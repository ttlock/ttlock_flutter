import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';

import 'gateway_page.dart';

class WifiPage extends StatefulWidget {
  WifiPage({required this.mac}) : super();
  final String mac;
  @override
  _WifiPageState createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  List _wifiList = [];
  StreamSubscription? _wifiSub;

  @override
  void initState() {
    super.initState();
    _getNearbyWifi();
  }

  @override
  void dispose() {
    _wifiSub?.cancel();
    super.dispose();
  }

  void _getNearbyWifi() {
    _wifiSub = TTLock.gateway.gatewayGetNearbyWifi(gatewayMac: widget.mac).listen(
      (wifiList) {
        setState(() {
          _wifiList = wifiList;
        });
      },
      onError: (e) => print('WiFi scan error: $e'),
    );
  }

  void _pushGatewayPage(String wifi) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return GatewayPage(type: TTGatewayType.g2, wifi: wifi);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select Wifi')),
        body: Material(child: ProgressHud(
          child: Container(
            child: Builder(builder: (context) {
              return getList();
            }),
          ),
        )));
  }

  Widget getList() {
    return ListView.builder(
        itemCount: _wifiList.length,
        padding: EdgeInsets.all(5.0),
        itemExtent: 50.0,
        itemBuilder: (context, index) {
          Map wifiMap = _wifiList[index];
          int rssi = wifiMap['rssi'];
          return ListTile(
            title: Text(wifiMap['wifi']),
            subtitle: Text('rssi:$rssi'),
            onTap: () {
              String wifi = wifiMap['wifi'];
              _pushGatewayPage(wifi);
            },
          );
        });
  }
}
