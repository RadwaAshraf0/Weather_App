import 'package:flutter/material.dart';
import 'package:weather/widgets/customText%20_widget.dart';
import 'package:weather/widgets/custom_container.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomContainer(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(98, 0, 0, 0),
          ),
          width: screenWidth * 0.9,
          height: screenHeight * 0.25,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          padding: EdgeInsets.all(screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "There is no weather 😩",
                size: screenWidth * 0.06,
                color: Colors.white,
                isBold: true,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomText(
                text: "Start search now 🔍",
                size: screenWidth * 0.05,
                color: Colors.white,
                isBold: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
