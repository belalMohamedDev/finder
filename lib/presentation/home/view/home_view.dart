import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/font_manger.dart';
import 'package:finder/presentation/resources/route_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../application/app_prefs.dart';
import '../../../application/di.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text(
              "${AppStrings.hello} ${_appPreferences.isAccessName()} !",
               maxLines: 1,
              style:  TextStyle(fontSize:FontSize.s16.sp, fontWeight: FontWeight.bold,),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              AppStrings.hope,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 190),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.makeReport);
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 180,
                        width: 180,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          elevation: 20,
                          child: ClipRRect(
                            child: Container(
                              color: ColorManger.darkBlue,
                              padding: const EdgeInsets.all(32),
                              child: Image.asset(
                                ImageAsset.missing,
                                fit: BoxFit.contain,
                                color: Colors.white,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Missing Person",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.makeUnReport);
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 180,
                        width: 180,
                        child: Card(
                          color: ColorManger.darkBlue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          elevation: 10,
                          child: ClipRRect(
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(32),
                              child: Image.asset(
                                ImageAsset.found,
                                color: ColorManger.darkBlue,
                                fit: BoxFit.contain,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Find Person",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
