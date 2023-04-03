

import 'package:conditional_builder/conditional_builder.dart';
import 'package:dimagold/layout/home_layout.dart';
import 'package:dimagold/screens/login/loginCubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../component/component.dart';
import '../../component/defaultButton.dart';
import '../../component/defaultTextButton.dart';
import '../../component/defaultTextField.dart';
import '../register/shop_register_screen.dart';
import 'loginCubit/states.dart';

class DimaGoldLoginScreen extends StatefulWidget {
   const DimaGoldLoginScreen({super.key});

  @override
  State<DimaGoldLoginScreen> createState() => _DimaGoldLoginScreenState();
}

class _DimaGoldLoginScreenState extends State<DimaGoldLoginScreen> {
var formkey = GlobalKey<FormState>();

var emailController =TextEditingController();

var passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
     //return BlocConsumer<DimaGoldLoginCubit,DimaGoldLoginState>(
     return BlocProvider(
       create: (BuildContext context) => DimaGoldLoginCubit(),
      child: BlocConsumer<DimaGoldLoginCubit,DimaGoldLoginState>(
       listener: (context, state) { if(state is DimaGoldLoginErrortates){ showToast(text : state.error, state : ToastStates.ERROR,); } },
       builder: (context, state) {
          return Scaffold(        
          body:Padding(
          padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key : formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LOGIN',style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),),

                    Text('login now to browser our hot offers',style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey,),),

                  const SizedBox(height: 30,),    

                  DefaultTextField(
                    controller: emailController ,
                    type: TextInputType.emailAddress,
                    validate: ( value)
                    {if(value!.isEmpty){return 'please enter your email address';}return null;} ,                 
                   label: 'Email Address',
                   prefix: Icons.email_outlined,
                    border: InputBorder.none,
                  ),                           
                  const SizedBox(height: 15,),    

                     DefaultTextField(
                    controller: passwordController ,
                    type: TextInputType.visiblePassword,
                    validate: ( value)
                    { if(value!.isEmpty){return 'password is too short';}return null;} ,
                   label: 'Password',
                   suffix: DimaGoldLoginCubit.get(context).suffix,
                   prefix: Icons.lock,
               //    border: InputBorder.none,
                   isPassword:DimaGoldLoginCubit.get(context).isPassword,
                   suffixPressed: (){ print("changePasswordVisibility"); DimaGoldLoginCubit.get(context).changePasswordVisibility(); },
                    //   onSubmit: (value) {                      
                    //    if(formkey.currentState!.validate()) {
                    //  DimaGoldLoginCubit.get(context).userlogin(email: emailController.text, password: passwordController.text);
                    // }
                    // },
                  ),
                  const SizedBox(height: 30,),

                ConditionalBuilder(
                condition: state is! DimaGoldLoginLoadingStates,
                builder: (context) => DefaultButton(
                  width : double.infinity,
                  background: Colors.orangeAccent,
                  isuppercase:true,
                  function: ()
                  {
                    try{
                    if(formkey.currentState!.validate()) {
                     DimaGoldLoginCubit.get(context).userlogin(email: emailController.text, password: passwordController.text);
                    }
                  }
                  catch(e)
                  {print(e.toString());}

                  }
                , text: 'login'
            
                ),
                fallback:(context) =>  const Center(child: CircularProgressIndicator()),
                            ),

                 const SizedBox(height: 15,),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text('dont have an account ?'),
                
                   DefaultTextButton(
                    function:(){
                    navigateAndFinish(context,DimaGoldRegisterScreen());
                    } 
                    , text: 'register'),
                 ],),

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