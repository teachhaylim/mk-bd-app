import "package:flutter/material.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:get/get.dart";
import "package:mk_bd/core/styles.dart";
import "package:mk_bd/navigation/router.dart";
import "package:mk_bd/navigation/routes.dart";

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _onReady() {
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Morkort Birthday App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.brown900),
        // colorScheme: ColorScheme(
        //   primary: AppColor.brown900,
        //   secondary: AppColor.brown800,
        //   onPrimary: AppColor.brown400,
        //   onSecondary: AppColor.brown700,
        //   error: Colors.red,
        //   onError: AppColor.brown700,
        //   background: AppColor.brown800,
        //   onBackground: AppColor.brown800,
        //   surface: AppColor.brown800,
        //   onSurface: AppColor.brown800,
        //   brightness: Brightness.light,
        // ),
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior(),
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.router,
      initialRoute: AppRoutes.splashScreen,
      onReady: _onReady,
    );
  }
}
