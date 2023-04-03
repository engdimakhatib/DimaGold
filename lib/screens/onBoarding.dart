import 'package:dimagold/layout/home_layout.dart';
import 'package:dimagold/screens/login/dima_gold_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../component/buildBoardingItem.dart';
import '../component/component.dart';
import '../component/defaultTextButton.dart';
import '../modle/BoardingModel.dart';
import '../network/local/cache_helper.dart';
import '../shared/colors.dart';



class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen> {
 final PageController boardController = PageController();

 List<BoardingModel> Boarding = [
  BoardingModel(image:'assets/images/find1.png',title: 'On Board 1 Title',body: 'On Board 1 Body'),
  BoardingModel(image: 'assets/images/find2.png',title: 'On Board 2 Title',body: 'On Board 2 Body'),
  BoardingModel(image: 'assets/images/find3.png',title: 'On Board 3 Title',body:'On Board 3 Body' ),
];
bool islast = false;
void submit()
{
    print("on submit");
 CacheHelper.savaData(key: 'onBoarding', value: true).then((value){
  if(value) {navigateAndFinish(context ,  const DimaGoldLoginScreen(),);}
   // if(value) {navigateAndFinish(context , ShopLoginScreen(),);}
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

actions: [  DefaultTextButton(function: submit,text: 'skip', ),],
      ),
      body: Column(children : [
       //    Expanded(

                //child:
                 SizedBox(
                  height : 500,
                   child: PageView.builder(
                    physics:   const BouncingScrollPhysics(),
                    controller: boardController,
                    onPageChanged: (int index) 
                    {
                      print(index.toString());
                      if(index == Boarding.length-1){ setState(() {islast=true; }); }
                      else {islast=false;} 
                    },
                    itemBuilder: (context, index) => Expanded(child: BuildBoardingItem(model:Boarding[index])) ,
                    itemCount: Boarding.length,
                                 ),
                 ),
             
          // ),
      
          const SizedBox(height: 40.0,),
          Row( children: [
              SmoothPageIndicator(
                controller: boardController,
                effect:  const ExpandingDotsEffect(
                  dotColor: Colors.grey , activeDotColor: defaultColor ,dotHeight: 10,dotWidth: 10, expansionFactor: 4,spacing: 5,
                  ),
                 count: Boarding.length),
                 
              const Spacer(),
              FloatingActionButton(
                onPressed: ()
                {
                  if(islast) {submit();}
                  else { boardController.nextPage(duration: const Duration(milliseconds: 750,), curve: Curves.fastLinearToSlowEaseIn);}               
                  },
                child: const Icon(Icons.arrow_forward_ios),),
            ],),
        ],),
    );
  }
  // Widget buildBoardingItem(BoardingModel model) => Column(
  //       children: [
  //        Expanded(
  //           child: 
  //           Image(image:  AssetImage(model.image) , width: 200 , height: 200,),
  //         ),
  //         const SizedBox(height: 30.0,),
  //         Text(model.title,
  //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 15.0,),
  //         Text(model.body,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 15.0,),
  //       ],);
}
