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


enum ScanType { lock, gateway, electricMeter, keyPad }

class ScanPage extends StatefulWidget {
  ScanPage({required this.scanType}) : super();
  final ScanType scanType;
  @override
  _ScanPageState createState() => _ScanPageState(scanType);
}

class _ScanPageState extends State<ScanPage> {
  ScanType? scanType;
  BuildContext? _context;

  _ScanPageState(ScanType scanType) {
    super.initState();
    this.scanType = scanType;

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

  List<TTLockScanModel> _lockList = [];
  List<TTGatewayScanModel> _gatewayList = [];
  List<TTElectricMeterScanModel> _electricMeterList = [];
  List<TTRemoteAccessoryScanModel> _keyPadList = [];
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

  void _initLock(TTLockScanModel scanModel) async {
    _showLoading();

    Map map = Map();
    map["lockMac"] = scanModel.lockMac;
    map["lockVersion"] = scanModel.lockVersion;
    map["isInited"] = scanModel.isInited;
    TTLock.initLock(map, (lockData) {
      _dismissLoading();
      LockConfig.lockData = lockData;
      LockConfig.lockMac = scanModel.lockMac;
      Navigator.push(context,
          new MaterialPageRoute(builder: (BuildContext context) {
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

  void _initElectricMeter(TTElectricMeterScanModel scanModel) async {
    print("init electric meter：" + scanModel.isInited.toString());
    if (scanModel.isInited) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (BuildContext context) {
        return ElectricMeterPage(
          name: scanModel.name,
          mac: scanModel.mac,
        );
      }));
    } else {
      _showLoading();

      Map initParamMap = Map();
      initParamMap["mac"] = scanModel.mac;
      initParamMap["number"] = scanModel.name;
      initParamMap["payMode"] = TTMeterPayMode.postpaid.index;
      initParamMap["price"] = '1';
      TTElectricMeter.init(initParamMap, () {
        _dismissLoading();
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
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

  void _initKeyPad(TTRemoteAccessoryScanModel scanModel) async {
    print("init keyPad");
    var mac = scanModel.mac;
    var lockMac = LockConfig.lockMac;
    var lockData = LockConfig.lockData;
    print("多功能键盘lockData:$lockData");
    print("多功能键盘：$lockMac");
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
                new MaterialPageRoute(builder: (BuildContext context) {
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
            new MaterialPageRoute(builder: (BuildContext context) {
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

  void _connectGateway(String mac, TTGatewayType type) async {
    _showLoading();
    TTGateway.connect(mac, (status) {
      _dismissLoading();
      if (status == TTGatewayConnectStatus.success) {
        //for test
        _configIp(mac);
        StatefulWidget? widget;
        if (type == TTGatewayType.g2) {
          widget = WifiPage(mac: mac);
        } else if (type == TTGatewayType.g3 || type == TTGatewayType.g4) {
          widget = GatewayPage(type: type);
        }

        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return widget!;
        }));
      }
    });
  }

  void _configIp(String mac) {
    Map paramMap = Map();
    paramMap["mac"] = mac;
    paramMap["type"] = TTIpSettingType.DHCP.index;
    //for static ip setting
    // paramMap["type"] = TTIpSettingType.STATIC_IP.index;
    // paramMap["ipAddress"] = "192.168.1.100";
    // paramMap["subnetMask"] = "255.255.255.0";
    // paramMap["router"] = "192.168.1.1";
    // paramMap["preferredDns"] = "xxx.xxx.xxx.xxx";
    // paramMap["alternateDns"] = "xxx.xxx.xxx.xxx";

    TTGateway.configIp(paramMap, () {
      print("config ip success");
    }, (errorCode, errorMsg) {
      print('config ip errorCode:$errorCode msg:$errorMsg');
    });
  }

  void _startScanLock() async {
    _lockList = [];
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
    _gatewayList = [];
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
    _electricMeterList = [];
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
    _keyPadList = [];
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
