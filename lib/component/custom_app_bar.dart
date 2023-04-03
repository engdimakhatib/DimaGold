import 'package:flutter/material.dart';
import 'custom_icon.dart';

 class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, required this.title, required this.icon,
      required this.opacity
      ,  this.onPressed})
      : super(key: key);
  final String title;
  final IconData icon;
 final Color opacity;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( title, style: const TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w700,  fontSize: 20,), ),
       //  Text( title, style: const TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w700,  fontSize: 20,color :Colors.black,), ),
           CustomIcon(onPressed: onPressed, icon: icon,
           opacity: opacity
           ),
      ], );
  }
}
