import 'package:flutter/material.dart';


import '../../data/AlternativesScreen/AlternativesScreenViewModel.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../HomeScreen/HomeScreen.dart';

class AlternativesScreen extends StatefulWidget {
  const AlternativesScreen({Key? key}) : super(key: key);

  @override
  State<AlternativesScreen> createState() => _AlternativesScreenState();
}
class Model_3 {
  late final String title;
  final Image image;


  Model_3({
    required this.title,
    required this.image,
  });
}

class _AlternativesScreenState extends State<AlternativesScreen> {
  List<Widget> screens = [HomeScreen(),
    // MenuScreen(),
  // RecipesScreen(),
    CategoriesScreen()];
  static final List<Model_3> items = [
    Model_3(
        title: "Juhayna soy milk ",

        image: Image.asset('Assets/Images/soy milk.jpeg', height: 130, width: 130)),
    Model_3(
        title: "alpro almond milk",
        image:
        Image.asset('Assets/Images/almond.jpeg', height: 130, width: 130)),
    Model_3(
        title: "Juhayna oat milk",
        image: Image.asset('Assets/Images/oatmilk.jpeg',
            height: 135, width: 135)),
    Model_3(
        title: "Juhayna coconut milk",
        image: Image.asset('Assets/Images/coconut.jpeg', height: 130, width: 130)),
    Model_3(
        title: "Alpro coconut milk",
        image: Image.asset('Assets/Images/alprococo.jpeg', height: 130, width: 130)),
    Model_3(
        title: "Juhayna Almond milk",
        image: Image.asset('Assets/Images/Juhalmond.jpeg', height: 130, width: 130)),
  ];

  int Current_Index = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      Current_Index = index;
    });
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: Icon(
        color: Colors.black,
        Icons.arrow_back,
      ),

      elevation: 0,
    ),
    body: Container(
      child: ListView(
        children: [


          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 15),
            child: Text("Alternatives",
                textAlign: TextAlign.center,
                style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,

                )),
          ),
          Container(
            height: 480,

            child: buildList(),

          ),
        ],
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Menus',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          label: 'Categories',
        ),
      ],
      currentIndex: Current_Index,
      selectedItemColor: Color(0xFF16CD54),
      onTap: _onItemTapped,
    ),

  );

  Widget buildList() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 4,
          childAspectRatio: 1 / 1),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: GridTile(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  items[index].image,
                  Text(
                    items[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Outfit"),
                  ),
                ],
              ),
            ),
          ),
          /*onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>AllergenMenuScreen()));},*/
        );;
      });
}
