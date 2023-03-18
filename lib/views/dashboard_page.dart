import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provastella/views/dashboard_pages/first_page.dart';

import 'dashboard_pages/second_page.dart';
import 'dashboard_pages/third_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }

}

class DashboardPageState extends State<DashboardPage> {

  final FirstPage firstPage = const FirstPage();
  final SecondPage secondPage = const SecondPage();
  final ThirdPage thirdPage = const ThirdPage();

  final List<Widget> pages = List.empty(growable: true);

  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    pages.addAll([firstPage, secondPage, thirdPage]);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Second Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Third Page',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
      ),
      body: pages[currentIndex],
    );
  }

  changeTab(int index){
    setState(() {
      currentIndex = index;
    });
  }

}
