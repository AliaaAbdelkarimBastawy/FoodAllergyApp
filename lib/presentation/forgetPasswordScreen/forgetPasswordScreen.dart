import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/auth_service.dart';
import '../createNewPasswordScreen/createNewPasswordScreen.dart';
import '../loginScreen/loginScreen.dart';
import '../signUpScreen/signUpScreen.dart';
class forgetPasswordScreen extends StatefulWidget {

  forgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<forgetPasswordScreen> createState() => _forgetPasswordScreenState();

}

class _forgetPasswordScreenState extends State<forgetPasswordScreen> {
  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  final formKey = GlobalKey<FormState>();
  String email = "";
  bool _isLoading = false;
  AuthService authService = AuthService();

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ), onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => loginScreen()));
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
                    child: Image(
                      image: AssetImage('Assets/Images/forgetPassword.jpeg',
                      ),),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Forgot Your Password?".tr,
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
                        checkEmail(context, EmailController.text);
                      }
                    },
                    child: Text("Reset Password".tr,
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

  Future<void> checkEmail(BuildContext context, String email) async {
    final signInMethods = await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(email);
    if (signInMethods.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email not found. Please try again.'.tr),
        ),
      );
    } else {
        showDialog(context: context,
            barrierDismissible: false,
            builder: (context) =>
                AlertDialog(
                  content: Text('check your email'.tr),));
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail
            (email: EmailController.text.trim());
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => loginScreen()));

          // Utils.ShowSnackBar('Password Reset Email Sent');
        }
        on FirebaseAuthException catch (e) {
          print(e);
          Navigator.of(context).pop();
        }

    }
    // Email exists, continue with login or registration flow   }

  }
}
