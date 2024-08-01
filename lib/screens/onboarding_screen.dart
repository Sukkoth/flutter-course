import 'package:app/screens/home_screen.dart';
import 'package:app/utils.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/onboarding.png',
              height: 400,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Everything About The Weather At A Glance!",
                textAlign: TextAlign.center,
                style: appFont(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333866)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 40,
              ),
              child: Text(
                "The aora app will accuretly display current weather conditions in no time.",
                textAlign: TextAlign.center,
                style: appFont(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                //navigate to Homescreen()
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xffa1abff),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
