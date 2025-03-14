import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/view/on_boarding_screen/widgets/on_boarding_points.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: height * 0.5,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Text("Your Circle, Your Circle, Your Circle"),
                  SizedBox(height: 12),
                  OnBoardingPoints(pointTitle: 'Smart cycle & Ovulation Tracking ',),
                  OnBoardingPoints(pointTitle: 'Smart cycle & Ovulation Tracking ',),
                  OnBoardingPoints(pointTitle: 'Smart cycle & Ovulation Tracking ',),
                  OnBoardingPoints(pointTitle: 'Smart cycle & Ovulation Tracking ',),
                  OnBoardingPoints(pointTitle: 'Smart cycle & Ovulation Tracking ',),
                  SizedBox(height: 24),
                  PrimaryButton(title:'Get Started',),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle( // Ensure text is visible
                            fontSize: 16,
                            color: Colors.black, // Change color based on theme
                          ),
                        ),TextSpan(
                          text: 'Login here',
                          style: TextStyle( // Ensure text is visible
                            fontSize: 16,
                            color: Colors.orange, // Change color based on theme
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  const PrimaryButton({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Center(child: Text(title,style: TextStyle(color: Colors.white),)),
    );
  }
}
