import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P3 RoutePaths 覆盖 ekey 与六类凭证', () {
    expect(RoutePaths.ekeyList, '/lock/:lockId/ekeys');
    expect(RoutePaths.ekeySend, '/lock/ekey-send');
    expect(RoutePaths.ekeyDetail, '/lock/ekey-detail');
    expect(RoutePaths.ekeyChangePeriod, '/lock/ekey-change-period');
    expect(RoutePaths.ekeyDeleteConfirm, '/lock/ekey-delete-confirm');
    expect(RoutePaths.passcodeList, '/lock/:lockId/passcodes');
    expect(RoutePaths.passcodeGet, '/lock/passcode-get');
    expect(RoutePaths.passcodeAdd, '/lock/passcode-add');
    expect(RoutePaths.passcodeDetail, '/lock/passcode-detail');
    expect(RoutePaths.cardList, '/lock/:lockId/cards');
    expect(RoutePaths.cardAdd, '/lock/card-add');
    expect(RoutePaths.cardDetail, '/lock/card-detail');
    expect(RoutePaths.cardChangePeriod, '/lock/card-change-period');
    expect(RoutePaths.cardDeleteConfirm, '/lock/card-delete-confirm');
    expect(RoutePaths.fingerprintList, '/lock/:lockId/fingerprints');
    expect(RoutePaths.fingerprintAdd, '/lock/fingerprint-add');
    expect(RoutePaths.fingerprintDetail, '/lock/fingerprint-detail');
    expect(
      RoutePaths.fingerprintChangePeriod,
      '/lock/fingerprint-change-period',
    );
    expect(
      RoutePaths.fingerprintDeleteConfirm,
      '/lock/fingerprint-delete-confirm',
    );
    expect(RoutePaths.faceList, '/lock/:lockId/faces');
    expect(RoutePaths.faceAdd, '/lock/face-add');
    expect(RoutePaths.faceEnrollMethod, '/lock/face-enroll-method');
    expect(RoutePaths.facePhotoAdd, '/lock/face-photo-add');
    expect(RoutePaths.faceDetail, '/lock/face-detail');
    expect(RoutePaths.palmVeinList, '/lock/:lockId/palm-veins');
    expect(RoutePaths.palmVeinAdd, '/lock/palm-vein-add');
    expect(RoutePaths.palmVeinDetail, '/lock/palm-vein-detail');
    expect(RoutePaths.palmVeinChangePeriod, '/lock/palm-vein-change-period');
    expect(RoutePaths.palmVeinDeleteConfirm, '/lock/palm-vein-delete-confirm');
    expect(RoutePaths.qrCodeList, '/lock/:lockId/qr-codes');
    expect(RoutePaths.qrCodeAdd, '/lock/qr-code-add');
    expect(RoutePaths.qrCodeDetail, '/lock/qr-code-detail');
    expect(RoutePaths.qrCodeChangePeriod, '/lock/qr-code-change-period');
    expect(RoutePaths.qrCodeDeleteConfirm, '/lock/qr-code-delete-confirm');
    expect(RoutePaths.remoteList, '/lock/:lockId/remotes');
    expect(RoutePaths.remoteAdd, '/lock/remote-add');
    expect(RoutePaths.remoteDetail, '/lock/remote-detail');
    expect(RoutePaths.remoteChangePeriod, '/lock/remote-change-period');
    expect(RoutePaths.remoteDeleteConfirm, '/lock/remote-delete-confirm');
  });

  test('静态 /lock/* 须排在 /lock/:lockId 之前，避免被当成 lockId 解析', () {
    final paths = $appRoutes.whereType<GoRoute>().map((r) => r.path).toList();
    final detailIdx = paths.indexOf('/lock/:lockId');
    expect(detailIdx, greaterThanOrEqualTo(0));
    for (final staticPath in const [
      '/lock/ekey-send',
      '/lock/passcode-get',
      '/lock/passcode-add',
      '/lock/card-add',
      '/lock/qr-code-add',
      '/lock/remote-add',
    ]) {
      expect(
        paths.indexOf(staticPath),
        lessThan(detailIdx),
        reason: '$staticPath must precede /lock/:lockId',
      );
    }
  });
}
