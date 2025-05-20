import 'package:flutter/material.dart';
import 'package:ttlock_flutter/TTElectricMeter.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_flutter/ttlock.dart';

class ElectricMeterPage extends StatefulWidget {
  ElectricMeterPage({Key? key, required this.name, required this.mac})
      : super(key: key);
  final String name;
  final String mac;
  _ElectricMeterState createState() => _ElectricMeterState(name, mac);
}

enum Command {
  reset,
  readData,
  setOnOff,
  setRemainderKwh,
  clearRemainderKwh,
  setMaxPower,
  setPayMode,
  recharge,
  readFeatureValue
}

class _ElectricMeterState extends State<ElectricMeterPage> {
  List<Map<String, Command>> _commandList = [
    {"Reset": Command.reset},
    {"Read data": Command.readData},
    {"Set on off": Command.setOnOff},
    {"Set remainder kwh": Command.setRemainderKwh},
    {"Clear remainder kwh": Command.clearRemainderKwh},
    {"Set max power": Command.setMaxPower},
    {"Set pay mode": Command.setPayMode},
    {"Recharge": Command.recharge},
    {"Read feature value": Command.readFeatureValue}
  ];

  String note =
      'Note: You need to reset the electric meter before pop current page,otherwise the electric meter will can\'t be initialized again';

  String mac = '';
  String name = '';
  BuildContext? _context;

  _ElectricMeterState(String name, String mac) {
    super.initState();
    this.name = name;
    this.mac = mac;
  }

  void _showLoading(String text) {
    ProgressHud.of(_context!)!.showLoading(text: text);
  }

  void _showSuccessAndDismiss(String text) {
    ProgressHud.of(_context!)!.showSuccessAndDismiss(text: text);
  }

  void _showErrorAndDismiss(TTMeterErrorCode errorCode, String errorMsg) {
    ProgressHud.of(_context!)!.showErrorAndDismiss(
        text: 'errorCode:$errorCode errorMessage:$errorMsg');
  }

  void _click(Command command, BuildContext context) async {
    _showLoading('');
    switch (command) {
      case Command.reset:
        TTElectricMeter.delete(mac, () {
          _showSuccessAndDismiss("Reset success");
          Navigator.popAndPushNamed(context, '/');
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setOnOff:
        TTElectricMeter.setPowerOnOff(mac, false, () {
          _showSuccessAndDismiss("Set Power success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.readData:
        TTElectricMeter.readData(mac, () {
          _showSuccessAndDismiss("Read data success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setRemainderKwh:
        TTElectricMeter.setRemainderKwh(mac, '100.1', () {
          _showSuccessAndDismiss("Set remainder kwh success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.clearRemainderKwh:
        TTElectricMeter.clearRemainderKwh(mac, () {
          _showSuccessAndDismiss("Clear remainder kwh success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.setPayMode:
        TTElectricMeter.setPayMode(mac, "1.0", TTMeterPayMode.prepaid, () {
          _showSuccessAndDismiss("Set pay mode success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.setMaxPower:
        TTElectricMeter.setMaxPower(mac, 280, () {
          _showSuccessAndDismiss("Set max power success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.recharge:
        TTElectricMeter.recharge(mac, '1', '2', () {
          _showSuccessAndDismiss("Recharge success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.readFeatureValue:
        TTElectricMeter.readFeatureValue(mac, () {
          _showSuccessAndDismiss("Read feature value success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      default:
    }
  }

  Widget getListView() {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 2, color: Colors.green);
        },
        itemCount: _commandList.length,
        itemBuilder: (context, index) {
          Map<String, Command> map = _commandList[index];
          String title = '${map.keys.first}';

          return ListTile(
            title: Text(title),
            subtitle: Text(index == 0 ? note : ''),
            onTap: () {
              _click(map.values.first, context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Electric Meter'),
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
}
