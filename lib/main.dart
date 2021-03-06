import 'package:cryptoapp/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      theme: ThemeData(
         fontFamily: "Lato",
      ),
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      
      debugShowCheckedModeBanner: false,
      
      themeMode: ThemeMode.system,
    );
    
  }
}
