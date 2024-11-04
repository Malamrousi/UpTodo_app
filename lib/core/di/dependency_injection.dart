import 'package:get_it/get_it.dart';
import 'package:uptodo/feature/category/data/repo/category_repo_impl.dart';
import 'package:uptodo/feature/category/ui/cubit/add_category/add_category_cubit.dart';
import 'package:uptodo/feature/home/data/repo/get_category_repo_impl.dart';
import 'package:uptodo/feature/home/data/repo/task_repo_impl.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';
import 'package:uptodo/feature/login/data/repo/login_repo_impl.dart';
import 'package:uptodo/feature/register/data/repo/register_repo_impl.dart';
import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';

import '../../feature/home/ui/cubit/get_category/get_category_cubit.dart';
import '../../feature/login/ui/cubit/login_cubit/login_cubit.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  //RegisterRepoImpl
  getIt.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl());
  //TaskRepoImpl
  getIt.registerLazySingleton<TaskRepoImpl>(() => TaskRepoImpl());
//LoginRepoImpl
  getIt.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  //categoryRepoImpl
  getIt.registerLazySingleton<AddCategoryRepoImpl>(() => AddCategoryRepoImpl());
  // GetCategoryRepoImpl
  getIt.registerFactory<GetCategoryRepoImpl>(() => GetCategoryRepoImpl());

  //registerCubit
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt.get<RegisterRepoImpl>()));

//loginCubit
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt.get<LoginRepoImpl>()));

//AddCategoryCubit
  getIt.registerFactory<AddCategoryCubit>(
      () => AddCategoryCubit(getIt.get<AddCategoryRepoImpl>()));
//TaskCubit
  getIt.registerFactory<TaskCubit>(() => TaskCubit(getIt.get<TaskRepoImpl>()));
//GetCategoryCubit
  getIt.registerFactory<GetCategoryCubit>(
      () => GetCategoryCubit(getIt.get<GetCategoryRepoImpl>()));
}
