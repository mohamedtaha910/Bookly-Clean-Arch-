import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_sevices.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiSevice>(ApiSevice(getIt.get<Dio>()));

  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      homeLocalDataSource: HomeLocalDataSourceImplementation(),
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(
        getIt.get<ApiSevice>(),
      ),
    ),
  );
}
