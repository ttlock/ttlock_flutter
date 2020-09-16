import 'package:flutter/material.dart';
import 'gateway_page.dart';
import 'package:ttlock_flutter/ttgateway.dart';
import 'package:bmprogresshud/progresshud.dart';

class WifiPage extends StatefulWidget {
  WifiPage({this.mac}) : super();
  final String mac;
  @override
  _WifiPageState createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  List _wifiList = List();
  // BuildContext _context;

  _WifiPageState() {
    super.initState();
    _getNearbyWifi();
  }

  void _getNearbyWifi() {
    // ProgressHud.of(_context).showLoading();
    TTGateway.getNearbyWifi((finished, wifiList) {
      // ProgressHud.of(_context).dismiss();
      for (var map1 in wifiList) {
        bool contain = false;
        for (var map2 in _wifiList) {
          if (map1['wifi'] == map2['wifi']) {
            contain = true;
          }
        }
        if (!contain) {
          setState(() {
            _wifiList.add(map1);
          });
        }
      }
    }, (errorCode, errorMsg) {});
  }

  void _pushGatewayPage(String wifi) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return GatewayPage(
        wifi: wifi,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Wifi'),
        ),
        body: Material(child: ProgressHud(
          child: Container(
            child: Builder(builder: (context) {
              // _context = context;
              return getList();
            }),
          ),
        )));
  }

  Widget getList() {
    return ListView.builder(
        itemCount: _wifiList.length,
        padding: new EdgeInsets.all(5.0),
        itemExtent: 50.0,
        itemBuilder: (context, index) {
          Map wifiMap = _wifiList[index];
          int rssi = wifiMap['rssi'];
          return ListTile(
            title: Text(wifiMap['wifi']),
            subtitle: Text('rssi:$rssi'),
            onTap: () {
              Map wifiMap = _wifiList[index];
              String wifi = wifiMap['wifi'];
              _pushGatewayPage(wifi);
            },
          );
        });
  }
}
