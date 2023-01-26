import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    Text("Login Account",
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
                            return "Email can't be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(

                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelText: "Email",
                          hintText: "Enter your email",
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
                            return "Password can't be empty";
                          }
                          return null;
                        },
                        obscureText: isPassword,
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelText: "Password",
                          hintText: "Enter your password",
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
                            Text("Forget Password?",
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
                        child: Text("Login",
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
                        Text("Not registered yet?"),
                        SizedBox(width: 0.2,),
                        TextButton(onPressed:
                            (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                        }, child: Text("Sign up", style:
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
  Future SignIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PasswordController.text.trim(),

    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen(Current: 0)));


  }
  
}