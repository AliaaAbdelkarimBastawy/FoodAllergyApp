
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/ShowCategory.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/ShowKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/ShowRecipes.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/presentation/Language/LanguageScreen.dart';
import 'package:graduationproject26_1/presentation/mainScreen/MainScreen.dart';
import '../../../helper/helper_function.dart';
import '../../mainScreen/MainScreen2.dart';
import 'globals.dart' as globals;

import '../../RecipesScreen/RecipesScreen.dart';
import '../../TextRecognition/home.notifer_2.dart';
import '../../loginScreen/loginScreen.dart';
import '../../recipesDetails/recipes_Details.dart';

class AdminHomePageModel {
  late final String title;
  final Image image;

  AdminHomePageModel(
      {required this.title,
        required this.image,
      });
}

@override
void initState() {
  globals.WhichMainScreen2=1;
}

class AdminHomePage extends StatefulWidget {
   AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  String userName = "";
  String email = "";
  String getName = "";
  String getEmail = "";
  String getPassword = "";
   final List<AdminHomePageModel> items = [];
   static List<String> Titles = ["Menus", "Recipes", "Categories", "Knowledge", "User View","Language"];
   static List<String> Images = ['Assets/Images/Menu1.png','Assets/Images/Recipe1.png','Assets/Images/Category1.png',
     'Assets/Images/Knowledge2.png',
     'Assets/Images/eye.png', 'Assets/Images/languages.png'];
   // static List<String> ShowPages = ["ShowRestaurant", "ShowRecipes", "ShowCategory", 
   //   "ShowKnowledge", "MainScreen"];

   Future<dynamic> getCurrentUserInfo() async {
     for (int i = 0; i < Titles.length; i++) {
       setState(() {
         items.add(AdminHomePageModel(title: Titles[i], image: Image.asset(
           Images[i],
           width: 100,
           height: 100,
         )));
       });
     }
     print("HENAAAA");
     print(Images.length);
     print("HENAAAA");
     print(Titles.length);
     print(items.length);


   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
           backgroundColor: Color(0xFF16CD54),
           title: Padding(
             padding: const EdgeInsets.only(left: 55.0),
             child:Row(
               children: [
                 Image.asset('Assets/Images/admin.png', width: 35,
                   height: 35,),
                 SizedBox(width: 10,),
                 Text("Admin Panel"),
               ],
             )
           ),

       ),
       body:  Container(
         width: double.infinity,
         height: double.infinity,
         margin: const EdgeInsets.only(top: 10),
         child: Container(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.fromLTRB(8, 2, 8,0),
                 child: SizedBox(
                   height: 590,
                   child: Expanded(
                     child: Container(
                       child: GridView.builder(
                         itemBuilder: (context, index) =>
                             buildStartScreensItem(items[index], index),
                         itemCount: items.length,
                         scrollDirection: Axis.vertical,
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             mainAxisSpacing: 2,
                             childAspectRatio: 1 / 1),
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
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
                         backgroundImage: AssetImage('Assets/Images/administrator.png'),

                       ),
                       SizedBox(width: 10,),
                       Text(globals.username,
                         style: TextStyle(fontSize:18,fontWeight: FontWeight.bold, color: Colors.white),),
                     ],
                   ),
                 ),
               ),
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
     );
   }

   Widget buildStartScreensItem(AdminHomePageModel model,int index) => Padding(
     padding: const EdgeInsets.fromLTRB(8,8,4,8),
     child: Material(
       // elevation: 10,
       child: Column(
         children: [
           GestureDetector(
             onTap: (){
               if (index == 0)
                 {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRestaurant()));

                 }
               
               else if (index ==1)
                 {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowRecipes()));

                 }
               
               else if (index ==2)
                 {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowCategory()));

                 }
               
               else if (index ==3)
                 {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowKnowledge()));

                 }
               
               else if (index ==4)
                 {
                   globals.WhichMainScreen2 =1;
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen2(Current: 0,)));

                 }
               else
                 {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> EditLanguageScreen()));
                 }
             },
             child: Container(
                 margin: const EdgeInsets.only(top: 5.0),
                 height: 160.0,
                 width: 200.0,
                 child: Card(
                     elevation: 13,
                     margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                           child: Center(child: model.image),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Text(
                             model.title,
                             textAlign: TextAlign.center,
                             style: const TextStyle(
                                 fontSize: 15,
                                 color: Colors.black,
                                 fontWeight: FontWeight.w300,
                                 fontFamily: "Outfit"),
                           ),
                         ),
                       ],
                     ))
             ),
           ),
         ],
       ),
     ),
   );

   @override
   void initState() {
     getUserData();
     super.initState();
     getCurrentUserInfo();
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

}
