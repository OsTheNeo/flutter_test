import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/landing');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Slide 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Slide 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Slide 3',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextPage,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
