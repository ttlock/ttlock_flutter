import 'package:flutter/material.dart';

enum CommandCategory {
  basic('Basic', Icons.lock_outline),
  passcode('Passcode', Icons.dialpad),
  card('IC Card', Icons.credit_card),
  fingerprint('Fingerprint', Icons.fingerprint),
  face('Face', Icons.face),
  palmVein('Palm Vein', Icons.pan_tool_alt),
  network('Network', Icons.wifi),
  security('Security', Icons.shield_outlined),
  behavior('Behavior', Icons.tune),
  advanced('Advanced', Icons.engineering),
  lift('Elevator', Icons.elevator),
  hotel('Hotel', Icons.hotel),
  passageMode('Passage Mode', Icons.door_front_door),
  accessory('Accessories', Icons.cable);

  const CommandCategory(this.label, this.icon);
  final String label;
  final IconData icon;
}
