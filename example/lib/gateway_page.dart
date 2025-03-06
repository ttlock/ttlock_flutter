import 'package:flutter/material.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_flutter/ttgateway.dart';
import 'package:ttlock_flutter/ttlock.dart';

import 'config.dart';

class GatewayPage extends StatefulWidget {
  GatewayPage({required this.type, this.wifi}) : super();
  final String? wifi;
  final TTGatewayType type;
  @override
  _GatewayPageState createState() => _GatewayPageState(type, wifi);
}

class _GatewayPageState extends State<GatewayPage> {
  BuildContext? _context;
  String? _wifi;
  String? _wifiPassword;
  TTGatewayType? _type;
  _GatewayPageState(TTGatewayType type, String? wifi) {
    super.initState();
    _wifi = wifi;
    _type = type;
  }

  void _showLoading() {
    ProgressHud.of(_context!)!.showLoading();
  }

  void _showAndDismiss(ProgressHudType type, String text) {
    ProgressHud.of(_context!)!.showAndDismiss(type, text);
  }

  void _initGateway_2(String? wifi, String? wifiPassword) {
    if (_wifi == null || _wifiPassword != null || _wifiPassword!.length == 0) {
      _showAndDismiss(ProgressHudType.error, '"wifi or password cant be empty');
    }

    Map paramMap = Map();
    paramMap["wifi"] = wifi;
    paramMap["wifiPassword"] = wifiPassword;
    paramMap["type"] = _type!.index;
    paramMap["gatewayName"] = GatewayConfig.gatewayName;
    paramMap["uid"] = GatewayConfig.uid;
    paramMap["ttlockLoginPassword"] = GatewayConfig.ttlockLoginPassword;
    _initGateway(paramMap);
  }

  void _initGateway_3_4() {
    Map paramMap = Map();
    paramMap["type"] = _type!.index;
    paramMap["gatewayName"] = GatewayConfig.gatewayName;
    paramMap["uid"] = GatewayConfig.uid;
    paramMap["ttlockLoginPassword"] = GatewayConfig.ttlockLoginPassword;
    _initGateway(paramMap);
  }

  void _initGateway(Map paramMap) {
    // test account.  ttlockUid = 17498, ttlockLoginPassword = "1111111"
    // if (Config.ttlockUid == 17498) {
    //   String errorDesc =
    //       "Please config ttlockUid and ttlockLoginPassword. Reference documentation ‘https://open.sciener.com/doc/api/v3/user/getUid’";
    //   _showAndDismiss(ProgressHudType.error, errorDesc);
    //   print(errorDesc);
    //   return;
    // }

    _showLoading();
    TTGateway.init(paramMap, (map) {
      print("网关添加结果");
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
    TextField wifiTextField = TextField(
      textAlign: TextAlign.center,
      controller: TextEditingController(text: _wifi),
      enabled: false,
    );

    TextField wifiPasswordTextField = TextField(
        textAlign: TextAlign.center,
        controller: TextEditingController(text: _wifiPassword),
        decoration: InputDecoration(hintText: 'Input wifi password'),
        onChanged: (String content) {
          _wifiPassword = content;
        });

    ElevatedButton initGatewayButton = ElevatedButton(
      child: Text('Init Gateway'),
      onPressed: () {
        FocusScope.of(_context!).requestFocus(FocusNode());
        //g2
        if (_type == TTGatewayType.g2) {
          _initGateway_2(_wifi, _wifiPassword);
        } else {
          //g3 g4
          _initGateway_3_4();
        }
      },
    );

    if (_type == TTGatewayType.g2) {
      return Column(
        children: <Widget>[
          wifiTextField,
          wifiPasswordTextField,
          initGatewayButton
        ],
      );
    } else {
      return Center(child: initGatewayButton);
    }
  }
}
