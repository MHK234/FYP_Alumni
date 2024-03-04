import 'dart:ui';

import 'package:flutter/material.dart';

class Chat2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Chat2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 35),
          physics: BouncingScrollPhysics(),
          children: [
            _itemChats(
              avatar: 'assets/images/1.jpg',
              name: 'Hamza',
              chat:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
              time: '08.10',
            ),
            _itemChats(
              avatar: 'assets/images/2.jpg',
              name: 'Faizan',
              chat: 'Excepteur sint occaecat cupidatat non proident',
              time: '03.19',
            ),
            _itemChats(
              avatar: 'assets/images/3.jpg',
              name: 'Haram',
              chat: 'Hii... 😎',
              time: '02.53',
            ),
            _itemChats(
              avatar: 'assets/images/4.jpg',
              name: 'Humna',
              chat: 'Consectetur adipiscing elit',
              time: '11.39',
            ),
            _itemChats(
              avatar: 'assets/images/6.jpg',
              name: 'Rehan',
              chat:
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
              time: '00.09',
            ),
            _itemChats(
              avatar: 'assets/images/7.jpg',
              name: 'Khalid',
              chat:
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
              time: '00.09',
            ),
          ],
        ),
      ),
    );
  }
_itemChat({required int chat, required String avatar, message, time}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        avatar != null
            ? Avatar(
                image: avatar,
                size: 50,
              )
            : Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text('$message'),
          ),
        ),
        chat == 1
            ? Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              )
            : SizedBox(),
      ],
    );
  }
  Widget _itemChats(
      {String avatar = '', name = '', chat = '', time = '00.00'}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatPage(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20),
        elevation: 0,
        child: Row(
          children: [
            Avatar(
              margin: EdgeInsets.only(right: 20),
              size: 60,
              image: avatar,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$time',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$chat',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4196E3),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                _bodyChat(),
                SizedBox(
                  height: 120,
                )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  _topChat() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                'Fiona',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Okey 🐣',
              time: '18.00', avatar: 'assets/image/5.jpg'
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message: 'It has survived not only five centuries, 😀',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
              time: '18.00', avatar: 'assets/image/5.jpg',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message: '😅 😂 🤣',
              time: '18.00',
            ),
          ],
        ),
      ),
    );
  }

  // 0 = Send
  // 1 = Recieved
  _itemChat({required int chat, required String avatar, message, time}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        avatar != null
            ? Avatar(
                image: avatar,
                size: 50,
              )
            : Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text('$message'),
          ),
        ),
        chat == 1
            ? Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              )
            : SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              suffixIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff4196E3)),
                padding: EdgeInsets.all(14),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 202, 231, 255)),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 202, 231, 255)),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;
  Avatar({this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
