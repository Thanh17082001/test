import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './ui/site/hompage_screen.dart';

import './ui/product/product_screen.dart';
import './ui/news/news_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   int selectedIndex = 0;
 
  final List<Widget> pages = [
    const HomePageScreen(),
    // const Text('Trang chu'),
    const ProductScreen(),
    const NewsScreen(),
    const Text("setting"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      bottomNavigationBar: navbarBottom(),
      body: pages[selectedIndex]
    );
  }

  Widget navbarBottom(){
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        color: const Color.fromARGB(255, 230, 59, 59),
        height: 65.0,
        onTap: changePage,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Icon(
            Icons.account_box,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ]);
  }
  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  
}
