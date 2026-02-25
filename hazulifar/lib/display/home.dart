import 'package:flutter/material.dart';
import 'package:hazulifar/model/user.dart';
import 'home_page.dart';
import '../authentication/profile_page.dart';
import '../package/wedding_package.dart';
import '../booking/booking_page.dart';
import '../payment/payment_page.dart';
import '../rating/rating_page.dart';
import 'package:hazulifar/admin/admin_login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    homepage(),
    ProfilePage(user: User(userid: 0, name: '', email: '', phone: 0, username: '', password: '',)),
    WeddingPage(),
    const BookingDetailsPage(name: '', address: '', phoneNo: '', email: '',),
    PaymentPage(bookingDate: '', bookingTime: '', eventDate: '', eventTime: '', additionalRequests: '', numberOfPeople: 0, packageType: '', menuPackage: '', menuPackage2: '', totalPrice: 0.0,),
    RateCourse(),
    AdminLoginPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hazulifar Wedding',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromARGB(255, 121, 127, 205), // Set selected item color to white
        unselectedItemColor: Color.fromARGB(255, 46, 54, 88), // Set unselected item color to grey
        backgroundColor: Theme.of(context).primaryColor, // Optional: Set background color
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.padding_rounded),
            label: 'Package',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_added_rounded),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_rounded),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_rounded),
            label: 'Rating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Admin',
          ),
        ],
      ),
    );
  }
}
