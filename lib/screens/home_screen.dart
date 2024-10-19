import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/assets/asset_paths.dart';
import 'package:notes_app/screens/editor_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 120),

                  // Clickable search icon
                  GestureDetector(
                    onTap: () {
                      print("Search icon clicked!");
                      // Add functionality here
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image(image: AssetImage(AssetPaths.imageSearch)),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Clickable outline icon
                  GestureDetector(
                    onTap: () {
                      print("Outline icon clicked!");
                      // Add functionality here
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image(image: AssetImage(AssetPaths.imageOutline)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>const EditorScreen()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add,),
      ),
    );
  }
}
