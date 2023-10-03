import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:mk_bd/navigation/router.dart";
import "package:mk_bd/navigation/routes.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Morkort Birthday App",
      theme: ThemeData(
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior(),
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.router,
      initialRoute: AppRoutes.startScreen,
    );
  }
}
