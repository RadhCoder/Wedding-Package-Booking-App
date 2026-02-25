import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hazulifar/display/home.dart';

class RateCourse extends StatefulWidget {
  const RateCourse({super.key});

  @override
  State<RateCourse> createState() => _RateCourseState();
}

class _RateCourseState extends State<RateCourse> {
  double? _ratingValue1;
  double? _ratingValue2;
  double? _ratingValue3;
  final _reviewController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _reviewController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ratings'),
        ),
        body: ListView(
          controller: _scrollController,
          children: [
            buildRatingSection('How was Your Booking Experience?', (value) {
              setState(() {
                _ratingValue1 = value;
                if (_ratingValue1 != null) {
                  _scrollToNextSection(1);
                }
              });
            }, _ratingValue1),
            buildRatingSection('Rate Our Wedding Package!', (value) {
              setState(() {
                _ratingValue2 = value;
                if (_ratingValue1 != null) {
                  _scrollToNextSection(2);
                }
              });
            }, _ratingValue2),
            buildRatingSection('Rate Our Menu!', (value) {
              setState(() {
                _ratingValue3 = value;
                if (_ratingValue1 != null) {
                  _scrollToNextSection(3);
                }
              });
            }, _ratingValue3),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'We Appreciate a Feedback!', // Title for the review text field
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                      height: 15), // Spacing between title and text field
                  TextField(
                    controller: _reviewController,
                    decoration: const InputDecoration(
                      labelText: 'Write your review here',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReviewPage(
                    ratingValue1: _ratingValue1,
                    ratingValue2: _ratingValue2,
                    ratingValue3: _ratingValue3,
                    review: _reviewController.text,
                  ),
                ));
              },
              child: const Text('Submit'),
            ),
          ],
        ));
  }

  void _scrollToNextSection(int sectionIndex) {
    double offset = sectionIndex * 250.0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget buildRatingSection(
      String title, Function(double) onRatingUpdate, double? ratingValue) {
    return Padding(
      padding: const EdgeInsets.all(45),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 25),
            // implement the rating bar
            RatingBar(
                initialRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                    full: const Icon(Icons.star,
                        color: Color.fromRGBO(8, 17, 59, 1)),
                    half: const Icon(Icons.star_half,
                        color: Color.fromRGBO(8, 17, 59, 1)),
                    empty: const Icon(Icons.star_outline,
                        color: Color.fromRGBO(8, 17, 59, 1))),
                onRatingUpdate: onRatingUpdate),
            const SizedBox(height: 25),
            // Display the rate in number
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(8, 17, 59, 1), shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(
                ratingValue != null ? ratingValue.toString() : 'Rate it!',
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewPage extends StatelessWidget {
  final double? ratingValue1;
  final double? ratingValue2;
  final double? ratingValue3;
  final String review;

  const ReviewPage({
    super.key,
    required this.ratingValue1,
    required this.ratingValue2,
    required this.ratingValue3,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thank You for your Review!',
              style: TextStyle(
                fontWeight: FontWeight.bold, // Bold the text
                fontSize: 20, // Optional: Adjust the font size as needed
              ),
            ),
            Text('Booking Experience Rating: ${ratingValue1 ?? 'Not rated'}'),
            Text('Wedding Package Rating: ${ratingValue2 ?? 'Not rated'}'),
            Text('Menu Rating: ${ratingValue3 ?? 'Not rated'}'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Review: $review'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: const Text('Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
