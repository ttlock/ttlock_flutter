import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';

/// 添加页凭证有效期种类（详情禁止切换）。
enum CredentialValidityKind { permanent, limited, cyclic }

/// UI 态循环日程：统一每日时段 + 多选星期（1=周一…7=周日）。
class CyclicSchedule {
  const CyclicSchedule({
    required this.weekDays,
    required this.startMinutes,
    required this.endMinutes,
  });

  final Set<int> weekDays;
  final int startMinutes;
  final int endMinutes;

  bool get isValid => weekDays.isNotEmpty && startMinutes < endMinutes;

  List<CyclicConfig> toCyclicConfig() {
    final days = weekDays.toList()..sort();
    return [
      for (final d in days)
        CyclicConfig(weekDay: d, startTime: startMinutes, endTime: endMinutes),
    ];
  }

  List<TTCycleModel> toCycleModels() {
    final days = weekDays.toList()..sort();
    return [
      for (final d in days)
        TTCycleModel(weekDay: d, startTime: startMinutes, endTime: endMinutes),
    ];
  }

  /// 各日时段须完全一致，否则返回 null。
  static CyclicSchedule? tryFrom(List<CyclicConfig> list) {
    if (list.isEmpty) return null;
    final start = list.first.startTime;
    final end = list.first.endTime;
    for (final e in list) {
      if (e.startTime != start || e.endTime != end) return null;
      if (e.weekDay < 1 || e.weekDay > 7) return null;
    }
    return CyclicSchedule(
      weekDays: {for (final e in list) e.weekDay},
      startMinutes: start,
      endMinutes: end,
    );
  }
}

DateTime cyclicDayStart(DateTime d) =>
    DateTime(d.year, d.month, d.day, 0, 0, 0, 0);

DateTime cyclicDayEnd(DateTime d) =>
    DateTime(d.year, d.month, d.day, 23, 59, 59, 999);

typedef ResolvedValidity = ({
  DateTime? start,
  DateTime? end,
  CredentialType type,
  List<CyclicConfig> cyclicConfig,
  List<TTCycleModel>? cycleList,
});

ResolvedValidity resolveValidity({
  required CredentialValidityKind kind,
  DateTime? start,
  DateTime? end,
  CyclicSchedule? schedule,
}) {
  final epoch0 = DateTime.fromMillisecondsSinceEpoch(0);
  switch (kind) {
    case CredentialValidityKind.permanent:
      return (
        start: epoch0,
        end: epoch0,
        type: CredentialType.normal,
        cyclicConfig: const [],
        cycleList: null,
      );
    case CredentialValidityKind.limited:
      if (start == null || end == null) {
        throw ArgumentError('limited needs dates');
      }
      return (
        start: start,
        end: end,
        type: CredentialType.normal,
        cyclicConfig: const [],
        cycleList: null,
      );
    case CredentialValidityKind.cyclic:
      if (start == null ||
          end == null ||
          schedule == null ||
          !schedule.isValid) {
        throw ArgumentError('cyclic needs YMD + valid schedule');
      }
      return (
        start: cyclicDayStart(start),
        end: cyclicDayEnd(end),
        type: CredentialType.cycle,
        cyclicConfig: schedule.toCyclicConfig(),
        cycleList: schedule.toCycleModels(),
      );
  }
}

String _weekdayLabel(int weekDay, AppLocalizations l10n) => switch (weekDay) {
  1 => l10n.weekdayMon,
  2 => l10n.weekdayTue,
  3 => l10n.weekdayWed,
  4 => l10n.weekdayThu,
  5 => l10n.weekdayFri,
  6 => l10n.weekdaySat,
  7 => l10n.weekdaySun,
  _ => '$weekDay',
};

String _fmtMinutes(int minutes) {
  final h = minutes ~/ 60;
  final m = minutes % 60;
  return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
}

/// 循环文案：每日/工作日/周末摘要或星期列表 + 时段。
String formatCyclicConfig(List<CyclicConfig> configs, AppLocalizations l10n) {
  final schedule = CyclicSchedule.tryFrom(configs);
  if (schedule == null || !schedule.isValid) return l10n.recurring;
  final days = schedule.weekDays.toList()..sort();
  final range =
      '${_fmtMinutes(schedule.startMinutes)}–${_fmtMinutes(schedule.endMinutes)}';
  final String daysLabel;
  if (days.length == 7) {
    daysLabel = l10n.recurringDaily;
  } else if (days.length == 5 && days.toSet().containsAll({1, 2, 3, 4, 5})) {
    daysLabel = l10n.recurringWorkday;
  } else if (days.length == 2 && days.toSet().containsAll({6, 7})) {
    daysLabel = l10n.recurringWeekend;
  } else {
    daysLabel = days.map((d) => _weekdayLabel(d, l10n)).join(',');
  }
  return '$daysLabel $range';
}
