import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/CategoriesScreen/CategoriesScreenViewModel.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<CategoriesViewModel> FishList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
  ];

  List<CategoriesViewModel> MilkList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
  ];

  List<CategoriesViewModel> BakeryList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
  ];

  List<CategoriesViewModel> ProteinList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
  ];

  List<CategoriesViewModel> GrainsList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
  ];

  List<CategoriesViewModel> FruitList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
  ];

  List<CategoriesViewModel> EggsList = [
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
    CategoriesViewModel(imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",),
  ];
  /// List of Tab Bar Item
  List<String> items = [
    "All Categories",
    "Recipes",
    "Menus",
  ];
  List<String> titles=[
    "All Categories",
    "Recipes",
    "Menus",];
  int current = 0;

  int Current_Index = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      Current_Index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List<List<CategoriesViewModel>> Lists= [MilkList, BakeryList, ProteinList,FishList, GrainsList, FruitList, EggsList];
    var ListSelected = Lists[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        title: Padding(
          padding: const EdgeInsets.only(left: 95.0),
          child: Text("Favorites"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.qr_code_scanner_sharp),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            /// CUSTOM TABBAR
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 600,
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  margin: const EdgeInsets.all(5),
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: current == index
                                        ? Color(0xFF16CD54)
                                        : Colors.white70,
                                    borderRadius: current == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(10),
                                    border: current == index
                                        ? Border.all(
                                        color: Color(0xFF16CD54), width: 2)
                                        : Border.all(
                                        color: Colors.white30, width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      items[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: current == index
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: current == index,
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                  ))
                            ],
                          );
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: 500,
                child: GridView.builder(itemBuilder: (context, index)=> buildStartScreensItem( Lists[current][index]),
                  itemCount: ListSelected.length,
                  scrollDirection: Axis.vertical, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 3/2,
                      crossAxisSpacing: 20, mainAxisSpacing: 20
                  ),),
              ),
            ),
          ],
        ),
      ),
    );

  }
  Widget buildStartScreensItem(CategoriesViewModel model)=> Padding(
    padding: const EdgeInsets.all(8),
    child: Material(
      // elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 80,
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(

                child: Image(image: model.imageProvider, width: 110, height: 80,)),
            SizedBox(height: 8,),
            Center(child: Text('${model.title}', style: TextStyle( fontSize: 14,),)),

          ],
        ),
      ),
    ),
  );

}

