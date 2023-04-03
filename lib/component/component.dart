import 'package:dimagold/component/custom_icon.dart';
import 'package:dimagold/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


 final ButtonStyle styleBtnMessage = ElevatedButton.styleFrom(textStyle:const TextStyle(fontFamily: 'My_Font' ,fontWeight: FontWeight.bold , fontSize: 17.0 , color: Colors.black), foregroundColor: Colors.white , backgroundColor: Colors.orangeAccent ,);
 final ButtonStyle styleBtnFollowMe = ElevatedButton.styleFrom(textStyle:const TextStyle(fontFamily: 'My_Font' ,fontWeight: FontWeight.bold , fontSize: 17.0 , color: Colors.black),foregroundColor: Colors.white,backgroundColor: Colors.black54 ,);

Stack buildMyStack(BuildContext context , var keyDrawer) =>  
 Stack(
        children : <Widget>[
      Container(
           color : Colors.white ,
           height : 350.0 ,
           width : double.infinity,
      ),
     Container(
          // color : Color(0xFF0A624F) ,
           decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.orangeAccent,Colors.yellow.shade300, ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
           height : 200 ,
           width : double.infinity,
           child: Padding(
            padding: const EdgeInsetsDirectional.only( end : 20 , bottom:160),          
               child: Row(
                 children: [
                  CustomIcon(icon: Icons.menu ,
                  opacity: Colors.white.withOpacity(.5),
                    onPressed: () {keyDrawer.currentState?.openDrawer();}, ),
                //  IconButton(
                //   color :Colors.black54,
                //   icon: const Icon(Icons.menu),
                //   tooltip: 'menu',
                //   onPressed: () {print('Hi') ;_keyDrawer.currentState?.openDrawer();},),
                  const SizedBox(width : 8),
                   const Text('DimaGold',style: TextStyle(fontFamily:'Poppins', fontWeight: FontWeight.w700,fontSize: 20,color: Colors.black),),
                 ],),        
           ),           
      ),  
    Positioned(
      top : 125.0,
      left: 15.0,
       right: 15.0,
       child: Material(elevation: 3, borderRadius: BorderRadius.circular(7.0),
       child: Container(
      height: 200.0,
      decoration: BoxDecoration(
       borderRadius:BorderRadius.circular(9.0) ,
       //color : Colors.grey.withOpacity(0.4) 
     color : Colors.amber[100],
        ),   
       ),
       ),
    ),
    Positioned(
      top : 75.0,
      left: (MediaQuery.of(context).size.width / 2 - 50.0 ),
       child: Material(elevation: 3,color:AppCubit.get(context).isDark ?  const Color.fromARGB(136, 56, 55, 55).withOpacity(0.8) : const Color.fromARGB(239, 253, 253, 253).withOpacity(0.8) , borderRadius: BorderRadius.circular(7.0 ,),
      // color: AppCubit.get(context).isDark ? const Color.fromARGB(136, 56, 55, 55).withOpacity(0.8) : const Color.fromARGB(239, 253, 253, 253).withOpacity(0.8),
       child: Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
       borderRadius:BorderRadius.circular(50.0) ,
       color : Colors.white,
       image: const DecorationImage(image: AssetImage("images/diamond.png"), fit: BoxFit.fill),
        ),
       ),
       ),
    ),
    Positioned(
      top : 190.0 ,
      left : (MediaQuery.of(context).size.width / 2 - 110.0 ),
      child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children : <Widget>[
      const Text("eng.Dima Khatib", style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w700 , fontSize: 18.0 , color: Colors.black),) ,
       const SizedBox(height: 9.0,),
       const Text("Syria", style: TextStyle(fontFamily: 'DancingScript' ,fontWeight: FontWeight.w700 , fontSize: 24.0 ,color: Colors.grey),) ,    
       const SizedBox(height: 9.0,),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton( 
          onPressed: () {}, 
        child:  const Text("Message",style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w400 , fontSize: 18.0 ,color: Colors.black),) ,
        style : styleBtnMessage   
         ),
         const SizedBox(width: 10,),
      ElevatedButton(onPressed: () {}, 
        child: const Text("Follow me",style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w400 , fontSize: 18.0 ,color: Colors.white),) ,
        style : styleBtnFollowMe,     
         ),
       ],),
      ],),
      ),
        ],);    
      Container buildMyPaddingRow() => Container(
       // color : Colors.yellow,
        child: Padding(
  padding: const EdgeInsets.only(left : 15.0 , right: 15.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text("Search Gold" ,style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w700 , fontSize: 17.0 ,color: Colors.black),),
              Text("more" , style: TextStyle(fontFamily: 'Poppins' ,fontWeight: FontWeight.w700 , fontSize: 15.0 , color: Colors.grey),),
            ],),
          ),
      );


  Widget buildCard(){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0 , right: 10.0 ,),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        child: Container(
          height: 125.0,
          width: double.infinity,
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),color: Colors.white,
             boxShadow: const [BoxShadow( blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))],
          ),   
  child: const ListTile(
       title: Text('About Us' , style:  TextStyle(color :Colors.grey ,fontSize: 20 , fontFamily: 'DancingScript' , fontWeight: FontWeight.w500),),
       subtitle: Padding(
         padding: EdgeInsets.only(top: 20.0 , left: 10 , right: 10 ,bottom: 10,),
         child: Text('Application to save time and effort And find what youre looking for , And saving cost to become half ,  We hope you have a useful and enjoyable experience here' 
         , style:  TextStyle(fontSize: 18, fontFamily: 'Poppins' , fontWeight: FontWeight.w500 ,color : Colors.black),maxLines: 5,),
       ),
        ),     
      ),
      )
    ),
  );
  }
Padding buildhorizontalListImg() =>  Padding(
          padding: const EdgeInsets.only(left : 15 ,right: 10),
                        child: Container(
                                color: Colors.white,
                                  height: 100,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                   physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    children :[
                                   imgCard('assets/images/1.jpeg'),
                                   imgCard('assets/images/2.jpeg'),
                                   imgCard('assets/images/3.jpeg'),
                                  // imgCard('assets/images/4.jpeg'),
                                   imgCard('assets/images/5.jpeg'),
                                   imgCard('assets/images/7.jpeg'),
                                     imgCard('assets/images/8.jpeg'),
                                   imgCard('assets/images/9.jpeg'),
                                    ],
                                  ),
                                  ),
                        );
Widget imgCard(String img){
return Padding(
  padding: const EdgeInsets.only(right: 10),
  child: Container(
   height: 100,
    width: 140,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(img )
        , fit:BoxFit.fill
         ),
    ),
     ),
);
}
void navigateTo(context , widget)  => Navigator.push(
  context,
  MaterialPageRoute(builder : (context) => widget),
);
void backTo(context )  => Navigator.of(context).pop();

// Widget  defaultTextField({
//   required TextEditingController controller ,
//   required TextInputType type,
//  //required FormFieldValidator validate,
//    required final FormFieldValidator<String> validate,
//   required String label ,
//   required IconData prefix ,
//   ValueChanged<String>?  onSubmit,
//    ValueChanged<String>?   onChanged,
//   IconData? suffix ,
//   Function? suffixPressed ,
//   InputBorder? border =InputBorder.none,
//    bool? isPassword ,
// })=> Container(
//          decoration:  BoxDecoration(
//               borderRadius: BorderRadius.circular(20.0),
//               color : Colors.white,
//               boxShadow: const [BoxShadow( blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))],
//             ),
//   child:   TextFormField (    
//                 controller : controller,
//                 keyboardType : type,
//                 onFieldSubmitted : onSubmit,
//                 onChanged :  onChanged,               
//                 decoration : InputDecoration(
//                   labelText :label,
//                   //hinText : 'EmailAddress',
//                   prefixIcon :Icon(prefix ,color: Colors.orangeAccent, ) ,
//                   border : border, 
//                 suffixIcon : suffix !=null ?
//                               IconButton(
//                               color: Colors.orangeAccent,
//                                 icon :Icon(suffix) ,
//                    onPressed :(() => suffixPressed) ,
//                               )
//                               : null,
//                 ),
//               validator :validate,         
//               obscureText : isPassword ?? false ,
//               ),
// );  


// Widget  defaultButton({
//   double width = double.infinity,
// Color background = Colors.orangeAccent,
// bool isuppercase= true,
// required Function function,
// required String text,
// })=> Container(
//               width : width,           
//                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
//        decoration:  BoxDecoration(
//               borderRadius: BorderRadius.circular(20.0),
//               color : background,
//               boxShadow: const [BoxShadow( blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))],
//             ) ,
//               child: MaterialButton(
//                 onPressed :(() => function) ,
//                 child : Expanded(child: Text( isuppercase? text.toUpperCase() : text , style : const TextStyle(color : Colors.white,), )),
//               ),
//           );


Widget  defaulTexttButton({required Function function, required String text})
 => TextButton(onPressed :(() => function) , child: Text(text.toUpperCase(),),);


void navigateAndFinish(context , widget)  =>
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder : (context) => widget),
  //we put false to remove the previous route , because i dont't need to click back
(Route<dynamic> route) => false,
);
//enum
 enum ToastStates{SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastStates state)
{
Color color;
switch(state)
{
  case ToastStates.SUCCESS : color= Colors.green;break;
  case ToastStates.WARNING : color= Colors.amber;break;
  case ToastStates.ERROR : color= Colors.red;break;
}
  return color;
}

void showToast({required String text , required ToastStates state}) =>  Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );
    // Fluttertoast.showToast(
    //     msg: state.loginModel.message,
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 5,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
 