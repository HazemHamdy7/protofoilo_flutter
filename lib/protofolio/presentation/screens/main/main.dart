import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofoilo/constants/assets.dart';
import 'package:protofoilo/protofolio/core/colors_app.dart';
import 'package:protofoilo/protofolio/presentation/screens/main/widgets/custom_app_bar.dart';
import 'package:protofoilo/protofolio/presentation/screens/main/widgets/custom_social_icons.dart';
import 'package:protofoilo/protofolio/presentation/screens/main/widgets/custom_text.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 24.0,
      fontFamily: 'Horizon',
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomAppBar(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  Assets.imagesBg1,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.3,
                  left: MediaQuery.sizeOf(context).width * 0.08,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Hello , i'm Hazem"),
                        SizedBox(height: 20),
                        AnimatedTextKit(
                          totalRepeatCount: 2,
                          animatedTexts: [
                            WavyAnimatedText(
                              'Flutter Developer',
                              textStyle: TextStyle(
                                fontSize: 40,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                                color: ColorsApp.bgTitle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        // AnimatedTextKit(
                        //   animatedTexts: [
                        //     ColorizeAnimatedText(
                        //       'Larry Page',
                        //       textStyle: colorizeTextStyle,
                        //       colors: colorizeColors,
                        //     ),
                        //     ColorizeAnimatedText(
                        //       'Bill Gates',
                        //       textStyle: colorizeTextStyle,
                        //       colors: colorizeColors,
                        //     ),
                        //     ColorizeAnimatedText(
                        //       'Steve Jobs',
                        //       textStyle: colorizeTextStyle,
                        //       colors: colorizeColors,
                        //     ),
                        //   ],
                        //   isRepeatingAnimation: true,
                        //   onTap: () {},
                        // ),
                        CustomText(
                          text: "i build life changeing courses",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 16),
                        MaterialButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          textTheme: ButtonTextTheme.accent,
                          clipBehavior: Clip.antiAlias,
                          color: ColorsApp.bgTitle,
                          onPressed: () {},
                          child: Text('View my work'),
                        ),
                        SizedBox(height: 16),
                        CustomSocialIcons(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
