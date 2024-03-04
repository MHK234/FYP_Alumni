
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events & Reunion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EventsReunionPage(),
    );
  }
}

class EventsReunionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events & Reunion'),
      ),
      body: ListView.builder(
        itemCount: 10, // Number of events
        itemBuilder: (context, index) {
          return EventCard(
            title: 'Event $index',
            date: 'June 15, 2022',
            location: 'City Hall',
            imageUrl: 'https://via.placeholder.com/150', // Placeholder image URL
          );
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String imageUrl;

  EventCard({
    required this.title,
    required this.date,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
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
                  'Date: $date',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Location: $location',
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
