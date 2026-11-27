// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_manage_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupManageNotifier)
const groupManageProvider = GroupManageNotifierProvider._();

final class GroupManageNotifierProvider
    extends $AsyncNotifierProvider<GroupManageNotifier, GroupManageState> {
  const GroupManageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupManageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupManageNotifierHash();

  @$internal
  @override
  GroupManageNotifier create() => GroupManageNotifier();
}

String _$groupManageNotifierHash() =>
    r'2fc1efc7c553b4f9cd4fd11b41849478d9338cf5';

abstract class _$GroupManageNotifier extends $AsyncNotifier<GroupManageState> {
  FutureOr<GroupManageState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<GroupManageState>, GroupManageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GroupManageState>, GroupManageState>,
              AsyncValue<GroupManageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
