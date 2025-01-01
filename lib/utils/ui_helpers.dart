import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


  // Function to show a snackbar message
 void showSnackbar(BuildContext context, String message, {Color backgroundColor = Colors.black, Color textColor = Colors.white}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: textColor,
        onPressed: () {
          // Some code to dismiss the snackbar
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Function to show a simple Toast message
   void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM, Toast? toast}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      toastLength: toast ?? Toast.LENGTH_SHORT,
      fontSize: 16.0,
    );
  }

  // Function to show an alert dialog
   Future<void> showAlertDialog(BuildContext context, String title, String message, {String? positiveButtonText, String? negativeButtonText}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            if (negativeButtonText != null)
              TextButton(
                child: Text(negativeButtonText),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            if (positiveButtonText != null)
              TextButton(
                child: Text(positiveButtonText),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          ],
        );
      },
    );
  }

  // Function to show a loading dialog
   Future<void> showLoadingDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) {
        return AlertDialog(
          title: Text('Loading...'),
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Please wait'),
            ],
          ),
        );
      },
    );
  }

  // Function to hide the loading dialog
   void hideLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  // Function to show a bottom sheet with custom content
   void showCustomBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

