import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';

part 'locale_provider.g.dart';

@Riverpod(keepAlive: true)
Locale locale(Ref ref) => const Locale('zh');

@Riverpod(keepAlive: true)
AppLocalizations l10n(Ref ref) =>
    lookupAppLocalizations(ref.watch(localeProvider));
