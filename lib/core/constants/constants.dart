import 'package:flutter/material.dart';
import 'package:wemace/features/aichat/screens/ai_chat_screen.dart';
import 'package:wemace/features/feed/feed_screen.dart';
import 'package:wemace/features/post/screens/add_post_screen.dart';

class Constants {
  //Local Assets
  static const logoPath = 'assets/images/logo.png';
  static const GoogleLogoPath = 'assets/images/Google.png';
  static const logoNamePath = 'assets/images/logoName.png';
  static const GoogleAuth = 'assets/images/googleIcon.png';
  static const communityLogo = 'assets/images/Community_Logo.png';
  static const googleAnalytics = 'assets/images/google-analytics.png';
  static const emailAuth = 'assets/images/mailIcon.png';
  static const womenCommunity = 'assets/images/Women_Community.png';
  static const chatbot = 'assets/images/chatbot.png';
  static const Saraswati = 'assets/images/Saraswati.png';
  static const Lakshmi = 'assets/images/Lakshmi.png';
  //Link Assets
  static const bannerDefault =
      'https://i.pinimg.com/564x/d7/fb/e5/d7fbe58828c6f9f1daf289fe7d172e32.jpg';
  static const avatarDefault =
      'https://i.pinimg.com/564x/8b/1f/9f/8b1f9f145889835124f968a6aa82b79f.jpg';

  // Tab Widgets Routing
  static const tabWidgets = [
    FeedScreen(),
    AddPostScreen(),
    AiChatScreen(),
  ];

  // AppBar Widgets Routing
  static const appbarwidgets = [];

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
