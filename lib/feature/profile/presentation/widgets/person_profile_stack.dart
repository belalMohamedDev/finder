import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/style/fonts/font_family_helper.dart';
import 'package:finder/core/style/images/app_images.dart';
import 'package:finder/core/utils/extensions.dart';
import 'package:finder/core/style/sharedWidget/picketImage/show_picker.dart';
import 'package:finder/feature/profile/logic/cubit/profile_cubit.dart';
import 'package:finder/feature/profile/presentation/refactors/person_data_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonDataProfileStack extends StatelessWidget {
  const PersonDataProfileStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Card(
            color: ColorsLight.lightDarkBlue,
            elevation: 8.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.sp),
              ),
            ),
            child: SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name:  ${SharedPref().getString(PrefKeys.userName)}  ",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.sp,
                        fontFamily: FontFamilyHelper.cairoArabic,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Phone Number:  ${SharedPref().getString(PrefKeys.userPhone)}   ',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.sp,
                        fontFamily: FontFamilyHelper.cairoArabic,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Address:  ${SharedPref().getString(PrefKeys.userAddress)}  ",
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16.sp,
                        fontFamily: FontFamilyHelper.cairoArabic,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
        const ImageUserProfile(),
        BlocListener<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) =>
              current is Loading || current is Success || current is Error,
          listener: (context, state) {
            state.whenOrNull(
              loading: (flowStat) {
                flowStat.getScreenWidget(
                    context: context, retryActionFunction: () {});
              },
              error: (flowStat) {
                flowStat.getScreenWidget(
                    context: context, retryActionFunction: () {});
              },
              success: (userData) async {
                context.pop();
              },
            );
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(top: 325.h, left: 95.w, right: 100.w),
                child: Center(
                    child: SizedBox(
                  height: 45.h,
                  width: 120.w,
                  child: ElevatedButton(
                    onPressed: () => showPersonDataDialog(
                        context: context,
                        profileCubitInstance: context.read<ProfileCubit>()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsLight.blueD8),
                    child: Text(
                      LangKeys.edite,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.sp,
                          fontFamily: FontFamilyHelper.cairoArabic,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ImageUserProfile extends StatefulWidget {
  const ImageUserProfile({
    super.key,
  });

  @override
  State<ImageUserProfile> createState() => _ImageUserProfileState();
}

class _ImageUserProfileState extends State<ImageUserProfile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => showPicker(
              context: context,
              listTileCamera: () {
                context.read<ProfileCubit>().camera();
                Navigator.of(context).pop();
              },
              listTileGallery: () {
                context.read<ProfileCubit>().gallery();
                Navigator.of(context).pop();
              },
            ),
            child: Stack(
              children: [
                Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: ColorsLight.lightDarkBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60.sp),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.sp),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${SharedPref().getString(PrefKeys.userImage)?.replaceFirst(ApiConstants.baseUrlImage, ApiConstants.baseUrl)}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Image.asset(ImageAsset.profile),
                      ),
                    )),
                Positioned.directional(
                  start: 80.w,
                  top: 60.h,
                  width: 20.w,
                  textDirection: TextDirection.ltr,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit_outlined,
                      color: ColorsLight.blue,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
