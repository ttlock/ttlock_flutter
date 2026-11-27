  import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_json_loader.g.dart';

class ConfigJsonLoader {
  const ConfigJsonLoader();

  Future<Map<String, dynamic>> load() async {
    final raw = await rootBundle.loadString('assets/config.json');
    final decoded = jsonDecode(raw);
    if (decoded is Map<String, dynamic>) return decoded;
    if (decoded is Map) return Map<String, dynamic>.from(decoded);
    return {};
  }
}

@Riverpod(keepAlive: true)
ConfigJsonLoader configJsonLoader(Ref ref) => const ConfigJsonLoader();
