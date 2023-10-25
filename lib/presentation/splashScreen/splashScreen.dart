

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject26_1/presentation/startScreens/startScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../loginScreen/loginScreen.dart';
import '../selectLanguageScreen/selectLanguageScreen.dart';
import 'package:graduationproject26_1/languageGlobal.dart' as LanguageGlobal;
class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }

}

 class SplashState extends State<SplashScreen> {
  late bool FirstTime = false;

  void getSharedPreferenceOfLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      FirstTime = prefs.getBool("languageScreen")!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPreferenceOfLanguage();
    startTime();
  }


  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor:Color(0xFF16CD54),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('Assets/Images/AppLogo.png'),
            width: 270,
            ),
          ),
        ],
      ),
    );
  }

  route() {
    if (FirstTime == true)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => SelectLanguageScreen()
        )
        );
      }
    else
      {
        // if(LanguageGlobal.isEnglish == false)
        //   {
        //     Navigator.pushReplacement(context, MaterialPageRoute(
        //         builder: (context) => StartScreen(lang: false,)
        //     )  );
        //   }
        //
        // else
        //   {
        //     Navigator.pushReplacement(context, MaterialPageRoute(
        //         builder: (context) => StartScreen(lang: true,)
        //     )  );
        //   }
        //

        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => SelectLanguageScreen()));
     
      }
 
    }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
}