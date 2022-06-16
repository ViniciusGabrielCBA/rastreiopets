import 'package:flutter/material.dart';
import 'package:rastreiopets/screens/dashboard/dashboard_screen.dart';
import 'package:rastreiopets/screens/utils/first_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectPage = 0;
  List<Widget> pageList = [];
  @override
  void initState() {
    pageList.add(const FirstPage());
    pageList.add(DashBoardScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 10,
        backgroundColor: Colors.indigo,
        title: const Text("Rastreio de Pets"),
      ),
      body: IndexedStack(
        children: pageList,
        index: _selectPage,
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: _selectPage, onTap: _ontItemTapped, backgroundColor: Colors.indigo, fixedColor: Colors.white, items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          label: "Menu",
        )
      ]),
    );
  }

  void _ontItemTapped(int index) {
    setState(() {
      _selectPage = index;
    });
  }
}
