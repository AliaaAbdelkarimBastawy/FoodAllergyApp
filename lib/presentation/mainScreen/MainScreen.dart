
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../BarcodeScreens/BarcodeScanner.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../KnowledgeScreens/KnowledgeScreen.dart';
import '../MenuScreen/MenuScreen.dart';
import '../RecipesScreen/RecipesScreen.dart';
import '../TextRecognition/Main-TextRecognition_2.dart';
import '../loginScreen/loginScreen.dart';
import '../profileScreen/profileScreen.dart';
import 'globals.dart' as globals;
import '../../data/homeScreen/homeScreenViewModel.dart';

class MainScreen extends StatefulWidget {
   var Current;
   MainScreen({super.key, required this.Current});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class Model2 {
  late final String title;
  final Image image;

  Model2({
    required this.title,
    required this.image,
  });
}

class _MainScreenState extends State<MainScreen> {
  @override
  // TODO: implement widget
  final fb = FirebaseDatabase.instance.reference().child("Restaurants");
  
  static List<String> Names = [];
  static List<String> Images = [];
  static  List<Model2> items = [];


  List<Widget> screens = [HomeScreen(),MenuScreen(),
    RecipesScreen(),
    CategoriesScreen()];


  List<String> ScreensTitles = ["Home","Menus",
    "Recipes", "Categories"];

  List<HomeViewModel> HomeScreensList = [
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
    HomeViewModel(imageProvider: AssetImage('Assets/Images/tortilla.jpg'),
      title: "Chicken Tortella",),
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
  Widget build(BuildContext context) {
    if (widget.Current !=0)
    {
      print("OUTTTTTTT");
      print(widget.Current);
      Current_Index = widget.Current;
      widget.Current =0;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Color(0xFF16CD54),
          title: Padding(
            padding: const EdgeInsets.only(left: 94.0),
            child: Text(ScreensTitles[Current_Index]),
          ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.chat,
            color: Colors.white,
          ),
          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> BarcodeScanner()));
          },
        ),
        IconButton(
          icon: Icon(Icons.qr_code_scanner_sharp,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BarcodeScanner()));
          },
        ),

      ]
      ),
      body: screens[Current_Index],
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color:  Color(0xFF16CD54),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('Assets/Images/profile1.png'),

                      ),
                      SizedBox(width: 10,),
                      Text('Ahmed yasser',
                        style: TextStyle(fontSize:18,fontWeight: FontWeight.bold, color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Text('Profile'),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.info_outline,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Text('Knowledge'),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> KnowledgeScreen()));
              },
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: MaterialButton(onPressed: _showAlertDialog,
                color: Color(0xFF16CD54),
                child: Text("Logout",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              ),
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
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          height: 100,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: EdgeInsets.only(bottom: 10),
            // <-- SEE HERE
            title: Center(child: const Text('Logout?')),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Center(child: Text('Are you sure want to logout?')),
                ],
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                child: const Text('Cancel', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: OutlinedButton(
                  child: const Text('Logout', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 14),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
// --- Button Widget --- //
}

