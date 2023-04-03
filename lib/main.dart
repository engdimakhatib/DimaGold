import 'package:dimagold/screens/login/dima_gold_login_screen.dart';
import 'package:dimagold/screens/login/loginCubit/cubit.dart';
import 'package:dimagold/screens/onBoarding.dart';
import 'package:dimagold/screens/register/registerCubit/cubit.dart';
import 'package:dimagold/screens/register/shop_register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'cubit/cubit.dart';
import 'my_bloc_observer.dart';
import 'cubit/states.dart';
import 'layout/home_layout.dart';
import 'network/local/cache_helper.dart';
// Import the generated file
//import 'firebase_options.dart';
void main() async
 {
 WidgetsFlutterBinding.ensureInitialized();
 try{await Firebase.initializeApp( 
  //options: DefaultFirebaseOptions.currentPlatform,
  );}
catch(e){print(e.toString());}

 Bloc.observer = MyBlocObserver() ;
await CacheHelper.init();
//To get values from a Future(async) method, you have to await them. And after await the variable you get is not a Future anymore.
//bool isDark  = await CacheHelper.getBoolean(key: 'isDark') as bool ;
bool isDark = CacheHelper.getData(key: 'isDark') as bool;
bool onBoarding = CacheHelper.getData(key: 'onBoarding') as bool;
String token = CacheHelper.getData(key: 'token') as String;
print('token');
Widget widget;
if(onBoarding != null )
{
 // if(token != null) 
  widget = const home_layout() ;//i pass login and onBoarding
  //else  widget = ShopLoginScreen() ;//i dont pass login but pass onBoarding
}
else {
  widget = const OnBoardingScreen() ;
}//i am in start of application
print('i am in start of application');
   runApp( MyApp( isDark));
   }

class MyApp extends StatelessWidget {
  final bool isDark=false ;
  const MyApp(bool isDark, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {   
 return MultiBlocProvider(
   providers :[
    BlocProvider(create :(context)=> AppCubit()..changeAppMode( fromShared : isDark,),),
   //BlocProvider(create :(context)=> DimaGoldLoginCubit()),
  // BlocProvider(create :(context)=> DimaGoldRegisterCubit()),
             ],  
    child : BlocConsumer<AppCubit,AppStates>(
      listener : (context,state){},
      builder : (context , state){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
           title : 'Dima Gold',
   theme : ThemeData(
   // primarySwatch :  Colors.white,
    scaffoldBackgroundColor : Colors.white,
   appBarTheme : const AppBarTheme(
     titleSpacing : 20.0,
      systemOverlayStyle : SystemUiOverlayStyle( statusBarColor :  Colors.white,  statusBarIconBrightness : Brightness.dark,),
       elevation : 0.0,
        backgroundColor :Colors.white,
       titleTextStyle: TextStyle(color  : Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
   
    ),
      iconTheme : const IconThemeData(color : Colors.white70,   size: 28),
      
    bottomNavigationBarTheme :const BottomNavigationBarThemeData(
       backgroundColor : Colors.white,
       elevation : 20.0,
      type : BottomNavigationBarType.fixed,
      selectedItemColor : Colors.orange,
      unselectedItemColor : Colors.grey,  
    ),
  floatingActionButtonTheme : const FloatingActionButtonThemeData( backgroundColor : Colors.orange,),
     textTheme : const TextTheme(
       bodyText1 : TextStyle(fontSize: 18 ,fontWeight : FontWeight.w600 , color : Colors.black,), 
       ),
   ),

darkTheme : ThemeData(
  //  primarySwatch : Colors.orange,
 // scaffoldBackgroundColor : HexColor('333739'),
  scaffoldBackgroundColor : Colors.white,
  appBarTheme : AppBarTheme(  
     titleSpacing : 20.0,
     systemOverlayStyle : SystemUiOverlayStyle( statusBarColor :  HexColor('333739'), statusBarIconBrightness : Brightness.light,),
      elevation : 0.0,
      backgroundColor :Colors.white,
      titleTextStyle : const TextStyle( color : Colors.white,fontSize :20.0 , fontWeight : FontWeight.bold,), 
     ),
      iconTheme : const IconThemeData( color : Colors.black, ),
  bottomNavigationBarTheme :BottomNavigationBarThemeData(
      type : BottomNavigationBarType.fixed,
      selectedItemColor : Colors.orange,
      unselectedItemColor : Colors.grey,
      elevation : 20.0,
      backgroundColor : HexColor('333739'),
    ),
  floatingActionButtonTheme : const FloatingActionButtonThemeData(backgroundColor : Colors.orange,),
  textTheme : const TextTheme( 
    bodyText1 : TextStyle(fontSize: 18 ,fontWeight : FontWeight.w600 , color : Colors.white,),
    
    ),
    ),

    themeMode : AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light, 

  home :   const home_layout(),
 //home :   DimaGoldLoginScreen(),

     );//MaterialApp
      }
    ),
    );
  }
  }
   