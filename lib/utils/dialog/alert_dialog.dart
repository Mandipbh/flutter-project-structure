import 'package:flutter/material.dart';
import 'package:flutter_project_structure/style/text_style.dart';

showAlertDialog(BuildContext context, String title, String content,String okButtonText, {VoidCallback? onTapOk,bool isShowCancel = false,String cancelButtonText = ''}) {
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
    onPressed: onTapOk ?? () async {Navigator.pop(context);},
    child: Text(okButtonText, style: TextStyleTheme.customTextStyle(Colors.black,12,FontWeight.w400)),
  );
  Widget cancelButton = ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor:Colors.blue),
    onPressed:() async {Navigator.pop(context);},
    child: Text(cancelButtonText, style: TextStyleTheme.customTextStyle(Colors.black,12,FontWeight.w400)),
  );
  AlertDialog alert = AlertDialog(
    title: Text(title,style: TextStyleTheme.customTextStyle(Colors.white, 16, FontWeight.w600),),
    content: Text(content),
    actions: [
      isShowCancel == true  ? cancelButton : Container(),
      okButton,
    ],
  );

  /// show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}