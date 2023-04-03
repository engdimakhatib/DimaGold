import 'dart:html';

import 'package:flutter/material.dart';
import '../modle/BoardingModel.dart';
import '../screens/onBoarding.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key , required this.model});
final BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
         Expanded(
            child: 
            Image(image:  AssetImage(model.image) , width: 200 , height: 200,),
          ),
          const SizedBox(height: 30.0,),
          Text(model.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15.0,),
          Text(model.body,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15.0,),
        ],);
  }
}