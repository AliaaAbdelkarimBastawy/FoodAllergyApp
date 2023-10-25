import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject26_1/presentation/Admin/AdminHomePage/AdminHomePage.dart';
import '../../helper/helper_function.dart';
import '../../pages/home_page.dart';
import '../../service/auth_service.dart';
import '../../service/database_service.dart';
import '../../widgets/widgets.dart';
import '../HomeScreen/HomeScreen.dart';
import '../forgetPasswordScreen/forgetPasswordScreen.dart';
import '../mainScreen/MainScreen.dart';
import '../signUpScreen/signUpScreen.dart';

class loginScreen extends StatefulWidget
{
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();

  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  var FormKey = GlobalKey<FormState> ();

  bool isPassword = true;

  @override
  void dispose(){
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xFF16CD54),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: FormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                        AssetImage('Assets/Images/logo.jpeg'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                   Text("Login Account".tr,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,),),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //height: 50,
                      child: TextFormField(
                        controller: EmailController,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Email can't be empty".tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelText: "Email".tr,
                          hintText: "Enter your email".tr,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xFF16CD54)
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                     // height: 50,
                      child: TextFormField(
                        controller: PasswordController,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Password can't be empty".tr;
                          }
                          return null;
                        },
                        obscureText: isPassword,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelText: "Password".tr,
                          hintText: "Enter your password".tr,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(icon: isPassword? Icon(Icons.visibility): Icon(Icons.visibility_off),
                            onPressed: () {
                            setState(() {
                             isPassword = !isPassword;
                            });
                          },),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xFF16CD54)
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0.1),
                            child: TextButton(onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> forgetPasswordScreen()));
                            }, child:
                            Text("Forget Password?".tr,
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                              style: TextButton.styleFrom(
                                primary: Colors.black,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 44,
                      // width: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          if (FormKey.currentState!.validate()) {
                            SignIn();
                          }
                        },
                        child: Text("Login".tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        color: Color(0xFF16CD54),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not registered yet?".tr),
                        SizedBox(width: 0.2,),
                        TextButton(onPressed:
                            (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                        }, child: Text("Sign up".tr, style:
                        TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }


  SignIn() async {

    final FirebaseAuth auth = FirebaseAuth.instance;
    late DatabaseReference reference;
    FirebaseDatabase db = FirebaseDatabase.instance;

    final User? user = auth.currentUser;
    final uid = user?.uid;
    print(uid);
    reference = db.ref();

    var UsernameSnapshot  = await reference.child('$uid/UserData/Name').get();
    print(UsernameSnapshot.value.toString());

    if (FormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(EmailController.text, PasswordController.text)
          .then((value) async {
        if (value == true) {
          if(EmailController.text == "Aliaa2005@yahoo.com" && PasswordController.text == "12345678" || EmailController.text == "Maram350@yahoo.com" && PasswordController.text == "12345678")
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return AdminHomePage();
              }));

              // nextScreenReplace(context,  HomePage(profileVisible: false, CreateGroupButton: true,));
            }

          else if(EmailController.text == "Ali3535@yahoo.com" && PasswordController.text == "12345678")
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return HomePage(profileVisible: false, CreateGroupButton: true);
            }));

          }

          else if(EmailController.text == "Haidy700@yahoo.com" && PasswordController.text == "12345678" || EmailController.text == "Tasneem350@yahoo.com" && PasswordController.text == "12345678")
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return HomePage(profileVisible: false, CreateGroupButton: true);
              }));

            }

          else
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return MainScreen(Current: 0, drawer: true);
              }));

            }
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

}