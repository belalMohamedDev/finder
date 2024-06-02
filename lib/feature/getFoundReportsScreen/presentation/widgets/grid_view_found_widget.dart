import 'package:finder/feature/getFoundReportDetailsScreen/screen/found_person.dart';
import 'package:finder/feature/getFoundReportsScreen/logic/cubit/get_found_cubit.dart';
import 'package:finder/feature/getFoundReportsScreen/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewFoundWidget extends StatelessWidget {
  const GridViewFoundWidget({
    super.key,
    required this.getFoundCubit,
  });

  final GetFoundCubit getFoundCubit;

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
          childAspectRatio: 0.7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoundPersonDetailsScreen(
                      data: getFoundCubit.dataList[index]),
                ));
          },
          child: CustomCardFound(
              index: index,
              data: getFoundCubit.search.text.isEmpty
                  ? getFoundCubit.dataList
                  : getFoundCubit.searchList),
        );
      },
      itemCount: getFoundCubit.search.text.isEmpty
          ? getFoundCubit.dataList.length
          : getFoundCubit.searchList!.length,
    );
  }
}
