import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttelectricMeter.dart';
import 'package:bmprogresshud/progresshud.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter/ttremoteKeypad.dart';

class KeyPadPage extends StatefulWidget {
  KeyPadPage(
      {Key? key,
      required this.name,
      required this.mac,
      required this.lockMac,
      required this.lockData})
      : super(key: key);
  final String name;
  final String mac;
  final String lockMac;
  final String lockData;
  _KeyPadState createState() => _KeyPadState(name, mac, lockMac, lockData);
}

enum Command { getStoredLocks, deleteStoredLock, addFingerprint, addCard }

class _KeyPadState extends State<KeyPadPage> {
  List<Map<String, Command>> _commandList = [
    {"getStoredLocks": Command.getStoredLocks},
    {"deleteStoredLock": Command.deleteStoredLock},
    {"addFingerprint": Command.addFingerprint},
    {"addCard": Command.addCard}
  ];

  String note =
      'Note: You need to reset the electric meter before pop current page,otherwise the electric meter will can\'t be initialized again';

  String mac = '';
  String name = '';
  String lockMac = '';
  String lockData = '';
  BuildContext? _context;

  _KeyPadState(String name, String mac, String lockMac, String lockData) {
    super.initState();
    this.name = name;
    this.mac = mac;
    this.lockMac = lockMac;
    this.lockData = lockData;
  }

  void _showLoading(String text) {
    ProgressHud.of(_context!)!.showLoading(text: text);
  }

  void _showSuccessAndDismiss(String text) {
    ProgressHud.of(_context!)!.showSuccessAndDismiss(text: text);
  }

  void _showErrorAndDismiss(
      TTRemoteKeyPadAccessoryError errorCode, String errorMsg) {
    ProgressHud.of(_context!)!.showErrorAndDismiss(
        text: 'errorCode:$errorCode errorMessage:$errorMsg');
  }

  void _click(Command command, BuildContext context) async {
    _showLoading('');
    switch (command) {
      case Command.getStoredLocks:
        TTRemoteKeypad.getStoredLocks(mac, (List lockMacList) {
          _showSuccessAndDismiss("lockMacList:$lockMacList");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;

      case Command.deleteStoredLock:
        TTRemoteKeypad.deleteStoredLock(mac, 1, () {
          _showSuccessAndDismiss("Set Power success");
        }, (errorCode, errorMsg) {
          _showErrorAndDismiss(errorCode, errorMsg);
        });
        break;
      case Command.addFingerprint:
        TTRemoteKeypad.addFingerprint(mac,
            null,
            1746673751000,
            1746760151000,
            lockData,
                (int currentCount, int totalCount){
               print("addFingerprint;;;currentCount:$currentCount;;;;totalCount:$totalCount");
            }, (String fingerprintNumber) {
              print("addFingerprint fingerprintNumber:$fingerprintNumber");
            }, (errorCode, errorMsg) {
              print("addFingerprint;;;errorCode:$errorCode;;;;errorMsg:$errorMsg");

            }, (TTRemoteKeyPadAccessoryError errorCode, String errorMsg){
              print("addFingerprint;;;errorCode:$errorCode;;;;errorMsg:$errorMsg");
            });
        break;
      case Command.addCard:
        TTRemoteKeypad.addCard(
            null,
            0,
            0,
            lockData,
                (){
              print("addCard;;;请刷卡");
            }, (String cardNumber) {
              print("addCard fingerprintNumber:$cardNumber");
              _showSuccessAndDismiss("addCard success");
            }, (errorCode, errorMsg) {
              print("addCard;;;errorCode:$errorCode;;;;errorMsg:$errorMsg");
              ProgressHud.of(_context!)!.showErrorAndDismiss(
                  text: 'errorCode:$errorCode errorMessage:$errorMsg');
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
          title: Text('Key Pad'),
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
