import 'package:flutter/material.dart';
import '../SQLite/sqlite.dart'; // Import the database file
import 'package:hazulifar/model/weddingbook.dart'; // Import your database helper methods
import '../model/user.dart'; // Import User model

class AdminPage extends StatefulWidget {
  final User user; // Accept User object as a parameter

  const AdminPage({Key? key, required this.user}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // List to store booking information retrieved from the database
  List<WeddingBook> bookings = [];

  @override
  void initState() {
    super.initState();
    // Call method to fetch booking information when the page initializes
    _fetchBookingData();
  }

  Future<void> _fetchBookingData() async {
    // Call your database helper method to fetch booking information
    List<Map<String, dynamic>> results = await DatabaseHelper().getAllBookings();

    // Parse the results and create Booking objects
    List<WeddingBook> parsedBookings = results.map((result) => WeddingBook.fromMap(result)).toList();

    // Update the state with the fetched bookings
    setState(() {
      bookings = parsedBookings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return ListTile(
            title: Text('Booking ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booking Date: ${booking.bookDate}'),
                Text('Booking Time: ${booking.bookTime}'),
                Text('Event Date: ${booking.eventDate}'),
                Text('Event Time: ${booking.eventTime}'),
                Text('Additional Requests: ${booking.additionalRequests}'),
                Text('Number of People: ${booking.numberOfPeople}'),
                Text('Package Type: ${booking.packageType}'),
                Text('Menu Package: ${booking.menuPackage}'),
                if (booking.menuPackage2 != null)
                  Text('Menu Package 2: ${booking.menuPackage2}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

