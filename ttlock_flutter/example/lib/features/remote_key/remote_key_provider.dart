import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'remote_key_provider.g.dart';

class RemoteKeyState {
  final bool isLoading;
  final String? error;
  final String? result;

  const RemoteKeyState({this.isLoading = false, this.error, this.result});
}

@riverpod
class RemoteKeyNotifier extends _$RemoteKeyNotifier {
  @override
  RemoteKeyState build() => const RemoteKeyState();
}
