import 'package:flutter/material.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_flutter/ttgateway.dart';
import 'package:ttlock_flutter/ttlock.dart';

import 'config.dart';

class GatewayPage extends StatefulWidget {
  GatewayPage({this.wifi}) : super();
  final String wifi;
  @override
  _GatewayPageState createState() => _GatewayPageState(wifi);
}

class _GatewayPageState extends State<GatewayPage> {
  BuildContext _context;
  String _wifi;
  String _wifiPassword = '';
  _GatewayPageState(String wifi) {
    super.initState();
    _wifi = wifi;
  }

  void _showLoading() {
    ProgressHud.of(_context).showLoading(text: '');
  }

  void _showAndDismiss(ProgressHudType type, String text) {
    ProgressHud.of(_context).showAndDismiss(type, text);
  }

  void _initGateway(String wifi, String wifiPassword) {
    FocusScope.of(_context).requestFocus(FocusNode());

    Map paramMap = Map();
    paramMap["wifi"] = wifi;
    paramMap["wifiPassword"] = wifiPassword;
    paramMap["gatewayName"] = Config.gatewayName;
    paramMap["ttlockUid"] = Config.ttlockUid;
    paramMap["ttlockLoginPassword"] = Config.ttlockLoginPassword;

    // test account.  ttlockUid = 17498, ttlockLoginPassword = "1111111"
    if (Config.ttlockUid == 17498) {
      String errorDesc =
          "Please config ttlockUid and ttlockLoginPassword. Reference documentation ‘https://open.sciener.com/doc/api/v3/user/getUid’";
      _showAndDismiss(ProgressHudType.error, errorDesc);
      print(errorDesc);
      return;
    }

    _showLoading();
    TTGateway.init(paramMap, (map) {
      print(map);
      _showAndDismiss(ProgressHudType.success, 'Init Gateway Success');
    }, (errorCode, errorMsg) {
      _showAndDismiss(
          ProgressHudType.error, 'errorCode:$errorCode msg:$errorMsg');
      if (errorCode == TTGatewayError.notConnect ||
          errorCode == TTGatewayError.disconnect) {
        print("Please repower  and connect the gateway again");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gateway"),
        ),
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
    return Column(
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          controller: TextEditingController(text: _wifi),
          enabled: false,
        ),
        TextField(
          textAlign: TextAlign.center,
          controller: TextEditingController(text: _wifiPassword),
          decoration: InputDecoration(hintText: 'Input wifi password'),
          onChanged: (String content) {
            _wifiPassword = content;
          },
        ),
        RaisedButton(
          child: Text('Init Gateway'),
          onPressed: () {
            if (_wifiPassword.length > 0) {
              _initGateway(_wifi, _wifiPassword);
            } else {
              _showAndDismiss(
                  ProgressHudType.error, '"wifiPasswor cant be empty');
            }
          },
        )
      ],
    );
  }
}
