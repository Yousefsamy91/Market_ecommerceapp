import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({super.key});

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  int currentindex = 0;
  PageController _controller = PageController();

  List<Widget> pages = [
    Screens(
      title: 'Welcome to Marketi',
      imageurl: 'assets/images/Illustration_Onboarding_1.png',
      description:
      'Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.',
    ),
    Screens(
      title: 'Easy to Buy',
      imageurl: 'assets/images/Illustration_Onboarding_2.png',
      description:
      'Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.',
    ),
    Screens(
      title: 'Wonderful User Experience',
      imageurl: 'assets/images/Illustration_Onboarding_3.png',
      description:
      'Start exploring now and experience the convenience of online shopping at its best.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentindex = index;
                });
              },
              itemBuilder: (context, index) => pages[index],
            ),
            Positioned(
              bottom: 20,
              left: 50,
              right: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (currentindex < pages.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    await prefs.setBool('seenOnboarding', true);
                    context.go('/login');
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF3F80FF)),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 60)),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
                child: Text(
                  currentindex == pages.length - 1 ? 'Get Started' : 'Next',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screens extends StatelessWidget {
  final String title;
  final String imageurl;
  final String description;

  const Screens(
      {super.key,
        required this.title,
        required this.imageurl,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageurl, height: 300),
        const SizedBox(height: 25),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            description,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.black,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}