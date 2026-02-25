import 'package:flutter/material.dart';
import '../SQLite/sqlite.dart'; // Import the database file
import 'package:hazulifar/admin/update_userpage.dart';
import '../model/user.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<Map<String, dynamic>>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = DatabaseHelper().getAllUsersWithWeddingBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin User Management'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No users found.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = snapshot.data![index];
                      return FutureBuilder<List<Map<String, dynamic>>>(
                        future: DatabaseHelper()
                            .getAllBookingsForUser(user['username']),
                        builder: (context, bookingSnapshot) {
                          if (bookingSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ListTile(
                              title: Text(user['username'] ?? 'Unknown'),
                              subtitle: Text('Loading booking...'),
                            );
                          } else if (bookingSnapshot.hasError) {
                            return ListTile(
                              title: Text(user['username'] ?? 'Unknown'),
                              subtitle: Text('Error loading booking'),
                            );
                          } else {
                            final bookings = bookingSnapshot.data!;
                            return ExpansionTile(
                              title: Text(user['username'] ?? 'Unknown'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: bookings
                                    .map((booking) => Text(
                                        'Event Date: ${booking['eventDate']}, Event Time: ${booking['eventTime']}'))
                                    .toList(),
                              ),
                              children: [
                                for (var booking in bookings)
                                  ListTile(
                                    title: Text(
                                        'Event Date: ${booking['eventDate']}'),
                                    subtitle: Text(
                                        'Event Time: ${booking['eventTime']}'),
                                  ),
                              ],
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the update user page with a null user
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateUserPage(user: null),
                ),
              );
            },
            child: Text('Update User'),
          ),
        ],
      ),
    );
  }
}
