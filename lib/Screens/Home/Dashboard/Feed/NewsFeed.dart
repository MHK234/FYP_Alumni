import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NewsFeedPage(),
    );
  }
}

class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Number of news articles
        itemBuilder: (context, index) {
          return NewsCard(
            title: 'Breaking News $index',
            description:
                'In a groundbreaking discovery, scientists have identified a new celestial phenomenon that challenges our understanding of the universe. The research team, using advanced telescopes and space probes, observed unique patterns in distant galaxies, suggesting the presence of previously unknown cosmic structures. This discovery opens up new avenues for research and could revolutionize our understanding of the cosmos.',
            imageUrl: 'https://via.placeholder.com/150',
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  NewsCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Image.asset(
              "assets/images/ad.jpg",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
