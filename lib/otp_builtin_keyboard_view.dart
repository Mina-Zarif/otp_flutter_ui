import 'package:flutter/material.dart';

class OTPBuiltinKeyboard extends StatefulWidget {
  const OTPBuiltinKeyboard({super.key});

  @override
  State<OTPBuiltinKeyboard> createState() => _OTPBuiltinKeyboardState();
}

class _OTPBuiltinKeyboardState extends State<OTPBuiltinKeyboard> {
  String field1 = '';
  String field2 = '';
  String field3 = '';
  String field4 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            const Text(
              'Verify your identity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Enter the 4-digit code sent to your phone number',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomOTPTextField(value: field1),
                CustomOTPTextField(value: field2),
                CustomOTPTextField(value: field3),
                CustomOTPTextField(value: field4),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                buildNumberButton('1'),
                buildNumberButton('2'),
                buildNumberButton('3')
              ],
            ),
            Row(
              children: [
                buildNumberButton('4'),
                buildNumberButton('5'),
                buildNumberButton('6')
              ],
            ),
            Row(
              children: [
                buildNumberButton('7'),
                buildNumberButton('8'),
                buildNumberButton('9')
              ],
            ),
            Row(
              children: [
                submitButton(),
                buildNumberButton('0'),
                buildClearButton()
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  void resetFieldOnExit() {
    field1 = '';
    field2 = '';
    field3 = '';
    field4 = '';
    setState(() {});
  }

  Widget buildNumberButton(String text) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () => setState(
              () {
                if (field1.isEmpty) {
                  field1 = text;
                } else if (field2.isEmpty) {
                  field2 = text;
                } else if (field3.isEmpty) {
                  field3 = text;
                } else if (field4.isEmpty) {
                  field4 = text;
                }
              },
            ),
            icon: Text(
              text,
              style: const TextStyle(fontSize: 28),
            ),
          ),
        ),
      );

  Widget buildClearButton() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () => setState(
              () {
                if (field4.isNotEmpty) {
                  field4 = '';
                } else if (field3.isNotEmpty) {
                  field3 = '';
                } else if (field2.isNotEmpty) {
                  field2 = '';
                } else if (field1.isNotEmpty) {
                  field1 = '';
                }
              },
            ),
            icon: const Icon(
              Icons.backspace_outlined,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      );

  Widget submitButton() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              final String pin = field1 + field2 + field3 + field4;
              if (pin.length == 4) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'your pin is confirm $pin',
                    ),
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.check,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      );
}

class CustomOTPTextField extends StatelessWidget {
  const CustomOTPTextField({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 650),
        height: 60,
        width: 60,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border.all(
            color: value.isEmpty ? Colors.transparent : Colors.grey.shade700,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          value.isEmpty ? '*' : value,
          style: TextStyle(
            fontSize: 24,
            color: value.isEmpty ? Colors.grey.shade700 : Colors.black,
          ),
        ),
      ),
    );
  }
}
