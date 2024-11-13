import 'package:get_it/get_it.dart';

import '../view_models/column_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ColumnViewModel>(() => ColumnViewModel());
}
