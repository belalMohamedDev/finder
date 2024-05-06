import 'package:finder/core/style/sharedWidget/search.dart';
import 'package:finder/feature/getFoundReportsScreen/logic/cubit/get_found_cubit.dart';
import 'package:finder/feature/getFoundReportsScreen/presentation/manager/found_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoundView extends StatefulWidget {
  const FoundView({super.key});

  @override
  State<FoundView> createState() => _FoundViewState();
}

class _FoundViewState extends State<FoundView> {
  @override
  Widget build(BuildContext context) {
    final getFoundCubit = context.read<GetFoundCubit>();
    return Scaffold(
      appBar: AppBar(
          title: searchBar(context, function: (value) {
        getFoundCubit.addItemToList(value);
      }, clear: () {
        getFoundCubit.search.clear();
      }, search: getFoundCubit.search)),
      body: const FoundBody(),
      bottomNavigationBar: BlocBuilder<GetFoundCubit, GetFoundState>(
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
