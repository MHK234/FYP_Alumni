import 'dart:io';
import 'package:loginsignup/home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {

  const EditProfilePage({super.key,});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  TextEditingController endYearController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  File? _image;
  late String uid;
  late String profilepic='';

  Widget buildProfilePicture() {
      return CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(profilepic),
      );
  }
  @override
  void initState()  {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userId') ?? "";
    try {
      DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection('userdata').doc(uid).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        print(uid);
        // Populate text fields with user data
        setState(() {
          fatherNameController.text = userData['fatherName'] ?? '';
          cnicController.text = userData['cnic'] ?? '';
          degreeController.text = userData['degree'] ?? '';
          batchController.text = userData['batch'] ?? '';
          startYearController.text = userData['startYear'] ?? '';
          endYearController.text = userData['endYear'] ?? '';
          departmentController.text = userData['department'] ?? '';
          profilepic = userData['profileUrl'] ?? '';
          print(profilepic);
        });
      } else {
        // Handle the case when the user document doesn't exist
        print('User document does not exist for userId: ${uid}');
      }
    } catch (e) {
      // Handle errors
      print('Error fetching user data: $e');
    }
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
    // Save user profile data to Firestore
    if (kDebugMode) {
      print('Submit Clicked');
    }

    // Upload image if it exists
    String imageUrl = '';
    if (_image != null) {
      String imageName = "profile_image.jpg";
      Reference storageReference =
      FirebaseStorage.instance.ref().child('${uid}/$imageName');
      await storageReference.putFile(_image!);
      imageUrl = await storageReference.getDownloadURL();
      print('Image URL: $imageUrl');
    }

    // Save user profile data to Firestore, including the image URL
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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(),  // Replace 'HomePage' with the actual class for your homepage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
        child: ListView(
          children: [
            // Profile Picture Widget
          Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: _pickImage,
            child: buildProfilePicture(),
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
}