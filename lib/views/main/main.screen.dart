import "dart:ui";

import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:mk_bd/navigation/router.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _navigateToMomentsScreen() {
    AppRouter.navigateToMomentsScreen();
  }

  void _navigateToBirthdayScreen() {
    AppRouter.navigateToBirthdayScreen();
  }

  void _navigateToMessageScreen() {
    AppRouter.navigateToMessageScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1,
                  colors: [
                    Color(0xFFc38e70),
                    Color(0xFF774936),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Lottie.asset(
              "lib/assets/anim/ic_firework.json",
              repeat: true,
            ),
          ),
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Lottie.asset(
                "lib/assets/anim/ic_celebration.json",
                repeat: true,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Lottie.asset(
                  "lib/assets/anim/ic_birthday_cake.json",
                  height: 250,
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 0,
                      sigmaY: 0,
                    ),
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: _navigateToBirthdayScreen,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 18,
                                      sigmaY: 18,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // color: const Color(0xFF111928).withOpacity(0.8),
                                        // border: Border.all(
                                        //   width: 1.5,
                                        //   color: const Color(0xFF111928).withOpacity(0.8),
                                        // ),
                                        // gradient: LinearGradient(
                                        //   colors: [
                                        //     Theme.of(context).colorScheme.onPrimary,
                                        //     Theme.of(context).colorScheme.onSecondary,
                                        //   ],
                                        // ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Spacer(),
                                          Image.asset("lib/assets/icons/ic_birthday.png", width: 38, height: 38),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Birthday wishes",
                                            style: Theme.of(context).textTheme.titleMedium,
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: double.infinity,
                                            child: FilledButton.tonal(
                                              onPressed: () {},
                                              child: const Icon(Icons.arrow_right),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: _navigateToMessageScreen,
                                      child: Container(
                                        // height: double.infinity,
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset("lib/assets/icons/ic_message.png", width: 32, height: 32),
                                            const SizedBox(height: 8),
                                            Text(
                                              "My message",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    GestureDetector(
                                      onTap: _navigateToMomentsScreen,
                                      child: Container(
                                        // height: double.infinity,
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset("lib/assets/icons/ic_photo.png", width: 32, height: 32),
                                            const SizedBox(height: 8),
                                            Text(
                                              "Our moments",
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // const SizedBox(height: 16),
                        // Container(
                        //   padding: const EdgeInsets.all(16),
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: const Row(
                        //     children: [
                        //       Text(
                        //         "My deepest message",
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Lottie.asset(
              "lib/assets/anim/ic_happy_birthday.json",
              repeat: false,
            ),
          ),
        ],
      ),
    );
  }
}
