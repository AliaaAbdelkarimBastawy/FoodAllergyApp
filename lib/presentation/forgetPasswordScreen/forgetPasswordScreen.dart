import 'package:flutter/material.dart';

import '../createNewPasswordScreen/createNewPasswordScreen.dart';
import '../loginScreen/loginScreen.dart';
import '../signUpScreen/signUpScreen.dart';
class forgetPasswordScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState> ();
   forgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.black,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
        },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child:
          SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      color: Colors.white,
                      width: 330,
                      child: Image(image: AssetImage('Assets/Images/forgetPassword.jpeg',
                      ),),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Forgot Your Password?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
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
                    height: 44,
                    // width: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(onPressed: (){

                      if (FormKey.currentState!.validate())
                      {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> createNewPasswordScreen()));
                      }
                    },
                      child: Text("Reset",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: Color(0xFF16CD54),
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
