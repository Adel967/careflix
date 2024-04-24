import 'package:careflix/core/theme/theme_provider.dart';
import 'package:careflix/l10n/local_provider.dart';
import 'package:careflix/layers/view/search_screen/filters/show_filter_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initInjection() {
  //cubit
  sl.registerLazySingleton(() => ShowFilterCubit());

  //Provider
  sl.registerLazySingleton(() => ThemeProvider());
  sl.registerLazySingleton(() => LocaleProvider());
}
