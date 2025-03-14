import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/constant/padding.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: AppPadding.screenPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            ),
          ),
      ),
    );
  }
}