import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';
import '../assets/asset_paths.dart'; // Ensure this is correct

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Top Row with Back and Save buttons
              topRow(context),
              const SizedBox(height: 20),
              // Form Fields for Title and Description
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Field
                      TextFormField(
                        controller: _titleController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Description Field
                      TextFormField(
                        controller: _descriptionController,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: const TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row topRow(BuildContext context) {
    return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xff3B3B3B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Padding(
                          padding: EdgeInsets.only(right: 3),
                          child: Image(
                            image: AssetImage(AssetPaths.imageButtonBack),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Image and Text Column
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Image
                                  Image(
                                      image:
                                          AssetImage(AssetPaths.imageInfo)),
                                  SizedBox(height: 15),
                                  // Text
                                  Text(
                                    'Save changes ?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Row of Clickable Containers
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("First action clicked");
                                      Navigator.pop(
                                          context); // Close dialog after click
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Discard',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("Second action clicked");
                                      Navigator.pop(
                                          context); // Close dialog after click
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 1.5),
                          child: Image(
                            image: AssetImage(AssetPaths.imageButtonSave),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
  }
}
