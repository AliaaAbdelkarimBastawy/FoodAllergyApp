import 'package:flutter/material.dart';

import '../../data/profileScreen/profileScreenModel.dart';
import '../HomeScreen/HomeScreen.dart';
import '../mainScreen/MainScreen.dart';
import '../signUpScreen/signUpScreen.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  List<ProfileViewModel> ProfileScreensList = [
    ProfileViewModel(title: "My Favorites", icon: Icons.favorite),
    ProfileViewModel(title: "Allergy Card", icon: Icons.credit_card),
    ProfileViewModel(title: "Edit Account", icon: Icons.account_circle_outlined),
    ProfileViewModel(title: "Language", icon: Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF16CD54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen(Current: 0,)));
        },
        ),
        title:  Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Text("Profile"),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('Assets/Images/profile1.png'),),
                ),
                SizedBox(height: 5,),
                Text("User", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
              ],

            ),
            Expanded(
              child: GestureDetector(
                onTap: ()
                {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));

                },
                child: Container(
                  child: ListView.separated(itemBuilder: (context, index) => buildStartScreensItem(ProfileScreensList[index]),
                      separatorBuilder: (context, index) {
                        return Divider();},
                      itemCount: ProfileScreensList.length),
                ),
              ),
            )
          ],
        ),
      ),

      );
  }
   Widget buildStartScreensItem(ProfileViewModel model)=> Padding(
     padding: const EdgeInsets.all(8.0),
     child: Material(
       elevation: 1,
       child: Container(
         height: 60,
         child:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               SizedBox(width: 10,),
               Icon(model.icon),
               SizedBox(width: 10,),
               Text('${model.title}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
               Spacer(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Transform.rotate(angle: 380,
                     child: Icon(Icons.arrow_back_ios_new)),
               ),
             ],
           ),
         ),
         decoration: BoxDecoration(
           boxShadow: [
             //BoxShadow
             BoxShadow(
               color: Colors.white,
               offset: const Offset(0.0, 0.0),
               blurRadius: 0.0,
               spreadRadius: 0.0,
             ), //BoxShadow
           ],
         ),

       ),
     ),
   );
}
