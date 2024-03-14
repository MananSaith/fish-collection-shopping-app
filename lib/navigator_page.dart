import 'package:flutter/material.dart';
import 'package:shoping_app/homepage.dart';
import 'package:shoping_app/add_to_card_page.dart';
class NavegatorPage extends StatefulWidget {
  const NavegatorPage({super.key});

  @override
  State<NavegatorPage> createState() => _NavegatorPageState();
}

class _NavegatorPageState extends State<NavegatorPage> {
  List<Widget> pages= const [MyHomePage(),AddCardPage()];
  int currentpage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (v){
          setState(() {
            currentpage=v;
          });
            
        },
        iconSize: 40,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentpage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
             label: '',
            ),
            
             BottomNavigationBarItem(
            icon: Icon(Icons.add_card_outlined),
            label: '',
            ),
            ],
            )
    );
  }
}