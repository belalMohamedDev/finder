import 'package:finder/core/network/api/app_api.dart';
import 'package:finder/core/network/dio_factory/dio_factory.dart';
import 'package:finder/core/network/network_connectivity/connectivity_controller.dart';
import 'package:finder/core/services/pushNotification/firebase_cloud_messaging.dart';
import 'package:finder/core/services/pushNotification/local_notification.dart';

import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/aiScreen/data/repositories/ai_repo.dart';
import 'package:finder/feature/aiScreen/logic/cubit/ai_cubit.dart';
import 'package:finder/feature/getFoundReportsScreen/data/repositories/found_repo.dart';
import 'package:finder/feature/getFoundReportsScreen/logic/cubit/get_found_cubit.dart';
import 'package:finder/feature/login/data/repository/login_repo.dart';
import 'package:finder/feature/login/logic/viewModel/login_cubit.dart';
import 'package:finder/feature/makeAObjectReport/data/repositories/make_report_object_repo.dart';
import 'package:finder/feature/makeAObjectReport/logic/cubit/make_a_object_report_cubit.dart';
import 'package:finder/feature/makeAPersonReport/data/repositories/make_report_repo.dart';
import 'package:finder/feature/makeAPersonReport/logic/cubit/make_a_report_cubit.dart';

import 'package:finder/feature/makeUnReport/data/repository/make_un_report_repo.dart';
import 'package:finder/feature/makeUnReport/logic/viewModel/make_un_report_cubit.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/repositories/missing_repo.dart';
import 'package:finder/feature/getMissingRepotsScreen/logic/cubit/get_missing_cubit.dart';
import 'package:finder/feature/notifications/data/repository/notification_repo.dart';
import 'package:finder/feature/notifications/logic/cubit/notification_cubit.dart';
import 'package:finder/feature/profile/data/repository/updateImage/update_image_repo.dart';
import 'package:finder/feature/updatePassword/data/repository/updatePassword/update_my_password_repo.dart';
import 'package:finder/feature/updateUserData/data/repository/updateMyData/update_my_data_repo.dart';
import 'package:finder/feature/profile/logic/cubit/profile_cubit.dart';

import 'package:finder/feature/signUp/data/repository/register_repo.dart';
import 'package:finder/feature/signUp/logic/viewModel/register_cubit.dart';
import 'package:finder/feature/updatePassword/logic/cubit/update_password_cubit.dart';
import 'package:finder/feature/updateUserData/logic/cubit/update_user_data_cubit.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance;



Future<void> initAppModule() async {
  await Future.wait([
    SharedPref.preferences.instantiatePreferences(),
    ScreenUtil.ensureScreenSize(),
    FirebaseCloudMessaging().init(),
    LocalNotificationService.init(),
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorsLight.mainColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );


  if (!instance.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    );
  }

  if (!instance.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(DioFactory.new);
  }

  if (!instance.isRegistered<ImagePicker>()) {
    instance.registerLazySingleton<ImagePicker>(ImagePicker.new);
  }

  final dio = await instance<DioFactory>().getDio();
  if (!instance.isRegistered<AppServiceClient>()) {
    instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  }

  _registerCubitsAndRepositories();
}

void _registerCubitsAndRepositories() {
  if (!instance.isRegistered<GetMissingRepository>()) {
    instance.registerLazySingleton<GetMissingRepository>(
        () => GetMissingRepository(instance(), instance()));
  }

  if (!instance.isRegistered<GetMissingCubit>()) {
    instance.registerFactory<GetMissingCubit>(() => GetMissingCubit(instance()));
  }

  if (!instance.isRegistered<GetFoundRepository>()) {
    instance.registerLazySingleton<GetFoundRepository>(
        () => GetFoundRepository(instance(), instance()));
  }

  if (!instance.isRegistered<GetFoundCubit>()) {
    instance.registerFactory<GetFoundCubit>(() => GetFoundCubit(instance()));
  }

  if (!instance.isRegistered<MakeUnReportRepository>()) {
    instance.registerLazySingleton<MakeUnReportRepository>(
        () => MakeUnReportRepository(instance(), instance()));
  }

  if (!instance.isRegistered<MakeUnReportCubit>()) {
    instance.registerFactory<MakeUnReportCubit>(
        () => MakeUnReportCubit(instance(), instance()));
  }

  if (!instance.isRegistered<MakeAReportRepository>()) {
    instance.registerLazySingleton<MakeAReportRepository>(
        () => MakeAReportRepository(instance(), instance()));
  }

  if (!instance.isRegistered<MakeAReportCubit>()) {
    instance.registerFactory<MakeAReportCubit>(
        () => MakeAReportCubit(instance(), instance()));
  }

  if (!instance.isRegistered<MakeAReportObjectRepository>()) {
    instance.registerLazySingleton<MakeAReportObjectRepository>(
        () => MakeAReportObjectRepository(instance(), instance()));
  }

  if (!instance.isRegistered<MakeAObjectReportCubit>()) {
    instance.registerFactory<MakeAObjectReportCubit>(
        () => MakeAObjectReportCubit(instance(), instance()));
  }

  if (!instance.isRegistered<UpdateImageRepository>()) {
    instance.registerLazySingleton<UpdateImageRepository>(
        () => UpdateImageRepository(instance(), instance()));
  }

  if (!instance.isRegistered<ProfileCubit>()) {
    instance.registerFactory<ProfileCubit>(() => ProfileCubit(instance(), instance()));
  }

  if (!instance.isRegistered<UpdateMyDataRepository>()) {
    instance.registerLazySingleton<UpdateMyDataRepository>(
        () => UpdateMyDataRepository(instance(), instance()));
  }

  if (!instance.isRegistered<UpdateMyDataCubit>()) {
    instance.registerFactory<UpdateMyDataCubit>(() => UpdateMyDataCubit(instance()));
  }

  if (!instance.isRegistered<UpdatePasswordRepository>()) {
    instance.registerLazySingleton<UpdatePasswordRepository>(
        () => UpdatePasswordRepository(instance(), instance()));
  }

  if (!instance.isRegistered<UpdatePasswordCubit>()) {
    instance.registerFactory<UpdatePasswordCubit>(() => UpdatePasswordCubit(instance()));
  }

  if (!instance.isRegistered<NotificationRepository>()) {
    instance.registerLazySingleton<NotificationRepository>(
        () => NotificationRepository(instance(), instance()));
  }

  if (!instance.isRegistered<NotificationCubit>()) {
    instance.registerFactory<NotificationCubit>(() => NotificationCubit(instance()));
  }

  if (!instance.isRegistered<AiRepository>()) {
    instance.registerLazySingleton<AiRepository>(() => AiRepository(instance(), instance()));
  }

  if (!instance.isRegistered<AiCubit>()) {
    instance.registerFactory<AiCubit>(() => AiCubit(instance(), instance()));
  }




  if (!instance.isRegistered<LoginRepository>()) {
    instance.registerFactory<LoginRepository>(() => LoginRepository(instance(), instance()));
  }

  if (!instance.isRegistered<LoginCubit>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
  }

  if (!instance.isRegistered<RegisterRepository>()) {
    instance.registerFactory<RegisterRepository>(() => RegisterRepository(instance(), instance()));
  }

  if (!instance.isRegistered<RegisterCubit>()) {
    instance.registerFactory<RegisterCubit>(() => RegisterCubit(instance(), instance()));
  }









}