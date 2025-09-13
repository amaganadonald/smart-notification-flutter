
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(  MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [GlobalColors.mainColor, GlobalColors.secondaryColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to SkillRise',
              style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your journey to learning starts here!',
              style: TextStyle(
                color: GlobalColors.SubTextColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
    );
  }
}