import 'package:flutter/material.dart';


 void showErrorMessage(
  BuildContext context,{
   required String message,
  } )
   {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

void showSuccessMessage( BuildContext context,
{
   required String message,
  } ) {
    final snackBar = SnackBar(content: Text(message),
    behavior: SnackBarBehavior.fixed,
    shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    backgroundColor: Colors.green, // Green background color
    duration: const Duration(seconds: 2), // Optional: Set the duration
  );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }