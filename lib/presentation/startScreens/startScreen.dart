import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:graduationproject26_1/LocalString.dart';
import 'package:graduationproject26_1/languageGlobal.dart' as LanguageGlobal;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/startScreens/pageViewModel.dart';
import '../loginScreen/loginScreen.dart';

class StartScreen extends StatefulWidget {

  bool lang;
  StartScreen({Key? key, required this.lang}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

Future<void> _LanguageScreenSharedPreference() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('languageScreen', true);
}

class _StartScreenState extends State<StartScreen> {
   PageController pageController = PageController(viewportFraction: 0.8, keepPage: true);

   @override
   void initState()
   {
     _LanguageScreenSharedPreference();
     super.initState();
   }

  List<PageViewModel> startScreensList = [
    PageViewModel(imageProvider: AssetImage('Assets/Images/start_screen1.jpg'),
        title: "Search Food Products".tr,
        description:"Search food by Product name to know what allergy types it contains".tr),
    PageViewModel(imageProvider: AssetImage('Assets/Images/start_screen2.jpg'),
        title: "Search Recipes & Menus".tr,
        description:"Search different recipes that are safe to your allergy type, and you can also see the allergens Menus of the most popular restaurants".tr),
    PageViewModel(imageProvider: AssetImage('Assets/Images/start_screen3.jpg'),
        title: "Scan, Check & Enjoy!".tr,
        description:"Scan products you want to check if they are Allergy free or Alcohol free & enjoy happy, friendly Shopping!".tr),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(29.0),
        child: AppBar(
          backgroundColor:Colors.white,
          elevation: 0,
          leading: Container(),
          title: TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
          },child: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Container(
                margin: EdgeInsets.only(left: 270),
                child: Text("Skip".tr, style: TextStyle(
                  fontSize: 15,
                    color: Color(0xFF16CD54)),)),
          ),),
        ),
      ),
      body:Container(
        color: Colors.white,
        child: Column(
          children: [
          Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) => buildStartScreensItem(startScreensList[index]),
            itemCount: startScreensList.length,
            controller: pageController,
            scrollDirection: Axis.horizontal,
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SmoothPageIndicator(controller: pageController, count: startScreensList.length,
              effect:SlideEffect(
                    spacing:  8.0,
                    dotColor:  Colors.grey.shade400,
                    activeDotColor: Color(0xFF16CD54)
              ),),
          ),

        ],),
      ),

    );
  }

  Widget buildStartScreensItem(PageViewModel model)=> Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: model.imageProvider),
            SizedBox(height: 30,),
            Center(child: Text('${model.title}', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ),)),
            SizedBox(height: 30,),
            Center(child: Text('${model.description}', style: TextStyle( fontSize: 13,),)),
            SizedBox(height: 30,),

          ],
        ),
      ),
    ),
  );
}
