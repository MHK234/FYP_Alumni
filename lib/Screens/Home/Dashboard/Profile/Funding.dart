import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginsignup/Screens/Home/Dashboard/Profile/Funds_details.dart';

class Funding_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return (Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Center(
              child: Container(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Color(0xff4196E3)),
                borderRadius: BorderRadius.circular(10)),
          )),
        ),
        Row(
          children: [
            InkWell(
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff4196E3),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(left: 70, top: 20, right: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Center(
                        child: Text(
                      "Study",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
              onTap: () => print("Tap on Study"),
            ),
            InkWell(
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Icon(
                        Icons.mood,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 52, 171),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                        child: Text(
                      "Human",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
              onTap: () => print("Tap on Human"),
            ),
            InkWell(
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Icon(
                        Icons.view_comfy_alt,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff4196E3),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Center(
                        child: Text(
                      "Others",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
              onTap: () => print("Tap on Others"),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Text(
                    "See More",
                    style: TextStyle(color: Color(0xff4196E3)),
                  ),
                  onTap: () => print("See more is Pressed"),
                ),
              ],
            )),
        InkWell(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            width: screenWidth + 20,
            height: screenHeight / 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 0.3, color: Color(0xff4196E3)),
              color: Color.fromARGB(255, 215, 239, 242),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "University Seminar",
                        style: TextStyle(
                            fontSize: screenWidth / 22,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Description: Wireshark Packet Trace and Analytics ",
                      style: TextStyle(fontSize: screenWidth / 25),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Amount: Rs 50/-",
                        style: TextStyle(
                            fontSize: screenWidth / 21,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => Funds_details())),
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            width: screenWidth + 20,
            height: screenHeight / 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 0.3, color: Color(0xff4196E3)),
              color: Color.fromARGB(255, 215, 239, 242),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Donation For Beggers",
                        style: TextStyle(
                            fontSize: screenWidth / 22,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Description: This Donation is for beggers around metro station to support",
                      style: TextStyle(fontSize: screenWidth / 25),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Amount: Rs 20/-",
                        style: TextStyle(
                            fontSize: screenWidth / 21,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => Funds_details())),
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            width: screenWidth + 20,
            height: screenHeight / 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 0.3, color: Color(0xff4196E3)),
              color: Color.fromARGB(255, 215, 239, 242),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Fair Well Party",
                        style: TextStyle(
                            fontSize: screenWidth / 22,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Description: Fair Well party to last Year Students at the end of their degree ",
                      style: TextStyle(fontSize: screenWidth / 25),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        "Amount: Rs 200/-",
                        style: TextStyle(
                            fontSize: screenWidth / 21,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => Funds_details())),
        ),
      ]),
    ));
  }
}
