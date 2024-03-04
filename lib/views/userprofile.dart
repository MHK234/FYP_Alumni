// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:loginsignup/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({
    super.key
});
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  TextEditingController endYearController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  File? _image;
  late String uid;

  @override
  void initState() {
    super.initState();
    // Fetch user data when the page is created
    loaduid();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      String imageName = "profile_image.jpg";
      Reference storageReference =
          FirebaseStorage.instance.ref().child('${uid}/$imageName');
      await storageReference.putFile(_image!);
    }
  }


  Future<void> _submitUserProfile() async {
    // Optionally, you can get the download URL of the uploaded image
    String imageUrl = '';
    if (_image != null) {
      String imageName = "profile_image.jpg";
      Reference storageReference =
      FirebaseStorage.instance.ref().child('${uid}/$imageName');
      await storageReference.putFile(_image!);
      imageUrl = await storageReference.getDownloadURL();
      print('Image URL: $imageUrl');
    }

    // Save user profile data to Firestore
    await FirebaseFirestore.instance.collection('userdata').doc(uid).set({
      'fatherName': fatherNameController.text,
      'cnic': cnicController.text,
      'degree': degreeController.text,
      'batch': batchController.text,
      'startYear': startYearController.text,
      'endYear': endYearController.text,
      'department': departmentController.text,
      'profileUrl': imageUrl,
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
    // You can now use the imageUrl as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Widget
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 60,
                  height: 60,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey, // Placeholder color
                  ),
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 60,
                        ),
                ),
              ),
            ),

            TextField(
              textCapitalization: TextCapitalization.words,
              controller: fatherNameController,
              decoration: const InputDecoration(labelText: "Father's Name"),
            ),

            TextField(
              controller: cnicController,
              maxLength: 16,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'CNIC'),
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: degreeController,
              decoration: const InputDecoration(labelText: 'Degree'),
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: batchController,
              decoration: const InputDecoration(labelText: 'Batch'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 140,
                  child: TextField(
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    controller: startYearController,
                    decoration: const InputDecoration(labelText: 'Starting Year'),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: TextField(
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    controller: endYearController,
                    decoration: const InputDecoration(labelText: 'Ending Year'),
                  ),
                ),
              ],
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: departmentController,
              decoration: const InputDecoration(labelText: 'Department Name'),
            ),
            const SizedBox(height: 5),
            //submit button
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color of the button
                ),
                onPressed: _submitUserProfile,
                child:const Text('Submit',
                  style: TextStyle(
                    color: Colors.white, // Text color of the button
                  ),),

              ),
            ),
          ]
        ),
      ),
    );
  }

  void loaduid() async{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      uid = prefs.getString('userId') ?? "";
  }
}
