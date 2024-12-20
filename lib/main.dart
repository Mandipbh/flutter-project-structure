import 'package:flutter/material.dart';
import 'package:flutter_project_structure/utils/buttons/custom_button.dart';
import 'package:flutter_project_structure/utils/common/colors/colors.dart';
import 'package:flutter_project_structure/utils/common/dimesions/dimensions.dart';
import 'package:flutter_project_structure/utils/common/dimesions/padding.dart';
import 'package:flutter_project_structure/utils/textinput/custom_text_field.dart';

import 'utils/loader/custom_loader.dart';
import 'utils/textview/custom_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Builder(
      builder: (context) {
        Dimensions.init(context);
        return MaterialApp(
          home: Scaffold(
            body: Stack(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingMedium),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.paddingLarge),
                      CustomButton(
                        text: 'Responsive Button',
                        icon: Icons.touch_app,
                        onPressed: () {
                          print('Button Pressed');
                        },
                        backgroundColor: Colors.teal,
                      ),
                      const CustomTextField(
                        hintText: 'Enter your email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        borderColor: AppColors.buttonPrimary,
                      ),
                      const CustomTextField(
                        hintText: 'Enter your password',
                        icon: Icons.lock,
                        obscureText: true,
                        borderColor: AppColors.buttonSecondary,
                      ),
                      SizedBox(height: Dimensions.paddingMedium),
                      const CustomTextView(
                        text: 'Customizable with maxLines and overflow.',
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        color: AppColors.error,
                      ),
                      CustomTextView(
                        text: 'This is a responsive CustomTextView',
                        fontSize: Dimensions.fontLarge,
                        fontWeight: FontWeight.bold,
                        color: AppColors.success,
                      ),
                      SizedBox(height: Dimensions.paddingMedium),
                      CustomTextView(
                        text: 'This text adjusts based on screen size.',
                        fontSize: Dimensions.fontMedium,
                        color: AppColors.customBlue,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: _startLoading,
                          child: const Text('Start Loading'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isLoading) const CustomLoader(),
            ]),
          ),
        );
      },
    );
  }
}
