// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configStorageHash() => r'4ea5df5b6da5def05afa13e67888f2cce4b7eb31';

/// See also [configStorage].
@ProviderFor(configStorage)
final configStorageProvider = AutoDisposeProvider<ConfigStorage>.internal(
  configStorage,
  name: r'configStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConfigStorageRef = AutoDisposeProviderRef<ConfigStorage>;
String _$configNotifierHash() => r'8c83b10dcd0b80eb04fcf63a46ecde2c45cc3450';

/// See also [ConfigNotifier].
@ProviderFor(ConfigNotifier)
final configNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ConfigNotifier, ConfigModel>.internal(
  ConfigNotifier.new,
  name: r'configNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfigNotifier = AutoDisposeAsyncNotifier<ConfigModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
