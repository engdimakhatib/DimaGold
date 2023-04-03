import 'package:flutter/material.dart';
import '../cubit/cubit.dart';
import '../modle/listItems.dart';

 

List <list_items> items = [
list_items(title : 'Home' , icon : Icons.home),
list_items(title : 'Dark Mode' , icon : Icons.settings),
list_items(title : 'Search' , icon : Icons.search),
list_items(title : 'call us' , icon : Icons.call),
list_items(title : 'Email' , icon : Icons.email),
list_items(title : 'send us' , icon : Icons.message),
list_items(title : 'Youtube' , icon : Icons.youtube_searched_for),
];

class items_design extends StatefulWidget {
final  IconData icon ;
 final String title ;
  items_design({required this.title,required this.icon});
  @override
  _items_designState createState() => _items_designState();
}

class _items_designState extends State<items_design> { 
  @override
  Widget build(BuildContext context) {
    return Container(
 margin : const EdgeInsets.symmetric(horizontal : 10 , vertical : 20),
child : Row (
  children : <Widget> [
Icon(widget.icon , color :  AppCubit.get(context).isDark ? Colors.white70 : Colors.black54,),
const SizedBox(width :10,),
Text(widget.title , style : TextStyle(color: AppCubit.get(context).isDark ? Colors.white70 :Colors.black54 , fontSize :20.0,)),
  ],),
 );
       
  }
}
