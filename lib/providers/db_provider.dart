import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static final DbProvider _instance = DbProvider._internal();
  Database? _database;

  factory DbProvider() {
    return _instance;
  }

  DbProvider._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await initDB();
  }

  initDB() async {
    String path = join(await getDatabasesPath(), "clickdeliverus.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    // TODO: implement chat scheme
    String chatQuery = '''''';

    await db.execute(chatQuery);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // temp
    if (newVersion == 2) {
      // Modify scheme
      await db.execute("DROP TABLE ");

      String chatQuery = '''''';

      await db.execute(chatQuery);
    } else if (newVersion == 4) {
      // Delete all rows
      await db.execute("DELETE FROM ");
    }
  }
}
