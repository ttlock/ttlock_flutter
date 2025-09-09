import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttelectricMeter.dart';
import 'package:ttlock_flutter/ttgateway.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter/ttremoteKeypad.dart';
import 'package:ttlock_flutter_example/gateway_page.dart';
import 'config.dart';
import 'key_pad_page.dart';
import 'wifi_page.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'lock_page.dart';
import 'electric_meter_page.dart';


/// An enum to represent the type of device to scan for.
enum ScanType {
  /// A lock.
  lock,
  /// A gateway.
  gateway,
  /// An electric meter.
  electricMeter,
  /// A keypad.
  keyPad
}

/// A page that displays a list of scanned devices.
class ScanPage extends StatefulWidget {
  /// Creates a [ScanPage] widget.
  const ScanPage({Key? key, required this.scanType}) : super(key: key);
  /// The type of device to scan for.
  final ScanType scanType;
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ScanType? scanType;
  BuildContext? _context;

  @override
  void initState() {
    super.initState();
    scanType = widget.scanType;

    // Print TTLock Log
    TTLock.printLog = true;

    if (scanType == ScanType.lock) {
      _startScanLock();
    } else if (scanType == ScanType.gateway) {
      _startScanGateway();
    } else if (scanType == ScanType.electricMeter) {
      _startScanElectricMeter();
    } else if (scanType == ScanType.keyPad) {
      _startScanKeyPad();
    }
  }

  final List<TTLockScanModel> _lockList = [];
  final List<TTGatewayScanModel> _gatewayList = [];
  final List<TTElectricMeterScanModel> _electricMeterList = [];
  final List<TTRemoteAccessoryScanModel> _keyPadList = [];
  @override
  void dispose() {
    if (scanType == ScanType.lock) {
      TTLock.stopScanLock();
    } else if (scanType == ScanType.gateway) {
      TTGateway.stopScan();
    } else if (scanType == ScanType.electricMeter) {
      TTElectricMeter.stopScan();
    } else if (scanType == ScanType.keyPad) {
      TTRemoteKeypad.stopScan();
    }
    super.dispose();
  }

  void _showLoading() {
    ProgressHud.of(_context!)!.showLoading(text: '');
  }

  void _dismissLoading() {
    ProgressHud.of(_context!)!.dismiss();
  }

  void _initLock(TTLockScanModel scanModel) {
    _showLoading();

    Map map = {};
    map["lockMac"] = scanModel.lockMac;
    map["lockVersion"] = scanModel.lockVersion;
    map["isInited"] = scanModel.isInited;
    TTLock.initLock(map, (lockData) {
      _dismissLoading();
      LockConfig.lockData = lockData;
      LockConfig.lockMac = scanModel.lockMac;
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LockPage(
          title: scanModel.lockName,
          lockData: lockData,
          lockMac: scanModel.lockMac,
        );
      }));
    }, (errorCode, errorMsg) {
      _dismissLoading();
    });
  }

  void _initElectricMeter(TTElectricMeterScanModel scanModel) {
    if (scanModel.isInited) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return ElectricMeterPage(
          name: scanModel.name,
          mac: scanModel.mac,
        );
      }));
    } else {
      _showLoading();

      Map initParamMap = {};
      initParamMap["mac"] = scanModel.mac;
      initParamMap["name"] = scanModel.name;
      initParamMap["payMode"] = TTMeterPayMode.postpaid.index;
      initParamMap["price"] = '1';
      TTElectricMeter.init(initParamMap, () {
        _dismissLoading();
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ElectricMeterPage(
            name: scanModel.name,
            mac: scanModel.mac,
          );
        }));
      }, (errorCode, errorMsg) {
        _dismissLoading();
      });
    }
  }

  void _initKeyPad(TTRemoteAccessoryScanModel scanModel) {
    var mac = scanModel.mac;
    var lockMac = LockConfig.lockMac;
    var lockData = LockConfig.lockData;
    if (scanModel.isMultifunctionalKeypad) {
      assert(lockMac.isNotEmpty);
      assert(lockData.isNotEmpty);
      TTRemoteKeypad.multifunctionalInit(
          mac,
          lockData,
          (int electricQuantity,
              String wirelessKeypadFeatureValue,
              int slotNumber,
              int slotLimit) {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return KeyPadPage(
                    name: scanModel.name,
                    mac: scanModel.mac,
                    lockData: lockData,
                    lockMac: lockMac,
                  );
                }));
          }, (TTLockError errorCode, String errorMsg) {

      }, (TTRemoteKeyPadAccessoryError errorCode, String errorMsg) {});
    } else {
      assert(lockMac.isNotEmpty);
      TTRemoteKeypad.init(mac, lockMac,
          (int electricQuantity, String wirelessKeypadFeatureValue) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return KeyPadPage(
            name: scanModel.name,
            mac: scanModel.mac,
            lockData: lockData,
            lockMac: lockMac,
          );
        }));
      }, (TTRemoteAccessoryError errorCode, String errorMsg) {});
    }
  }

  void _connectGateway(String mac, TTGatewayType type) {
    _showLoading();
    TTGateway.connect(mac, (status) {
      _dismissLoading();
      if (status == TTGatewayConnectStatus.success) {
        //for test
        _configIp(mac);
        Widget? widget;
        if (type == TTGatewayType.g2) {
          widget = WifiPage(mac: mac);
        } else if (type == TTGatewayType.g3 || type == TTGatewayType.g4) {
          widget = GatewayPage(type: type);
        }

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return widget!;
        }));
      }
    });
  }

  void _configIp(String mac) {
    Map paramMap = {};
    paramMap["mac"] = mac;
    paramMap["type"] = TTIpSettingType.DHCP.index;

    TTGateway.configIp(paramMap, () {
    }, (errorCode, errorMsg) {
    });
  }

  void _startScanLock() {
    _lockList.clear();
    TTLock.startScanLock((scanModel) {
      bool contain = false;
      bool initStateChanged = false;
      for (var model in _lockList) {
        if (scanModel.lockMac == model.lockMac) {
          contain = true;
          initStateChanged = model.isInited != scanModel.isInited;
          if (initStateChanged) {
            model.isInited = scanModel.isInited;
          }
          break;
        }
      }
      if (!contain) {
        _lockList.add(scanModel);
      }
      if (!contain || initStateChanged) {
        setState(() {
          _lockList.sort((model1, model2) =>
              (model2.isInited ? 0 : 1) - (model1.isInited ? 0 : 1));
        });
      }
    });
  }

  void _startScanGateway() {
    _gatewayList.clear();
    TTGateway.startScan((scanModel) {
      bool contain = false;
      for (TTGatewayScanModel model in _gatewayList) {
        if (scanModel.gatewayMac == model.gatewayMac) {
          contain = true;
          break;
        }
      }
      if (!contain) {
        setState(() {
          _gatewayList.add(scanModel);
        });
      }
    });
  }

  void _startScanElectricMeter() {
    _electricMeterList.clear();
    TTElectricMeter.startScan((scanModel) {
      bool contain = false;
      for (TTElectricMeterScanModel model in _electricMeterList) {
        if (scanModel.mac == model.mac) {
          contain = true;
          break;
        }
      }
      if (!contain) {
        setState(() {
          _electricMeterList.add(scanModel);
        });
      }
    });
  }

  void _startScanKeyPad() {
    _keyPadList.clear();
    TTRemoteKeypad.startScan((scanModel) {
      bool contain = false;
      for (TTRemoteAccessoryScanModel model in _keyPadList) {
        if (scanModel.mac == model.mac) {
          contain = true;
          break;
        }
      }
      if (!contain) {
        setState(() {
          _keyPadList.add(scanModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = [
      'Lock',
      'Gateway',
      'Electric Meter',
      'Electric Meter'
    ][scanType!.index];
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Material(child: ProgressHud(
          child: Container(
            child: Builder(builder: (context) {
              _context = context;
              return getListView();
            }),
          ),
        )));
  }

  Widget getListView() {
    String gatewayNote = 'please power on again the gateway';
    String lockNote = 'please touch the keyboard of lock';
    String electricMeterNote = '';
    String keypadNote = '';
    String note =
        [lockNote, gatewayNote, electricMeterNote, keypadNote][scanType!.index];
    return Column(
      children: <Widget>[
        Text(note),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 2, color: Colors.green);
                },
                itemCount: [
                  _lockList,
                  _gatewayList,
                  _electricMeterList,
                  _keyPadList
                ][scanType!.index]
                    .length,
                itemBuilder: (context, index) {
                  String title = "";
                  String subtitle = "";
                  Color textColor = Colors.black;
                  if (scanType == ScanType.lock) {
                    TTLockScanModel scanModel = _lockList[index];
                    title = 'Lock：${scanModel.lockName}';
                    subtitle = scanModel.isInited
                        ? 'lock has been inited'
                        : 'click to init the lock';
                    if (scanModel.isInited) {
                      textColor = Colors.grey;
                    }
                  } else if (scanType == ScanType.gateway) {
                    TTGatewayScanModel scanModel = _gatewayList[index];
                    title = 'Gateway：${scanModel.gatewayName}';
                    subtitle = 'click to connect the gateway';
                  } else if (scanType == ScanType.electricMeter) {
                    TTElectricMeterScanModel scanModel =
                        _electricMeterList[index];
                    title = 'Meter：${scanModel.name}';
                    subtitle = scanModel.isInited
                        ? 'meter has been inited'
                        : 'click to init the meter';
                    if (scanModel.isInited) {
                      textColor = Colors.grey;
                    }
                  } else if (scanType == ScanType.keyPad) {
                    TTRemoteAccessoryScanModel scanModel = _keyPadList[index];
                    title = 'keyPad name：${scanModel.name}';
                  }

                  TextStyle textStyle = new TextStyle(color: textColor);

                  return ListTile(
                    title: Text(title, style: textStyle),
                    subtitle: Text(subtitle, style: textStyle),
                    onTap: () {
                      if (scanType == ScanType.lock) {
                        TTLockScanModel scanModel = _lockList[index];
                        if (!scanModel.isInited) {
                          TTLock.stopScanLock();
                          _initLock(scanModel);
                        }
                      } else if (scanType == ScanType.gateway) {
                        TTGatewayScanModel scanModel = _gatewayList[index];
                        TTGateway.stopScan();
                        _connectGateway(scanModel.gatewayMac, scanModel.type!);
                      } else if (scanType == ScanType.electricMeter) {
                        TTElectricMeterScanModel scanModel =
                            _electricMeterList[index];
                        TTElectricMeter.stopScan();
                        _initElectricMeter(scanModel);
                      } else if (scanType == ScanType.keyPad) {
                        TTRemoteAccessoryScanModel scanModel =
                            _keyPadList[index];
                        TTRemoteKeypad.stopScan();
                        _initKeyPad(scanModel);
                      }
                    },
                  );
                })),
      ],
    );
  }
}
