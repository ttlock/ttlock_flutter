import 'package:ttlock_flutter/ttlock.dart';

import 'credential_validity.dart';

class CredentialDateRange {
  const CredentialDateRange({
    required this.startDate,
    required this.endDate,
    this.cycleList,
  });

  final int startDate;
  final int endDate;
  final List<TTCycleModel>? cycleList;
}

CredentialDateRange validityToDateRange(CredentialValidity validity) {
  return validity.map(
    permanent: () => const CredentialDateRange(startDate: 0, endDate: 0),
    timed: (start, end) => CredentialDateRange(startDate: start, endDate: end),
    recurring: (start, end, cycles) => CredentialDateRange(
      startDate: _dayStartMs(start),
      endDate: _dayStartMs(end),
      cycleList: cycles,
    ),
    once: (start, end) => CredentialDateRange(startDate: start, endDate: end),
  );
}

TTPasscodeType validityToPasscodeType(CredentialValidity validity) {
  return validity.map(
    permanent: () => TTPasscodeType.permanent,
    timed: (_, __) => TTPasscodeType.period,
    recurring: (_, __, ___) => TTPasscodeType.cycle,
    once: (_, __) => TTPasscodeType.once,
  );
}

int validityToCycleType(CredentialValidity validity) {
  return validity.map(
    permanent: () => 0,
    timed: (_, __) => 0,
    recurring: (_, __, cycles) => cycles.isNotEmpty ? cycles.first.weekDay : 0,
    once: (_, __) => 0,
  );
}

int _dayStartMs(int ms) {
  if (ms == 0) return 0;
  final d = DateTime.fromMillisecondsSinceEpoch(ms);
  return DateTime(d.year, d.month, d.day).millisecondsSinceEpoch;
}

String formatCredentialValidityLabel({
  required int startDate,
  required int endDate,
  List<TTCycleModel>? cycleList,
}) {
  if (startDate == 0 && endDate == 0) {
    return 'Permanent';
  }
  if (cycleList != null && cycleList.isNotEmpty) {
    final days = cycleList.map((c) => c.weekDay).join(', ');
    return 'Recurring (days $days)';
  }
  return '${_formatMs(startDate)} — ${_formatMs(endDate)}';
}

String _formatMs(int ms) {
  final d = DateTime.fromMillisecondsSinceEpoch(ms);
  String two(int n) => n.toString().padLeft(2, '0');
  return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
}

String formatPasscodeValidityLabel(TTPasscodeModel model) {
  if (model.startDate == 0 && model.endDate == 0) {
    return 'Permanent';
  }
  return formatCredentialValidityLabel(
    startDate: model.startDate,
    endDate: model.endDate,
  );
}

String formatCardValidityLabel(int startDate, int endDate) {
  return formatCredentialValidityLabel(startDate: startDate, endDate: endDate);
}

List<TTCycleModel> buildCycleListFromWeekdays({
  required Set<int> weekdays,
  required int startMinutes,
  required int endMinutes,
}) {
  return weekdays
      .map(
        (day) => TTCycleModel(
          weekDay: day,
          startTime: startMinutes,
          endTime: endMinutes,
        ),
      )
      .toList();
}

String? validateCredentialValidity(CredentialValidity validity) {
  return validity.map(
    permanent: () => null,
    timed: (start, end) {
      if (start == 0 || end == 0) return 'Select start and end time';
      if (start >= end) return 'End must be after start';
      return null;
    },
    recurring: (start, end, cycles) {
      if (start == 0 || end == 0) return 'Select date range';
      if (start >= end) return 'End date must be after start';
      if (cycles.isEmpty) return 'Select at least one weekday';
      return null;
    },
    once: (start, end) {
      if (start == 0 || end == 0) return 'Select start and end time';
      if (start >= end) return 'End must be after start';
      return null;
    },
  );
}
