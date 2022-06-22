
import 'package:finder/presentation/resources/color_manger.dart';
import 'package:finder/presentation/resources/strings_manger.dart';
import 'package:flutter/material.dart';


class TipsView extends StatelessWidget {
  const TipsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManger.black),
        title: Text(AppStrings.tips,style: TextStyle(color: ColorManger.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70.0,top: 20,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.tips1,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tips2,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tips3,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tips4,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tips5,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tips6,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tops7,style: Theme.of(context).textTheme.titleSmall,),
            Text(AppStrings.tips8,style: Theme.of(context).textTheme.titleSmall,),

          ],
        ),
      ),

    );
  }
}

