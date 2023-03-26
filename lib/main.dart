import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/pages/auth/login_page.dart';
import 'package:graduationproject26_1/pages/home_page.dart';
import 'package:graduationproject26_1/presentation/Admin/AdminHomePage/AdminHomePage.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategoryItem/AddNewCategoryItem.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategoryItem/EditCategoryItem.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategoryItem/ShowProducts.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/AddNewCategorySection.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/EditCategorySection.dart';
import 'package:graduationproject26_1/presentation/Admin/Category/CategorySection/ShowCategory.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/AddNewKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/EditKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/Knowledge/ShowKnowledge.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/AddNewDish.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/EditDish.dart';
import 'package:graduationproject26_1/presentation/Admin/MenuDishes/ShowDishes.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/AddNewRecipe.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/EditRecipe.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/ShowRecipes.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/AddNewRestaurant.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/EditRestaurant.dart';
import 'package:graduationproject26_1/presentation/Admin/Restaurant/ShowRestaurant.dart';
import 'package:graduationproject26_1/presentation/UserProfile/EditUserProfile.dart';
import 'package:graduationproject26_1/presentation/loginScreen/loginScreen.dart';
import 'package:graduationproject26_1/presentation/profileScreen/profileScreen.dart';
import 'package:graduationproject26_1/presentation/signUpScreen/signUpScreen.dart';
import 'package:graduationproject26_1/presentation/splashScreen/splashScreen.dart';
import 'package:graduationproject26_1/shared/constants.dart';
import 'Alcohol-TextRecognition/Main-TextRecognition.dart';
import 'fetchData.dart';
import 'helper/helper_function.dart';


// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SignUpScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

