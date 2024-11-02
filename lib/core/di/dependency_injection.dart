import 'package:get_it/get_it.dart';
import 'package:uptodo/feature/category/data/repo/category_repo_impl.dart';
import 'package:uptodo/feature/category/ui/cubit/category/category_cubit.dart';
import 'package:uptodo/feature/login/data/repo/login_repo_impl.dart';
import 'package:uptodo/feature/register/data/repo/register_repo_impl.dart';
import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';

import '../../feature/login/ui/cubit/login_cubit/login_cubit.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl());
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt.get<RegisterRepoImpl>()));

  getIt.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt.get<LoginRepoImpl>()));

  getIt.registerLazySingleton<CategoryRepoImpl>(() => CategoryRepoImpl());

  getIt.registerFactory<CategoryCubit>(
      () => CategoryCubit(getIt.get<CategoryRepoImpl>()));
}
