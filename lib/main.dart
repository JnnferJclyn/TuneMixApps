import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tunemix_apps/screens/home_screen.dart';
import 'package:tunemix_apps/screens/login_screen.dart';
import 'package:tunemix_apps/screens/landing_screen.dart';
import 'package:tunemix_apps/screens/signup_screen.dart';
import 'package:tunemix_apps/screens/user_profile_screen.dart';
import 'package:tunemix_apps/screens/view_profile_screen.dart';
import 'package:tunemix_apps/youtube_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final youtubeAPI = YouTubeAPI(
      apiKey: 'AIzaSyCfKYPykxwaHq05BWyYcL6P2wvVwIPyfGI'); // Ganti dengan kunci API YouTube Anda
  runApp(MyApp(youtubeAPI: youtubeAPI));
}

class MyApp extends StatelessWidget {
  final YouTubeAPI youtubeAPI;

  const MyApp({Key? key, required this.youtubeAPI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuneMix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(youtubeAPI: youtubeAPI),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/account': (context) => const UserProfile(imageUrl: ''),
        '/view': (context) => const ViewProfile(),
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

