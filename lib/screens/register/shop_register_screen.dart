import 'package:conditional_builder/conditional_builder.dart';
import 'package:dimagold/layout/home_layout.dart';
import 'package:dimagold/screens/register/registerCubit/cubit.dart';
import 'package:dimagold/screens/register/registerCubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../component/component.dart';
import '../../component/defaultButton.dart';
import '../../component/defaultTextField.dart';
import '../../network/local/cache_helper.dart';

class DimaGoldRegisterScreen extends StatelessWidget {
   DimaGoldRegisterScreen({super.key});
var formkey = GlobalKey<FormState>();
var nameController =TextEditingController();
var emailController =TextEditingController();
var passwordController =TextEditingController();
var phoneController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
     create: (context) => DimaGoldRegisterCubit(),
     child: BlocConsumer<DimaGoldRegisterCubit , DimaGoldRegisterState>(
        listener: (context, state) {
        if(state is DimaGoldRegisterSuccessStates)
        {
        //   if(state.loginModel.status)
        // {
        //   CacheHelper.savaData(key: 'token' , value: state.loginModel.data!.token).then((value) 
        //  {
        //   token = state.loginModel.data!.token;
        //   navigateAndFinish(context, const home_layout());
        //  }        
        //   );
        // }
        // else{
        //   print(state.loginModel.message);
        //  showToast(text : state.loginModel.message, state : ToastStates.ERROR, );         
        // }
        }    
        },
        builder: (context, state)  {
        var cubit=   DimaGoldRegisterCubit.get(context);
         return Scaffold(
         appBar: AppBar(),
         body : Padding(
         padding: const EdgeInsets.all(20.0),
           child: SingleChildScrollView(
             child: Form(
               key : formkey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('REGISTER',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),),
                   Text('Register now to browser our hot offers',style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey,),),
                 const SizedBox(height: 30,),
                DefaultTextField(
                   controller: nameController ,
                   type: TextInputType.name,
                   validate: ( value)
                   {
                     if(value!.isEmpty){return 'please enter your name';}
                     return null;
                   } ,               
                  label: 'User Name',
                  prefix: Icons.person,
                  border : InputBorder.none,
                 ),
                 const SizedBox(height: 15,),  
                 DefaultTextField(
                   controller: emailController ,
                   type: TextInputType.emailAddress,
                   validate: ( value){
                     if(value!.isEmpty){return 'please enter your email address';}
                  return null; } ,      
                  label: 'Email Address',
                  prefix: Icons.email_outlined,
                   border : InputBorder.none,
                 ),
                  const SizedBox(height: 15,), 
                 DefaultTextField(
                   controller: passwordController ,
                   type: TextInputType.visiblePassword,
                   validate: ( value){if(value!.isEmpty){return 'password is too short';} } ,
                  label: 'Password',
                  prefix: Icons.lock,
                  suffix: DimaGoldRegisterCubit.get(context).suffix,
                  isPassword:DimaGoldRegisterCubit.get(context).isPassword,
                   border : InputBorder.none,
                  suffixPressed: (){
                  cubit.changePasswordVisibility();
                  },
                  //      onSubmit: (value) {
                  //     if(formkey.currentState!.validate()) {
                  //  //  DimaGoldRegisterCubit.get(context).userlogin(email: emailController.text, password: passwordController.text);
                  //  }
                  //  },
                 ),
                const SizedBox(height: 15,),                                
                    DefaultTextField(
                   controller: phoneController ,
                   type: TextInputType.phone,
                   validate: ( value){if(value!.isEmpty){return 'enter your phone';} } ,
                  label: 'Phone',
                  prefix: Icons.phone,
                   border : InputBorder.none,
                
                  //      onSubmit: (value) {
                  //     if(formkey.currentState!.validate()) {
                  //  //  DimaGoldRegisterCubit.get(context).userlogin(email: emailController.text, password: passwordController.text);
                  //  }
                  //  },
                 ),
               const SizedBox(height: 30,),              
               ConditionalBuilder(
               condition : state is! DimaGoldRegisterLoadingStates,
               builder: (context) => DefaultButton(
                 width : double.infinity,
                 background: Colors.orangeAccent,
                 function: ()
                 {
                  try{
                   if(formkey.currentState!.validate()) {
                     // DimaGoldRegisterCubit.get(context).userRegister(
                     //   name: nameController.text,
                     //   email: emailController.text,
                     //   password: passwordController.text,
                     //   phone: phoneController.text, 
                     //   );
                     }
                     
                   }
                   catch(e){print(e.toString());}
                 }
               , text: 'register'
               ,isuppercase :true,
               ),
               fallback:(context) =>  const Center(child: CircularProgressIndicator()),
                           ),
                const SizedBox(height: 15,),
                 ],),
             ),
           ),
         ),
        );
        },      
     ),
    );
  }
}