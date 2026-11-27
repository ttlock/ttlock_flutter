import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';

abstract class AppConfigRepositoryInterface {
  TaskEither<AppException, AppConfig> load();
  TaskEither<AppException, void> save(AppConfig config);
}
