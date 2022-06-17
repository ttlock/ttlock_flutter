import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttgateway.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter_example/gateway_page.dart';
import 'wifi_page.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'lock_page.dart';

enum ScanType { lock, gateway }

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
    } else {
      _startScanGateway();
    }
  }

  List<TTLockScanModel> _lockList = [];
  List<TTGatewayScanModel> _gatewayList = [];

  void dispose() {
    if (scanType == ScanType.lock) {
      TTLock.stopScanLock();
    } else {
      TTGateway.stopScan();
    }
    super.dispose();
  }

  void _showLoading() {
    ProgressHud.of(_context!).showLoading(text: '');
  }

  void _dismissLoading() {
    ProgressHud.of(_context!).dismiss();
  }

  void _initLock(TTLockScanModel scanModel) async {
    _showLoading();

    Map map = Map();
    map["lockMac"] = scanModel.lockMac;
    map["lockVersion"] = scanModel.lockVersion;
    map["isInited"] = scanModel.isInited;
    TTLock.initLock(map, (lockData) {
      _dismissLoading();
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

  @override
  Widget build(BuildContext context) {
    String title = scanType == ScanType.lock ? 'Lock' : 'Gateway';
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
    String gatewayNote = 'please repower the gateway';
    String lockNote = 'please touch the keyboard of lock';
    String note = scanType == ScanType.lock ? lockNote : gatewayNote;
    return Column(
      children: <Widget>[
        Text(note),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 2, color: Colors.green);
                },
                itemCount: (scanType == ScanType.lock
                    ? _lockList.length
                    : _gatewayList.length),
                itemBuilder: (context, index) {
                  String title;
                  String subtitle;
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
                  } else {
                    TTGatewayScanModel scanModel = _gatewayList[index];
                    title = 'Gateway：${scanModel.gatewayName}';
                    subtitle = 'click to connect the gateway';
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
                      } else {
                        TTGatewayScanModel scanModel = _gatewayList[index];
                        TTGateway.stopScan();
                        _connectGateway(scanModel.gatewayMac, scanModel.type!);
                      }
                    },
                  );
                })),
      ],
    );
  }
}
