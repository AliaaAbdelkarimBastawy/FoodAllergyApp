import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../startScreens/startScreen.dart';

class SelectLanguageScreen extends StatefulWidget {
   SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

Future<void> _LanguageScreenSharedPreference() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('languageScreen', true);
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  bool isEnglish = true;
  @override
  void initState()
  {
    _LanguageScreenSharedPreference();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 55,),
                Text("What’s your preferred language?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            color:isEnglish? Colors.grey.shade300 : Colors.white ,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('Assets/Images/american_flag.png'),
                            ),
                          ),
                          onTap: ()
                          {
                            setState(() {
                              isEnglish = true;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("English", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            color:isEnglish? Colors.white : Colors.grey.shade300,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('Assets/Images/Egypt_flag.png'),
                            ),
                          ),
                          onTap: ()
                          {
                            setState(() {
                              isEnglish = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text("Arabic", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100,)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 40,
                  width: double.maxFinite,
                    child: MaterialButton(onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> StartScreen()));
                    },
                      color: Color(0xFF16CD54),
                    child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18),),
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
