import 'package:burger_ui/pages/home/components/food_type.dart';
import 'package:burger_ui/pages/home/components/pop_food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // States
  final List<List<String>> foodTypes = [
    ['Pizza', '\u{1F355}'],
    ['Cheese', '\u{1F9C0}'],
    ['Taco', '\u{1F32E}'],
    ['Shrimp', '\u{1F364}'],
    ['Burger', '\u{1F354}'],
  ];

  int foodTypeIndex = 0;

  final List<List> popFoods = [
    ['Extra Beef Burger', 4.8, 5.3, 9.90],
    ['Smoked Beef Burger', 4.5, 4.0, 9.90],
    ['Special Beef Burger', 4.6, 4.8, 12.0],
    ['Old-Fasion Beef Burger', 4.0, 2.5, 9.5],
    ["90's Beef Burger", 3.2, 5.0, 10.0],
  ];

  int popFoodsIndex = 0;

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.amber,
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find and order',
                style: GoogleFonts.raleway(fontSize: 32),
              ),
              Text(
                'burger for you \u{1F354}',
                style: GoogleFonts.raleway(
                    fontSize: 33, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 32,
              ),
              search(),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 32),
                // color: Colors.blue,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodTypes.length,
                  itemBuilder: (context, index) => FoodType(
                    typeName: foodTypes[index][0],
                    emoji: foodTypes[index][1],
                    isSelected: foodTypeIndex == index ? true : false,
                    onTap: () {
                      setState(() {
                        foodTypeIndex = index;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Most popular',
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                // color: Colors.amber,
                margin: const EdgeInsets.only(top: 10),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popFoods.length,
                  itemBuilder: (context, index) => PopFood(
                    name: popFoods[index][0],
                    rating: popFoods[index][1],
                    distance: popFoods[index][2],
                    price: popFoods[index][3],
                    isSelected: popFoodsIndex == index ? true : false,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  // components
  AppBar appBar() {
    return AppBar(
      // backgroundColor: Colors.deepPurple,
      leading: const Icon(Icons.menu_rounded),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.person),
        ),
      ],
    );
  }

  Widget bottomNavigationBar() {
    return  BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      iconSize: 28,
      selectedIconTheme: const IconThemeData(size: 28, color: Colors.black),
      // landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_open_outlined),
          label: '',
        ),
      ],
    );
  }

  Widget search() {
    return  TextField(
      decoration: InputDecoration(
          prefixIcon:
          Icon(Icons.search_rounded, color: Colors.grey.shade400),
          hintText: "Find your burger",
          hintStyle: TextStyle(color: Colors.grey.shade400),
          fillColor: Colors.grey.shade50,
          filled: true,
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.orange),
          //   borderRadius: BorderRadius.circular(14),
          // ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(14),

          )
      ),
    );
  }



}
