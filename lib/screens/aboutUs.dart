import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/component.dart';
import '../component/my_drawer.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';




class about_page extends StatefulWidget {

  @override
  _about_pageState createState() => _about_pageState();
}

class _about_pageState extends State<about_page> {    
   
   final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
       return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
         builder: (context, state) {
         
    return Scaffold(
     key: _keyDrawer,
     //drawer : Drawer (left side)
     //endDrawer (Right side) you can see the example for endDrawer.
      drawer: const My_drawer(),
         resizeToAvoidBottomInset: false,
    body : Container(
     //color:Color.fromARGB(255, 252, 251, 248),
       child: Column( 
     children:[
            //1
           buildMyStack( context ,  _keyDrawer),
               const SizedBox(height: 10,),  
            buildMyPaddingRow(),     
           const SizedBox(height: 10,),
            buildCard(),
             const SizedBox(height: 10,),
             buildhorizontalListImg(),
          ], ),     
       ),
      );
  //  //listview
   } );   
  }
//card


}