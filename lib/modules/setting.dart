import 'package:flutter/cupertino.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Setting Screen',
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
