import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => _launchURL('https://www.linkedin.com/feed/'),
          child:
              Icon(FontAwesomeIcons.linkedinIn, size: 24, color: Colors.blue),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () => _launchURL('https://www.facebook.com'),
          child: Icon(FontAwesomeIcons.facebook,
              size: 24, color: Colors.blueAccent),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () => _launchURL('https://github.com/HazemHamdy7'),
          child: Icon(FontAwesomeIcons.github, size: 24),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () => _launchURL('https://www.youtube.com'),
          child: Icon(FontAwesomeIcons.youtube, size: 24, color: Colors.red),
        ),
      ],
    );
  }
}
