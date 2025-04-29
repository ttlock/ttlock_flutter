import 'package:flutter/material.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_flutter/ttelectricMeter.dart';
import 'scan_page.dart';
import 'config.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext? _context;

  void _startScanGateway() {
    if (GatewayConfig.uid == 0 ||
        GatewayConfig.ttlockLoginPassword.length == 0) {
      String text = 'Please config the ttlockUid and the ttlockLoginPassword';
      ProgressHud.of(_context!)!.showAndDismiss(ProgressHudType.error, text);

      return;
    }
    _startScan(ScanType.gateway);
  }

  void _startScanLock() {
    _startScan(ScanType.lock);
  }

  void _startScanElectricMeter() {
    ElectricMeterServerParamMode electricMeterServerParamMode =
        ElectricMeterServerParamMode();
    // electricMeterServerParamMode.url = 'https://cntestservlet.sciener.cn/lock/electricMeterCommand/executeCommand';
    // electricMeterServerParamMode.clientId = '607ab4bcc9504a5da58c43575a1b3746';
    // electricMeterServerParamMode.accessToken = 'VgC8yDPW/jr6V31nNAcCEkFLNA6o27cQ6OZDjF4iNbKbSz1kU5LcoMh0I4xgbZNZ';
    electricMeterServerParamMode.url = "https://cntestservlet.sciener.cn";
    electricMeterServerParamMode.clientId = '607ab4bcc9504a5da58c43575a1b3746';
    electricMeterServerParamMode.accessToken =
        'fj81Mf4Mnglw5knoaTmjLG8c4H2fdhpWB37wwFJh2dI=';

    TTElectricMeter.configServer(electricMeterServerParamMode);
    _startScan(ScanType.electricMeter);
  }


  void _startKeyPadPage() {
    _startScan(ScanType.keyPad);
  }

  void _startScan(ScanType scanType) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return ScanPage(
        scanType: scanType,
      );
    }));
  }

  Widget getChild() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ElevatedButton(
        child: Text('Lock', style: TextStyle(fontWeight: FontWeight.w600)),
        onPressed: _startScanLock,
      ),
      ElevatedButton(
        child: Text('Gateway', style: TextStyle(fontWeight: FontWeight.w600)),
        onPressed: _startScanGateway,
      ),
      ElevatedButton(
        child: Text('Electric Meter',
            style: TextStyle(fontWeight: FontWeight.w600)),
        onPressed: _startScanElectricMeter,
      ),
      ElevatedButton(
        child: Text('Key Pad',
            style: TextStyle(fontWeight: FontWeight.w600)),
        onPressed: _startKeyPadPage,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TTLock Demo'),
        ),
        body: Material(child: ProgressHud(
          child: Center(
            child: Builder(builder: (context) {
              _context = context;
              return getChild();
            }),
          ),
        )));
  }
}
