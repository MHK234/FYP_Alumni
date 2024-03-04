import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class User_Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(margin:EdgeInsets.only(top: 40),
          child:Center(child: Image.asset('assets/images/dp.png',width: screenWidth/3.5,height: screenHeight/7,),) 
          ),
          Text("Alexander",style: TextStyle(fontSize: screenWidth/15, fontWeight: FontWeight.bold),),
          Text("Mobile App Developer",style: TextStyle(fontSize: screenWidth/25, fontWeight: FontWeight.w600),),
          Row(
              children: [
                InkWell(
                  child:  Column(
                  children: [
                    Container(
                      width: 40,height: 40,
                      child: Center(
                        child: Icon(Icons.sms, color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff4196E3),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        margin: EdgeInsets.only(left: 70, top: 20,right: 20),    
                    ),
                    Padding(padding: EdgeInsets.only(left: 50),
                    child: Center(child:Text("Message",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                    ),
                    )
                  ],
                ),
                onTap: () => print("Tap on Message"),
                ),
                InkWell(child: Column(
                  children: [
                    Container(
                      width: 40,height: 40,
                      child: Center(
                        child:  Icon(Icons.person_add,color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 45, 52, 171),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        margin: EdgeInsets.only(left: 20, top: 20,right: 20),    
                    ),
                    Padding(padding: EdgeInsets.only(left: 0),
                    child: Center(child:Text("Follow",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),)
                    
                  ],
                ),
                onTap: () => print("Tap on Follow"),
                ),
                InkWell(child: Column(
                  children: [
                    Container(
                      width: 40,height: 40,
                      child: Center(
                        child: Icon(Icons.star_rate,color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff4196E3),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        margin: EdgeInsets.only(left: 20, top: 20,right: 20),    
                    ),
                    Padding(padding: EdgeInsets.only(left: 0),
                    child: Center(child:Text("Favorite",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),)
                    ],
                ),
                onTap:() =>  print("Tap on Favorite")
                ,) 
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(top:30),
              width: screenWidth-20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color:  Color.fromARGB(255, 215, 239, 242)
                ),
                child: Column(children: [
                  Align(alignment: Alignment.topLeft,
                  child: Padding(padding: EdgeInsets.only(top: 10, left: 20),
                  child: Text("Interests", style: TextStyle(fontSize: screenWidth/20, fontWeight: FontWeight.bold),),),),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff4196E3)),
                      child: Center(child: Text("Java",style: TextStyle(color: Colors.white),)),
                      margin: EdgeInsets.only(left: 40,top: 20,bottom: 10,right: 10),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff4196E3)),
                      child: Center(child: Text("Flutter",style: TextStyle(color: Colors.white),)),
                      margin: EdgeInsets.only(left: 10,top: 20,bottom: 10,right: 10),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff4196E3)),
                      child: Center(child: Text("Node",style: TextStyle(color: Colors.white),)),
                      margin: EdgeInsets.only(left: 10,top: 20,bottom: 10,right: 10),
                      ),
                      ],),
                      Row(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff4196E3)),
                      child: Center(child: Text("React",style: TextStyle(color: Colors.white),)),
                      margin: EdgeInsets.only(left: 80,top: 20,bottom: 10,right: 10),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff4196E3)),
                      child: Center(child: Text("Swift",style: TextStyle(color: Colors.white),)),
                      margin: EdgeInsets.only(left: 10,top: 20,bottom: 10,right: 10),
                      ),
                      
                      ],)

                ]),
            ),
            Container(
               padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(top:30),
              width: screenWidth-20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color:  Color.fromARGB(255, 215, 239, 242)
                ),
                child: Column(children: [
                  Align(alignment: Alignment.topLeft,
                  child: Padding(padding: EdgeInsets.only(top: 10, left:20),
                  child: Text("Experience", style: TextStyle(fontSize: screenWidth/20, fontWeight: FontWeight.bold),),
                  )
                  ),
                  Align(alignment: Alignment.bottomLeft,
                  child: Padding(padding: EdgeInsets.only(left: 10),child:Text("6 Months Internship in Flutter in ABC organization", style: TextStyle(fontSize: 12),))),
                  Align(alignment: Alignment.bottomLeft,
                  child: Padding(padding: EdgeInsets.only(left: 10),child:Text("3 Months Internship in React Native in XYZ organization", style: TextStyle(fontSize: 12),))),
                  Align(alignment: Alignment.bottomLeft,
                  child: Padding(padding: EdgeInsets.only(left: 10),child:Text("Working As Senior App Developer in AAA Technologies", style: TextStyle(fontSize: 12),))),
                  
                  
                ],)
            )
        ],),
      )
    );
  }

}