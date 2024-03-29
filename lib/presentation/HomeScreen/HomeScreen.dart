
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../Product_details.dart';
import '../CategoriesScreen/CategoriesScreen.dart';
import '../loginScreen/loginScreen.dart';
import 'MenuScreen_FromHomePage.dart';
import 'RecipeDetails_FromHomePage.dart';
import 'RecipeModel.dart';
import 'RestaurantModel.dart';
import '../CategoriesScreen/globals.dart' as globals;
import '../Admin/Restaurant/FromUserOrAdminFile.dart' as globalsFromUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class ModelHome {
  late final String Name;
  final Image image;

  ModelHome({
    required this.Name,
    required this.image,
  });
}




class _HomeScreenState extends State<HomeScreen> {

  List<List<ModelCategory>> list = [];
  List<List<String>> NamesOfLists2 =[];
  List<List<String>> ImageOfLists2 =[];

  static List<String> BakeryNames = [];
  static List<String> BakeryImages = [];
  static List<String> BakeryDescription = [];
  static List<String> BakeryAllergyContained = [];
  static List<String> BakeryIngredients = [];


  static List<String> MilkNames = [];
  static List<String> MilkImages = [];
  static List<String> MilkDescription = [];
  static List<String> MilkAllergyContained = [];
  static List<String> MilkIngredients = [];


  static List<String> ProteinsNames = [];
  static List<String> ProteinsImages = [];
  static List<String> ProteinDescription = [];
  static List<String> ProteinAllergyContained = [];
  static List<String> ProteinIngredients = [];


  static List<String> SnacksNames = [];
  static List<String> SnacksImages = [];
  static List<String> SnacksDescription = [];
  static List<String> SnacksAllergyContained = [];
  static List<String> SnacksIngredients = [];

  //////////////////////////
  List<MenuModel> listmenu = [];
  List<String> Names = [];
  List<String> Images = [];
  List<Model> items = [];
  List<List<MenuModel>> MenuList2 = [];
  List<List<MenuModel>> MenuList3 = new List.generate(6, (i) => []);




  static final List<ModelCategory> BakeryList = [],
      MilkList = [],
      ProteinList = [],
      SnacksList = [],

      MergeList=[ModelCategory(Name: "Nutella",
      image:Image.network(
  "https://firebasestorage.googleapis.com/v0/b/allowed-gp.appspot.com/o/Images%2FNutella%20Ferrero%20Hazelnut%20Spread%20With%20Cocoa.jpg?alt=media&token=d126e8ba-ee43-4f87-aa5c-d7e825c9c690",
  width: 80,
  height: 80,
  ),
      description: "Make your breakfast interesting with Nutella hazelnut spread with cocoa.  Packed with the richness of selected hazelnuts and delicious cocoa, it is the most trusted breakfast spread brand across the world.  Nutella can be easily spread over bread, roti, dosa or idli and variety of other breakfast dishes.  It is 100% vegetarian and contains no preservatives.",
      containedOf: "Hazelnut, Milk", ingredients: 'Milk')];



  final fb = FirebaseDatabase.instance.reference().child("Category");
  final fb1 = FirebaseDatabase.instance.reference().child("Menus");
  final fb2 = FirebaseDatabase.instance.reference().child("Recipes");

  static List<String> CatNames = [];
  static List<String> CatImages = [];

  static List<String> MenuNames = [];
  static List<String> MenuImages = [];

  static List<String> RecipesNames = [];
  static List<String> RecipesImages = [];
  static  List<ModelCategory> CategoryList=[], MenusList= [], RecipesList= [] ;



  List<recipeModel> listrecipes = [];
  static List<String> Namesrecipes = [];
  static List<String> Imagesrecipes = [];
  static List<String> durations = [];
  static List<String> directionss = [];
  static List<String> containedAllergies = [];
  static List<String> ingredientss = [];

  final List<recipeModel> itemsrecipes = [];




  Future<dynamic> getCurrentUserInfo() async {
    MilkList.clear();
    SnacksList.clear();
    ProteinList.clear();
    BakeryList.clear();
    MergeList.clear();

    final ref = FirebaseDatabase.instance.ref();
    var snapshot;
    var snapshot2;
    var snapshot3;
    var snapshot4;
    var snapshot5;
    var snapshot6;
    var snapshot7;
    var snapshot8;
    var snapshot9;
    var snapshot10;
    var snapshot11;
    var snapshot12;
    var snapshot13;
    var snapshot14;
    var snapshot15;
    var snapshot16;
    var snapshot17;
    var snapshot18;
    var snapshot19;
    var snapshot20;

    BakeryNames.clear();
    BakeryImages.clear();
    BakeryDescription.clear();
    BakeryAllergyContained.clear();
    BakeryIngredients.clear();

    MilkImages.clear();
    MilkNames.clear();
    MilkDescription.clear();
    MilkAllergyContained.clear();
    MilkIngredients.clear();


    ProteinsNames.clear();
    ProteinsImages.clear();
    ProteinDescription.clear();
    ProteinAllergyContained.clear();
    ProteinIngredients.clear();


    SnacksNames.clear();
    SnacksImages.clear();
    SnacksDescription.clear();
    SnacksAllergyContained.clear();
    SnacksIngredients.clear();


    for (int i = 1; i < 20; i++) {
      snapshot = await ref.child('Category/Category1/Item$i/Name').get();
      snapshot2 = await ref.child('Category/Category1/Item$i/image').get();

      snapshot3 = await ref.child('Category/Category2/Item$i/Name').get();
      snapshot4 = await ref.child('Category/Category2/Item$i/image').get();

      snapshot5 = await ref.child('Category/Category3/Item$i/Name').get();
      snapshot6 = await ref.child('Category/Category3/Item$i/image').get();

      snapshot7 = await ref.child('Category/Category4/Item$i/Name').get();
      snapshot8 = await ref.child('Category/Category4/Item$i/image').get();


      snapshot9 = await ref.child('Category/Category1/Item$i/contains').get();
      snapshot10 = await ref.child('Category/Category1/Item$i/description').get();
      snapshot17 = await ref.child('Category/Category1/Item$i/ingredients').get();


      snapshot11 = await ref.child('Category/Category2/Item$i/contains').get();
      snapshot12 = await ref.child('Category/Category2/Item$i/description').get();
      snapshot18 = await ref.child('Category/Category2/Item$i/ingredients').get();


      snapshot13= await ref.child('Category/Category4/Item$i/contains').get();
      snapshot14 = await ref.child('Category/Category4/Item$i/description').get();
      snapshot19 = await ref.child('Category/Category4/Item$i/ingredients').get();


      snapshot15 = await ref.child('Category/Category3/Item$i/contains').get();
      snapshot16 = await ref.child('Category/Category3/Item$i/description').get();
      snapshot20 = await ref.child('Category/Category3/Item$i/ingredients').get();


      if(snapshot.value.toString() != "null")
      {
        BakeryNames.add(snapshot.value.toString());
        BakeryImages.add(snapshot2.value.toString());
        BakeryAllergyContained.add(snapshot9.value.toString());
        BakeryDescription.add(snapshot10.value.toString());
        BakeryIngredients.add(snapshot17.value.toString());
      }



      if(snapshot3.value.toString() != "null")
      {
        MilkNames.add(snapshot3.value.toString());
        MilkImages.add(snapshot4.value.toString());
        MilkAllergyContained.add(snapshot11.value.toString());
        MilkDescription.add(snapshot12.value.toString());
        MilkIngredients.add(snapshot18.value.toString());
      }



      if(snapshot5.value.toString() != "null")
      {
        ProteinsNames.add(snapshot5.value.toString());
        ProteinsImages.add(snapshot6.value.toString());
        ProteinAllergyContained.add(snapshot15.value.toString());
        ProteinDescription.add(snapshot16.value.toString());
        ProteinIngredients.add(snapshot20.value.toString());
      }



      if(snapshot7.value.toString() != "null")
      {
        SnacksNames.add(snapshot7.value.toString());
        SnacksImages.add(snapshot8.value.toString());
        SnacksAllergyContained.add(snapshot13.value.toString());
        SnacksDescription.add(snapshot14.value.toString());
        SnacksIngredients.add(snapshot19.value.toString());

      }



    }


    for (int i = 0; i < MilkNames.length; i++) {

        MilkList.add(new ModelCategory(
            Name: MilkNames[i],
            image: Image.network(
              MilkImages[i],
              width: 80,
              height: 80,
            ),
            description: MilkDescription[i],
            containedOf: MilkAllergyContained[i], ingredients: MilkIngredients[i]

        ));
        MergeList.add(new ModelCategory(
            Name: MilkNames[i],
            image: Image.network(
              MilkImages[i],
              width: 80,
              height: 80,
            ),
            description: MilkDescription[i],
            containedOf: MilkAllergyContained[i], ingredients: MilkIngredients[i]

        ));
    }

    for (int i = 0; i < BakeryNames.length; i++) {
        BakeryList.add(new ModelCategory(
            Name: BakeryNames[i],
            image: Image.network(
              BakeryImages[i],
              width: 80,
              height: 80,
            ),
            description: BakeryDescription[i],
            containedOf: BakeryAllergyContained[i], ingredients: BakeryIngredients[i]
        ),);
        MergeList.add(new ModelCategory(
            Name: BakeryNames[i],
            image: Image.network(
              BakeryImages[i],
              width: 80,
              height: 80,
            ),
            description: BakeryDescription[i],
            containedOf: BakeryAllergyContained[i], ingredients: BakeryIngredients[i]
        ),);


    }


    for (int i = 0; i < ProteinsNames.length; i++) {
        ProteinList.add(new ModelCategory(
            Name: ProteinsNames[i],
            image: Image.network(
              ProteinsImages[i],
              width: 80,
              height: 80,
            ),
            description: ProteinDescription[i],
            containedOf: ProteinAllergyContained[i], ingredients: ProteinIngredients[i]
        ));
        MergeList.add(new ModelCategory(
            Name: ProteinsNames[i],
            image: Image.network(
              ProteinsImages[i],
              width: 80,
              height: 80,
            ),
            description: ProteinDescription[i],
            containedOf: ProteinAllergyContained[i], ingredients: ProteinIngredients[i]
        ));

    }

    for (int i = 0; i < SnacksNames.length; i++) {
        SnacksList.add(new ModelCategory(
            Name: SnacksNames[i],
            image: Image.network(
              SnacksImages[i],
              width: 80,
              height: 80,
            ),
            description: SnacksDescription[i],
            containedOf: SnacksAllergyContained[i], ingredients: SnacksIngredients[i]
        ));
        MergeList.add(new ModelCategory(
            Name: SnacksNames[i],
            image: Image.network(
              SnacksImages[i],
              width: 80,
              height: 80,
            ),
            description: SnacksDescription[i],
            containedOf: SnacksAllergyContained[i], ingredients: SnacksIngredients[i]
        ));


      print(MilkNames);
      print(MilkImages);

      print(BakeryNames);
      print(BakeryImages);

      print(ProteinsNames);
      print(ProteinsImages);

      print(SnacksNames);
      print(SnacksImages);

      print(SnacksDescription);
      print(SnacksAllergyContained);

    }

    //////////////////////////////////////
    items.clear();
    final ref2 = FirebaseDatabase.instance.ref();
    Names.clear();
    Images.clear();
    MenuList2.clear();
    for (int i = 1; i < 6; i++) {

      snapshot = await ref2.child('Restaurants/Restaurant$i/Name').get();
      snapshot2 = await ref2.child('Restaurants/Restaurant$i/image').get();

      if(snapshot.value.toString() != "null")
      {
        list.clear();
        for (int j = 1; j < 4; j++) {
          snapshot3 = await ref2.child('Restaurants/Restaurant$i/Menu/dish$j/ListOfcontainedAllergies').get();
          snapshot4 = await ref2.child('Restaurants/Restaurant$i/Menu/dish$j/Name').get();
          snapshot5 = await ref2.child('Restaurants/Restaurant$i/Menu/dish$j/Image').get();
          if(snapshot4.value.toString() != "null")
          {

            MenuList3[Names.length].add(new MenuModel(
                dishName: snapshot4.value.toString(),
                dishImage: Image.network(snapshot5.value.toString()),
                dishDetails: snapshot3.value.toString()));
          }

          // print(list.length);
        }

        Names.add(snapshot.value.toString());
        Images.add(snapshot2.value.toString());
      }

    }

    for (int i = 0; i < Names.length; i++) {
      items.add(Model(
          title: Names[i],
          image: Image.network(
            Images[i],
            width: 80,
            height: 80,
          ),
          MenuList:MenuList3[i],
        ));
        print("items" + items[0].title);

    }
///////////////////////////////////////////
    itemsrecipes.clear();
    final refrecipe = FirebaseDatabase.instance.ref();

    Namesrecipes.clear();
    Imagesrecipes.clear();
    containedAllergies.clear();
    ingredientss.clear();
    durations.clear();
    directionss.clear();
    for (int i = 1; i < 9; i++) {
      snapshot  = await refrecipe.child('Recipes/Recipe$i/Name').get();
      snapshot2 = await refrecipe.child('Recipes/Recipe$i/image').get();
      snapshot3 = await refrecipe.child('Recipes/Recipe$i/ContainedAllergyType').get();
      snapshot4 = await refrecipe.child('Recipes/Recipe$i/Ingredients').get();
      snapshot5 = await refrecipe.child('Recipes/Recipe$i/Duration').get();
      snapshot6 = await refrecipe.child('Recipes/Recipe$i/Directions').get();

      print("HENABara!");
      if(snapshot.value.toString() != "null")
        {
          print("HENA!");
          Namesrecipes.add(snapshot.value.toString());
          Imagesrecipes.add(snapshot2.value.toString());
          containedAllergies.add(snapshot3.value.toString());
          ingredientss.add(snapshot4.value.toString());
          durations.add(snapshot5.value.toString());
          directionss.add(snapshot6.value.toString());
        }

    }
    for (int i = 0; i < Namesrecipes.length; i++) {
      setState(() {
        itemsrecipes.add(new recipeModel(
          Name: Namesrecipes[i],
          image: Image.network(
            Imagesrecipes[i],
            width: 80,
            height: 80,
          ), containedAllery: containedAllergies[i], direction: directionss[i]
          ,duration: durations[i] ,ingredients: ingredientss[i],));
      });
    }


  }


  Widget buildLogin(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return HomeScreen();
        } else {
          return loginScreen();
        }
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 540,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Categories", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(itemBuilder: (context, index)=> buildStartScreensItem1(MergeList[index]),
                    itemCount: MergeList.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          color: Colors.black,
                        ) ),),
              SizedBox(height: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Menus", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),)),
                ],
              ),
              SizedBox(height: 4,),
              buildList(),

              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Recipes", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),)),
                ],
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index)=>buildStartScreensItem3(itemsrecipes[index]),
                  itemCount: itemsrecipes.length,
                  scrollDirection: Axis.horizontal,),),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildStartScreensItem1(ModelCategory model) => Padding(
    padding: const EdgeInsets.fromLTRB(0,8,0,0),
    child: Material(
      // elevation: 10,
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Product_details(detailsModel: model,)));
            },
            child: Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: 120.0,
                width: 200.0,
                child: Card(
                    elevation: 5,
                    margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Center(child: model.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            model.Name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Outfit"),
                          ),
                        ),
                      ],
                    ))
            ),
          ),
        ],
      ),
    ),
  );
  Widget buildList() => Expanded(
    child: Container(
      child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(items[index]);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MenuScreen_FromHomePage(
                      detailsModel:items[index],
                    )));
              },
              child: Column(
                children: [
                Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        height: 120.0,
                        width: 200.0,
                        child: Card(
                            elevation: 5,
                            margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Center(child: items[index].image),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    items[index].title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Outfit"),
                                  ),
                                ),
                              ],
                            ))
                    ),
                ],
              ),
            );
            ;
          }),
    ),
  );
  Widget buildStartScreensItem3(recipeModel model) => Padding(
    padding: const EdgeInsets.fromLTRB(0,8,0,0),
    child: Material(
      // elevation: 10,
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                  RecipeDetail_FromHomePage(detailsModel: model,)));
            },
            child: Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: 120.0,
                width: 200.0,
                child: Card(
                    elevation: 5,
                    margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Center(child: model.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            model.Name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Outfit"),
                          ),
                        ),
                      ],
                    ))
            ),
          ),
        ],
      ),
    ),
  );

  @override
  void initState() {
    globalsFromUser.FromUser=1;
    globals.fromUser = 1;
    super.initState();
    getCurrentUserInfo();

  }
}