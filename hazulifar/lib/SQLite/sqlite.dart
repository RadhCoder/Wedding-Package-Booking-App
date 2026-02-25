import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:hazulifar/model/admin.dart';
import 'package:hazulifar/model/user.dart';
import 'package:hazulifar/model/weddingbook.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  final String databaseName = "hazulifar.db";

  final String users = '''
          CREATE TABLE users (
            userid INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            phone INTEGER,
            username TEXT,
            password TEXT
          )
        ''';

  final String weddingbook = '''
          CREATE TABLE weddingbook (
            bookid INTEGER PRIMARY KEY AUTOINCREMENT,
            userid INTEGER,
            bookdate DATE,
            booktime TIME,
            eventdate DATE,
            eventtime TIME,
            weddingpackage TEXT,
            numguest INTEGER,
            packageprice DOUBLE
          )
        ''';

  final String admin = '''
          CREATE TABLE administrator (
            adminid INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT
          )
        ''';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      await db.execute(weddingbook);
      await db.execute(admin);
    });
  }

  //user methods
  Future<int> signup(User user) async {
    final db = await database;
    return await db.insert(
      'users',
      {
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'username': user.username,
        'password': user.password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> login(User user) async {
    final Database db = await database;
    var result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [user.username, user.password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<int> updateUser(User user) async {
    final Database db = await database;
    return db.update('users', user.toMap(),
        where: 'userid = ?', whereArgs: [user.userid]);
  }

  Future<int> deleteUser(int? userId) async {
    final Database db = await database;
    return db.delete('users', where: 'userid = ?', whereArgs: [userId]);
  }

  Future<User?> getUserById(int userId) async {
    final Database db = await database;
    var result =
        await db.query('users', where: 'userid = ?', whereArgs: [userId]);
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  //Method to fetch all users from the database
  Future<List<Map<String, dynamic>>> getAllUsersWithWeddingBook() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT u.*, wb.* 
    FROM users u 
    LEFT JOIN weddingbook wb ON u.userid = wb.userid
  ''');
    return results;
  }

  // Admin methods
  Future<int> signupAdmin(Admin admin) async {
    final Database db = await database;
    return db.insert('administrator', admin.toMap());
  }

  Future<bool> loginAdmin(Admin admin) async {
    final Database db = await database;
    var result = await db.rawQuery(
        "SELECT * FROM administrator WHERE username = ? AND password = ?",
        [admin.username, admin.password]);
    return result != null && result.isNotEmpty;
  }

  Future<int> updateAdmin(Admin admin) async {
    final Database db = await database;
    return db.update('administrator', admin.toMap(),
        where: 'adminid = ?', whereArgs: [admin.adminid]);
  }

  Future<int> deleteAdmin(int adminid) async {
    final Database db = await database;
    return db.delete('admins', where: 'adminid = ?', whereArgs: [adminid]);
  }

  Future<Admin?> getAdminById(int adminid) async {
    final Database db = await database;
    var result = await db
        .query('administrator', where: 'adminid = ?', whereArgs: [adminid]);
    if (result.isNotEmpty) {
      return Admin.fromMap(result.first);
    }
    return null;
  }

  // WeddingBook methods

  Future<int> createBooking(WeddingBook weddingbook, User user) async {
    final Database db = await database;
    int insertedBookings = 0;

    WeddingBook newBooking = WeddingBook(
      userId: user.userid!, // Assuming userid is not nullable
      bookDate: weddingbook.bookDate,
      bookTime: weddingbook.bookTime,
      eventDate: weddingbook.eventDate,
      eventTime: weddingbook.eventTime,
      weddingPackage: weddingbook.weddingPackage,
      packagePrice: weddingbook.packagePrice,
      numberOfPeople: weddingbook.numberOfPeople,
      packageType: weddingbook.packageType,
      menuPackage: weddingbook.menuPackage,
      menuPackage2: weddingbook.menuPackage2,
      additionalRequests: weddingbook.additionalRequests,
    );

    int result = await db.insert('weddingbook', newBooking.toMap());
    if (result > 0) {
      insertedBookings++;
    }
    return insertedBookings;
  }

  Future<int> updateBooking(WeddingBook weddingbook) async {
    final Database db = await database;
    return db.update('weddingbook', weddingbook.toMap(),
        where: 'bookId = ?', whereArgs: [weddingbook.bookId]);
  }

  Future<int> deleteBooking(int bookId) async {
    final Database db = await database;
    return db.delete('weddingbook', where: 'bookId = ?', whereArgs: [bookId]);
  }

  Future<List<Map<String, dynamic>>> getAllBookings() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query('weddingbook');
    return results;
  }

  // Inside the DatabaseHelper class

  Future<List<Map<String, dynamic>>> getAllBookingsForUser(
      String username) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery('''
    SELECT * FROM weddingbook 
    WHERE userid IN (SELECT userid FROM users WHERE username = ?)
  ''', [username]);
    return results;
  }
}
