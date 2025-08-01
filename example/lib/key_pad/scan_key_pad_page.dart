import 'package:bmprogresshud/progresshud.dart';
import 'package:flutter/material.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';
import 'package:ttlock_premise_flutter/ttremoteKeypad.dart';

class ScanKeyPadPage extends StatefulWidget {
  final String lockData;
  final String lockMac;
  const ScanKeyPadPage({Key? key, required this.lockData, required this.lockMac}):super(key: key);

  @override
  State<ScanKeyPadPage> createState() => _ScanKeyPadPageState();
}

class _ScanKeyPadPageState extends State<ScanKeyPadPage> {
  TTRemoteAccessoryScanModel? model;

  bool isInit = false;
  bool isMultifunctionalKeypad = false;
  late BuildContext context;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scanKeyPad();
    });
    super.initState();
  }

  @override
  void dispose() {
    TTRemoteKeypad.stopScan();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan KeyPad'),
      ),
      body: ProgressHud(
        child: Container(
          child: Builder(builder: (context) {
            this.context = context;
            return Column(
              children: [
                ListTile(
                  title: Text(model?.name??''),
                  subtitle: Text('Click to Init'),
                  onTap: () {
                    if(model == null)
                    {
                      return;
                    }
                    TTRemoteKeypad.stopScan();
                    _showLoading('waiting init keypad');
                    isMultifunctionalKeypad = model?.isMultifunctionalKeypad??false;
                    if(!isInit)
                    {

                      if(isMultifunctionalKeypad)
                      {
                        TTRemoteKeypad.multifunctionalInit(
                            model!.mac,
                            widget.lockData, (
                            int electricQuantity,
                            String wirelessKeypadFeatureValue,
                            int slotNumber,
                            int slotLimit){
                          if(mounted)
                            {
                              setState(() {
                                isInit = true;
                              });
                            }
                          _showSuccessAndDismiss('init keypad success');
                        },(TTLockError errorCode, String errorMsg){
                          _showErrorAndDismiss(errorMsg);
                        },(TTRemoteKeyPadAccessoryError errorCode, String errorMsg){
                          _showErrorAndDismiss(errorMsg);
                        });
                      }else
                      {
                        TTRemoteKeypad.init(model!.mac, widget.lockMac, (
                            int electricQuantity, String wirelessKeypadFeatureValue){

                        }, (TTRemoteAccessoryError errorCode, String errorMsg){

                        });
                      }
                    }
                  },
                ),
                getContent()
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget getContent()
  {
    if(!isInit)
      {
        return SizedBox();
      }
    if(!isMultifunctionalKeypad)
    {
      return SizedBox();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Delete stored lock'),
          subtitle: Text('Click to delete stored lock'),
          onTap: () {
            if(model == null)
            {
              return;
            }
            _showLoading('waiting deleteStoredLock');

            TTRemoteKeypad.deleteStoredLock(model!.mac,1, (){
              _showSuccessAndDismiss("deleteStoredLock success");
              Navigator.pop(context);
            },(TTRemoteKeyPadAccessoryError errorCode, String errorMsg){
              _showErrorAndDismiss(errorMsg);
            });
          },
        ),

        ListTile(
          title: Text('Add fingerprint'),
          subtitle: Text('Click Add fingerprint'),
          onTap: () {
            if(model == null)
            {
              return;
            }
            _showLoading('waiting Add fingerprint');

            TTRemoteKeypad.addFingerprint(model!.mac,null,0,0, widget.lockData, (
                int currentCount, int totalCount){
               print("多功能键盘添加指纹currentCount：$currentCount;;;totalCount:$totalCount");
            },(String fingerprintNumber){
              _showSuccessAndDismiss("addFingerprint success");
            },(
                TTLockError errorCode, String errorMsg){
              _showErrorAndDismiss(errorMsg);
            },(TTRemoteKeyPadAccessoryError errorCode, String errorMsg){
              _showErrorAndDismiss(errorMsg);
            });
          },
        ),

        ListTile(
          title: Text('Add Card'),
          subtitle: Text('Click to Add Card'),
          onTap: () {
            if(model == null)
            {
              return;
            }
            _showLoading('waiting Add Card');

            TTRemoteKeypad.addCard(null,0,0, widget.lockData, (){
              print("多功能键盘添加卡：请刷卡");
            },(String cardNumber){
              _showSuccessAndDismiss("addCard success");
            },(
                TTLockError errorCode, String errorMsg){
              _showErrorAndDismiss(errorMsg);
            });
          },
        ),
      ],
    );
  }


  void scanKeyPad() {
    TTRemoteKeypad.startScan((TTRemoteAccessoryScanModel scanModel){
      if(mounted)
        {
          setState(() {
            model = scanModel;
          });
        }

    });
  }

  void _showLoading(String text) {
    ProgressHud.of(context).showLoading(text: text);
  }

  void _showSuccessAndDismiss(String text) {
    ProgressHud.of(context).showSuccessAndDismiss(text: text);
  }

  void _showErrorAndDismiss(String errorMsg) {
    ProgressHud.of(context).showErrorAndDismiss(
        text: 'errorMessage:$errorMsg');
  }
}
