
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../SelectAllergyScreen/SelectAlleryScreen.dart';
import '../loginScreen/loginScreen.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({Key? key}) : super(key: key);



  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  Text("Create Account",
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
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        labelText: "Username",
                        hintText: "Enter your name",
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
                      keyboardType: TextInputType.emailAddress,),),
                  SizedBox(
                    height: 20,),
                  Container(
                    //height: 50,
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
                          "Must be at least 8 characters,contain at least 1 number and 1 special character",
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
                      if (FormKey.currentState!.validate()) {
                        SignUp();
                      }
                    },
                      child: Text("Continue",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,),),
                      color: Color(0xFF16CD54),),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 0,),
                      TextButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
                      },
                        child: Text("Login ", style:
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


  Future SignUp() async {


    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PasswordController.text.trim(),
      );
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => SelectAllergyScreen()));
    } on FirebaseAuthException catch (e) {
      print(e);
      // Fluttertoast.showToast(
      //     msg: "The email address is already in use by another account.",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );

    }

  }
}