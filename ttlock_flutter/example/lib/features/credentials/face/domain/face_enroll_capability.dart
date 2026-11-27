/// 人脸录入能力判定（纯函数，无 IO）。语义对齐 ttaccess，不依赖其包。
enum FaceEnrollEntryAction { showMethodSheet, photoOnly, lockOnly }

class FaceEnrollCapability {
  const FaceEnrollCapability({
    required this.supportsLockEnroll,
    required this.supportsPhotoEnroll,
  });

  final bool supportsLockEnroll;
  final bool supportsPhotoEnroll;
}

FaceEnrollCapability resolveFaceEnrollCapability({
  required bool supportsFace,
  required bool supportsYiNuoPhotoFace,
  required bool supportsZhiAnPhotoFace,
  required bool supportsZhiAnFace2ndGen,
  required bool supportsYiShengPhotoFace,
}) {
  final supportsPhotoEnroll =
      supportsZhiAnPhotoFace ||
      supportsZhiAnFace2ndGen ||
      supportsYiShengPhotoFace ||
      supportsYiNuoPhotoFace;
  return FaceEnrollCapability(
    supportsLockEnroll: supportsFace,
    supportsPhotoEnroll: supportsPhotoEnroll,
  );
}

FaceEnrollEntryAction resolveFaceEnrollEntry(FaceEnrollCapability c) {
  if (c.supportsPhotoEnroll && c.supportsLockEnroll) {
    return FaceEnrollEntryAction.showMethodSheet;
  }
  if (c.supportsPhotoEnroll) {
    return FaceEnrollEntryAction.photoOnly;
  }
  return FaceEnrollEntryAction.lockOnly;
}
