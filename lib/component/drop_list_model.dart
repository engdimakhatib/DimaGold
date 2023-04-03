import 'package:flutter/material.dart';

class DropListModel
 {
  final List<OptionItem> listOptionItems;
   DropListModel(this.listOptionItems);
}

class OptionItem 
{
  final String id;
  final String title;
  OptionItem({required this.id, required this.title});
}
