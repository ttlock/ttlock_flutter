import 'package:flutter/material.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';

import 'config.dart';

class GatewayPage extends StatefulWidget {
  GatewayPage({required this.type, this.wifi}) : super();
  final String? wifi;
  final TTGatewayType type;
  @override
  _GatewayPageState createState() => _GatewayPageState();
}

class _GatewayPageState extends State<GatewayPage> {
  BuildContext? _context;
  String? _wifiPassword;

  void _showLoading() => ProgressHud.of(_context!).showLoading();
  void _showAndDismiss(ProgressHudType type, String text) =>
      ProgressHud.of(_context!).showAndDismiss(type, text);

  void _initGateway() async {
    if (widget.type == TTGatewayType.g2 &&
        (widget.wifi == null || _wifiPassword == null || _wifiPassword!.isEmpty)) {
      _showAndDismiss(ProgressHudType.error, 'WiFi or password cannot be empty');
      return;
    }

    final params = TTGatewayInitParams(
      type: widget.type.value,
      ttlockUid: Config.uid,
      gatewayName: Config.gatewayName,
      wifi: widget.wifi,
      wifiPassword: _wifiPassword,
      serverIp: Config.gatewayServerIp.isNotEmpty ? Config.gatewayServerIp : null,
      serverPort: Config.gatewayServerPort.isNotEmpty ? Config.gatewayServerPort : null,
    );

    _showLoading();
    try {
      final result = await TTLock.gateway.init(params);
      print(result);
      _showAndDismiss(ProgressHudType.success, 'Init Gateway Success');
    } on TTGatewayException catch (e) {
      _showAndDismiss(ProgressHudType.error, '${e.error}: ${e.message}');
      if (e.error == TTGatewayError.notConnect || e.error == TTGatewayError.disconnect) {
        print("Please repower and connect the gateway again");
      }
    } catch (e) {
      _showAndDismiss(ProgressHudType.error, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Gateway")),
        body: Material(child: ProgressHud(
          child: Container(
            child: Builder(builder: (context) {
              _context = context;
              return getChild();
            }),
          ),
        )));
  }

  Widget getChild() {
    final initButton = ElevatedButton(
      child: Text('Init Gateway'),
      onPressed: () {
        FocusScope.of(_context!).requestFocus(FocusNode());
        _initGateway();
      },
    );

    if (widget.type == TTGatewayType.g2) {
      return Column(
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            controller: TextEditingController(text: widget.wifi),
            enabled: false,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: 'Input wifi password'),
            onChanged: (content) => _wifiPassword = content,
          ),
          initButton,
        ],
      );
    } else {
      return Center(child: initButton);
    }
  }
}
