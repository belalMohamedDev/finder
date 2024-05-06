import 'package:finder/feature/getMissingReportDetailsScreen/screen/missing_widget_details.dart';
import 'package:finder/feature/getMissingRepotsScreen/logic/cubit/get_missing_cubit.dart';
import 'package:finder/feature/getMissingRepotsScreen/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewMissingWidget extends StatelessWidget {
  const GridViewMissingWidget({
    super.key,
    required this.getMissingCubit,
  });

  final GetMissingCubit getMissingCubit;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      addAutomaticKeepAlives: true,
      padding: EdgeInsets.only(
        top: 15.h,
        right: 12.w,
        left: 15.w,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.58,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MissingPersonDetailsScreen(
                      data: getMissingCubit.dataList[index]),
                ));
          },
          child: CustomCardMissing(
              index: index,
              data: getMissingCubit.search.text.isEmpty
                  ? getMissingCubit.dataList
                  : getMissingCubit.searchList),
        );
      },
      itemCount: getMissingCubit.search.text.isEmpty
          ? getMissingCubit.dataList.length
          : getMissingCubit.searchList!.length,
    );
  }
}
