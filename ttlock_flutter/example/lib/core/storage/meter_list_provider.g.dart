// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$waterMeterListHash() => r'c3c15b634c892e773f156036782421b5fdcb0dd9';

/// See also [waterMeterList].
@ProviderFor(waterMeterList)
final waterMeterListProvider =
    AutoDisposeFutureProvider<List<SavedMeterDevice>>.internal(
  waterMeterList,
  name: r'waterMeterListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$waterMeterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WaterMeterListRef
    = AutoDisposeFutureProviderRef<List<SavedMeterDevice>>;
String _$electricMeterListHash() => r'be3ad0be8ca67e544585cee950b0ada3cfb409ac';

/// See also [electricMeterList].
@ProviderFor(electricMeterList)
final electricMeterListProvider =
    AutoDisposeFutureProvider<List<SavedMeterDevice>>.internal(
  electricMeterList,
  name: r'electricMeterListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$electricMeterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ElectricMeterListRef
    = AutoDisposeFutureProviderRef<List<SavedMeterDevice>>;
String _$meterListNotifierHash() => r'ee7a6c09e94d0a09c7e79c885e441069483907ae';

/// See also [MeterListNotifier].
@ProviderFor(MeterListNotifier)
final meterListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    MeterListNotifier, List<SavedMeterDevice>>.internal(
  MeterListNotifier.new,
  name: r'meterListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$meterListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MeterListNotifier = AutoDisposeAsyncNotifier<List<SavedMeterDevice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
