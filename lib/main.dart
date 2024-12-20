import 'package:flutter/material.dart';
import 'package:flutter_project_structure/utils/buttons/custom_button.dart';
import 'package:flutter_project_structure/utils/dimesions/dimensions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        Dimensions.init(context); 
        return MaterialApp(
          home: Scaffold(
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
      },
    );
  }
}
