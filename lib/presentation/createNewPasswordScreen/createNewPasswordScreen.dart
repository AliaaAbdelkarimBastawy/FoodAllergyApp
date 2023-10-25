import 'package:flutter/material.dart';

import '../loginScreen/loginScreen.dart';

class createNewPasswordScreen extends StatelessWidget {
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState> ();
  createNewPasswordScreen({Key? key}) : super(key: key);

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
          child: Container(
            color: Colors.white,
            child: Form(
              key: FormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("Create new password",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,),),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.white,
                    //height: 50,
                    child: TextFormField(
                      controller: EmailController,
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        labelText: "New Password",
                        hintText: "Enter your new password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
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
                  SizedBox(
                    height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Must be at least 8 characters,contain at least 1 number and 1 special character",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,),),],),),

                  SizedBox(
                    height: 30,),

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
                            (context)=> loginScreen()));
                      }
                    },
                      child: Text("Update",
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
      ),

    );
  }
}
