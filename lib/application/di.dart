import 'package:dio/dio.dart';
import 'package:finder/application/app_prefs.dart';
import 'package:finder/data/datasource/localData/report/local_data_source.dart';
import 'package:finder/data/datasource/localData/unReport/un_report_local_data.dart';
import 'package:finder/data/network/api/app_api.dart';
import 'package:finder/data/network/dio_factory/dio_factory.dart';
import 'package:finder/data/network/network_info/network_info.dart';
import 'package:finder/data/repository/repository_impl.dart';
import 'package:finder/domain/repository/repositry.dart';
import 'package:finder/domain/useCase/logOut/log_out_use_case.dart';
import 'package:finder/domain/useCase/login/login_use_case.dart';
import 'package:finder/domain/useCase/makeReport/make_report_use_case.dart';
import 'package:finder/domain/useCase/register/register_use_case.dart';
import 'package:finder/domain/useCase/reports/reports_use_case.dart';
import 'package:finder/domain/useCase/specificReport/use_case.dart';
import 'package:finder/presentation/login/viewModel/login_view_model.dart';
import 'package:finder/presentation/makeUnReport/viewModel/view_model.dart';
import 'package:finder/presentation/makingReport/viewModel/view_model.dart';
import 'package:finder/presentation/missing/viewModel/missing_view_model.dart';
import 'package:finder/presentation/profile/specificReport/viewModel/view_model.dart';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/localData/specificReport/local_data_source.dart';
import '../data/datasource/localData/specificUnReport/local_data_source.dart';
import '../data/datasource/remoteData/remote_data_source.dart';
import '../domain/useCase/makeUnReport/make_un_report_use_case.dart';
import '../domain/useCase/makeUnSpecificReport/use_case.dart';
import '../domain/useCase/unReport/un_report_use_case.dart';
import '../domain/useCase/updateUser/use_case.dart';
import '../presentation/found/viewModel/found_view_model.dart';
import '../presentation/profile/specificUnReport/viewModel/view_model.dart';
import '../presentation/profile/viewModel/view_model.dart';
import '../presentation/register/viewModel/register_view_model.dart';

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

  // local data source
  instance.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImpl());

  //  un report local data source
  instance.registerLazySingleton<UnReportLocalDataSource>(
          () => UnReportLocalDataSourceImpl());

  //  specific report local data source
  instance.registerLazySingleton<SpecificReportLocalDataSource>(
          () => SpecificReportLocalDataSourceImpl());


  //  un specific report local data source
  instance.registerLazySingleton<SpecificUnReportLocalDataSource>(
          () => SpecificUnReportLocalDataSourceImpl());

  //repository
  instance.registerLazySingleton<Repositry>(
      () => RepositoryImpl(instance(), instance(),instance(),instance(),instance(),instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance(), instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initFoundModule() {
  if (!GetIt.I.isRegistered<UnReportUseCase>()) {
    instance.registerFactory<UnReportUseCase>(() => UnReportUseCase(instance()));
    instance.registerFactory<FoundViewModel>(() => FoundViewModel(instance()));
  }
}


initSpecificReportModule() {
  if (!GetIt.I.isRegistered<SpecificReportUseCase>()) {
    instance.registerFactory<SpecificReportUseCase>(() => SpecificReportUseCase(instance()));
    instance.registerFactory<SpecificReportViewModel>(() => SpecificReportViewModel(instance()));

  }
}


initSpecificUnReportModule() {
  if (!GetIt.I.isRegistered<SpecificUnReportUseCase>()) {
    instance.registerFactory<SpecificUnReportUseCase>(() => SpecificUnReportUseCase(instance()));
    instance.registerFactory<SpecificUnReportViewModel>(() => SpecificUnReportViewModel(instance()));

  }
}

initUpdateUserModule() {
  if (!GetIt.I.isRegistered<UpdateUserUseCase>()) {
    instance.registerFactory<UpdateUserUseCase>(() => UpdateUserUseCase(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());

  }
}




initMissingModule() {
  if (!GetIt.I.isRegistered<ReportUseCase>()) {
    instance.registerFactory<ReportUseCase>(() => ReportUseCase(instance()));
    instance.registerFactory<MissingViewModel>(() => MissingViewModel(instance()));
   // instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}


initMakeReportModule() {
  if (!GetIt.I.isRegistered<MakeReportUseCase>()) {
    instance.registerFactory<MakeReportUseCase>(() => MakeReportUseCase(instance()));
    instance.registerFactory<MakingReportViewModel>(() => MakingReportViewModel(instance()));
  }
}


initMakeUnReportModule() {

  if (!GetIt.I.isRegistered<MakeUnReportUseCase>()) {
    instance
        .registerFactory<MakeUnReportUseCase>(() => MakeUnReportUseCase(instance()));
    instance.registerFactory<MakeUnReport>(
            () => MakeUnReport(instance()));
   // instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}


initLogOutModule() {
  if (!GetIt.I.isRegistered<LogOutUseCase>()) {
    instance.registerFactory<LogOutUseCase>(() => LogOutUseCase(instance()));
    instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(instance(),instance()));
  }
}