import "package:flutter/material.dart";
import "package:mk_bd/navigation/router.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _timeout();
  }

  void _timeout() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        AppRouter.navigateToMainScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Color(0xFFc38e70),
              Color(0xFF774936),
            ],
          ),
        ),
      ),
    );
  }
}
