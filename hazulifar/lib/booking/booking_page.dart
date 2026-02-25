import 'package:flutter/material.dart';
import 'display_page.dart';
import 'package:intl/intl.dart'; // for DateFormat

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({
    super.key,
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.email,
  });

  final String name;
  final String address;
  final String phoneNo;
  final String email;

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final TextEditingController _bookingDate = TextEditingController();
  final TextEditingController _bookingTime = TextEditingController();
  final TextEditingController _eventDate = TextEditingController();
  final TextEditingController _eventTime = TextEditingController();
  final TextEditingController _numberOfPeople = TextEditingController();
  String _selectedRequest = "No wedding hall (+ RM 0)";
  String _selectedPackage = 'Chinese Opulence';
  String _selectedMenu = 'Chinese Banquet Package';
  String? _selectedMenu2; // Optional second menu package

  final Map<String, double> hallPrice = {
    'No wedding hall (+ RM 0)': 0,
    'Wedding hall included (+ RM 850)': 850,
  };

  final Map<String, double> packagePrice = {
    'Chinese Opulence': 498,
    'Indian Opulence': 498,
    'Malay Opulence': 468,
    'Chinese Grandeur': 538,
    'Indian Grandeur': 538,
    'Malay Grandeur': 498,
  };

  final Map<String, double> menuPrice = {
    'Chinese Banquet Package': 199,
    'Western Banquet Package': 280,
    'Indian Banquet Package': 178,
    'Malay Banquet Package Buffet': 188,
    'Malay Banquet Package Muhibbah': 198,
  };

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        final period = picked.period == DayPeriod.am ? 'AM' : 'PM';
        controller.text =
            '${picked.hourOfPeriod}:${picked.minute.toString().padLeft(2, '0')} $period';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: Center(
        child: ListView(
          children: [
            _buildDateTimeField("Enter the Booking Date", _bookingDate,
                _selectDate, Icons.calendar_today),
            _buildDateTimeField("Enter the Booking Time", _bookingTime,
                _selectTime, Icons.access_time),
            _buildDateTimeField("Enter the Event Date", _eventDate, _selectDate,
                Icons.calendar_today),
            _buildDateTimeField("Enter the Event Time", _eventTime, _selectTime,
                Icons.access_time),
            _buildDropdownField(
              "Enter Additional Requests",
              hallPrice.keys.toList(),
              Icons.request_page,
              (value) {
                setState(() {
                  _selectedRequest = value!;
                });
              },
              _selectedRequest,
            ),
            _buildTextField(
                "Enter Number of People", _numberOfPeople, Icons.people),
            _buildDropdownField(
              "Select Package Type",
              packagePrice.keys.toList(),
              Icons.local_offer,
              (value) {
                setState(() {
                  _selectedPackage = value!;
                });
              },
              _selectedPackage,
            ),
            _buildDropdownField(
              "Select Menu Package",
              menuPrice.keys.toList(),
              Icons.restaurant_menu,
              (value) {
                setState(() {
                  _selectedMenu = value!;
                });
              },
              _selectedMenu,
            ),
            _buildDropdownField(
              "Select Additional Menu Package (Optional)",
              ['None'] + menuPrice.keys.toList(),
              Icons.restaurant_menu,
              (value) {
                setState(() {
                  _selectedMenu2 = value == 'None' ? null : value;
                });
              },
              _selectedMenu2 ?? 'None',
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_bookingDate.text.isEmpty ||
                          _bookingTime.text.isEmpty ||
                          _eventDate.text.isEmpty ||
                          _eventTime.text.isEmpty ||
                          _numberOfPeople.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all the fields.'),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DisplayPage(
                              bookingDate: _bookingDate.text,
                              bookingTime: _bookingTime.text,
                              eventDate: _eventDate.text,
                              eventTime: _eventTime.text,
                              additionalRequests: _selectedRequest,
                              numberOfPeople: _numberOfPeople.text,
                              packageType: _selectedPackage,
                              menuPackage: _selectedMenu,
                              menuPackage2:
                                  _selectedMenu2, // Optional second menu package
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("SUBMIT"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTimeField(
      String label,
      TextEditingController controller,
      Future<void> Function(TextEditingController controller) selectDateOrTime,
      IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          selectDateOrTime(controller);
        },
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items, IconData icon,
      ValueChanged<String?> onChanged, String value) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        value: value,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
