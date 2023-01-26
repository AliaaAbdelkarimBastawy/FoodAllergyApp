import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../Product_details.dart';
import '../../data/CategoriesScreen/CategoriesScreenViewModel.dart';

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

  ModelCategory({
    required this.Name,
    required this.image,
    required this.description,
    required this.containedOf
  });


}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final fb = FirebaseDatabase.instance.reference().child("Products");

  List<List<ModelCategory>> list = [];
  List<List<String>> NamesOfLists2 =[];
  List<List<String>> ImageOfLists2 =[];

  static List<String> BakeryNames = [];
  static List<String> BakeryImages = [];
  static List<String> BakeryDescription = [];
  static List<String> BakeryAllergyContained = [];

  static List<String> MilkNames = [];
  static List<String> MilkImages = [];
  static List<String> MilkDescription = [];
  static List<String> MilkAllergyContained = [];

  static List<String> ProteinsNames = [];
  static List<String> ProteinsImages = [];
  static List<String> ProteinDescription = [];
  static List<String> ProteinAllergyContained = [];

  static List<String> SnacksNames = [];
  static List<String> SnacksImages = [];
  static List<String> SnacksDescription = [];
  static List<String> SnacksAllergyContained = [];

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

    BakeryNames.clear();
    BakeryImages.clear();
    BakeryDescription.clear();
    BakeryAllergyContained.clear();

    MilkImages.clear();
    MilkNames.clear();
    MilkDescription.clear();
    MilkAllergyContained.clear();

    ProteinsNames.clear();
    ProteinsImages.clear();
    ProteinDescription.clear();
    ProteinAllergyContained.clear();

    SnacksNames.clear();
    SnacksImages.clear();
    SnacksDescription.clear();
    SnacksAllergyContained.clear();

    for (int i = 1; i < 10; i++) {
      snapshot = await ref.child('Products/Bakery/Item$i/Name').get();
      snapshot2 = await ref.child('Products/Bakery/Item$i/image').get();

      snapshot3 = await ref.child('Products/Milk/Item$i/Name').get();
      snapshot4 = await ref.child('Products/Milk/Item$i/image').get();

      BakeryNames.add(snapshot.value.toString());
      BakeryImages.add(snapshot2.value.toString());

      MilkNames.add(snapshot3.value.toString());
      MilkImages.add(snapshot4.value.toString());

      snapshot5 = await ref.child('Products/Protein/Item$i/Name').get();
      snapshot6 = await ref.child('Products/Protein/Item$i/image').get();

      snapshot7 = await ref.child('Products/Snacks/Item$i/Name').get();
      snapshot8 = await ref.child('Products/Snacks/Item$i/image').get();


      snapshot9 = await ref.child('Products/Bakery/Item$i/contains').get();
      snapshot10 = await ref.child('Products/Bakery/Item$i/description').get();


      snapshot11 = await ref.child('Products/Milk/Item$i/contains').get();
      snapshot12 = await ref.child('Products/Milk/Item$i/description').get();


      snapshot13= await ref.child('Products/Snacks/Item$i/contains').get();
      snapshot14 = await ref.child('Products/Snacks/Item$i/description').get();


      snapshot15 = await ref.child('Products/Protein/Item$i/contains').get();
      snapshot16 = await ref.child('Products/Protein/Item$i/description').get();


      ProteinsNames.add(snapshot5.value.toString());
      ProteinsImages.add(snapshot6.value.toString());

      SnacksNames.add(snapshot7.value.toString());
      SnacksImages.add(snapshot8.value.toString());

      BakeryAllergyContained.add(snapshot9.value.toString());
      BakeryDescription.add(snapshot10.value.toString());

      MilkAllergyContained.add(snapshot11.value.toString());
      MilkDescription.add(snapshot12.value.toString());

      SnacksAllergyContained.add(snapshot13.value.toString());
      SnacksDescription.add(snapshot14.value.toString());

      ProteinAllergyContained.add(snapshot15.value.toString());
      ProteinDescription.add(snapshot16.value.toString());

    }

    for (int i = 0; i < MilkNames.length; i++) {
      setState(() {
        BakeryList.add(new ModelCategory(
            Name: BakeryNames[i],
            image: Image.network(
              BakeryImages[i],
              width: 100,
              height: 100,
            ),
            description: BakeryDescription[i],
            containedOf: BakeryAllergyContained[i]
        ),

        );
        MilkList.add(new ModelCategory(
            Name: MilkNames[i],
            image: Image.network(
              MilkImages[i],
              width: 100,
              height: 100,
            ),
            description: MilkDescription[i],
            containedOf: MilkAllergyContained[i]

        ));

        ProteinList.add(new ModelCategory(
            Name: ProteinsNames[i],
            image: Image.network(
              ProteinsImages[i],
              width: 100,
              height: 100,
            ),
            description: ProteinDescription[i],
            containedOf: ProteinAllergyContained[i]
        ));
        SnacksList.add(new ModelCategory(
            Name: SnacksNames[i],
            image: Image.network(
              SnacksImages[i],
              width: 100,
              height: 100,
            ),
            description: SnacksDescription[i],
            containedOf: SnacksAllergyContained[i]
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
    List<List<ModelCategory>> Lists = [
      MilkList,
      BakeryList,
      ProteinList,
      SnacksList
    ];
    list=Lists;
    List<List<String>> NamesOfLists = [
      MilkNames,
      BakeryNames,
      ProteinsNames,
      SnacksNames
    ];

    List<List<String>> ImageOfLists = [
      MilkImages,
      BakeryImages,
      ProteinsImages,
      SnacksImages
    ];

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

  @override
  void initState() {
    super.initState();
    getCurrentUserInfo();
  }

  Future<void> search(String text, int current) async {

    list[current].clear();

    for (int i = 0; i < NamesOfLists2[current].length; i++) {
      setState(() {
        if (NamesOfLists2[current][i].contains(text)) {
          list[current].add(new ModelCategory(
              Name: NamesOfLists2[current][i],
              image: Image.network(
                ImageOfLists2[current][i],
                width: 100,
                height: 100,
              ),
              description: BakeryDescription[i],
              containedOf: BakeryAllergyContained[i]

          ));
        }
      });
    }

  }

}



