import "package:get/get.dart";
import "package:mk_bd/navigation/routes.dart";
import "package:mk_bd/views/birthday/birthday.screen.dart";
import "package:mk_bd/views/gallery/gallery.screen.dart";
import "package:mk_bd/views/main/main.screen.dart";
import "package:mk_bd/views/message/message.screen.dart";
import "package:mk_bd/views/moments/moments.screen.dart";
import "package:mk_bd/views/splash_screen/splash.screen.dart";

class AppRouter {
  static final router = [
    GetPage(
      name: AppRoutes.birthdayScreen,
      page: () => const BirthdayScreen(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: AppRoutes.momentsScreen,
      page: () => const MomentsScreen(),
    ),
    GetPage(
      name: AppRoutes.messageScreen,
      page: () => const MessageScreen(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.galleryScreen,
      page: () => const GalleryScreen(),
    ),
  ];

  static Future<void> navigateToBirthdayScreen() async {
    return await Get.toNamed(AppRoutes.birthdayScreen);
  }

  static Future<void> navigateToMainScreen() async {
    return await Get.offAllNamed(AppRoutes.mainScreen);
  }

  static Future<void> navigateToMomentsScreen() async {
    return await Get.toNamed(AppRoutes.momentsScreen);
  }

  static Future<void> navigateToMessageScreen() async {
    return await Get.toNamed(AppRoutes.messageScreen);
  }

  static Future<void> navigateToGalleryScreen() async {
    return await Get.toNamed(AppRoutes.galleryScreen);
  }
}
