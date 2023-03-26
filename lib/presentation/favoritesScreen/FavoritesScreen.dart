import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/CategoriesScreen/CategoriesScreenViewModel.dart';
import '../profileScreen/profileScreen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<CategoriesViewModel> Products = [
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/almond.jpeg'),
      title: "Chicken Tortella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/oatmilk.jpeg'),
      title: "Chicken Tortella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/soy milk.jpeg'),
      title: "Chicken Tortella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/Juhalmond.jpeg'),
      title: "Chicken Tortella",
    ),
  ];

  List<CategoriesViewModel> Menus = [
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
  ];

  List<CategoriesViewModel> recipes = [
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
    CategoriesViewModel(
      imageProvider: AssetImage('Assets/Images/img.png'),
      title: "Nutella",
    ),
  ];

  /// List of Tab Bar Item
  List<String> items = [
    "Products",
    "Recipes",
    "Menus",
  ];
  List<String> titles = [
    "Products",
    "Recipes",
    "Menus",
  ];
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
    List<List<CategoriesViewModel>> Lists = [Products, Menus, recipes];
    var ListSelected = Lists[0];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
        ),
        backgroundColor: Color(0xFF16CD54),
        title: const Padding(
          padding: EdgeInsets.only(left: 95.0),
          child: Text("Favorites"),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
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
                child: GridView.builder(
                  itemBuilder: (context, index) =>
                      buildStartScreensItem(Lists[current][index]),
                  itemCount: ListSelected.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 0.95,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStartScreensItem(CategoriesViewModel model) => Padding(
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
                child: Image(
                  image: model.imageProvider,
                  width: 110,
                  height: 80,
                )),
            SizedBox(
              height: 8,
            ),
            Center(
                child: Text(
                  '${model.title}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
          ],
        ),
      ),
    ),
  );
}
