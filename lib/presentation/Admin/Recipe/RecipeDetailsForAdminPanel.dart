import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject26_1/presentation/Admin/Recipe/ShowRecipes.dart';
import 'package:graduationproject26_1/presentation/test/Recipes_Admin.dart';
import 'package:graduationproject26_1/presentation/test/test.dart';
import '../../mainScreen/MainScreen2.dart';
import 'package:flutter/material.dart';
const kPrimaryColor= Colors.black;
const KMainTextColor= Color(0xFF000000);
const KsecondaryColor= Color(0xFF16CD54);
const KSecondaryTextColor= Color(0xFF9FA5C0);



class RecipeDetailsForAdminPanel extends StatelessWidget {

  String RecipeName;
  String RecipeImage;
  String RecipeIngredients;
  String RecipeDirections;
  String RecipeAllergiesContained;
  String RecipeDuration;

  RecipeDetailsForAdminPanel({Key? key, required this.RecipeName,
    required this.RecipeAllergiesContained, required this.RecipeImage, required this.RecipeDirections,
    required this.RecipeDuration, required this.RecipeIngredients}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF16CD54),
        leading:  IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                ShowRecipes()));
          },
        ),
        elevation: 0,
      ),
      body: Container(child:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
            expandedHeight: 275.0,
            backgroundColor:Colors.white,
            elevation: 0.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(RecipeImage),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(0.0),child: Container(
              height: 32.0,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xFF16CD54),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)
                  )
              ),
              child: Container(
                width: 40.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            ),
            leadingWidth: 80.0,
            leading: Container(
              margin: const EdgeInsets.only(left:24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX:3.0,sigmaY:3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
              ),
            ),

          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      RecipeName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 3.0),
                    DefaultTextStyle(
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kPrimaryColor),
                      child: Row(children: [
                        const Text('Duration:',
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                        const SizedBox(width: 6.0),
                        Container(
                          height: 3.0,
                          width: 5.0,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Text(RecipeDuration),
                      ]),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(color: KMainTextColor, height: 1.0),
                    const SizedBox(height: 10.0),
                    Text(
                      'Ingredients',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),

                    ),
                    const SizedBox(height: 8.0),
                    Text(RecipeIngredients.replaceAll("\\n", "\n"),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: KMainTextColor)),

                    const SizedBox(height: 8.0),
                    const Divider(color: KMainTextColor, height: 1.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'Directions',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),

                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      RecipeDirections.replaceAll("\\n", "\n"),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: KMainTextColor),
                    ),
                    const SizedBox(height: 8.0),
                    const Divider(color: KMainTextColor, height: 1.0),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Allergy contained',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),

                            const SizedBox(height: 6.0),
                            Text(
                              RecipeAllergiesContained,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: KMainTextColor),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),),
    );
  }
}

