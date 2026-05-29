// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_local_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockLocalCache {
  List<String>? get supportedFunctions;
  DateTime? get capabilitiesProbedAt;
  LockSettingsSnapshot? get settings;
  DateTime? get settingsFetchedAt;
  List<CachedPasscode>? get passcodes;
  List<CachedCard>? get cards;
  List<CachedFingerprint>? get fingerprints;
  List<CachedFace>? get faces;
  DateTime? get credentialsFetchedAt;

  /// Create a copy of LockLocalCache
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LockLocalCacheCopyWith<LockLocalCache> get copyWith =>
      _$LockLocalCacheCopyWithImpl<LockLocalCache>(
          this as LockLocalCache, _$identity);

  /// Serializes this LockLocalCache to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LockLocalCache &&
            const DeepCollectionEquality()
                .equals(other.supportedFunctions, supportedFunctions) &&
            (identical(other.capabilitiesProbedAt, capabilitiesProbedAt) ||
                other.capabilitiesProbedAt == capabilitiesProbedAt) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.settingsFetchedAt, settingsFetchedAt) ||
                other.settingsFetchedAt == settingsFetchedAt) &&
            const DeepCollectionEquality().equals(other.passcodes, passcodes) &&
            const DeepCollectionEquality().equals(other.cards, cards) &&
            const DeepCollectionEquality()
                .equals(other.fingerprints, fingerprints) &&
            const DeepCollectionEquality().equals(other.faces, faces) &&
            (identical(other.credentialsFetchedAt, credentialsFetchedAt) ||
                other.credentialsFetchedAt == credentialsFetchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(supportedFunctions),
      capabilitiesProbedAt,
      settings,
      settingsFetchedAt,
      const DeepCollectionEquality().hash(passcodes),
      const DeepCollectionEquality().hash(cards),
      const DeepCollectionEquality().hash(fingerprints),
      const DeepCollectionEquality().hash(faces),
      credentialsFetchedAt);

  @override
  String toString() {
    return 'LockLocalCache(supportedFunctions: $supportedFunctions, capabilitiesProbedAt: $capabilitiesProbedAt, settings: $settings, settingsFetchedAt: $settingsFetchedAt, passcodes: $passcodes, cards: $cards, fingerprints: $fingerprints, faces: $faces, credentialsFetchedAt: $credentialsFetchedAt)';
  }
}

/// @nodoc
abstract mixin class $LockLocalCacheCopyWith<$Res> {
  factory $LockLocalCacheCopyWith(
          LockLocalCache value, $Res Function(LockLocalCache) _then) =
      _$LockLocalCacheCopyWithImpl;
  @useResult
  $Res call(
      {List<String>? supportedFunctions,
      DateTime? capabilitiesProbedAt,
      LockSettingsSnapshot? settings,
      DateTime? settingsFetchedAt,
      List<CachedPasscode>? passcodes,
      List<CachedCard>? cards,
      List<CachedFingerprint>? fingerprints,
      List<CachedFace>? faces,
      DateTime? credentialsFetchedAt});

  $LockSettingsSnapshotCopyWith<$Res>? get settings;
}

/// @nodoc
class _$LockLocalCacheCopyWithImpl<$Res>
    implements $LockLocalCacheCopyWith<$Res> {
  _$LockLocalCacheCopyWithImpl(this._self, this._then);

  final LockLocalCache _self;
  final $Res Function(LockLocalCache) _then;

  /// Create a copy of LockLocalCache
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supportedFunctions = freezed,
    Object? capabilitiesProbedAt = freezed,
    Object? settings = freezed,
    Object? settingsFetchedAt = freezed,
    Object? passcodes = freezed,
    Object? cards = freezed,
    Object? fingerprints = freezed,
    Object? faces = freezed,
    Object? credentialsFetchedAt = freezed,
  }) {
    return _then(_self.copyWith(
      supportedFunctions: freezed == supportedFunctions
          ? _self.supportedFunctions
          : supportedFunctions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capabilitiesProbedAt: freezed == capabilitiesProbedAt
          ? _self.capabilitiesProbedAt
          : capabilitiesProbedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as LockSettingsSnapshot?,
      settingsFetchedAt: freezed == settingsFetchedAt
          ? _self.settingsFetchedAt
          : settingsFetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      passcodes: freezed == passcodes
          ? _self.passcodes
          : passcodes // ignore: cast_nullable_to_non_nullable
              as List<CachedPasscode>?,
      cards: freezed == cards
          ? _self.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CachedCard>?,
      fingerprints: freezed == fingerprints
          ? _self.fingerprints
          : fingerprints // ignore: cast_nullable_to_non_nullable
              as List<CachedFingerprint>?,
      faces: freezed == faces
          ? _self.faces
          : faces // ignore: cast_nullable_to_non_nullable
              as List<CachedFace>?,
      credentialsFetchedAt: freezed == credentialsFetchedAt
          ? _self.credentialsFetchedAt
          : credentialsFetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of LockLocalCache
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LockSettingsSnapshotCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $LockSettingsSnapshotCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LockLocalCache extends LockLocalCache {
  const _LockLocalCache(
      {final List<String>? supportedFunctions,
      this.capabilitiesProbedAt,
      this.settings,
      this.settingsFetchedAt,
      final List<CachedPasscode>? passcodes,
      final List<CachedCard>? cards,
      final List<CachedFingerprint>? fingerprints,
      final List<CachedFace>? faces,
      this.credentialsFetchedAt})
      : _supportedFunctions = supportedFunctions,
        _passcodes = passcodes,
        _cards = cards,
        _fingerprints = fingerprints,
        _faces = faces,
        super._();
  factory _LockLocalCache.fromJson(Map<String, dynamic> json) =>
      _$LockLocalCacheFromJson(json);

  final List<String>? _supportedFunctions;
  @override
  List<String>? get supportedFunctions {
    final value = _supportedFunctions;
    if (value == null) return null;
    if (_supportedFunctions is EqualUnmodifiableListView)
      return _supportedFunctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? capabilitiesProbedAt;
  @override
  final LockSettingsSnapshot? settings;
  @override
  final DateTime? settingsFetchedAt;
  final List<CachedPasscode>? _passcodes;
  @override
  List<CachedPasscode>? get passcodes {
    final value = _passcodes;
    if (value == null) return null;
    if (_passcodes is EqualUnmodifiableListView) return _passcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CachedCard>? _cards;
  @override
  List<CachedCard>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CachedFingerprint>? _fingerprints;
  @override
  List<CachedFingerprint>? get fingerprints {
    final value = _fingerprints;
    if (value == null) return null;
    if (_fingerprints is EqualUnmodifiableListView) return _fingerprints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CachedFace>? _faces;
  @override
  List<CachedFace>? get faces {
    final value = _faces;
    if (value == null) return null;
    if (_faces is EqualUnmodifiableListView) return _faces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? credentialsFetchedAt;

  /// Create a copy of LockLocalCache
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LockLocalCacheCopyWith<_LockLocalCache> get copyWith =>
      __$LockLocalCacheCopyWithImpl<_LockLocalCache>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LockLocalCacheToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LockLocalCache &&
            const DeepCollectionEquality()
                .equals(other._supportedFunctions, _supportedFunctions) &&
            (identical(other.capabilitiesProbedAt, capabilitiesProbedAt) ||
                other.capabilitiesProbedAt == capabilitiesProbedAt) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.settingsFetchedAt, settingsFetchedAt) ||
                other.settingsFetchedAt == settingsFetchedAt) &&
            const DeepCollectionEquality()
                .equals(other._passcodes, _passcodes) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            const DeepCollectionEquality()
                .equals(other._fingerprints, _fingerprints) &&
            const DeepCollectionEquality().equals(other._faces, _faces) &&
            (identical(other.credentialsFetchedAt, credentialsFetchedAt) ||
                other.credentialsFetchedAt == credentialsFetchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_supportedFunctions),
      capabilitiesProbedAt,
      settings,
      settingsFetchedAt,
      const DeepCollectionEquality().hash(_passcodes),
      const DeepCollectionEquality().hash(_cards),
      const DeepCollectionEquality().hash(_fingerprints),
      const DeepCollectionEquality().hash(_faces),
      credentialsFetchedAt);

  @override
  String toString() {
    return 'LockLocalCache(supportedFunctions: $supportedFunctions, capabilitiesProbedAt: $capabilitiesProbedAt, settings: $settings, settingsFetchedAt: $settingsFetchedAt, passcodes: $passcodes, cards: $cards, fingerprints: $fingerprints, faces: $faces, credentialsFetchedAt: $credentialsFetchedAt)';
  }
}

/// @nodoc
abstract mixin class _$LockLocalCacheCopyWith<$Res>
    implements $LockLocalCacheCopyWith<$Res> {
  factory _$LockLocalCacheCopyWith(
          _LockLocalCache value, $Res Function(_LockLocalCache) _then) =
      __$LockLocalCacheCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String>? supportedFunctions,
      DateTime? capabilitiesProbedAt,
      LockSettingsSnapshot? settings,
      DateTime? settingsFetchedAt,
      List<CachedPasscode>? passcodes,
      List<CachedCard>? cards,
      List<CachedFingerprint>? fingerprints,
      List<CachedFace>? faces,
      DateTime? credentialsFetchedAt});

  @override
  $LockSettingsSnapshotCopyWith<$Res>? get settings;
}

/// @nodoc
class __$LockLocalCacheCopyWithImpl<$Res>
    implements _$LockLocalCacheCopyWith<$Res> {
  __$LockLocalCacheCopyWithImpl(this._self, this._then);

  final _LockLocalCache _self;
  final $Res Function(_LockLocalCache) _then;

  /// Create a copy of LockLocalCache
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? supportedFunctions = freezed,
    Object? capabilitiesProbedAt = freezed,
    Object? settings = freezed,
    Object? settingsFetchedAt = freezed,
    Object? passcodes = freezed,
    Object? cards = freezed,
    Object? fingerprints = freezed,
    Object? faces = freezed,
    Object? credentialsFetchedAt = freezed,
  }) {
    return _then(_LockLocalCache(
      supportedFunctions: freezed == supportedFunctions
          ? _self._supportedFunctions
          : supportedFunctions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      capabilitiesProbedAt: freezed == capabilitiesProbedAt
          ? _self.capabilitiesProbedAt
          : capabilitiesProbedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as LockSettingsSnapshot?,
      settingsFetchedAt: freezed == settingsFetchedAt
          ? _self.settingsFetchedAt
          : settingsFetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      passcodes: freezed == passcodes
          ? _self._passcodes
          : passcodes // ignore: cast_nullable_to_non_nullable
              as List<CachedPasscode>?,
      cards: freezed == cards
          ? _self._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CachedCard>?,
      fingerprints: freezed == fingerprints
          ? _self._fingerprints
          : fingerprints // ignore: cast_nullable_to_non_nullable
              as List<CachedFingerprint>?,
      faces: freezed == faces
          ? _self._faces
          : faces // ignore: cast_nullable_to_non_nullable
              as List<CachedFace>?,
      credentialsFetchedAt: freezed == credentialsFetchedAt
          ? _self.credentialsFetchedAt
          : credentialsFetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of LockLocalCache
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LockSettingsSnapshotCopyWith<$Res>? get settings {
    if (_self.settings == null) {
      return null;
    }

    return $LockSettingsSnapshotCopyWith<$Res>(_self.settings!, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

// dart format on
