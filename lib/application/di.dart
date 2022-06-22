import 'package:dio/dio.dart';
import 'package:finder/application/app_prefs.dart';
import 'package:finder/data/datasource/localData/report/local_data_source.dart';
import 'package:finder/data/datasource/localData/unReport/un_report_local_data.dart';

import 'package:finder/domain/repository/repositry.dart';
import 'package:finder/domain/useCase/ai/use_case.dart';
import 'package:finder/domain/useCase/logOut/log_out_use_case.dart';
import 'package:finder/domain/useCase/login/login_use_case.dart';
import 'package:finder/domain/useCase/makeReport/make_report_use_case.dart';
import 'package:finder/domain/useCase/register/register_use_case.dart';
import 'package:finder/domain/useCase/reports/reports_use_case.dart';
import 'package:finder/presentation/ai/viewModel/view_model.dart';

import 'package:finder/presentation/login/viewModel/login_view_model.dart';
import 'package:finder/presentation/makeUnReport/viewModel/view_model.dart';
import 'package:finder/presentation/makingReport/viewModel/view_model.dart';
import 'package:finder/presentation/missing/viewModel/missing_view_model.dart';
import 'package:finder/presentation/profile/specificReport/viewModel/view_model.dart';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/remoteData/remote_data_source.dart';
import '../data/network/api/app_api.dart';
import '../data/network/dio_factory/dio_factory.dart';
import '../data/network/network_info/network_info.dart';
import '../data/repositoryImpl/repository_impl.dart';
import '../domain/useCase/Incident/use_case.dart';

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
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  //  un report local data source
  instance.registerLazySingleton<UnReportLocalDataSource>(
      () => UnReportLocalDataSourceImpl());

  instance.registerLazySingleton<ImagePicker>(() => ImagePicker());

  //repository
  instance.registerLazySingleton<Repositry>(() => RepositoryImpl(
        instance(),
        instance(),
        instance(),
        instance(),
      ));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(() => RegisterViewModel(instance(), instance(),instance()));
  }
}

initFoundModule() {
  if (!GetIt.I.isRegistered<UnReportUseCase>()) {
    instance.registerFactory<UnReportUseCase>(() => UnReportUseCase(instance()));
    instance.registerFactory<FoundViewModel>(() => FoundViewModel(instance()));
    instance.registerFactory<SpecificUnReportViewModel>(() => SpecificUnReportViewModel(instance()));
  }
}

initUpdateUserModule() {
  if (!GetIt.I.isRegistered<UpdateUserUseCase>()) {
    instance.registerFactory<UpdateUserUseCase>(
        () => UpdateUserUseCase(instance()));
  }
}

initMissingModule() {
  if (!GetIt.I.isRegistered<ReportUseCase>()) {
    instance.registerFactory<ReportUseCase>(() => ReportUseCase(instance()));
    instance.registerFactory<MissingViewModel>(() => MissingViewModel(instance()));
    instance.registerFactory<SpecificReportViewModel>(() => SpecificReportViewModel(instance()));
  }
}

initMakeReportModule() {
  if (!GetIt.I.isRegistered<MakeReportUseCase>()) {
    instance.registerFactory<MakeReportUseCase>(() => MakeReportUseCase(instance()));
    instance.registerFactory<MakingReportViewModel>(() => MakingReportViewModel(instance()));
  }
}

initMakeUnReportModule() {
  if (!GetIt.I.isRegistered<IncidentUseCase>()) {
    instance.registerFactory<IncidentUseCase>(() => IncidentUseCase(instance()));
    instance.registerFactory<MakeUnReport>(() => MakeUnReport(instance()));

  }
}

initLogOutModule() {
  if (!GetIt.I.isRegistered<LogOutUseCase>()) {
    instance.registerFactory<LogOutUseCase>(() => LogOutUseCase(instance()));
    instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(instance()));
  }
}

initAiModule() {
  if (!GetIt.I.isRegistered<AiUseCase>()) {
    instance.registerFactory<AiUseCase>(() => AiUseCase(instance()));
    instance.registerFactory<AiViewModel>(() => AiViewModel(instance(),instance()));
  }
}

restAllModule() {
  instance.reset(dispose: false);
  initAppModule();
  initFoundModule();
  initLoginModule();
  initLogOutModule();
  initAiModule();
  initMakeReportModule();
  initMakeUnReportModule();
  initMissingModule();
  initRegisterModule();
  initUpdateUserModule();
}
