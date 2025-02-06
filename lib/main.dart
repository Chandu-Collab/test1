import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test1/screens/home_screen.dart';
import 'package:test1/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyBlL5M-FcIL3TCoSRyFCkHrLu3VOnXjhac",
  authDomain: "test1-2254c.firebaseapp.com",
  projectId: "test1-2254c",
  storageBucket: "test1-2254c.firebasestorage.app",
  messagingSenderId: "617761243173",
  appId: "1:617761243173:web:074a3cbb36a88f3064ffcc",
  measurementId: "G-5P1E3K0D41",
  ),
  );
   print('Firebase initialized successfully');
    } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}