import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

part 'credential_validity.freezed.dart';

enum CredentialValidityKind { permanent, timed, recurring, once }

@freezed
abstract class CredentialValidity with _$CredentialValidity {
  const factory CredentialValidity.permanent() = _CredentialPermanent;

  const factory CredentialValidity.timed({
    required int startDate,
    required int endDate,
  }) = _CredentialTimed;

  const factory CredentialValidity.recurring({
    required int startDate,
    required int endDate,
    required List<TTCycleModel> cycleList,
  }) = _CredentialRecurring;

  const factory CredentialValidity.once({
    required int startDate,
    required int endDate,
  }) = _CredentialOnce;

  const CredentialValidity._();

  CredentialValidityKind get kind => map(
        permanent: () => CredentialValidityKind.permanent,
        timed: (_, __) => CredentialValidityKind.timed,
        recurring: (_, __, ___) => CredentialValidityKind.recurring,
        once: (_, __) => CredentialValidityKind.once,
      );

  R map<R>({
    required R Function() permanent,
    required R Function(int startDate, int endDate) timed,
    required R Function(int startDate, int endDate, List<TTCycleModel> cycleList)
        recurring,
    required R Function(int startDate, int endDate) once,
  }) {
    final self = this;
    if (self is _CredentialPermanent) return permanent();
    if (self is _CredentialTimed) {
      return timed(self.startDate, self.endDate);
    }
    if (self is _CredentialRecurring) {
      return recurring(self.startDate, self.endDate, self.cycleList);
    }
    if (self is _CredentialOnce) {
      return once(self.startDate, self.endDate);
    }
    throw StateError('Unknown CredentialValidity: $self');
  }

  R? mapOrNull<R>({
    R Function()? permanent,
    R Function(int startDate, int endDate)? timed,
    R Function(int startDate, int endDate, List<TTCycleModel> cycleList)?
        recurring,
    R Function(int startDate, int endDate)? once,
  }) {
    final self = this;
    if (self is _CredentialPermanent) return permanent?.call();
    if (self is _CredentialTimed) {
      return timed?.call(self.startDate, self.endDate);
    }
    if (self is _CredentialRecurring) {
      return recurring?.call(self.startDate, self.endDate, self.cycleList);
    }
    if (self is _CredentialOnce) {
      return once?.call(self.startDate, self.endDate);
    }
    return null;
  }
}
