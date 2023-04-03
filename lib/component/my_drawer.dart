import 'package:dimagold/cubit/cubit.dart';
import 'package:flutter/material.dart';
import '../Screens/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'items.dart';

class My_drawer extends StatefulWidget {
  const My_drawer({super.key});
  @override
  _My_drawerState createState() => _My_drawerState();
}

class _My_drawerState extends State<My_drawer> {
Widget callpages(int x)
  {
switch(x)
{
  case 0: return  home_page() ;break;
  // case 1: return page2(); break;
default : return home_page() ;
}
  }
   void  get(String x)
{
if(canLaunch(x) != null) { launch(x);} 
else {throw 'Cannot launch';}
}

//call
void call(){  get("tel : 0930199740");}

//
void email(){get("mailto : engdimakhatib@gmail.com");}
//
void sms(){ get("sms : 0930199740");}
//
void get_url(){get("https://www.youtube.com");}

void func(int y)
{
  switch(y)
  {
   
     case 1 :  AppCubit.get(context).changeAppMode();
    break;
    case 2 : call();
    break;
    case 3 : email();
    break;
      case 4 : sms();
    break;
      case 5 : get_url();
    break;
  }
}
  @override
  Widget build(BuildContext context) {
     var cubit=AppCubit.get(context);

  //     return BlocConsumer<AppCubit , AppStates>(
  // listener : ( context , state){},
  // builder : (context , state)
  // {
    return Container(
 width : 225 ,
 //color: Colors.black.withOpacity(0.8),
 color :  AppCubit.get(context).isDark? const Color.fromARGB(136, 56, 55, 55).withOpacity(0.8) : Color.fromARGB(239, 253, 253, 253).withOpacity(0.8) ,
  child:   Column(
    children : <Widget> [
   Padding(
  padding : const EdgeInsets.only( top: 30),
   child:  Container(
  height : 150,
  child : Column (
    mainAxisAlignment: MainAxisAlignment.center,
    children : <Widget>[
      Stack(
        alignment : AlignmentDirectional.bottomEnd,
         children:[
       Container(
       width:100,
        height : 100,
        decoration :const BoxDecoration(shape:BoxShape.circle,color: Colors.white ),   
       child:   const Padding(
         padding: EdgeInsets.symmetric(horizontal: 10,vertical:37),
         child: Text('Welcome' , style: TextStyle( color: Colors.black, fontFamily: 'My_Font_Bold',fontSize: 17,fontWeight: FontWeight.normal,),textAlign: TextAlign.center,),
       ),
      ),
     const Padding (
     padding :  EdgeInsetsDirectional.only(bottom : 3.5 , end : 3.5 ),
      child : CircleAvatar(
          radius : 7.0,
           backgroundColor : Colors.red,        
          ), 
     ),  
 ],),//
 const SizedBox(height: 15,),
  Text ('Find Gold',style : TextStyle(color :AppCubit.get(context).isDark? Colors.white70:Colors.black , fontSize : 16.0 , fontFamily :'My_Font_Regular' )), 
     //Padding 
    ],), 
  ), 
  ),
  const Divider (color : Colors.grey , height : 40.0,),
  Expanded( 
    child : ListView.builder( 
      itemCount : items.length, 
      itemBuilder :(_,i){ 
     return InkWell (  
      onTap : (){  
        Navigator.of(context).pop();
        if(i>=1) {func(i);} 
        else {Navigator.of(context).push(MaterialPageRoute(builder : (_)=>callpages(i))); }
        },
      child : items_design (
      icon : items[i].icon,
      title : items[i].title,
     ),
     );
      } ) 
  ), 
  const Divider (color : Colors.red , height : 40.0,), 
  InkWell(
    onTap :(){Navigator.of(context).pop();},
     child : const Icon (Icons.arrow_back_ios , color : Colors.white,)), 
    ],),
  //column
 );
//        },
//  ); 
  }
}
