import 'dart:convert';

import 'package:crypto/crypto.dart';

String md5Of(String input) => md5.convert(utf8.encode(input)).toString();
