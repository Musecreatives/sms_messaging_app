// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sms_messaging_app/data/models/message/message.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  static const String tableName = 'drafts';

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'drafts_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(db, version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        message TEXT,
        sender TEXT,
        time TEXT
      )
    ''');
  }

  Future<void> insertDraft(UserMessage? userMessage) async {
    final Database db = await database;
    //return
    await db.insert(tableName, userMessage!.toJson());
  }

  Future<List<Map<String, dynamic>>> getDrafts() async {
    final Database db = await database;
    if (_database == null) {
      throw Exception('Database has not been initialized');
    }

    return await db.query(tableName, orderBy: 'id DESC');
  }

// update draft feature
  Future<void> updateDraft(UserMessage userMessage) async {
    final Database db = await database;
    // return
    await db.rawUpdate(
      '''UPDATE $tableName
        SET message = ?
        WHERE id = ?;
        ''',
      [userMessage.message, userMessage.id],
    );
  }

// delete oldest drafts feature
  Future<int> deleteOldestDrafts(int numberOfDraftsToDelete) async {
    final Database db = await database;
    final List<Map<String, dynamic>> drafts = await getDrafts();

    int draftsDeleted = 0;

    for (int i = 0; i < numberOfDraftsToDelete && i < drafts.length; i++) {
      final int draftId = drafts[i]['id'];
      final int deleted =
          await db.delete('drafts', where: 'id = ?', whereArgs: [draftId]);
      draftsDeleted += deleted;
    }

    return draftsDeleted;
  }
}
