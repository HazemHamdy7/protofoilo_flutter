import 'package:flutter/material.dart';
import 'package:protofoilo/protofolio/presentation/screens/main_screen/widgets/custom_text.dart';
import 'package:protofoilo/protofolio/core/colors_app.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: 'Hazem',
        color: ColorsApp.bgTitle,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        Row(
          spacing: 10,
          children: [
                CustomText(
              text: 'About',
              color: ColorsApp.bgTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'Service',
              color: ColorsApp.bgTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'Project',
              color: ColorsApp.bgTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: 'Contact',
              color: ColorsApp.bgTitle,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    );
  }
}
