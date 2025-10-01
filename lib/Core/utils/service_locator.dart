import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:run_way/Core/utils/api_service.dart';
import 'package:run_way/Features/home/data/repos/home-repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl
        (getIt.get<ApiService>())
  );
}
