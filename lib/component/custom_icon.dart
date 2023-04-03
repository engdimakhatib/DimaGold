import 'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {

   CustomIcon({Key? key, required this.icon, this.onPressed,required this.opacity
   })
      : super(key: key);
  final void Function()? onPressed;
  final IconData icon;
 Color opacity ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: opacity,
          borderRadius: BorderRadius.circular(16)),
      child: IconButton( onPressed: onPressed, icon: Icon(icon, size: 28,),alignment: Alignment.center,),
    );
  }}
