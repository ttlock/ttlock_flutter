import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';

import {
  TTAccessoryHostApi,
  TTGatewayHostApi,
  TTLockHostApi,
} from './Messages';
import { LockHostApiImpl } from './LockHostApiImpl';
import { GatewayHostApiImpl } from './GatewayHostApiImpl';
import { AccessoryHostApiImpl } from './AccessoryHostApiImpl';
import { EventStreamHandlers } from './EventStreamHandlers';
import { EventContextStore } from './TtlockPremiseSupport';

/**
 * Ttlock Flutter 插件的 OpenHarmony 入口。
 *
 * 在 `onAttachedToEngine` 中：
 *   1. 实例化 3 个 HostApi 实现并通过 Pigeon 生成的 `setup` 注册到 BinaryMessenger；
 *   2. 注册 14 条 EventChannel（与 iOS / Android 对齐）；
 *   3. 保留一个旧的 `MethodChannel("ttlock_flutter_ohos")` 用于 `getPlatformVersion`，
 *      避免破坏存量 Dart 调用方。
 */
export default class TtlockFlutterOhosPlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;
  private streamHandlers: EventStreamHandlers | null = null;

  getUniqueClassName(): string {
    return 'TtlockFlutterOhosPlugin';
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    const messenger = binding.getBinaryMessenger();

    TTLockHostApi.setup(messenger, new LockHostApiImpl());
    TTGatewayHostApi.setup(messenger, new GatewayHostApiImpl());
    TTAccessoryHostApi.setup(messenger, new AccessoryHostApiImpl());

    this.streamHandlers = new EventStreamHandlers(messenger);
    this.streamHandlers.register();

    this.channel = new MethodChannel(messenger, 'ttlock_flutter_ohos');
    this.channel.setMethodCallHandler(this);
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    const messenger = binding.getBinaryMessenger();
    TTLockHostApi.setup(messenger, null);
    TTGatewayHostApi.setup(messenger, null);
    TTAccessoryHostApi.setup(messenger, null);

    if (this.streamHandlers !== null) {
      this.streamHandlers.dispose();
      this.streamHandlers = null;
    }

    if (this.channel !== null) {
      this.channel.setMethodCallHandler(null);
      this.channel = null;
    }

    EventContextStore.shared.reset();
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method === 'getPlatformVersion') {
      result.success('OpenHarmony ^ ^ ');
    } else {
      result.notImplemented();
    }
  }
}
