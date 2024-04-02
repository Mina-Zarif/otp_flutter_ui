import 'package:flutter/material.dart';
import 'package:otp/otp_builtin_keyboard_view.dart';
import 'package:otp/otp_defult_keyboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeVeiw(),
    );
  }
}

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OTPBuiltinKeyboard(),
                  ),
                );
              },
              child: const Text("OTP with builtin keyboard"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OTPWithDefultKeyboard(),
                  ),
                );
              },
              child: const Text("OTP with defult keyboard"),
            )
          ],
        ),
      ),
    );
  }
}
