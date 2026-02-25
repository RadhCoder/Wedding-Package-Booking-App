import 'dart:convert';

class WeddingBook {
  final int? bookId;
  final int userId;
  final String bookDate;
  final String bookTime;
  final String eventDate;
  final String eventTime;
  final List<String> weddingPackage;
  final int numberOfPeople;
  final double packagePrice;
  final String packageType;
  final String menuPackage;
  final String? menuPackage2;
  final String? additionalRequests;

  WeddingBook({
    this.bookId,
    required this.userId,
    required this.bookDate,
    required this.bookTime,
    required this.eventDate,
    required this.eventTime,
    required this.weddingPackage,
    required this.numberOfPeople,
    required this.packagePrice,
    required this.packageType,
    required this.menuPackage,
    this.menuPackage2,
    this.additionalRequests,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'userId': userId,
      'bookDate': bookDate,
      'bookTime': bookTime,
      'eventDate': eventDate,
      'eventTime': eventTime,
      'weddingPackage': weddingPackage,
      'numberOfPeople': numberOfPeople,
      'packagePrice': packagePrice,
      'packageType': packageType,
      'menuPackage': menuPackage,
      'menuPackage2': menuPackage2,
      'additionalRequests': additionalRequests,
    };
  }

  factory WeddingBook.fromMap(Map<String, dynamic> map) {
    return WeddingBook(
      bookId: map['bookId'],
      userId: map['userId'],
      bookDate: map['bookDate'],
      bookTime: map['bookTime'],
      eventDate: map['eventDate'],
      eventTime: map['eventTime'],
      weddingPackage: List<String>.from(map['weddingPackage']),
      numberOfPeople: map['numberOfPeople'],
      packagePrice: map['packagePrice'],
      packageType: map['packageType'],
      menuPackage: map['menuPackage'],
      menuPackage2: map['menuPackage2'],
      additionalRequests: map['additionalRequests'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeddingBook.fromJson(String source) => WeddingBook.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeddingBook(bookId: $bookId, userId: $userId, bookDate: $bookDate, bookTime: $bookTime, eventDate: $eventDate, eventTime: $eventTime, weddingPackage: $weddingPackage, numberOfPeople: $numberOfPeople, packagePrice: $packagePrice, packageType: $packageType, menuPackage: $menuPackage, menuPackage2: $menuPackage2, additionalRequests: $additionalRequests)';
  }
}
