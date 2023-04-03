import 'package:dimagold/component/gold_item.dart';
import 'package:flutter/material.dart';

class grid_view extends StatefulWidget {
  const grid_view({super.key});

  @override
  State<grid_view> createState() => _grid_viewState();
}

class _grid_viewState extends State<grid_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
        ),
        //itemCount: myProvider.allUsers.length,
        itemBuilder: (context, i) => gold_item(
          //model: myProvider.allUsersList[i], 
          //),
      ), 
      ),
    );
  }
}