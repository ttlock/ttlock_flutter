## Developers Email list
ttlock-developers-email-list@googlegroups.com


### ttlock_flutter



##### Config

iOS: 
1. In XCode,Add Key`Privacy - Bluetooth Peripheral Usage Description` Value `your description for bluetooth` to your project's `info` ➜ `Custom iOS Target Projectes`

Android:
AndroidManifest.xml configuration:
1. add 'xmlns:tools="http://schemas.android.com/tools"' to <manifest> element
2. add 'tools:replace="android:label"' to <application> element
3. additional permissions:
```  
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```
4. in MainActivity extends FlutterActivity, you need add permissions result to ttlock plugin. 
       
first add import

```
import com.ttlock.ttlock_flutter.TtlockFlutterPlugin
```

second add below callback code:   
java code:

```
@Override
public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        TtlockFlutterPlugin ttlockflutterpluginPlugin = (TtlockFlutterPlugin) getFlutterEngine().getPlugins().get(TtlockFlutterPlugin.class);
        if (ttlockflutterpluginPlugin != null) {
            ttlockflutterpluginPlugin.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
```
kotlin code:
```
override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        val ttlockflutterpluginPlugin = flutterEngine!!.plugins[TtlockFlutterPlugin::class.java] as TtlockFlutterPlugin?
        ttlockflutterpluginPlugin?.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }
```

5.you need config buildTypes in build.gradle file.like this:

```
    buildTypes {
        release {
            minifyEnabled false
            shrinkResources false
        }
    }
```

##### Ussage
```
import 'package:ttlock_flutter/ttlock.dart';

// Print TTLock Log
TTLock.printLog = true;

TTLock.controlLock(lockData, TTControlAction.unlock,(lockTime, electricQuantity, uniqueId) {
    print('success');
}, (errorCode, errorMsg) {
    print('errorCode');      
});
```
If you want to get log and set time immediately after unlocking, you can do the following:

```
void unlockAndGetLogAndSetTime() {

     //unlock
    TTLock.controlLock(lockData, TTControlAction.unlock,(lockTime, electricQuantity, uniqueId) {
        print('success');
    }, (errorCode, errorMsg) {
        print('errorCode');      
    });
    
     //get log
    TTLock.getLockOperateRecord(TTOperateRecordType.latest, lockData,(operateRecord) {
        print('$operateRecord');
    }, (errorCode, errorMsg) {
        print('errorCode');
    });
     //set time
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    TTLock.setLockTime(timestamp, lockData, () {
        print('$timestamp');
    }, (errorCode, errorMsg) {
        print('errorCode');
    });
}

```
##### How to determine the function of a lock
```
 TTLock.supportFunction(TTLockFuction.managePasscode, lockData,(isSupport) {
    if (isSupport) {
        TTLock.modifyPasscode("6666", "7777", startDate, endDate, lockData,() {
            print('success');
        }, (errorCode, errorMsg) {
            print('errorCode');
        });
    } else {
        print('Not support modify passcode');
    }
});
```




