import 'package:flutter/material.dart';
import 'package:flutter_project_structure/utils/buttons/custom_button.dart';
import 'package:flutter_project_structure/utils/dimesions/dimensions.dart';

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
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingMedium),
            child: CustomButton(
              text: 'Responsive Button',
              icon: Icons.touch_app,
              onPressed: () {
                print('Button Pressed');
              },
              backgroundColor: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
