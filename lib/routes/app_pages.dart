import 'package:cryptoapp/Pages/dashboard/dashboard_binding.dart';
import 'package:cryptoapp/Pages/dashboard/dashboard_page.dart';
import 'package:cryptoapp/routes/app_route.dart';
import 'package:get/get.dart';


class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}