import 'package:finder/core/services/pushNotification/firebase_cloud_messaging.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';

import 'package:finder/feature/notifications/logic/cubit/notification_cubit.dart';
import 'package:finder/feature/notifications/presentation/refactor/notification_screen_body.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder(
            valueListenable: FirebaseCloudMessaging().isNotificationSubscribe,
            builder: (context, value, child) => Transform.scale(
              scale: 0.6,
              child: Switch.adaptive(
                value: value,
                activeColor: Colors.green,
                inactiveTrackColor: ColorsLight.darkGrey,
                inactiveThumbColor: ColorsLight.darkBlue,
                onChanged: (value) async {
                  await FirebaseCloudMessaging()
                      .controllerForUserSubscribe(context);
                },
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ColorsLight.darkBlue1,
        title: Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: FontFamilyHelper.cairoArabic),
        ),
        centerTitle: true,
      ),
      body: const NotificationScreenBody(),
      bottomNavigationBar: BlocBuilder<NotificationCubit, NotificationState>(
        buildWhen: (previous, current) =>
            current is LoadingPagination ||
            current is Success ||
            current is Error,
        builder: (context, state) {
          if (state is LoadingPagination) {
            return SafeArea(
              child: SizedBox(
                  height: 60.h,
                  child: const Center(child: CircularProgressIndicator())),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

