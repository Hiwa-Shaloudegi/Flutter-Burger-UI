import 'package:burger_ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/burger.jpg'), fit: BoxFit.cover),
            ),
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // icon (burger queen)
          Positioned(
            left: 0,
            right: 0,
            top: 64,
            child: SizedBox(
              height: 55,
              child: Center(
                child: Text(
                  "BURGER\n QUEEN",
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          // intro text
          Positioned(
            left: 20,
            bottom: 150,
            child: Container(
              width: 260,
              height: 120,
              // color: Colors.deepPurple,
              child: Text(
                'Good Food\nTasty Food*',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xffFFC77900),
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2,
                ),
              ),
            ),
          ),
          // sign in button
          Positioned(
            left: 20,
            right: 20,
            bottom: 65,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
              child: Container(
                width: 200,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // underline button text
          Positioned(
            left: 0,
            right: 0,
            bottom: 25,
            child: Container(
              // color: Colors.deepPurple,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Sign up',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2,
                      // shadows: [
                      //   Shadow(
                      //     color: Colors.black,
                      //     offset: Offset(0, -1),
                      //   ),
                      // ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
