import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../Model/UserModel.dart';

class DbHelper {
  static Database? _db;

  static const String DB_Name = 'roadread.db';
  static const int Version = 1;

  static const String Table_User = 'user';

  static const String C_UserID = 'UserID';
  static const String C_UserName = 'UserName';
  static const String C_UserEmail = 'UserEmail';
  static const String C_UserPassword = 'UserPassword';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();

    return _db;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID TEXT, "
        " $C_UserName TEXT, "
        " $C_UserEmail TEXT, "
        " $C_UserPassword TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
  }

  Future<UserModel> saveData(UserModel user) async {
    var dbClient = await db;
    user.userID = (await dbClient!.insert(Table_User, user.toMap())) as String;
    return user;
  }

  Future<UserModel?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userId' AND "
        "$C_UserPassword = '$password");

    if (res.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }
    return null;
  }
}
