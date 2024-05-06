import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/services/pushNotification/firebase_cloud_messaging.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/feature/home/presentation/refactors/home_body.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          
          ValueListenableBuilder(
            valueListenable: FirebaseCloudMessaging().recieveNotification,
            builder: (context, value, child) => Stack(
              children: [
                IconButton(
                    onPressed: () {
                      context.pushNamed(Routes.notificationsView);
                      FirebaseCloudMessaging().recieveNotification.value =
                          false;
                    },
                    icon: const Icon(
                      Icons.notifications,
                    )),
                value
                    ? Positioned.fill(
                        left: 19.w,
                        right: 10.w,
                        bottom: 15.h,
                        child: const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 4,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: const HomeBody(),
    );
  }
}
