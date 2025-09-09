# TTLock Flutter Plugin

A Flutter plugin for interfacing with TTLock smart locks and accessories. This plugin provides a comprehensive API to manage and interact with TTLock devices, including locks, gateways, remote keypads, and various smart meters.

## Purpose

This plugin abstracts the native TTLock SDKs for both Android and iOS, offering a unified Dart interface for Flutter applications. It enables developers to build apps that can:

- Scan for and discover nearby TTLock devices.
- Initialize and configure locks, gateways, and other accessories.
- Perform core lock operations like locking and unlocking.
- Manage access credentials, including passcodes, IC cards, and fingerprints.
- Read device status, such as battery level, operation records, and configuration settings.
- Support for a wide range of TTLock accessories like door sensors, remote keypads, and smart meters (water and electric).

## Getting Started

To use this plugin, add `ttlock_flutter` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  ttlock_flutter:
```
Please check the [GitHub repository](https://github.com/ttlock/ttlock_flutter) for the latest version.

### iOS Configuration

In your `Info.plist` file, add the following key-value pair to describe why your app needs Bluetooth access:

```xml
<key>Privacy - Bluetooth Peripheral Usage Description</key>
<string>Your description for bluetooth</string>
```

### Android Configuration

1.  In your `AndroidManifest.xml`, add the following:
    - Add `xmlns:tools="http://schemas.android.com/tools"` to the `<manifest>` element.
    - Add `tools:replace="android:label"` to the `<application>` element.
    - Add the required permissions:
      ```xml
      <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
      <uses-permission android:name="android.permission.BLUETOOTH" />
      <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
      <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
      ```

2.  In your `MainActivity.java` or `MainActivity.kt`, you need to forward the permission result to the plugin.

    **Java:**
    ```java
    import com.ttlock.ttlock_flutter.TtlockFlutterPlugin;

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        TtlockFlutterPlugin ttlockflutterpluginPlugin = (TtlockFlutterPlugin) getFlutterEngine().getPlugins().get(TtlockFlutterPlugin.class);
        if (ttlockflutterpluginPlugin != null) {
            ttlockflutterpluginPlugin.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
    ```

    **Kotlin:**
    ```kotlin
    import com.ttlock.ttlock_flutter.TtlockFlutterPlugin

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        val ttlockflutterpluginPlugin = flutterEngine!!.plugins[TtlockFlutterPlugin::class.java] as TtlockFlutterPlugin?
        ttlockflutterpluginPlugin?.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }
    ```

3.  In your app-level `build.gradle` file, ensure `minifyEnabled` and `shrinkResources` are set to `false` for the release build type:
    ```groovy
    buildTypes {
        release {
            minifyEnabled false
            shrinkResources false
        }
    }
    ```

## Usage

Here's a basic example of how to use the plugin to scan for locks and perform an unlock action.

```dart
import 'package:ttlock_flutter/ttlock.dart';

// Enable logging for debugging
TTLock.printLog = true;

// Start scanning for locks
TTLock.startScanLock((scanModel) {
  print('Found lock: ${scanModel.lockName}');
  // Once you have the lockData, you can perform actions
  // For example, to unlock:
  TTLock.controlLock(lockData, TTControlAction.unlock, (lockTime, electricQuantity, uniqueId, lockData) {
      print('Unlock successful!');
  }, (errorCode, errorMsg) {
      print('Unlock failed: $errorCode - $errorMsg');
  });
});
```

### Checking for Feature Support

Before performing an operation, you can check if the lock supports it:

```dart
TTLock.supportFunction(TTLockFunction.managePasscode, lockData, (isSupport) {
    if (isSupport) {
        // The lock supports managing passcodes
    } else {
        print('This lock does not support managing passcodes.');
    }
});
```

## API Overview

The plugin is organized into several classes, each corresponding to a type of TTLock device:

- `TTLock`: The main class for interacting with smart locks. It includes methods for scanning, initialization, control, and management of passcodes, cards, and fingerprints.
- `TTGateway`: For managing TTLock gateways.
- `TTDoorSensor`: For interacting with door sensors.
- `TTRemoteKey`: For managing remote key fobs.
- `TTRemoteKeypad`: For wireless keypads.
- `TTElectricMeter`: For smart electric meters.
- `TTWaterMeter`: For smart water meters.

All interactions are asynchronous and use callbacks to handle success and failure scenarios.

**Note:** While the Dart code in the `lib/` directory is fully documented, the native Android and iOS code is not. The native code is complex and relies heavily on the underlying TTLock SDKs.

## Development

For questions, bug reports, or feature requests, please use the issue tracker on the repository.

You can also reach out to the developers via the Google Group: [ttlock-developers-email-list@googlegroups.com](mailto:ttlock-developers-email-list@googlegroups.com)
