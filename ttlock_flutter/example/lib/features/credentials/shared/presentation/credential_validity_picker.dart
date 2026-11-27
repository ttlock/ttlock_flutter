import 'package:flutter/material.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

/// 添加页：永久 / 限期 / 循环三选一。
class CredentialValidityPicker extends StatelessWidget {
  const CredentialValidityPicker({
    super.key,
    required this.value,
    required this.showCyclic,
    required this.onChanged,
    this.enabled = true,
  });

  final CredentialValidityKind value;
  final bool showCyclic;
  final ValueChanged<CredentialValidityKind> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RadioGroup<CredentialValidityKind>(
      groupValue: value,
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RadioListTile<CredentialValidityKind>(
            title: Text(l10n.permanent),
            value: CredentialValidityKind.permanent,
            enabled: enabled,
          ),
          RadioListTile<CredentialValidityKind>(
            title: Text(l10n.limited),
            value: CredentialValidityKind.limited,
            enabled: enabled,
          ),
          if (showCyclic)
            RadioListTile<CredentialValidityKind>(
              title: Text(l10n.recurring),
              value: CredentialValidityKind.cyclic,
              enabled: enabled,
            ),
        ],
      ),
    );
  }
}
