import 'package:ttlock_premise_flutter/models/enums.dart';

// --- Card ---

sealed class AddCardEvent {}

class AddCardProgress extends AddCardEvent {}

class AddCardComplete extends AddCardEvent {
  final String cardNumber;
  AddCardComplete({required this.cardNumber});

  AddCardComplete copyWith({String? cardNumber}) {
    return AddCardComplete(cardNumber: cardNumber ?? this.cardNumber);
  }
}

// --- Fingerprint ---

sealed class AddFingerprintEvent {}

class AddFingerprintProgress extends AddFingerprintEvent {
  final int currentCount;
  final int totalCount;
  AddFingerprintProgress({required this.currentCount, required this.totalCount});

  AddFingerprintProgress copyWith({int? currentCount, int? totalCount}) {
    return AddFingerprintProgress(
      currentCount: currentCount ?? this.currentCount,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}

class AddFingerprintComplete extends AddFingerprintEvent {
  final String fingerprintNumber;
  AddFingerprintComplete({required this.fingerprintNumber});

  AddFingerprintComplete copyWith({String? fingerprintNumber}) {
    return AddFingerprintComplete(
      fingerprintNumber: fingerprintNumber ?? this.fingerprintNumber,
    );
  }
}

// --- Face ---

sealed class AddFaceEvent {}

class AddFaceProgress extends AddFaceEvent {
  final TTFaceState state;
  final TTFaceErrorCode errorCode;
  AddFaceProgress({required this.state, required this.errorCode});

  AddFaceProgress copyWith({TTFaceState? state, TTFaceErrorCode? errorCode}) {
    return AddFaceProgress(
      state: state ?? this.state,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}

class AddFaceComplete extends AddFaceEvent {
  final String faceNumber;
  AddFaceComplete({required this.faceNumber});

  AddFaceComplete copyWith({String? faceNumber}) {
    return AddFaceComplete(faceNumber: faceNumber ?? this.faceNumber);
  }
}
