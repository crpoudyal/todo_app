import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = "todo.db";
  static final _dbVersion = 1;
  static Database _database = _database;

  static final _tableName = 'Task';
  static final _columnId = 'id';
  static final _columnTitle = 'title';
  static final _columnDescription = 'description';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    return db.execute('''
    CREATE TABLE $_tableName ($_columnId INTEGER PRIMARY KEY,$_columnTitle TEXT NOT NULL,$_columnDescription TEXT NOT NULL)
    ''');
  }

  Future<int> insertTask(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }
}
