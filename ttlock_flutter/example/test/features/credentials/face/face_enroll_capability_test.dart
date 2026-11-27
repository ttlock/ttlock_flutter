import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/face_enroll_capability.dart';

void main() {
  test('四 bit 任一为真即 supportsPhotoEnroll', () {
    final c = resolveFaceEnrollCapability(
      supportsFace: false,
      supportsYiNuoPhotoFace: false,
      supportsZhiAnPhotoFace: false,
      supportsZhiAnFace2ndGen: true,
      supportsYiShengPhotoFace: false,
    );
    expect(c.supportsPhotoEnroll, isTrue);
    expect(c.supportsLockEnroll, isFalse);
    expect(resolveFaceEnrollEntry(c), FaceEnrollEntryAction.photoOnly);
  });

  test('face + 照片 → 方法 sheet', () {
    final c = resolveFaceEnrollCapability(
      supportsFace: true,
      supportsYiNuoPhotoFace: true,
      supportsZhiAnPhotoFace: false,
      supportsZhiAnFace2ndGen: false,
      supportsYiShengPhotoFace: false,
    );
    expect(resolveFaceEnrollEntry(c), FaceEnrollEntryAction.showMethodSheet);
  });

  test('仅 face bit → lockOnly', () {
    final c = resolveFaceEnrollCapability(
      supportsFace: true,
      supportsYiNuoPhotoFace: false,
      supportsZhiAnPhotoFace: false,
      supportsZhiAnFace2ndGen: false,
      supportsYiShengPhotoFace: false,
    );
    expect(c.supportsPhotoEnroll, isFalse);
    expect(c.supportsLockEnroll, isTrue);
    expect(resolveFaceEnrollEntry(c), FaceEnrollEntryAction.lockOnly);
  });
}
