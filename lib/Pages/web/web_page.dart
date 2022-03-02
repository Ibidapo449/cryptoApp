
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'web_controller.dart';

class WebPage extends GetView<WebController> {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
          child: Text(
            "Alerts Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      
    );
  }
}
