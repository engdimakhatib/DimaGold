import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {

  final TextEditingController controller ;
 final  TextInputType type;

    final FormFieldValidator<String> validate;
 final  String label ;
  final IconData prefix ;
 final ValueChanged<String>?  onSubmit;
final   ValueChanged<String>?   onChanged;
 final IconData? suffix ;
 final Function? suffixPressed ;
 final InputBorder? border ;
  final bool? isPassword ;
   const   DefaultTextField({super.key ,required this.controller , required this.type , required this.validate , required this.label ,required this.prefix ,this.onSubmit ,this.onChanged,this.suffix, this.suffixPressed,this.border=InputBorder.none,this.isPassword });
  @override
  Widget build(BuildContext context) {
    return Container(
         decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color : Colors.white,
              boxShadow: const [BoxShadow( blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))],
            ),
  child:   TextFormField (    
                controller : controller,
                keyboardType : type,
                onFieldSubmitted : onSubmit,
                onChanged :  onChanged,               
                decoration : InputDecoration(
                  labelText :label,
                  prefixIcon :Icon(prefix ,color: Colors.orangeAccent, ) ,
                  border : border, 
                suffixIcon : suffix !=null ?
                              IconButton(
                              color: Colors.orangeAccent,
                                icon :Icon(suffix) ,
                   onPressed :(() => suffixPressed) ,
                              )
                              : null,
                ),
              validator :validate,         
              obscureText : isPassword ?? false ,
              ),
);
  }
}