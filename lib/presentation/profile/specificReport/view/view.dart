import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/domain/models/makeSpecificReport/model.dart';
import 'package:finder/presentation/common/stateRenderer/state_renderer_impl.dart';


import 'package:finder/presentation/profile/specificReport/viewModel/view_model.dart';
import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../application/constant.dart';
import '../../../../application/di.dart';
import '../missingPerson/view/missing_person_details.dart';


class SpecificReportView extends StatefulWidget {
  const SpecificReportView({Key? key}) : super(key: key);

  @override
  State<SpecificReportView> createState() => _SpecificReportViewState();
}

class _SpecificReportViewState extends State<SpecificReportView> {
  final SpecificReportViewModel _viewModel = instance<SpecificReportViewModel>();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getData(), () {
            _viewModel.start();
          }) ??
              _getData();
        },
      ),
    );
  }


  Widget _getData() {
    return SafeArea(
      child: StreamBuilder<List<MakeSpecificReportModel>>(
        stream: _viewModel.outputData,
        builder: (context, snapshot) {
          return _showData(snapshot.data);
        },
      ),
    );
  }

  Widget _showData(List<MakeSpecificReportModel>? data) {
    if (data != null) {
      return GridView.builder(
        padding: const EdgeInsets.only(
          top: 15,
          right: 8,
          left: 8,
        ),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {

          String imageData =
              "${Constant.baseUrl}/storage/${data[index].data?.attributes?.picture}";

          return GestureDetector(
            onTap:(){
              Navigator.push(context,  MaterialPageRoute(
                builder: (context) => MissingSpecificPersonDetailsScreen(data[index]),

              ));
            },
            child: _customCard(data[index].data?.attributes?.name,
                data[index].data?.attributes?.createdAt, imageData),
          );
        },
        itemCount: data.length,
      );
    } else {
      return const Center(child: CircularProgressIndicator());



    }
  }



  Widget _customCard(
      String? name,
      String? time,
      String? image,
      ) {
    return Card(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(APPSize.s10.sp),
        ),
      ),
      elevation: 2,
      child: Column(
        children: [
          ClipRRect(
              borderRadius:  BorderRadius.only(
                  topRight: Radius.circular(APPSize.s10.sp), topLeft: Radius.circular(APPSize.s10.sp)),
              child: CachedNetworkImage(
                imageUrl:
                "$image",
                height:AppPadding.p16.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(ImageAsset.profile),
              )),
          SizedBox(
            height: AppPadding.p1_5.h,
          ),
          Text(
            '$name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:  TextStyle(fontWeight: FontWeight.w500, fontSize: APPSize.s14.sp),
          ),
          SizedBox(
            height:AppPadding.p1_5.h,
          ),
          Text(
            '$time',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}








