import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 四分段 IPv4 输入：段间 `.` 固定展示，各段仅数字键盘，无需手输点号。
///
/// [controller] 始终存完整 IP（如 `192.168.1.1`）；任一段为空时写回空串，
/// 以便「可选 DNS」等场景把未填完的值视为未填写。
class IpAddressField extends StatefulWidget {
  const IpAddressField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.onChanged,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  State<IpAddressField> createState() => _IpAddressFieldState();
}

class _IpAddressFieldState extends State<IpAddressField> {
  static const _octetCount = 4;

  late final List<TextEditingController> _octets;
  late final List<FocusNode> _focusNodes;
  var _syncingFromParent = false;

  @override
  void initState() {
    super.initState();
    _octets = List.generate(_octetCount, (_) => TextEditingController());
    _focusNodes = List.generate(_octetCount, (_) => FocusNode());
    _applyParentText(widget.controller.text);
    widget.controller.addListener(_onParentChanged);
  }

  @override
  void didUpdateWidget(covariant IpAddressField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onParentChanged);
      widget.controller.addListener(_onParentChanged);
      _applyParentText(widget.controller.text);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onParentChanged);
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final c in _octets) {
      c.dispose();
    }
    super.dispose();
  }

  void _onParentChanged() {
    if (_syncingFromParent) return;
    final next = widget.controller.text;
    if (next == _composeIp()) return;
    _applyParentText(next);
  }

  void _applyParentText(String value) {
    final parts = _parseOctets(value);
    for (var i = 0; i < _octetCount; i++) {
      if (_octets[i].text != parts[i]) {
        _octets[i].value = TextEditingValue(
          text: parts[i],
          selection: TextSelection.collapsed(offset: parts[i].length),
        );
      }
    }
  }

  List<String> _parseOctets(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return List.filled(_octetCount, '');
    }
    final parts = trimmed.split('.');
    return List.generate(
      _octetCount,
      (i) => i < parts.length ? parts[i].replaceAll(RegExp(r'\D'), '') : '',
    );
  }

  String _composeIp() {
    final parts = _octets.map((c) => c.text.trim()).toList();
    if (parts.every((p) => p.isEmpty)) return '';
    // 有内容即拼接（含空段，如 `192.168..1`），交给业务侧校验拦截半成品。
    return parts.join('.');
  }

  void _writeBack() {
    final composed = _composeIp();
    if (widget.controller.text == composed) {
      widget.onChanged?.call(composed);
      return;
    }
    _syncingFromParent = true;
    widget.controller.value = TextEditingValue(
      text: composed,
      selection: TextSelection.collapsed(offset: composed.length),
    );
    _syncingFromParent = false;
    widget.onChanged?.call(composed);
  }

  void _onOctetChanged(int index, String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    final next = digits.length > 3 ? digits.substring(0, 3) : digits;
    if (_octets[index].text != next) {
      _octets[index].value = TextEditingValue(
        text: next,
        selection: TextSelection.collapsed(offset: next.length),
      );
    }
    _writeBack();
    if (next.length == 3 && index < _octetCount - 1) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        border: const OutlineInputBorder(),
        prefixIcon: widget.prefixIcon,
        enabled: widget.enabled,
      ),
      child: Row(
        children: [
          for (var i = 0; i < _octetCount; i++) ...[
            if (i > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  '.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Expanded(
              child: TextField(
                controller: _octets[i],
                focusNode: _focusNodes[i],
                enabled: widget.enabled,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 3,
                style: theme.textTheme.bodyLarge,
                decoration: const InputDecoration(
                  counterText: '',
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => _onOctetChanged(i, value),
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
