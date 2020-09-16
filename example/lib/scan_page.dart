import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter/ttgateway.dart';
import 'wifi_page.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'lock_page.dart';

enum ScanType { lock, gateway }

class ScanPage extends StatefulWidget {
  ScanPage({this.scanType}) : super();
  final ScanType scanType;
  @override
  _ScanPageState createState() => _ScanPageState(scanType);
}

class _ScanPageState extends State<ScanPage> {
  ScanType scanType;
  BuildContext _context;

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

  List<TTLockScanModel> _lockList;
  List<TTGatewayScanModel> _gatewayList;

  @override
  void initState() {
    super.initState();
  }

  void _showLoading() {
    ProgressHud.of(_context).showLoading(text: '');
  }

  void _dismissLoading() {
    ProgressHud.of(_context).dismiss();
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
        );
      }));
    }, (errorCode, errorMsg) {
      _dismissLoading();
    });
  }

  void _connectGateway(String mac) async {
    _showLoading();
    TTGateway.connect(mac, (status) {
      _dismissLoading();
      if (status == TTGatewayConnectStatus.success) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return WifiPage(
            mac: mac,
          );
        }));
      }
    });
  }

  void _startScanLock() async {
    _lockList = List();
    TTLock.startScanLock((scanModel) {
      bool contain = false;
      for (var model in _lockList) {
        if (scanModel.lockMac == model.lockMac) {
          contain = true;
          break;
        }
      }
      if (!contain && !scanModel.isInited) {
        setState(() {
          _lockList.add(scanModel);
        });
      }
    });
  }

  void _startScanGateway() {
    _gatewayList = List();
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
                  if (scanType == ScanType.lock) {
                    TTLockScanModel scanModel = _lockList[index];
                    title = 'Lock：${scanModel.lockName}';
                    subtitle = 'click to init the lock';
                  } else {
                    TTGatewayScanModel scanModel = _gatewayList[index];
                    title = 'Gateway：${scanModel.gatewayName}';
                    subtitle = 'click to connect the gateway';
                  }
                  return ListTile(
                    title: Text(title),
                    subtitle: Text(subtitle),
                    onTap: () {
                      if (scanType == ScanType.lock) {
                        TTLockScanModel scanModel = _lockList[index];
                        TTLock.stopScanLock();
                        _initLock(scanModel);
                      } else {
                        TTGatewayScanModel scanModel = _gatewayList[index];
                        TTGateway.stopScan();
                        _connectGateway(scanModel.gatewayMac);
                      }
                    },
                  );
                })),
      ],
    );
  }
}
