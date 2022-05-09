import 'package:dio/dio.dart';
import 'package:finder/application/app_prefs.dart';
import 'package:finder/data/datasource/remote_data_source.dart';
import 'package:finder/data/network/api/app_api.dart';
import 'package:finder/data/network/dio_factory/dio_factory.dart';
import 'package:finder/data/network/network_info/network_info.dart';
import 'package:finder/data/repository/repository_impl.dart';
import 'package:finder/domain/repository/repositry.dart';
import 'package:finder/domain/useCase/login_use_case.dart';
import 'package:finder/presentation/login/viewModel/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

//app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

//dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //repository
  instance.registerLazySingleton<Repositry>(
      () => RepositoryImpl(instance(), instance()));
}

 initLoginModule()  {
  if (!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }

}
