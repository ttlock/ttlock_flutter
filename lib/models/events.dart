import 'package:ttlock_premise_flutter/models/enums.dart';

// --- Card ---

sealed class AddCardEvent {}

class AddCardProgress extends AddCardEvent {}

class AddCardComplete extends AddCardEvent {
  final String cardNumber;
  AddCardComplete({required this.cardNumber});
}

// --- Fingerprint ---

sealed class AddFingerprintEvent {}

class AddFingerprintProgress extends AddFingerprintEvent {
  final int currentCount;
  final int totalCount;
  AddFingerprintProgress({required this.currentCount, required this.totalCount});
}

class AddFingerprintComplete extends AddFingerprintEvent {
  final String fingerprintNumber;
  AddFingerprintComplete({required this.fingerprintNumber});
}

// --- Face ---

sealed class AddFaceEvent {}

class AddFaceProgress extends AddFaceEvent {
  final TTFaceState state;
  final TTFaceErrorCode errorCode;
  AddFaceProgress({required this.state, required this.errorCode});
}

class AddFaceComplete extends AddFaceEvent {
  final String faceNumber;
  AddFaceComplete({required this.faceNumber});
}
