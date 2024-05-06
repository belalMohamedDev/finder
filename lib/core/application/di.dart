import 'package:finder/core/network/api/app_api.dart';
import 'package:finder/core/network/dio_factory/dio_factory.dart';
import 'package:finder/core/network/network_connectivity/connectivity_controller.dart';
import 'package:finder/core/services/pushNotification/firebase_cloud_messaging.dart';

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
import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  // shared prefs instance

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await SharedPref.preferences.instantiatePreferences();

  await ScreenUtil.ensureScreenSize();

  await FirebaseCloudMessaging().init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorsLight.mainColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  //network info instance
  instance
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    )

    //dio factory
    ..registerLazySingleton<DioFactory>(DioFactory.new);

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance
    ..registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio))
    ..registerLazySingleton<ImagePicker>(ImagePicker.new)

    // login
    ..registerLazySingleton<LoginRepository>(
        () => LoginRepository(instance(), instance()))
    ..registerFactory<LoginCubit>(() => LoginCubit(instance()))

    // register
    ..registerLazySingleton<RegisterRepository>(
        () => RegisterRepository(instance(), instance()))
    ..registerFactory<RegisterCubit>(
        () => RegisterCubit(instance(), instance()))

    // get missing
    ..registerLazySingleton<GetMissingRepository>(
        () => GetMissingRepository(instance(), instance()))
    ..registerFactory<GetMissingCubit>(() => GetMissingCubit(instance()))

    // get found
    ..registerLazySingleton<GetFoundRepository>(
        () => GetFoundRepository(instance(), instance()))
    ..registerFactory<GetFoundCubit>(() => GetFoundCubit(instance()))

    // make un report
    ..registerLazySingleton<MakeUnReportRepository>(
        () => MakeUnReportRepository(instance(), instance()))
    ..registerFactory<MakeUnReportCubit>(
        () => MakeUnReportCubit(instance(), instance()))

    // make report
    ..registerLazySingleton<MakeAReportRepository>(
        () => MakeAReportRepository(instance(), instance()))
    ..registerFactory<MakeAReportCubit>(
        () => MakeAReportCubit(instance(), instance()))

    // make object report
    ..registerLazySingleton<MakeAReportObjectRepository>(
        () => MakeAReportObjectRepository(instance(), instance()))
    ..registerFactory<MakeAObjectReportCubit>(
        () => MakeAObjectReportCubit(instance(), instance()))

    // profile
    ..registerLazySingleton<UpdateImageRepository>(
        () => UpdateImageRepository(instance(), instance()))
    ..registerFactory<ProfileCubit>(() => ProfileCubit(
          instance(),
          instance(),
        ))

// update data
    ..registerLazySingleton<UpdateMyDataRepository>(
        () => UpdateMyDataRepository(instance(), instance()))
    ..registerFactory<UpdateMyDataCubit>(() => UpdateMyDataCubit(
          instance(),
        ))
// update password
    ..registerLazySingleton<UpdatePasswordRepository>(
        () => UpdatePasswordRepository(instance(), instance()))
    ..registerFactory<UpdatePasswordCubit>(
        () => UpdatePasswordCubit(instance()))


        // update password
    ..registerLazySingleton<NotificationRepository>(
        () => NotificationRepository(instance(), instance()))
    ..registerFactory<NotificationCubit>(
        () => NotificationCubit(instance()))
    // AI
       ..registerLazySingleton<AiRepository>(
        () => AiRepository(instance(), instance()))
    ..registerFactory<AiCubit>(() => AiCubit(
          instance(),
          instance(),
        ));
}
