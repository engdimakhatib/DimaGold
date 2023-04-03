
import 'package:dimagold/component/custom_app_bar.dart';
import 'package:dimagold/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';



class home_page extends StatefulWidget {

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {    
  @override
  Widget build(BuildContext context) {
  return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
         builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
    return Scaffold(
         resizeToAvoidBottomInset: false,
    body : Container(
    // color:Color.fromARGB(255, 252, 251, 248),
    padding: EdgeInsets.all(10),
       child: Column(
     children:[      
  CustomAppBar(title: 'Home Page',icon:Icons.search,
  opacity: Colors.black.withOpacity(.05),
  onPressed: () {navigateTo(context , const search_page());},) ,                
      const SizedBox(height: 5),     
     
          ], ),
       ),
      );
      },
      );
  //  //listview
          
  }

  Widget Card(String imgPath,String name ,String country  ,String type , int weight  ){
  return Padding(
    padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
    child: Material(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        height: 125.0,
        width: double.infinity,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),color: Colors.white,
        ),
       child:  Row(
         children: [
  const SizedBox(width: 10,),
 Container( 
 height: 100.0,
        width:100.0,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          image : AssetImage(imgPath), fit: BoxFit.fill
        ),
        ),       
 ),

  const SizedBox(width: 10,),

  Column(
    children: [
      Text(name , style: TextStyle(fontFamily: 'My_Font' ,fontWeight: FontWeight.bold , fontSize: 16.0 , color: Colors.black), ),
      const SizedBox(height: 10,),
      Text(country , style: TextStyle(fontFamily: 'My_Font' ,fontWeight: FontWeight.bold , fontSize: 16.0 , color: Colors.black), ),
     const SizedBox(height: 10,),
      Text(type , style: TextStyle(fontFamily: 'My_Font' ,fontWeight: FontWeight.bold , fontSize: 16.0 , color: Colors.black), ),
     const SizedBox(height: 10,),
     Text(weight.toString()),
     
    ], ),


         ],),     
      ),     
    ),
  );
  }//card



}