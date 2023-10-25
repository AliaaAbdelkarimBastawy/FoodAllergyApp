import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/pages/home_page.dart';
import 'package:graduationproject26_1/presentation/test/HomeAdmin.dart';
import '../../helper/helper_function.dart';
import '../../service/auth_service.dart';
import '../../service/database_service.dart';
import '../Admin/AdminHomePage/AdminHomePage.dart';
import '../BarcodeScreens/BarcodeScanner.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../MenuScreen/MenuScreen.dart';
import '../RecipesScreen/RecipesScreen.dart';
import '../TextRecognition/Main-TextRecognition_2.dart';
import '../loginScreen/loginScreen.dart';
import '../profileScreen/profileScreen.dart';
import '../test/Categories_Admin.dart';
import '../test/KnowledgeTest_Admin.dart';
import '../test/Recipes_Admin.dart';
import '../test/RestaurantTest_Admin.dart';
import 'globals.dart' as globals;
import '../../data/homeScreen/homeScreenViewModel.dart';
import '../Admin/AdminHomePage/globals.dart' as WhichMainScreen;
class MainScreen2 extends StatefulWidget {
  var Current;
  var drawer;
  var arrow ;
  MainScreen2({super.key, required this.Current,});
  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class Model2 {
  late final String title;
  final Image image;

  Model2({
    required this.title,
    required this.image,
  });
}

class _MainScreen2State extends State<MainScreen2> {

  String userName = "";
  String email = "";
  AuthService authService = AuthService();

  @override
  // TODO: implement widget
  final fb = FirebaseDatabase.instance.reference().child("Restaurants");

  static List<String> Names = [];
  static List<String> Images = [];
  static  List<Model2> items = [];


  List<Widget> screens = [MyHome_Admin(),MyRestaurants_Admin(),
    MyRecipes_Admin(),
    MyCategory_Admin()];


  List<String> ScreensTitles = ["Home","Menus",
    "Recipes", "Categories"];


  int Current_Index = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      Current_Index = index;
    });
  }


  String getName = "";

  String getEmail = "";

  String getPassword = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseReference reference;
  FirebaseDatabase db = FirebaseDatabase.instance;

  var snapshotName;
  var snapshotEmail;
  var snapshotPassword;

  Future<dynamic> getUserData() async {
    final ref = FirebaseDatabase.instance.ref();
    var authenVariable = auth.currentUser?.uid;
    final fb = FirebaseDatabase.instance.reference().child("$authenVariable");

    snapshotName = await ref.child('$authenVariable/UserData/Name').get();
    snapshotEmail = await ref.child('$authenVariable/UserData/Email').get();
    snapshotPassword = await ref.child('$authenVariable/UserData/Password').get();

    setState(() {
      getName = snapshotName.value.toString();
      globals.username = getName;

      if(globals.username == "null")
      {
        gettingUserData();
        print("NameIfNull");
        print(getName);
      }

      getEmail = snapshotEmail.value.toString();
      getPassword = snapshotPassword.value.toString();
    });

  }

  gettingUserData() async {
    print("gettingUserData");
    await HelperFunctions.getUserNameFromSF().then((val) {
      setState(() {
        getName = val!;
        globals.username = getName;
        print("Line 139");
        print(getName);
      });
    });
    // getting the list of snapshots in our stream
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
                icon: Icon(Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                     AdminHomePage()));
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
                      Icon(
                        Icons.account_circle,

                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Text("Username",
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
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10,),
                  Text('Profile', style: TextStyle(color: Colors.grey),),
                ],
              ),
              onTap: () {
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyKnowledge_Admin()));
              },
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: MaterialButton(
                color: Colors.grey,
                onPressed: () {  },
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

  @override
  void initState() {
    WhichMainScreen.WhichMainScreen2 =1;
    super.initState();
    getUserData();
    gettingUserData();
  }

// --- Button Widget --- //
}

