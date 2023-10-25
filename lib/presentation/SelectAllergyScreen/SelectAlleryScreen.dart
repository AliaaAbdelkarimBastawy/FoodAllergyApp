import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home_page.dart';
import '../Admin/AdminHomePage/AdminHomePage.dart';
import '../HomeScreen/HomeScreen.dart';
import '../loginScreen/loginScreen.dart';
import '../mainScreen/MainScreen.dart';


class SelectAllergyScreen extends StatefulWidget {
  var UsernameController;
  var EmailController;
  var PasswordController;

  SelectAllergyScreen({Key? key, required this.EmailController, required this.UsernameController, required this.PasswordController}) : super(key: key);

  @override
  State<SelectAllergyScreen> createState() => _SelectAllergyScreen();

}

class _SelectAllergyScreen extends State<SelectAllergyScreen> {
  bool Milk = false;
  bool Fish = false;
  bool Eggs = false;
  bool Peanuts = false;



  bool Strawberry = false;
  bool Soy = false;
  bool Wheat = false;
  bool Gluten = false;


  bool Nut = false;
  bool Corn = false;
  bool Almonds = false;
  bool Crustaceans = false;

  bool EggYolk = false;
  bool EggWhite = false;

  bool MilkCasein = false;
  bool MilkWhey = false;


  @override
  Widget build(BuildContext context) {
    return Material(
      child:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset("Assets/Images/logo.jpeg",
                  width: 170, height: 170),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 24, bottom: 20),

                child:  Text(
                  'Please, select your food allergy/ies'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Outfit'),
                )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: 160,
                        child: ListView(
                              children: [
                                CheckboxListTile(

                                  title:  Text("Milk".tr),
                                  value: Milk,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      Milk = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(

                                  title:  Text("EggYolk".tr),
                                  value: EggYolk,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      EggYolk = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  title:  Text("EggWhite".tr),
                                  value: EggWhite,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      EggWhite = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  title:  Text("Fish".tr),
                                  value: Fish,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      Fish = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  title:  Text("Egg".tr),
                                  value: Eggs,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      Eggs = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  title:  Text("Peanut".tr),
                                  value: Peanuts,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      Peanuts = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  title:  Text("Nut".tr),
                                  value: Nut,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      Nut = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                                CheckboxListTile(
                                  title:  Text("Corn".tr),
                                  value: Corn,
                                  activeColor: Colors.teal,
                                  onChanged: (value) {
                                    setState(() {
                                      Corn = value!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity.leading,
                                ),
                              ],

                        ),
                      ),
                      Container(
                        height: 300,
                        width: 180,
                        child: ListView(
                            children: [
                              CheckboxListTile(
                                title:  Text("Strawberry".tr),
                                value: Strawberry,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    Strawberry = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),
                              CheckboxListTile(
                                title:  Text("MilkCasein".tr),
                                value: MilkCasein,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    MilkCasein = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),
                              CheckboxListTile(
                                title:  Text("MilkWhey".tr),
                                value: MilkWhey,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    MilkWhey = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),
                              CheckboxListTile(
                                title:  Text("Soy".tr),
                                value: Soy,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    Soy = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),
                              CheckboxListTile(
                                title:  Text("Wheat".tr),
                                value: Wheat,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    Wheat = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),
                              CheckboxListTile(
                                title:  Text("Gluten".tr),
                                value: Gluten,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    Gluten = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),

                              CheckboxListTile(
                                title:  Text("Almond".tr),
                                value: Almonds,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    Almonds = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),
                              CheckboxListTile(
                                title:  Text("Crustacean".tr),
                                value: Crustaceans,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    Crustaceans = value!;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,
                              ),

                            ],
                          ),
                      ),
                       ]
                  ),

            Container(
              height: 44,
              width: double.infinity,
                margin: EdgeInsets.only(top: 26),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Color(0xFF16CD54)),
                  onPressed: () {
                    if(Milk || Fish || Eggs || Peanuts || Nut || Corn || Strawberry || Soy
                        || Wheat || Gluten || Almonds || Crustaceans || EggYolk || EggWhite || MilkWhey || MilkCasein)
                      {
                        inputData();

                        if(widget.EmailController.text == "Aliaa2000@yahoo.com" && widget.PasswordController.text == "12345678" ||
                            widget.EmailController.text == "Maram350@yahoo.com" && widget.PasswordController.text == "12345678")
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return loginScreen();
                          }));

                          // nextScreenReplace(context,  HomePage(profileVisible: false, CreateGroupButton: true,));
                        }
                        else if(widget.EmailController.text == "jano33@yahoo.com" && widget.PasswordController.text == "12345678")
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return AdminHomePage();
                          }));

                        }

                        else if(widget.EmailController.text == "haidy50@yahoo.com" && widget.PasswordController.text == "12345678")
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return HomePage(profileVisible: false, CreateGroupButton: true);
                          }));

                        }
                        else
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen(Current: 0,
                              drawer: true,)));
                          }

                        }

                    else
                      {
                        print ("Please, Select your Allergy/ies");
                      }
                      },

                 child: Text("Save".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,),),),
                ),

          ],
        ) ,
    ));
  }


  final FirebaseAuth auth = FirebaseAuth.instance;
  late DatabaseReference reference;
  FirebaseDatabase db = FirebaseDatabase.instance;

  Future<void> inputData() async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);

    reference = db.ref(auth.currentUser?.uid);
    await reference.set({
      "Allergies": {
        "Milk Allergy": Milk,
        "MilkWhey Allergy":MilkWhey,
        "MilkCasein Allergy":MilkCasein,
        "Fish Allergy": Fish,
        "Eggs Allergy": Eggs,
        "EggWhite Allergy": EggWhite,
        "EggYolk Allergy": EggYolk,
        "Peanuts Allergy": Peanuts,

        "Strawberry Allergy": Strawberry,
        "Soy Allergy": Soy,
        "Wheat Allergy": Wheat,
        "Gluten Allergy": Gluten,

        "Nut Allergy": Nut,
        "Corn Allergy": Corn,
        "Almonds Allergy": Almonds,
        "Crustaceans Allergy": Crustaceans,

      },

    });

    var authenVariable= auth.currentUser?.uid;
    final fb = FirebaseDatabase.instance.reference().child("$authenVariable");
    Map<String, String> DataOfUser =
    {
      'Name' : widget.UsernameController.text,
      'Email' : widget.EmailController.text,
      'Password' : widget.PasswordController.text,
    };
    fb.child("UserData").set(DataOfUser);

  }
}
