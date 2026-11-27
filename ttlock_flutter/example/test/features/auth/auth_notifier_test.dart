import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/auth/presentation/provider/auth_notifier.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_service.dart';

class _FakeUserService extends UserService {
  _FakeUserService({this.fail = false, this.network = false});

  final bool fail;
  final bool network;

  @override
  TaskEither<AppException, UserSession> login(
    String username,
    String password,
  ) {
    if (network) {
      return TaskEither.left(
        AppException.network(exception: 'x', message: 'raw'),
      );
    }
    if (fail) {
      return TaskEither.left(
        const AppException.business(code: 10007, message: '账号或密码错误'),
      );
    }
    return TaskEither.right(
      const UserSession(accessToken: 't', refreshToken: 'r'),
    );
  }

  @override
  TaskEither<AppException, String> register(String username, String password) {
    if (fail) {
      return TaskEither.left(
        const AppException.business(code: 30003, message: '用户已存在'),
      );
    }
    return TaskEither.right(username);
  }
}

void main() {
  test('登录失败写入 errorMessage', () async {
    final container = ProviderContainer(
      overrides: [
        userServiceProvider.overrideWith(() => _FakeUserService(fail: true)),
      ],
    );
    addTearDown(container.dispose);
    final notifier = container.read(authProvider.notifier);
    notifier.setUsername('u');
    notifier.setPassword('p');
    await notifier.login();
    expect(container.read(authProvider).loading, isFalse);
    expect(container.read(authProvider).errorMessage, isNotNull);
  });

  test('登录成功 loading 为 false 且 errorMessage 为空', () async {
    final container = ProviderContainer(
      overrides: [userServiceProvider.overrideWith(() => _FakeUserService())],
    );
    addTearDown(container.dispose);
    final notifier = container.read(authProvider.notifier);
    notifier.setUsername('u');
    notifier.setPassword('p');
    await notifier.login();
    final state = container.read(authProvider);
    expect(state.loading, isFalse);
    expect(state.errorMessage, isNull);
  });

  test('登录网络失败使用 getUserFriendlyMessage', () async {
    final container = ProviderContainer(
      overrides: [
        userServiceProvider.overrideWith(() => _FakeUserService(network: true)),
      ],
    );
    addTearDown(container.dispose);
    final notifier = container.read(authProvider.notifier);
    notifier.setUsername('u');
    notifier.setPassword('p');
    await notifier.login();
    expect(container.read(authProvider).errorMessage, isNot(equals('raw')));
    expect(container.read(authProvider).errorMessage, isNotNull);
  });

  test('注册失败写入 errorMessage', () async {
    final container = ProviderContainer(
      overrides: [
        userServiceProvider.overrideWith(() => _FakeUserService(fail: true)),
      ],
    );
    addTearDown(container.dispose);
    final notifier = container.read(authProvider.notifier);
    notifier.setUsername('u');
    notifier.setPassword('p');
    await notifier.register();
    expect(container.read(authProvider).loading, isFalse);
    expect(container.read(authProvider).errorMessage, isNotNull);
  });

  test('注册成功 loading 为 false 且 errorMessage 为空', () async {
    final container = ProviderContainer(
      overrides: [userServiceProvider.overrideWith(() => _FakeUserService())],
    );
    addTearDown(container.dispose);
    final notifier = container.read(authProvider.notifier);
    notifier.setUsername('u');
    notifier.setPassword('p');
    await notifier.register();
    final state = container.read(authProvider);
    expect(state.loading, isFalse);
    expect(state.errorMessage, isNull);
  });

  test('setUsername 清除 errorMessage', () async {
    final container = ProviderContainer(
      overrides: [
        userServiceProvider.overrideWith(() => _FakeUserService(fail: true)),
      ],
    );
    addTearDown(container.dispose);
    final notifier = container.read(authProvider.notifier);
    notifier.setUsername('u');
    notifier.setPassword('p');
    await notifier.login();
    expect(container.read(authProvider).errorMessage, isNotNull);
    notifier.setUsername('u2');
    expect(container.read(authProvider).errorMessage, isNull);
  });
}
