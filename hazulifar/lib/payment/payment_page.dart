import 'package:flutter/material.dart';
import 'package:hazulifar/rating/rating_page.dart';

class PaymentPage extends StatefulWidget {
  final String bookingDate;
  final String bookingTime;
  final String eventDate;
  final String eventTime;
  final String additionalRequests;
  final int numberOfPeople;
  final String packageType;
  final String menuPackage;
  final String? menuPackage2;
  final double totalPrice;

  const PaymentPage({
    super.key,
    required this.bookingDate,
    required this.bookingTime,
    required this.eventDate,
    required this.eventTime,
    required this.additionalRequests,
    required this.numberOfPeople,
    required this.packageType,
    required this.menuPackage,
    this.menuPackage2,
    required this.totalPrice,
  });

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final TextEditingController _discountController = TextEditingController();
  double discount = 0.0;
  double discountedTotalPrice = 0.0;
  bool paymentConfirmed = false;
  bool _isApplyingDiscount = false;

  final List<String> banks = ['CIMB Bank', 'Maybank', 'Hong Leong Bank'];
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildInfoCard('Booking Date', widget.bookingDate),
            _buildInfoCard('Booking Time', widget.bookingTime),
            _buildInfoCard('Event Date', widget.eventDate),
            _buildInfoCard('Event Time', widget.eventTime),
            _buildInfoCard(
                'Number of People', widget.numberOfPeople.toString()),
            _buildInfoCard('Package Type', widget.packageType),
            _buildInfoCard('Menu Package', widget.menuPackage),
            if (widget.menuPackage2 != null)
              _buildInfoCard('Additional Menu Package', widget.menuPackage2!),
            _buildPriceInfoCard('Total Price Before Discount (RM)',
                widget.totalPrice.toStringAsFixed(2)),
            if (_isApplyingDiscount)
              _buildPriceInfoCard('Total Price After Discount (RM)',
                  discountedTotalPrice.toStringAsFixed(2)),
            TextField(
              controller: _discountController,
              decoration: const InputDecoration(
                labelText: 'Discount Code',
                prefixIcon: Icon(Icons.card_giftcard),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _applyDiscount(_discountController.text);
              },
              child: const Text('Apply Discount'),
            ),
            const SizedBox(height: 20),
            const Text('Select Bank:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bank',
                prefixIcon: Icon(Icons.account_balance),
              ),
              value: selectedBank,
              items: banks.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedBank = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedBank == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a bank.')),
                  );
                } else {
                  setState(() {
                    paymentConfirmed = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment confirmed!')),
                  );
                }
              },
              child: const Text('Confirm Payment'),
            ),
            if (paymentConfirmed)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Payment has been confirmed. Thank you for your booking!',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            if (paymentConfirmed)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RateCourse()),
                  );
                },
                child: const Text('Rate Our Page'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
  }

  Widget _buildPriceInfoCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content),
      ),
    );
  }

  void _applyDiscount(String code) {
    setState(() {
      if (code == 'DISCOUNT10') {
        discount = 0.1 * widget.totalPrice;
        discountedTotalPrice = widget.totalPrice - discount;
        _isApplyingDiscount = true;
        _showSnackBar('Discount code applied successfully.');
      } else {
        _isApplyingDiscount = false;
        _showSnackBar('Invalid voucher code.');
      }
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
