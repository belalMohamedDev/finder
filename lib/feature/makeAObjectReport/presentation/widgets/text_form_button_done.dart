import 'package:finder/core/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/core/language/lang_keys.dart';
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/core/utils/app_regex.dart';
import 'package:finder/feature/makeAObjectReport/logic/cubit/make_a_object_report_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormAndButtonAOjectReport extends StatelessWidget {
  const TextFormAndButtonAOjectReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final makeAObjectReportCubit = context.read<MakeAObjectReportCubit>();

    return Form(
      key: makeAObjectReportCubit.formKey,
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
            controller: makeAObjectReportCubit.userAddress,
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
          SizedBox(
            height: 11.h,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            maxLines: 6,
            minLines: 2,
            keyboardType: TextInputType.text,
            controller: makeAObjectReportCubit.userDescription,
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
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 2.h,
            ),
            child: BlocListener<MakeAObjectReportCubit,
                MakeAObjectReportState<dynamic>>(
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
          ),
        ],
      ),
    );
  }
}

void validateThenDoMakeUnReport(BuildContext context) {
  if (context.read<MakeAObjectReportCubit>().formKey.currentState!.validate()) {
    context.read<MakeAObjectReportCubit>().makeAObjectReport();
  }
}
