import 'package:flutter/material.dart';
import 'package:bmprogresshud/progresshud.dart';
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
    if (Config.uid == 0 || Config.ttlockLoginPassword.length == 0) {
      String text = 'Please config the ttlockUid and the ttlockLoginPassword';
      ProgressHud.of(_context!).showAndDismiss(ProgressHudType.error, text);
      return;
    }
    _startScan(ScanType.gateway);
  }

  void _startScanLock() {
    _startScan(ScanType.lock);
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
      )
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
