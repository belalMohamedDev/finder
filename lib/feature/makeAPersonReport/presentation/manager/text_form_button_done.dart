
import 'package:finder/core/common/animations/animate_do.dart';
import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/feature/makeAPersonReport/logic/cubit/make_a_report_cubit.dart';
import 'package:finder/feature/makeAPersonReport/presentation/widgets/first_last_name_report_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormAndButtonAReport extends StatelessWidget {
  const TextFormAndButtonAReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final makeAReportCubit = context.read<MakeAReportCubit>();

    return Form(
      key: makeAReportCubit.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomFadeInLeft(
              duration: 1,
              child: FirstAndLastNameReportField(),
            ),
            SizedBox(
              height: 11.h,
            ),
            CustomFadeInLeft(
              duration: 1,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLines: 6,
                minLines: 1,
                controller: makeAReportCubit.userAge,
                decoration: InputDecoration(
                  labelText: LangKeys.age,
                  hintText: LangKeys.age,
                  prefixIcon: Icon(
                    Icons.date_range,
                    size: 16.sp,
                    color: ColorsLight.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            CustomFadeInLeft(
              duration: 1,
              child: TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isNameValid(value)) {
                    return 'Please enter a valid location';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLines: 6,
                minLines: 1,
                controller: makeAReportCubit.userAddress,
                decoration: InputDecoration(
                  labelText: LangKeys.address,
                  hintText: LangKeys.address,
                  prefixIcon: Icon(
                    Icons.location_on,
                    size: 16.sp,
                    color: ColorsLight.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            CustomFadeInRight(
              duration: 1,
              child: TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isNameValid(value)) {
                    return 'Please enter a cloths was wearing';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                maxLines: 6,
                minLines: 1,
                controller: makeAReportCubit.userClothLastSeen,
                decoration: InputDecoration(
                  labelText: LangKeys.cloths,
                  hintText: LangKeys.cloths,
                  prefixIcon: Icon(
                    Icons.dry_cleaning_rounded,
                    size: 16.sp,
                    color: ColorsLight.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            CustomFadeInRight(
              duration: 1,
              child: TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isNameValid(value)) {
                    return 'Please enter a descrebition';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                maxLines: 6,
                minLines: 2,
                keyboardType: TextInputType.text,
                controller: makeAReportCubit.userDescription,
                decoration: InputDecoration(
                  labelText: LangKeys.last,
                  hintText: LangKeys.last,
                  prefixIcon: Icon(
                    Icons.mark_as_unread_rounded,
                    size: 16.sp,
                    color: ColorsLight.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomFadeInLeft(
              duration: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 2.h,
                ),
                child:
                    BlocListener<MakeAReportCubit, MakeAReportState<dynamic>>(
                  listenWhen: (previous, current) =>
                      current is Loading ||
                      current is Success ||
                      current is Error,
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
                      success: (flowStat) {
                        flowStat.getScreenWidget(
                            context: context, retryActionFunction: () {});

                        makeAReportCubit.userFirstName.clear();
                        makeAReportCubit.userLastName.clear();
                        makeAReportCubit.userAddress.clear();
                        makeAReportCubit.userAge.clear();
                        makeAReportCubit.userClothLastSeen.clear();
                        makeAReportCubit.userDescription.clear();
                      },
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsLight.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      onPressed: () => validateThenDoMakeReport(context),
                      child: const Text(LangKeys.done),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void validateThenDoMakeReport(BuildContext context) {
  if (context.read<MakeAReportCubit>().formKey.currentState!.validate()) {
    context.read<MakeAReportCubit>().makeAReport();
  }
}
