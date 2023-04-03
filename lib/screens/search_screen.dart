
import 'package:carousel_pro/carousel_pro.dart';
import 'package:dimagold/component/custom_app_bar.dart';
import 'package:dimagold/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/component.dart';
import '../component/defaultButton.dart';
import '../component/defaultTextField.dart';
import '../component/drop_list_model.dart';
import '../component/select_drop_list.dart';
import '../cubit/states.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});
  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  //List<String> listCity = <String>['Aleppo', 'Damascus', 'Lattakia'];
  DropListModel dropListCityModel = DropListModel([
    OptionItem(id: "1", title: "حلب"),
    OptionItem(id: "2", title: "اللاذقية"),
    OptionItem(id: "2", title: "الشام"),
  ]);
  OptionItem optionItemCitySelected = OptionItem(id: "0", title: "City");

//List<String> listGold = <String>['Aleppo', 'Damascus', 'Lattakia'];
  DropListModel dropListGoldModel = DropListModel([
    OptionItem(
      id: "1",
      title: "أقراط",
    ),
    OptionItem(
      id: "2",
      title: "عقد",
    ),
    OptionItem(
      id: "2",
      title: "سنسال",
    ),
    OptionItem(
      id: "2",
      title: "أسوارة",
    ),
    OptionItem(
      id: "2",
      title: "خلخال",
    ),
    OptionItem(
      id: "2",
      title: "خاتم",
    ),
    OptionItem(
      id: "2",
      title: "لوّاحة",
    ),
  ]);
  OptionItem optionItemGoldSelected = OptionItem(id: "0", title: "Gold");
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is AppInsertDatabaseState) { Navigator.pop(context);}
      }, builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          // appBar: AppBar(
          //   title: const Text(''),
          //   backgroundColor: Colors.orangeAccent.withOpacity(0.5),
          // ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  //search
                  print('Hi if');
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                        (context) => Container(
                                                      padding: const EdgeInsets.all(5),
                                                      child :SingleChildScrollView(
                                                      child: Form(
                                                        key: formKey,
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            
                                                               SelectDropList(
                                                                optionItemCitySelected,
                                                                dropListCityModel,
                                                                (optionItem) {
                                                                  optionItemCitySelected = optionItem;
                                                                  setState(() {
                                                                    optionItemCitySelected = optionItem;
                                                                  });
                                                                },
                                                                true,
                                                                Icons.location_city,
                                                                null,
                                                              ),
                                                            
                                                            const SizedBox( height: 10, ),
                                                          SelectDropList(
                                                                optionItemGoldSelected,
                                                                dropListGoldModel,
                                                                (optionItem) {
                                                                  optionItemGoldSelected = optionItem;
                                                                  setState(() {
                                                                    optionItemGoldSelected = optionItem;
                                                                  });
                                                                },
                                                                false,
                                                                null,
                                                                'assets/images/gold2.png',
                                                              ),
                                                            
                                                            const SizedBox( height: 10, ),
                                                            DefaultTextField(
                                                              controller: weightController,
                                                              type: TextInputType.visiblePassword,
                                                              label: 'weight',
                                                              prefix: Icons.monitor_weight,
                                                              validate: (value) {
                                                                if (value!.isEmpty) {
                                                                  return 'weight mustnot be empty';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                              border: InputBorder.none,
                                                            ),
                                                            const SizedBox(
                                                              height: 15.0,
                                                            ),
                                                            DefaultButton(
                                                              width : double.infinity,
                                                              background: Colors.orangeAccent,
                                                              isuppercase: false,
                                                              text: 'search',
                                                              function: () {},
                                                            ),
                                                            const SizedBox(
                                                              height: 10.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                        ),
                                                    ),
                        
                        elevation: 15   
                     )
                    .closed
                    .then((value) {
                  cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                  print('Hi else');
                });
                cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
              }
            },
            child: Icon(cubit.fabIcon),
          ),
          body: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column( children: [
               CustomAppBar( title : '' ,icon: Icons.arrow_back_ios,   opacity: Colors.black.withOpacity(0.05),
               onPressed:() {backTo(context);} ,),
               Expanded(
                 child: ListView(children: [
                        Container(
                          height: 200,
                          child: Carousel(
                            dotBgColor: Colors.black54.withOpacity(0.7),
                            radius: const Radius.circular(20),
                            borderRadius: true,
                            dotIncreasedColor: Colors.orangeAccent,
                            autoplay: false,
                            // dotPosition : DotPosition.topCenter,
                            // dotIncreaseSize : 30,
                            images: const [
                              AssetImage("images/c.png"),
                              AssetImage("images/sql.png"),
                              AssetImage("images/flutter.png"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                DataTable(
                                  dataRowHeight: 60,
                                  headingRowHeight: 50,
                                  horizontalMargin: 10,
                                  sortColumnIndex: 1,
                                  sortAscending: true,
                                  columnSpacing: 15,
                                  columns: const [
                                     DataColumn(label: Text((""))),
                                    DataColumn(
                                      label: Text(
                                        ("name"),
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 81, 141, 191),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text(
                                      ("type"),
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 81, 141, 191),
                                      ),
                                    )),
                                    DataColumn(
                                      label: Text(
                                        ("weight"),
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 81, 141, 191),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text(
                                      ("city"),
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 81, 141, 191),
                                      ),
                                    )),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(
                                        CircleAvatar(
                                          radius: 20,
                                          child: Image.asset(
                                            "images/c.png",
                                            fit: BoxFit.cover,
                                          ),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "c#",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "Dima Katib",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "high",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "1/1/2020",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(
                                        CircleAvatar(
                                          radius: 20,
                                          child: Image.asset(
                                            "images/sql.png",
                                            fit: BoxFit.cover,
                                          ),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "Sql server",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "Dima Katib",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "high",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "1/1/2020",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(
                                        CircleAvatar(
                                          radius: 20,
                                          child: Image.asset(
                                            "images/flutter.png",
                                            fit: BoxFit.cover,
                                          ),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "flutter",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "Dima Katib",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "high",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          "1/1/2020",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
               ),
                
              ],
            ),
          ),
        );
      }),
    );
  }
}
