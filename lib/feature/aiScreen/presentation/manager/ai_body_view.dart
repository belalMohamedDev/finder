import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/routing/routes.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/aiScreen/logic/cubit/ai_cubit.dart';
import 'package:finder/feature/aiScreen/presentation/widgets/upload_missing_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiViewBody extends StatelessWidget {
  const AiViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomFadeInDown(duration: 1, child: UploadAiImageButton()),
          SizedBox(
            height: 50.h,
          ),
          const CustomFadeInDown(
              duration: 1,
              child: Text('You can use AI to Find your missing person')),
          SizedBox(
            height: 60.h,
          ),
          BlocListener<AiCubit, AiState>(
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
                success: (flowStat) async {
                  flowStat.getScreenWidget(
                      context: context, retryActionFunction: () {});
                },
              );
            },
            child: CustomFadeInUp(
              duration: 1,
              child: SizedBox(
                width: double.infinity,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AiCubit>().ai();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: ColorsLight.darkBlue,
                  ),
                  child: const Text(
                    LangKeys.submit,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomFadeInUp(
            duration: 1,
            child: SizedBox(
              width: double.infinity,
              height: 40.h,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.makeUnReport);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  LangKeys.skipToReport,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
