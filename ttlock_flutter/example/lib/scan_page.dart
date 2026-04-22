import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';
import 'package:ttlock_flutter_example/gateway_page.dart';
import 'package:ttlock_flutter_example/lock_page.dart';
import 'package:ttlock_flutter_example/wifi_page.dart';
import 'package:bmprogresshud/progresshud.dart';

enum ScanType { lock, gateway }

class ScanPage extends StatefulWidget {
  const ScanPage({super.key, required this.scanType});
  final ScanType scanType;

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  ScanType get scanType => widget.scanType;
  BuildContext? _context;

  List<TTLockScanModel> _lockList = [];
  List<TTGatewayScanModel> _gatewayList = [];
  StreamSubscription<TTLockScanModel>? _lockSub;
  StreamSubscription<TTGatewayScanModel>? _gatewaySub;

  @override
  void initState() {
    super.initState();
    TTLock.printLog = true;
    if (scanType == ScanType.lock) {
      _startScanLock();
    } else {
      _startScanGateway();
    }
  }

  @override
  void dispose() {
    _lockSub?.cancel();
    _gatewaySub?.cancel();
    // 网关扫描由 EventChannel 管理，取消订阅后原生 onCancel 会 stopScanGateway
    super.dispose();
  }

  void _showLoading() {
    ProgressHud.of(_context!).showLoading(text: '');
  }

  void _dismissLoading() {
    ProgressHud.of(_context!).dismiss();
  }

  Future<void> _initLock(TTLockScanModel scanModel) async {
    _showLoading();
    try {
      final params = TTLockInitParams(
        lockMac: scanModel.lockMac,
        lockVersion: scanModel.lockVersion,
        isInited: scanModel.isInited,
      );
      final lockData = await TTLock.lock.initLock(params);
      if (!mounted) return;
      _dismissLoading();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LockPage(
            title: scanModel.lockName,
            lockData: lockData,
            lockMac: scanModel.lockMac,
          ),
        ),
      );
    } catch (_) {
      if (mounted) _dismissLoading();
    }
  }

  Future<void> _connectGateway(String mac, TTGatewayType type) async {
    _showLoading();
    try {
      final status = await TTLock.gateway.connect(mac);
      if (!mounted) return;
      _dismissLoading();
      if (status == TTGatewayConnectStatus.success) {
        Widget? target;
        if (type == TTGatewayType.g2) {
          target = WifiPage(mac: mac);
        } else if (type == TTGatewayType.g3 || type == TTGatewayType.g4) {
          target = GatewayPage(type: type);
        }
        if (target != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => target!),
          );
        }
      }
    } catch (_) {
      if (mounted) _dismissLoading();
    }
  }

  void _startScanLock() {
    _lockList = [];
    _lockSub?.cancel();
    _lockSub = TTLock.lock.lockScanLock().listen((scanModel) {
      if (!mounted) return;
      final idx = _lockList.indexWhere((m) => m.lockMac == scanModel.lockMac);
      if (idx < 0) {
        setState(() {
          _lockList.add(scanModel);
          _lockList.sort((a, b) => (b.isInited ? 0 : 1) - (a.isInited ? 0 : 1));
        });
      } else if (_lockList[idx].isInited != scanModel.isInited) {
        setState(() {
          _lockList[idx] = scanModel;
          _lockList.sort((a, b) => (b.isInited ? 0 : 1) - (a.isInited ? 0 : 1));
        });
      }
    });
  }

  void _startScanGateway() {
    _gatewayList = [];
    _gatewaySub?.cancel();
    _gatewaySub = TTLock.gateway.gatewayStartScan().listen((scanModel) {
      if (!mounted) return;
      final contain = _gatewayList.any((m) => m.gatewayMac == scanModel.gatewayMac);
      if (!contain) {
        setState(() => _gatewayList.add(scanModel));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = scanType == ScanType.lock ? 'Lock' : 'Gateway';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Material(
        child: ProgressHud(
          child: Builder(
            builder: (context) {
              _context = context;
              return getListView();
            },
          ),
        ),
      ),
    );
  }

  Widget getListView() {
    final note = scanType == ScanType.lock
        ? 'please touch the keyboard of lock'
        : 'please repower the gateway';
    final listLength = scanType == ScanType.lock ? _lockList.length : _gatewayList.length;
    return Column(
      children: [
        Text(note),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 2, color: Colors.green),
            itemCount: listLength,
            itemBuilder: (context, index) {
              if (scanType == ScanType.lock) {
                final scanModel = _lockList[index];
                final textColor = scanModel.isInited ? Colors.grey : Colors.black;
                return ListTile(
                  title: Text('Lock：${scanModel.lockName}', style: TextStyle(color: textColor)),
                  subtitle: Text(
                    scanModel.isInited ? 'lock has been inited' : 'click to init the lock',
                    style: TextStyle(color: textColor),
                  ),
                  onTap: () {
                    if (!scanModel.isInited) {
                      _initLock(scanModel);
                    }
                  },
                );
              } else {
                final scanModel = _gatewayList[index];
                return ListTile(
                  title: Text('Gateway：${scanModel.gatewayName}'),
                  subtitle: const Text('click to connect the gateway'),
                  onTap: () {
                    _connectGateway(scanModel.gatewayMac, scanModel.type);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
