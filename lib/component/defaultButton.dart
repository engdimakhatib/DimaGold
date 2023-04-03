import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

 final double width ;
 final Color background ;
 final bool isuppercase;
late void Function() function;
 String text;
   DefaultButton({super.key , required this.width ,required this.background , required this.isuppercase,required this.function ,required this.text });

  @override
  Widget build(BuildContext context) {
    return  Container(
              width : width,           
               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
       decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color : background,
              boxShadow: const [BoxShadow( blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))],
            ) ,
              child: MaterialButton(
                onPressed :function ,
                child : Expanded(child: Text( isuppercase? text.toUpperCase() : text , style : const TextStyle(color : Colors.white,), )),
              ),
          );
  }
}