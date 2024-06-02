import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';

import 'package:finder/feature/makeUnReport/logic/viewModel/make_un_report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormAndButtonUnReport extends StatelessWidget {
  const TextFormAndButtonUnReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final makeUnReportCubit = context.read<MakeUnReportCubit>();

    return Form(
      key: makeUnReportCubit.formKey,
      child: Column(
        children: [
          TextFormField(
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
            controller: makeUnReportCubit.userAddress,
            decoration: InputDecoration(
              labelText: LangKeys.police,
              hintText: LangKeys.police,
              prefixIcon: Icon(
                Icons.location_on,
                size: 16.sp,
                color: ColorsLight.grey,
              ),
            ),
          ),
          SizedBox(
            height: 11.h,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            maxLines: 6,
            minLines: 2,
            keyboardType: TextInputType.text,
            controller: makeUnReportCubit.userDescription,
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
          SizedBox(
            height: 17.h,
          ),
          BlocListener<MakeUnReportCubit, MakeUnReportState<dynamic>>(
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
                success: (flowStat) {
                  flowStat.getScreenWidget(
                      context: context, retryActionFunction: () {});

                  makeUnReportCubit.userAddress.clear();
                  makeUnReportCubit.userDescription.clear();
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
                onPressed: () => validateThenDoMakeUnReport(context),
                child: const Text(LangKeys.done),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateThenDoMakeUnReport(BuildContext context) {
  if (context.read<MakeUnReportCubit>().formKey.currentState!.validate()) {
    context.read<MakeUnReportCubit>().makeUnReport();
  }
}
