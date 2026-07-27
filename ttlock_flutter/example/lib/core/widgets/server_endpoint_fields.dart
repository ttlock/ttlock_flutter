import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../config/server_endpoint_config.dart';
import '../../features/settings/model/config_model.dart';

/// 设备初始化/配网时使用的服务器地址与端口输入，默认取自 [ConfigModel]。
class ServerEndpointFields extends HookWidget {
  const ServerEndpointFields({
    super.key,
    required this.config,
    required this.deviceKind,
    required this.ipController,
    required this.portController,
  });

  final ConfigModel config;
  final DeviceServerKind deviceKind;
  final TextEditingController ipController;
  final TextEditingController portController;

  @override
  Widget build(BuildContext context) {
    final endpoint = config.defaultServerEndpoint(deviceKind);

    useEffect(() {
      if (ipController.text.isEmpty) {
        ipController.text = endpoint.address;
      }
      if (portController.text.isEmpty) {
        portController.text = endpoint.port;
      }
      return null;
    }, [config.uid, config.serverRegion, config.serverIp, config.serverPort]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: ipController,
          decoration: const InputDecoration(
            labelText: 'Server Address',
            hintText: 'e.g. cnplug.ttlock.com',
          ),
          validator: (value) =>
              value == null || value.trim().isEmpty ? 'Server address is required' : null,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: portController,
          decoration: const InputDecoration(
            labelText: 'Server Port',
            hintText: 'e.g. 2999',
          ),
          keyboardType: TextInputType.number,
          validator: (value) =>
              value == null || value.trim().isEmpty ? 'Server port is required' : null,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
