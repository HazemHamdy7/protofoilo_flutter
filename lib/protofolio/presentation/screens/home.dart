import 'package:flutter/material.dart';
import 'package:protofoilo/protofolio/presentation/screens/about/main_about.dart';
import 'package:protofoilo/protofolio/presentation/screens/main_screen/main_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 1200,
            child: Column(children: [
                    MainScreen(),
                    MainAbout(),
                  ]),
          )),
    );
  }
}
