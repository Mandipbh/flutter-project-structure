import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_project_structure/constants/app_routes.dart';
import 'package:flutter_project_structure/main.dart';
import 'package:flutter_project_structure/theme/dimesions/dimensions.dart';
import 'package:flutter_project_structure/widgets/buttons/custom_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(title: const Text('Responsive Custom Button Example')),
        body: Column(
          children: [
            Text(AppLocalizations.of(context)!.message),
            ElevatedButton(
              onPressed: () {}, // Change to Hindi
              child: const Text('Change to Hindi'),
            ),
            ElevatedButton(
              onPressed: () {}, // Change to English
              child: const Text('Change to English'),
            ),
            CustomButton(
              text: 'Responsive Button',
              icon: Icons.touch_app,
              onPressed: () {
                Get.toNamed(AppRoutes.settingScreen);
              },
              backgroundColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
