import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../Product_details.dart';
import '../../data/CategoriesScreen/CategoriesScreenViewModel.dart';
import 'globals.dart' as globals;
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class ModelCategory {
  late final String Name;
  final Image image;
  final String description;
  final String containedOf;
  final String ingredients;

  ModelCategory({
    required this.Name,
    required this.image,
    required this.description,
    required this.containedOf,
    required this.ingredients,
  });

}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final fb = FirebaseDatabase.instance.reference().child("Products");

  List<List<String>> NamesOfLists=[];
  List<List<ModelCategory>> list = [];
  List<List<String>> NamesOfLists2 =[];
  List<List<String>> ImageOfLists2 =[];
  List<List<String>> ImageOfLists =[];
  List<List<ModelCategory>> Lists = [];

  List<List<String>> DescriptionOfLists =[];
  List<List<String>> AllergyContainedOfLists =[];
  List<List<String>> IngredientsOfLists =[];

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


  static final List<ModelCategory> BakeryList = [],
      MilkList = [],
      ProteinList = [],
      SnacksList = [];

  Future<dynamic> getCurrentUserInfo() async {
    BakeryList.clear();

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
      setState(() {
        MilkList.add(new ModelCategory(
            Name: MilkNames[i],
            image: Image.network(
              MilkImages[i],
              width: 100,
              height: 100,
            ),
            description: MilkDescription[i],
            containedOf: MilkAllergyContained[i], ingredients: MilkIngredients[i]

        ));
      });
    }

    for (int i = 0; i < BakeryNames.length; i++) {
      setState(() {
        BakeryList.add(new ModelCategory(
            Name: BakeryNames[i],
            image: Image.network(
              BakeryImages[i],
              width: 100,
              height: 100,
            ),
            description: BakeryDescription[i],
            containedOf: BakeryAllergyContained[i], ingredients: BakeryIngredients[i]
        ),);
      });
    }


    for (int i = 0; i < ProteinsNames.length; i++) {
      setState(() {
        ProteinList.add(new ModelCategory(
            Name: ProteinsNames[i],
            image: Image.network(
              ProteinsImages[i],
              width: 100,
              height: 100,
            ),
            description: ProteinDescription[i],
            containedOf: ProteinAllergyContained[i], ingredients: ProteinIngredients[i]
        ));
      });
    }

    for (int i = 0; i < SnacksNames.length; i++) {
      setState(() {
        SnacksList.add(new ModelCategory(
            Name: SnacksNames[i],
            image: Image.network(
              SnacksImages[i],
              width: 100,
              height: 100,
            ),
            description: SnacksDescription[i],
            containedOf: SnacksAllergyContained[i], ingredients: SnacksIngredients[i]
        ));
      });
    }

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

  /// List of Tab Bar Item
  List<String> items = [
    "Milk",
    "Bakery",
    "Protein",
    "Snacks",
  ];
  List<String> titles = [
    "Milk",
    "Bakery",
    "Protein",
    "Snacks",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
   Lists = [MilkList, BakeryList, ProteinList, SnacksList];
    list=Lists;

    NamesOfLists = [MilkNames, BakeryNames, ProteinsNames, SnacksNames
    ];

    ImageOfLists = [MilkImages, BakeryImages, ProteinsImages, SnacksImages
    ];

    DescriptionOfLists =[MilkDescription, BakeryDescription, ProteinDescription, SnacksDescription];
   AllergyContainedOfLists =[MilkAllergyContained, BakeryAllergyContained, ProteinAllergyContained, SnacksAllergyContained];
   IngredientsOfLists =[MilkIngredients, BakeryIngredients, ProteinIngredients, SnacksIngredients];

    ImageOfLists2=ImageOfLists;

    NamesOfLists2=NamesOfLists;

    var ListSelected = Lists[0];
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.all(15),
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.green),
                hintText: 'Search product',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(color: Colors.green)),
              ),
              onChanged: (text) {
                search(text, current);
              },
            ),
          ),
          /// CUSTOM TABBAR
          Container(
            margin: EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 370,
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;

                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              margin: const EdgeInsets.all(5),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? Color(0xFF16CD54)
                                    : Colors.white70,
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: current == index
                                    ? Border.all(
                                    color: Color(0xFF16CD54), width: 2)
                                    : Border.all(
                                    color: Colors.white30, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: current == index
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: current == index,
                              child: Container(
                                width: 5,
                                height: 5,
                              ))
                        ],
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 371.42,
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    buildStartScreensItem(Lists[current][index]),
                itemCount: list[current].length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 2),

              ),

            ),
          ),
        ],
      ),
    );
  }
  Widget buildStartScreensItem(ModelCategory model) => Padding(
    padding: const EdgeInsets.fromLTRB(8,8,4,8),
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
                height: 160.0,
                width: 200.0,
                child: Card(
                    elevation: 13,
                    margin:EdgeInsets.fromLTRB(10, 0, 10, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                          child: Center(child: model.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            model.Name,
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
          ),
        ],
      ),
    ),
  );
  Future<void> search(String text, int current) async {
    list[current].clear();
    for (int i = 0; i < NamesOfLists[current].length; i++) {
      setState(() {
        if (NamesOfLists[current][i].contains(text)) {
          list[current].add(new ModelCategory
            (Name: NamesOfLists[current][i],
              image: Image.network(
                          ImageOfLists[current][i],
                            width: 80,
                            height: 80,
                          ),
              description: DescriptionOfLists[current][i],
              containedOf: AllergyContainedOfLists[current][i],
              ingredients: IngredientsOfLists[current][i],));
        }
      });
    }
  }

  @override
  void initState() {
    globals.fromUser =2;
    super.initState();
    getCurrentUserInfo();
  }

}




