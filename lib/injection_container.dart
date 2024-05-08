import 'package:careflix/core/theme/theme_provider.dart';
import 'package:careflix/l10n/local_provider.dart';
import 'package:careflix/layers/data/data_provider/auth_provider.dart';
import 'package:careflix/layers/data/data_provider/lists_provider.dart';
import 'package:careflix/layers/data/data_provider/profile_provider.dart';
import 'package:careflix/layers/data/repository/auth_repository.dart';
import 'package:careflix/layers/data/repository/lists_repository.dart';
import 'package:careflix/layers/data/repository/profile_repository.dart';
import 'package:careflix/layers/logic/auth/auth_cubit.dart';
import 'package:careflix/layers/logic/profile/profile_cubit.dart';
import 'package:careflix/layers/logic/show_lists/show_lists_cubit.dart';
import 'package:careflix/layers/view/search_screen/filters/show_filter_cubit.dart';
import 'package:get_it/get_it.dart';

import 'layers/logic/splash__provider.dart';

final sl = GetIt.instance;

void initInjection() {
  //cubit
  sl.registerLazySingleton(() => ShowFilterCubit());
  sl.registerLazySingleton(() => AuthCubit());
  sl.registerLazySingleton(() => ProfileCubit());
  sl.registerLazySingleton(() => ShowListsCubit());

  //Provider
  sl.registerLazySingleton(() => ThemeProvider());
  sl.registerLazySingleton(() => LocaleProvider());
  sl.registerLazySingleton(() => SplashProvider());

  //repos
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => ProfileRepository(sl()));
  sl.registerLazySingleton(() => ListsRepository(sl()));

  //data_provider
  sl.registerLazySingleton(() => AuthProvider());
  sl.registerLazySingleton(() => ProfileProvider());
  sl.registerLazySingleton(() => ListsProvider());
}
