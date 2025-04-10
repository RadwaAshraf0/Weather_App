import 'package:flutter/material.dart';
import 'package:weather/views/home_view.dart';
import 'package:weather/widgets/customText%20_widget.dart';
import 'package:weather/widgets/custom_container.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/Weather.png',
                height: 390,
                width: double.infinity,
              ),
              const SizedBox(height: 5),
              const CustomText(
                text: "Weather",
                size: 64,
                color: Colors.white,
                isBold: true,
              ),
              const CustomText(
                text: "ForeCasts",
                size: 40,
                color: Color(0xffDDB130),
                isBold: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDDB130),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(17),
                  child: CustomText(
                    text: 'Get Start',
                    size: 30,
                    color: Color.fromARGB(255, 2, 36, 75),
                    isBold: true,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
