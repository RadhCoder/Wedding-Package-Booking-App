import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hazulifar/payment/payment_page.dart';

class DisplayPage extends StatefulWidget {
  final String bookingDate;
  final String bookingTime;
  final String eventDate;
  final String eventTime;
  final String additionalRequests;
  final String numberOfPeople;
  final String packageType;
  String menuPackage;
  String? menuPackage2;

  DisplayPage({
    required this.bookingDate,
    required this.bookingTime,
    required this.eventDate,
    required this.eventTime,
    required this.additionalRequests,
    required this.numberOfPeople,
    required this.packageType,
    required this.menuPackage,
    this.menuPackage2,
  });

  @override
  DisplayPageState createState() => DisplayPageState();

  static const List<String> menuPackageOptions = [
    'Chinese Banquet Package',
    'Western Banquet Package',
    'Indian Banquet Package',
    'Malay Banquet Package Buffet',
    'Malay Banquet Package Muhibbah',
  ];
}

class DisplayPageState extends State<DisplayPage> {
  late TextEditingController _bookingDate;
  late TextEditingController _bookingTime;
  late TextEditingController _eventDate;
  late TextEditingController _eventTime;
  late TextEditingController _numberOfPeople;

  @override
  void initState() {
    super.initState();
    _bookingDate = TextEditingController(text: widget.bookingDate);
    _bookingTime = TextEditingController(text: widget.bookingTime);
    _eventDate = TextEditingController(text: widget.eventDate);
    _eventTime = TextEditingController(text: widget.eventTime);
    _numberOfPeople = TextEditingController(text: widget.numberOfPeople);
  }

  @override
  void dispose() {
    _bookingDate.dispose();
    _bookingTime.dispose();
    _eventDate.dispose();
    _eventTime.dispose();
    _numberOfPeople.dispose();
    super.dispose();
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        controller.text = formatter.format(picked);
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

  void _deleteBooking() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Information'),
      ),
      body: ListView(
        children: [
          const Divider(height: 30, thickness: 2),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Booking Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildDateTimeField(
              "Booking Date", _bookingDate, _selectDate, Icons.calendar_today),
          _buildDateTimeField(
              "Booking Time", _bookingTime, _selectTime, Icons.access_time),
          _buildDateTimeField(
              "Event Date", _eventDate, _selectDate, Icons.calendar_today),
          _buildDateTimeField(
              "Event Time", _eventTime, _selectTime, Icons.access_time),
          _buildTextField("Number of People", _numberOfPeople),
          _buildCard("Additional Requests", widget.additionalRequests),
          _buildPackageCard("Package Type", widget.packageType),
          _buildDropdownField(
            "Menu Package 1",
            [
              'Chinese Banquet Package',
              'Western Banquet Package',
              'Indian Banquet Package',
              'Malay Banquet Package Buffet',
              'Malay Banquet Package Muhibbah',
            ],
            Icons.restaurant_menu,
            (value) {
              setState(() {
                widget.menuPackage = value!;
                if (widget.menuPackage2 != null) {
                  widget.menuPackage2 = value;
                }
              });
            },
            widget.menuPackage,
          ),
          if (widget.menuPackage2 != null)
            _buildDropdownField(
              "Menu Package 2",
              ['None', ...DisplayPage.menuPackageOptions],
              Icons.restaurant_menu,
              (value) {
                setState(() {
                  widget.menuPackage2 = value == 'None' ? null : value;
                });
              },
              widget.menuPackage2 ?? 'None',
            ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        bookingDate: _bookingDate.text,
                        bookingTime: _bookingTime.text,
                        eventDate: _eventDate.text,
                        eventTime: _eventTime.text,
                        additionalRequests: widget.additionalRequests,
                        numberOfPeople: int.parse(_numberOfPeople.text),
                        packageType: widget.packageType,
                        menuPackage: widget.menuPackage,
                        menuPackage2: widget.menuPackage2,
                        totalPrice: calculateTotalPrice(),
                      ),
                    ),
                  );
                },
                child: const Text("Proceed to Payment"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _deleteBooking,
                child: const Text("Delete Booking"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
  }

  Widget _buildPackageCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
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

  Widget _buildTextField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: title,
          prefixIcon: const Icon(Icons.people),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the number of people';
          }
          return null;
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

  double calculateTotalPrice() {
    const hallPrice = 850.0;
    final packagePrice = {
      'Chinese Opulence': 498.0,
      'Indian Opulence': 498.0,
      'Malay Opulence': 468.0,
      'Chinese Grandeur': 538.0,
      'Indian Grandeur': 538.0,
      'Malay Grandeur': 498.0,
    };
    final menuPrice = {
      'Chinese Banquet Package': 199.0,
      'Western Banquet Package': 280.0,
      'Indian Banquet Package': 178.0,
      'Malay Banquet Package Buffet': 188.0,
      'Malay Banquet Package Muhibbah': 198.0,
    };

    final menuPrice1 = menuPrice[widget.menuPackage]!;
    final menuPrice2 =
        widget.menuPackage2 != null ? menuPrice[widget.menuPackage2!]! : 0.0;

    final totalPrice = hallPrice +
        packagePrice[widget.packageType]! +
        menuPrice1 +
        menuPrice2 +
        double.parse(_numberOfPeople.text) * 15;

    return totalPrice;
  }
}
