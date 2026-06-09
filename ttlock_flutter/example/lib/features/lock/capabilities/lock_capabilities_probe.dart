import 'package:flutter/foundation.dart';
import 'package:ttlock_flutter/ttlock.dart';

Future<Set<TTLockFunction>> probeLockCapabilities(
  TTLockApi api,
  String lockData,
) async {
  final supported = <TTLockFunction>{};
  for (final f in TTLockFunction.values) {
    try {
      final isSupported = await api.supportFunction(f, lockData);
      debugPrint('TTLockFunction $f: $isSupported');
      if (isSupported) supported.add(f);
    } catch (e) {
      debugPrint('Error probing TTLockFunction $f: $e');
    }
  }
  return supported;
}

List<String> capabilitiesToJson(Set<TTLockFunction> set) =>
    set.map((e) => e.name).toList();
