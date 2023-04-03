import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class home_layout extends StatelessWidget {
  const home_layout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
         builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body:cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) { cubit.changeIndex(index);},
              items: const [
                 BottomNavigationBarItem( icon: Icon(Icons.question_answer), label: 'About Us',),
                BottomNavigationBarItem( icon: Icon(Icons.menu), label: 'Home', ),
                BottomNavigationBarItem( icon: Icon(Icons.check_circle_outline), label: 'Search', ),
              ], ),
          );
       },
      );
 
     }
}

    //        bottomNavigationBar:  CurvedNavigationBar(
    //         height: 50,
    //         color : Colors.orange,
    //   backgroundColor: Colors.white,
    //      index: cubit.currentIndex,
    //        onTap: (index) { cubit.changeIndex(index);},

    //   items: const[
    //     Icon(Icons.question_answer, size:30),
    //     Icon(Icons.menu , size : 30),
    //     Icon(Icons.check_circle_outline , size: 30 , ),
      
    //   ],
    // ),