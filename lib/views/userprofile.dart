// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginsignup/Helper/NavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as Path;

class UserProfilePage extends StatefulWidget {
  UserProfilePage({super.key});
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

  Future<void> _submitUserProfile() async {
    // Optionally, you can get the download URL of the uploaded image

    // Save user profile data to Firestore
    await FirebaseFirestore.instance.collection('userdata').doc(uid).set({
      'fatherName': fatherNameController.text,
      'cnic': cnicController.text,
      'degree': degreeController.text,
      'batch': batchController.text,
      'startYear': startYearController.text,
      'endYear': endYearController.text,
      'department': departmentController.text,
      'profileUrl': "Null",
    });

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationBarScreen(),
        ));
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Profile Picture Widget

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
                backgroundColor: Colors.blue, // Background color of the button
              ),
              onPressed: _submitUserProfile,
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white, // Text color of the button
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void loaduid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userId') ?? "";
  }
}

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late File _image;
  final picker = ImagePicker();
  bool _isUploading = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    setState(() {
      _isUploading = true;
    });

    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(_image.path)}');
    UploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.whenComplete(() => setState(() => _isUploading = false));

    print('File Uploaded');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Demo'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.file(
                    _image,
                    height: 300,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isUploading ? null : uploadImage,
                    child: _isUploading
                        ? CircularProgressIndicator()
                        : Text('Upload Image'),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
