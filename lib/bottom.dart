import 'package:flutter/material.dart';

class botomnavigationbar extends StatelessWidget {
  const botomnavigationbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottomNav(),
    );
  }
}

class bottomNav extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<bottomNav> {
  int _currentIndex =
      0; //declares an integer variable named _currentIndex and initializes it with the value 0
  late PageController
      _pageController; // keyword is used to declare a non-nullable variable that might be initialized later

  @override
  void initState() //This method is part of the State lifecycle in Flutter.
  {
    //This line calls the initState method of the superclass
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          /*Container(
            //code
          ),
          Container(
            //code 
          ),
          Container(
          code
          ),*/
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
