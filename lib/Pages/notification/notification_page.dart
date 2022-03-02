import 'package:cryptoapp/Pages/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
         body:  Center(
          child: Text(
            "Notification Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
    );
  }
}
