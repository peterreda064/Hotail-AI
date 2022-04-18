import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../shared/components/compantants.dart';
import 'login_screen.dart';

class OnBoardingModel {
  String? image;
  String? title;
  String? body;
  OnBoardingModel({this.image, this.body, this.title});
}

class HotelOnBoarding extends StatefulWidget {
  @override
  State<HotelOnBoarding> createState() => _HotelOnBoardingState();
}

class _HotelOnBoardingState extends State<HotelOnBoarding> {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image: 'assets/images/on1.png',
      body: 'Welcome in our hotel',
    ),
    OnBoardingModel(
      image: 'assets/images/on3.png',
      body: 'Knowing where you are wherever you go',
    ),
    OnBoardingModel(
      image: 'assets/images/on4.png',
      body: 'Best service',
    ),
  ];

  var controller = PageController();

  bool? isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD3DCDE),
      appBar: AppBar(
        backgroundColor: const Color(0xffD3DCDE),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              NavigateTo(HotelLoginScreen(), context);
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(boarding[index]),
                itemCount: 3,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 16,
                      expansionFactor: 3,
                      dotWidth: 16,
                      spacing: 8,
                      activeDotColor: Colors.black),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: buttom,
                  onPressed: () {
                    if (isLast!) {
                      NavigateTo(HotelLoginScreen(), context);
                    } else {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildOnBoardingItem(OnBoardingModel onbording) => Column(
        children: [
          Center(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('${onbording.image}'),
              width: 700,
              height: 400,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${onbording.body}',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ],
      );
}
