import 'package:flutter/material.dart';
import 'package:spotify_clean_arch/core/configs/theme/App_Pallete.dart';
import 'package:spotify_clean_arch/presentation/home/pages/home_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  List<Widget> pages = [];
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      HomeScreen(),
      Center(
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      Center(
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      Center(
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppPallete.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  List<BottomNavigationBarItem> items() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.library_music),
        label: 'Library',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
  }
}
