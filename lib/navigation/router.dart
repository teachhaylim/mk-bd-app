import "package:get/get.dart";
import "package:mk_bd/navigation/routes.dart";
import "package:mk_bd/views/home/home.screen.dart";
import "package:mk_bd/views/start_screen/start.screen.dart";

class AppRouter {
  static final router = [
    GetPage(
      name: AppRoutes.startScreen,
      page: () => const StartScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
    ),
  ];

  // static Future<void> navigateToHomeScreen() async {
  //   return await Get.to(AppRoutes.homeScreen);
  // }

  static Future<void> navigateToHomeScreen() async {
    return await Get.toNamed(AppRoutes.homeScreen);
  }
}
