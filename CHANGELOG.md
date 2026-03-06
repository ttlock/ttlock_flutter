## 0.0.3

   Internal reorganization (public API unchanged)

   - Split logic from `ttlock.dart` into `lib/src/`: constants (`tt_response.dart`, `*_commands.dart`), types (`ttlock_types.dart`), and channel layer (`ttlock_channel.dart`).
   - `ttlock.dart` now only exposes TTLock lock API and re-exports types/response keys.
   - `ttgateway.dart`, `ttremotekey.dart`, `ttremoteKeypad.dart`, `ttdoorSensor.dart` use `TTLockChannel.invoke` and their respective command constants; no change to call sites.

## 0.0.2

   Add method
    
    1. Get valid passcode from lock

    2. Get valid cards from lock

    3. Get valid fingerprints from lock

