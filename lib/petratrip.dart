import 'package:flutter/material.dart';
import 'bottom.dart';
import 'buttons.dart';
class petra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageTransitionPage(),
    );
  }
}

//يتيتيبتب
class ImageTransitionPage extends StatefulWidget {
  @override
  _ImageTransitionPageState createState() => _ImageTransitionPageState();
}

class _ImageTransitionPageState extends State<ImageTransitionPage> {
  late PageController
      _pageController; //late keyword is used to indicate that the variable will be initialized later.
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _autoTransition();
  }

  void _autoTransition() {
    Future.delayed(
        Duration(
            seconds:
                10), // Automatically transition to the next page every 3 seconds
        () {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(
            milliseconds:
                10000), //class in Flutter used to represent a span of time.
        curve: Curves.easeInOut,
      );
      _autoTransition(); // Call itself for continuous auto-transition
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _hotelsbutton() {
    //صفوان
    print('Navigate to Hotels page');
  }

  void _tribsbutton() {
    //صفوان
    print('Navigate to trips page');
  }

  void _resandcafebutton() {
    //صفوان
    print('Navigate to res page');
  }

  void _showPetraDescription() {
    showDialog(
      //(method)
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'The city of Petra, capital of the Nabataean Arabs, is one of the most famous archaeological sites in the world, '
                'it is Located 240 km south of the capital Amman and 120 km north of the red sea town of Aqaba. Petra, the world wonder, '
                'is undoubtedly Jordan\'s most valuable treasure and greatest tourist attraction, and it is visited by tourists from all over the world.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _goToMap,
                child: const Text(
                  'See on the Map',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _goToMap() {
    // Add the code to navigate to the map here
    print('Navigate to the map');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Image.asset(
                    'assets/imagestransitionpetra/petra/petra1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/imagestransitionpetra/petra/petra3.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Petra Tours',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 35),
                        InkWell(
                          onTap: _showPetraDescription,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(58, 27, 15, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 10), //between petra tours and hotels button
//----------------------------//Container//----------------------------//
                    MyCustomContainer(text: 'Hotel',icon: Icons.hotel,onTap: _hotelsbutton,),
//----------------------------//Container//----------------------------//
                    MyCustomContainer(text: 'Trips', icon:Icons.directions_bus , onTap: _tribsbutton),
//----------------------------//Container//----------------------------//
                    MyCustomContainer(text: 'Cafe', icon:Icons.local_cafe , onTap: _resandcafebutton)
        
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottom(),
    );
  }
}
