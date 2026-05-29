// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential_validity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CredentialValidity {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CredentialValidity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CredentialValidity()';
  }
}

/// @nodoc
class $CredentialValidityCopyWith<$Res> {
  $CredentialValidityCopyWith(
      CredentialValidity _, $Res Function(CredentialValidity) __);
}

/// @nodoc

class _CredentialPermanent extends CredentialValidity {
  const _CredentialPermanent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CredentialPermanent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CredentialValidity.permanent()';
  }
}

/// @nodoc

class _CredentialTimed extends CredentialValidity {
  const _CredentialTimed({required this.startDate, required this.endDate})
      : super._();

  final int startDate;
  final int endDate;

  /// Create a copy of CredentialValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CredentialTimedCopyWith<_CredentialTimed> get copyWith =>
      __$CredentialTimedCopyWithImpl<_CredentialTimed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CredentialTimed &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'CredentialValidity.timed(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CredentialTimedCopyWith<$Res>
    implements $CredentialValidityCopyWith<$Res> {
  factory _$CredentialTimedCopyWith(
          _CredentialTimed value, $Res Function(_CredentialTimed) _then) =
      __$CredentialTimedCopyWithImpl;
  @useResult
  $Res call({int startDate, int endDate});
}

/// @nodoc
class __$CredentialTimedCopyWithImpl<$Res>
    implements _$CredentialTimedCopyWith<$Res> {
  __$CredentialTimedCopyWithImpl(this._self, this._then);

  final _CredentialTimed _self;
  final $Res Function(_CredentialTimed) _then;

  /// Create a copy of CredentialValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_CredentialTimed(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _CredentialRecurring extends CredentialValidity {
  const _CredentialRecurring(
      {required this.startDate,
      required this.endDate,
      required final List<TTCycleModel> cycleList})
      : _cycleList = cycleList,
        super._();

  final int startDate;
  final int endDate;
  final List<TTCycleModel> _cycleList;
  List<TTCycleModel> get cycleList {
    if (_cycleList is EqualUnmodifiableListView) return _cycleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cycleList);
  }

  /// Create a copy of CredentialValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CredentialRecurringCopyWith<_CredentialRecurring> get copyWith =>
      __$CredentialRecurringCopyWithImpl<_CredentialRecurring>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CredentialRecurring &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._cycleList, _cycleList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate,
      const DeepCollectionEquality().hash(_cycleList));

  @override
  String toString() {
    return 'CredentialValidity.recurring(startDate: $startDate, endDate: $endDate, cycleList: $cycleList)';
  }
}

/// @nodoc
abstract mixin class _$CredentialRecurringCopyWith<$Res>
    implements $CredentialValidityCopyWith<$Res> {
  factory _$CredentialRecurringCopyWith(_CredentialRecurring value,
          $Res Function(_CredentialRecurring) _then) =
      __$CredentialRecurringCopyWithImpl;
  @useResult
  $Res call({int startDate, int endDate, List<TTCycleModel> cycleList});
}

/// @nodoc
class __$CredentialRecurringCopyWithImpl<$Res>
    implements _$CredentialRecurringCopyWith<$Res> {
  __$CredentialRecurringCopyWithImpl(this._self, this._then);

  final _CredentialRecurring _self;
  final $Res Function(_CredentialRecurring) _then;

  /// Create a copy of CredentialValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? cycleList = null,
  }) {
    return _then(_CredentialRecurring(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      cycleList: null == cycleList
          ? _self._cycleList
          : cycleList // ignore: cast_nullable_to_non_nullable
              as List<TTCycleModel>,
    ));
  }
}

/// @nodoc

class _CredentialOnce extends CredentialValidity {
  const _CredentialOnce({required this.startDate, required this.endDate})
      : super._();

  final int startDate;
  final int endDate;

  /// Create a copy of CredentialValidity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CredentialOnceCopyWith<_CredentialOnce> get copyWith =>
      __$CredentialOnceCopyWithImpl<_CredentialOnce>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CredentialOnce &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'CredentialValidity.once(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$CredentialOnceCopyWith<$Res>
    implements $CredentialValidityCopyWith<$Res> {
  factory _$CredentialOnceCopyWith(
          _CredentialOnce value, $Res Function(_CredentialOnce) _then) =
      __$CredentialOnceCopyWithImpl;
  @useResult
  $Res call({int startDate, int endDate});
}

/// @nodoc
class __$CredentialOnceCopyWithImpl<$Res>
    implements _$CredentialOnceCopyWith<$Res> {
  __$CredentialOnceCopyWithImpl(this._self, this._then);

  final _CredentialOnce _self;
  final $Res Function(_CredentialOnce) _then;

  /// Create a copy of CredentialValidity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_CredentialOnce(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
