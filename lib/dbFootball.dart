import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tugas_list_view/favorite.dart';

class FootballDatabase {
  static final FootballDatabase instance = FootballDatabase.init();

  static Database? _database;

  FootballDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('football.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // create database
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    // creating table
    await db.execute('''
    CREATE TABLE ${FootballFields.favorite_team}(
    ${FootballFields.id} $idType,
    ${FootballFields.title} $textType,
    ${FootballFields.teambadge} $textType
    )
    ''');
  }

  // add data into dqatabase
  Future<int> create(PremierLeagueFootballFav model) async {
    Database db = await instance.database;
    final query = await db.insert(FootballFields.favorite_team, model.toMap());

    return query;
  }

  // to read and dsiplay the data from database
  Future<List<PremierLeagueFootballFav>> readAll() async {
    Database db = await instance.database;

    final data = await db.query(FootballFields.favorite_team);
    List<PremierLeagueFootballFav> result =
        data.map((e) => PremierLeagueFootballFav.fromMap(e)).toList();

    return result;
  }

  Future<bool> read(String? title) async {
    final db = await instance.database;

    final maps = await db.query(
      FootballFields.favorite_team,
      columns: FootballFields.values,
      where: '${FootballFields.title} = ?',
      whereArgs: [title],
    );

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  delete(String namateam) async {
    Database db = await instance.database;

    await db.delete(FootballFields.favorite_team,
        where: "${FootballFields.title} = ?", whereArgs: [namateam]);
  }

  // to delete data from database
  deleteTable(String table) async {
    Database db = await instance.database;

    await db.execute("DROP TABLE IF EXSIST $table");
  }
}
