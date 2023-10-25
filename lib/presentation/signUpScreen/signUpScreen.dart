
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/helper_function.dart';
import '../../pages/home_page.dart';
import '../../service/auth_service.dart';
import '../../widgets/widgets.dart';
import '../SelectAllergyScreen/SelectAlleryScreen.dart';
import '../loginScreen/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  var UsernameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  SignUpScreen({Key? key}) : super(key: key);



  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();

  var UsernameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isLogin = true;
  bool check= false;

  void toggle() => setState(() => isLogin = !isLogin);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xFF16CD54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('Assets/Images/logo.jpeg'),
                    ),
                  ),
                  SizedBox(
                    height: 20,),
                  Text("Create Account".tr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,),),
                  SizedBox(
                    height: 20,),
                  Container(
                    //height: 50,
                    child: TextFormField(
                      controller: UsernameController,
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Username can't be empty".tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        labelText: "Username".tr,
                        hintText: "Enter your name".tr,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color(0xFF16CD54)),),),
                      keyboardType: TextInputType.name,),),
                  SizedBox(
                    height: 20,),
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
                      keyboardType: TextInputType.emailAddress,),),
                  SizedBox(
                    height: 20,),
                  Container(
                    //height: 50,
                    child: TextFormField(
                      controller: PasswordController,
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Password can't be empty".tr;
                        }

                        else if(value != null && value.length < 8)
                          {
                            showSnackbar(context, Colors.red, "Password must be at least 8 characters".tr);
                          }
                      },
                      obscureText: isPassword,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        labelText: "Password".tr,
                        hintText: "Enter your password".tr,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(icon: isPassword ? Icon(
                            Icons.visibility) : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5,
                              color: Color(0xFF16CD54)),),),
                      keyboardType: TextInputType.visiblePassword,),),
                  SizedBox(
                    height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Must be at least 8 characters,contain at least 1 number".tr,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,),),
                      ],),),
                  SizedBox(
                    height: 20,),
                  Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      onPressed: () {
                        SignUp();
                    },
                      child: Text("Sign up".tr,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,),),
                      color: Color(0xFF16CD54),),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?".tr),
                      SizedBox(width: 0,),
                      TextButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
                      },
                        child: Text("Login".tr, style:
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


  SignUp() async {

      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(UsernameController.text, EmailController.text,
          PasswordController.text)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(EmailController.text);
          await HelperFunctions.saveUserNameSF(UsernameController.text);
          nextScreenReplace(context,  SelectAllergyScreen(EmailController:
          EmailController, UsernameController: UsernameController,
            PasswordController: PasswordController,));
        } else {
          if(PasswordController.text.length <8 && (PasswordController.text.contains("1")||PasswordController.text.contains("2")
              ||PasswordController.text.contains("3")
              ||PasswordController.text.contains("4")
              ||PasswordController.text.contains("5")
              ||PasswordController.text.contains("6")
              ||PasswordController.text.contains("7")
              ||PasswordController.text.contains("8")
              ||PasswordController.text.contains("9")
              ||PasswordController.text.contains("0")
          ))
            {
              value = "Password must be at least 8 characters";
            }

          else if(PasswordController.text.length < 8  && !(PasswordController.text.contains("1")||PasswordController.text.contains("2")
              ||PasswordController.text.contains("3")
              ||PasswordController.text.contains("4")
              ||PasswordController.text.contains("5")
              ||PasswordController.text.contains("6")
              ||PasswordController.text.contains("7")
              ||PasswordController.text.contains("8")
              ||PasswordController.text.contains("9")
              ||PasswordController.text.contains("0")
          ))
            {
              value = "Password must be at least 8 characters and contain at least 1 number";

            }

          else if(PasswordController.text.length >8  && !(PasswordController.text.contains("1")||PasswordController.text.contains("2")
              ||PasswordController.text.contains("3")
              ||PasswordController.text.contains("4")
              ||PasswordController.text.contains("5")
              ||PasswordController.text.contains("6")
              ||PasswordController.text.contains("7")
              ||PasswordController.text.contains("8")
              ||PasswordController.text.contains("9")
              ||PasswordController.text.contains("0")
          ))
          {
            value = "Password must contain at least 1 number";

          }

          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });

  }


}