import 'package:flutter/material.dart';
import 'package:wemace/features/aichat/screens/ai_chat_screen.dart';
import 'package:wemace/features/feed/feed_screen.dart';
import 'package:wemace/features/post/screens/add_post_screen.dart';

class Constants {
  static const logoPath = 'assets/images/logo.png';
  static const GoogleLogoPath = 'assets/images/Google.png';
  static const logoNamePath = 'assets/images/logoName.png';
  static const GoogleAuth = 'assets/images/googleIcon.png';
  static const communityLogo = 'assets/images/Community_Logo.png';
  static const googleAnalytics = 'assets/images/google-analytics.png';
  static const emailAuth = 'assets/images/mailIcon.png';
  static const womenCommunity = 'assets/images/Women_Community.png';
  static const chatbot = 'assets/images/chatbot.png';
  static const bannerDefault =
      'https://thumbs.dreamstime.com/b/abstract-stained-pattern-rectangle-background-blue-sky-over-fiery-red-orange-color-modern-painting-art-watercolor-effe-texture-123047399.jpg';
  static const avatarDefault =
      'https://external-preview.redd.it/5kh5OreeLd85QsqYO1Xz_4XSLYwZntfjqou-8fyBFoE.png?auto=webp&s=dbdabd04c399ce9c761ff899f5d38656d1de87c2';

  static const tabWidgets = [
    FeedScreen(),
    AddPostScreen(),
    AiChatScreen(),
  ];

  static const IconData up =
      IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
  static const IconData down =
      IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);

  static const awardsPath = 'assets/images/awards';

  static const awards = {
    'awesomeAns': '${Constants.awardsPath}/awesomeanswer.png',
    'gold': '${Constants.awardsPath}/gold.png',
    'platinum': '${Constants.awardsPath}/platinum.png',
    'helpful': '${Constants.awardsPath}/helpful.png',
    'plusone': '${Constants.awardsPath}/plusone.png',
    'rocket': '${Constants.awardsPath}/rocket.png',
    'thankyou': '${Constants.awardsPath}/thankyou.png',
    'til': '${Constants.awardsPath}/til.png',
  };
}
