
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
          child: Text(
            "Account Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      
    );
  }
}