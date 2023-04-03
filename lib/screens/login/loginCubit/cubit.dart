import 'package:bloc/bloc.dart';
import 'package:dimagold/screens/login/loginCubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DimaGoldLoginCubit extends Cubit<DimaGoldLoginState>
{
  DimaGoldLoginCubit(): super(DimaGoldLoginInitialStates()) ; 
  static DimaGoldLoginCubit get(context)=> BlocProvider.of<DimaGoldLoginCubit>(context);

  void userlogin({required String email , required String password})
  {
    emit(DimaGoldLoginLoadingStates());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
     .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
  emit(DimaGoldLoginSuccessStates());
   
     }).catchError((error){
      emit(DimaGoldLoginErrortates(error.toString()));
     });
  }
  IconData suffix =Icons.visibility_outlined;
  bool isPassword = true;
void changePasswordVisibility()
{
isPassword = !isPassword ;
suffix =isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
emit(DimaGoldChangePasswordVisibilityStates());
  }
}
