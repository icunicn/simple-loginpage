import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../models/user_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _db;

  Future<void> initDB() async {
    if (_db != null) return;
    final docs = await getApplicationDocumentsDirectory();
    final dbPath = path.join(docs.path, 'app_db.db');
    _db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL UNIQUE,
        passwordHash TEXT NOT NULL,
        salt TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(UserModel user) async {
    return await _db!.insert('users', user.toMap());
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final res =
        await _db!.query('users', where: 'email = ?', whereArgs: [email]);
    if (res.isEmpty) return null;
    return UserModel.fromMap(res.first);
  }
}
