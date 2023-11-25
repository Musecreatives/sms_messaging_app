// database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

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

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE drafts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        message TEXT,
        sender TEXT,
        time TEXT
      )
    ''');
  }

  Future<int> insertDraft(Map<String, dynamic> draft) async {
    final Database db = await database;
    return await db.insert('drafts', draft);
  }

  Future<List<Map<String, dynamic>>> getDrafts() async {
    final Database db = await database;
    return await db.query('drafts', orderBy: 'id DESC');
  }

// update draft feature
  Future<int> updateDraft(int draftId, String newMessage) async {
    final Database db = await database;
    return await db.rawUpdate(
      '''UPDATE drafts
        SET message = ?
        WHERE id = ?''',
       [newMessage, draftId],
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
