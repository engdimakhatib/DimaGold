import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {

   DefaultTextButton({super.key, required this.function,required this.text});

final void Function()? function;

 final String text  ;

  @override
  Widget build(BuildContext context) {
    return TextButton(
          //  style: TextButton.styleFrom(
          //           foregroundColor: Colors.white,
          //           padding: const EdgeInsets.all(16.0),
          //           textStyle: const TextStyle(fontSize: 20),
          //         ),
      onPressed :function,
     child: Text(text.toUpperCase(),),);
  }
}