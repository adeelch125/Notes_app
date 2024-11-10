import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';


const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyD1S13bX2Fqx1WGpReZBfWhPgNLuH4qOx0",
  appId: "1:225843989741:android:7423fbca1fc2ec83f690e4",
  messagingSenderId: "225843989741",
  projectId:"notesapp-d25e4",
  storageBucket: "notesapp-d25e4.firebasestorage.app", // Add your storage bucket here
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen() ,
    );
  }
}


