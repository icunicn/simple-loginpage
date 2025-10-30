import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../models/user_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _db;

  Database? get database => _db;

  Future<void> initDB() async {
    if (_db != null) return;
    final docs = await getApplicationDocumentsDirectory();
    final dbPath = path.join(docs.path, 'app_db.db');
    print('Database path: $dbPath');
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

  Future<String> getDatabasePath() async {
    final docs = await getApplicationDocumentsDirectory();
    return path.join(docs.path, 'app_db.db');
  }

  Future<File?> exportDatabase() async {
    if (_db == null) return null;
    final dbPath = await getDatabasePath();
    final dbFile = File(dbPath);

    if (await dbFile.exists()) {
      final externalDir = await getExternalStorageDirectory();
      if (externalDir != null) {
        final exportPath = path.join(externalDir.path, 'exported_app_db.db');
        await dbFile.copy(exportPath);
        print('Database exported to: $exportPath');
        return File(exportPath);
      }
    }
    return null;
  }
}
