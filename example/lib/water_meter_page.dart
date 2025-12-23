import 'package:bmprogresshud/progresshud.dart';
import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter/ttwaterMeter.dart';

enum Command {
  reset,
  recharge
}

class WaterMeterPage extends StatefulWidget {
  final String name;
  final String mac;
  const WaterMeterPage({Key? key, required this.name, required this.mac}):super(key: key);

  @override
  State<WaterMeterPage> createState() => _WaterMeterPageState();
}

class _WaterMeterPageState extends State<WaterMeterPage> {

  List<Map<String, Command>> _commandList = [
    {"Reset": Command.reset},
    // {"Read data": Command.readData},
    // {"Set on off": Command.setOnOff},
    // {"Set remainder kwh": Command.setRemainderKwh},
    // {"Clear remainder kwh": Command.clearRemainderKwh},
    // {"Set max power": Command.setMaxPower},
    // {"Set pay mode": Command.setPayMode},
    {"Recharge": Command.recharge},
    // {"Read feature value": Command.readFeatureValue}
  ];

  String note =
      'Note: You need to reset the water meter before pop current page,otherwise the water meter will can\'t be initialized again';

  String get mac => widget.mac;
  String get name => widget.name;
  BuildContext? _context;


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
        TTWaterMeter.delete(mac, () {
          _showSuccessAndDismiss("Reset success");
          Navigator.popAndPushNamed(context, '/');
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.recharge:
        TTWaterMeter.recharge(mac, "50", "100", () {
          _showSuccessAndDismiss("recharge success");
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
          title: Text('Water Meter'),
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
