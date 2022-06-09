import 'package:cached_network_image/cached_network_image.dart';
import 'package:finder/presentation/common/stateRenderer/state_renderer_impl.dart';

import 'package:finder/presentation/missing/viewModel/missing_view_model.dart';
import 'package:finder/presentation/missingPerson/view/missing_person_details.dart';
import 'package:finder/presentation/resources/asset_manger.dart';
import 'package:finder/presentation/resources/values_manger.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../application/constant.dart';
import '../../../application/di.dart';
import '../../../domain/models/reports/reports_model.dart';
import '../../resources/color_manger.dart';
import '../../widget/search.dart';


class MissingView extends StatefulWidget {
  const MissingView({ Key? key }) : super(key: key);

  @override
  State<MissingView> createState() => _MissingViewState();
}

class _MissingViewState extends State<MissingView> {
  final MissingViewModel _viewModel = instance<MissingViewModel>();
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Theme.of(context).primaryColor
    ),
    child:
      Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: const SizedBox(),
          title: Text("Searching in Missing .....",
              style: TextStyle(color: ColorManger.black)),
          actions: [
            StatefulBuilder(
              builder:  (context, setState) {
                return AnimSearchBar(
                  width: AppPadding.p90.w,
                  textController: _search,
                  onSuffixTap: () {
                    _search.clear();
                    setState(() {});
                  },
                  function: (value) {
                    addItemToList(value);
                  },
                );
              },
            ),
            SizedBox(
              width: AppPadding.p5.w,
            ),
          ],
        ),
      body: StreamBuilder<List<DataModel>>(
        stream: _viewModel.outputData,
        builder: (context, snapshot) {
          dataList=snapshot.data;
          return _showData(_search.text.isEmpty? snapshot.data:searchList);
        },
      ),
    )
    );
  }

  Widget _showData(List<DataModel>? data) {
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
            onTap:(){
              Navigator.push(context,  MaterialPageRoute(
                builder: (context) => MissingPersonDetailsScreen(data[index]),

              ));
            },
            child: _customCard(data[index].attributes?.name,
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

  void addItemToList(String value) {
    searchList = dataList!.where((element) =>
        element.attributes!.name.toLowerCase().startsWith(value))
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