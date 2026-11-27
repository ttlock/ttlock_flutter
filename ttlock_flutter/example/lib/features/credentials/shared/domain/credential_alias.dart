bool shouldSetCredentialAlias({
  required bool isYiNuoPhotoFace,
  required bool supportsSetAlias,
  required String alias,
}) =>
    isYiNuoPhotoFace && supportsSetAlias && alias.trim().isNotEmpty;
