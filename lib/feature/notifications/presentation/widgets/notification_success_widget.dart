import 'package:finder/feature/notifications/data/model/notificationResponse/notification_response.dart';
import 'package:finder/feature/notifications/presentation/widgets/list_view_item_builder_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSuccessWidget extends StatelessWidget {
  final List<DataNotification> state;
  const NotificationSuccessWidget({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      addAutomaticKeepAlives: true,
      itemBuilder: (context, index) {
        DateTime createAtParse = DateTime.parse(state[index].createdAt!);

        String? image = state[index].find?.image != null
            ? state[index].find!.image
            : state[index].missing!.image;

        String? name = state[index].find?.description != null
            ? state[index].find!.description
            : state[index].missing!.name;
        return ListViewItemBuilderBody(
          image: image,
          name: name,
          state: state,
          createAtParse: createAtParse,
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20.h,
      ),
      itemCount: state.length,
    );
  }
}
