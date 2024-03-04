import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Funds_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Details",
            style: TextStyle(
                color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.asset('assets/images/seminar.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "University Seminar",
                  style: TextStyle(
                      fontSize: screenWidth / 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Text(
                    "Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12),
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              padding: EdgeInsets.all(20),
              width: screenWidth - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 215, 239, 242),
              ),
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "For Donation",
                    style: TextStyle(
                        fontSize: screenWidth / 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Name: ABCDEF"),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Easypaise: 1234-567891"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: InkWell(
                    child: Container(
                      child: Text(
                        "Donote",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 4, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onTap: () => print("Donote Button is Pressed"),
                  ),
                )
              ]),
            ),
          ]),
        ));
  }
}
