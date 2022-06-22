import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/presentation/common/stateRenderer/state_renderer_impl.dart';
import 'package:finder/presentation/found/viewModel/found_view_model.dart';

import 'package:finder/presentation/resources/asset_manger.dart';


import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../application/constant.dart';
import '../../../application/di.dart';
import '../../../domain/models/unReport/un_report_model.dart';
import '../../foundPerson/view/found_person.dart';
import '../../resources/values_manger.dart';
import '../../widget/search.dart';

class FoundView extends StatefulWidget {
  const FoundView({Key? key}) : super(key: key);

  @override
  State<FoundView> createState() => _FoundViewState();
}

class _FoundViewState extends State<FoundView> {
  final FoundViewModel _viewModel = instance<FoundViewModel>();
  final TextEditingController _search = TextEditingController();
   List<DataModel>? dataList;
   List<DataModel>? searchList;

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
    return StreamBuilder<FlowState>(
      stream: _viewModel.outState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getData(), () {
              _viewModel.start();
            }) ??
            _getData();
      },
    );
  }

  Widget _getData() {
    return  Scaffold(
      appBar: AppBar(
        title: StatefulBuilder(
          builder: (context, setState) {
            return searchBar(
                context,
                function:  (value) {
                  addItemToList(value);
                },

                clear: () {
                  _search.clear();
                },
                search: _search
            );
          },
        ) ,

      ),
          body: StreamBuilder<List<DataModel>>(
            stream: _viewModel.outputData,
            builder: (context, snapshot) {
              dataList=snapshot.data;
              return _showData(_search.text.isEmpty? snapshot.data:searchList);
            },
          ),
        );
  }

  Widget _showData(List<DataModel>? data ) {
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
              "${Constant.baseUrl}/storage/${data[index].attributes?.picture}";

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoundPersonDetailsScreen(data[index]),
                  ));
            },
            child: _customCard(data[index].attributes?.policeStation,
                data[index].attributes?.createdAt, imageData),
          );
        },
        itemCount: _search.text.isEmpty? data.length:searchList!.length,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(APPSize.s10.sp),
        ),
      ),
      elevation: 2,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(APPSize.s10.sp),
                  topLeft: Radius.circular(APPSize.s10.sp)),
              child: CachedNetworkImage(
                imageUrl: "$image",
                height: AppPadding.p16.h,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(ImageAsset.profile),
              )),
          SizedBox(
            height: AppPadding.p1_5.h,
          ),
          Text(
            '$name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: APPSize.s14.sp),
          ),
          SizedBox(
            height: AppPadding.p1_5.h,
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

  void addItemToList(String value) {
    searchList = dataList!.where((element) =>
            element.attributes!.policeStation.toLowerCase().startsWith(value))
        .toList();
    setState(() {

    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
