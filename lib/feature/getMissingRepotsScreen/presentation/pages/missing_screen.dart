import 'package:finder/core/style/sharedWidget/search.dart';

import 'package:finder/feature/getMissingRepotsScreen/logic/cubit/get_missing_cubit.dart';
import 'package:finder/feature/getMissingRepotsScreen/presentation/refactors/missing_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MissingView extends StatelessWidget {
  const MissingView({super.key});

  @override
  Widget build(BuildContext context) {
    final getMissingCubit = context.read<GetMissingCubit>();
    return Scaffold(
      appBar: AppBar(
          title: searchBar(context, function: (value) {
        getMissingCubit.addItemToList(value);
      }, clear: () {
        getMissingCubit.search.clear();
      }, search: getMissingCubit.search)),
      body: const MissingBody(),
      bottomNavigationBar: BlocBuilder<GetMissingCubit, GetMissingState>(
        buildWhen: (previous, current) =>
            current is LoadingFromPagination ||
            current is Success ||
            current is Error,
        builder: (context, state) {
          if (state is LoadingFromPagination) {
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
