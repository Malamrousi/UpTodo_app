import 'package:get_it/get_it.dart';
import 'package:uptodo/feature/register/data/repo/register_repo_impl.dart';
import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl());
  getIt.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(getIt.get<RegisterRepoImpl>()));
}
