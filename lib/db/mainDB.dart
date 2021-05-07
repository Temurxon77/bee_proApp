import 'dart:io';

import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

Database db;
class Genres {
  int genresId;
  String Name;
  Genres({this.genresId,this.Name});

  Genres.fromJson(Map<String,dynamic> json){
    this.genresId = json['GenreId'];
    this.Name = json['Name'];
  }
}
class DatabaseCreator {
  Future<void> initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "chinook.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "db/chinook.db"));
      List<int> bytes =  data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    db = await openDatabase(path,version:1,readOnly: false);
    final data = await db.rawQuery("SELECT * FROM genres");
    List<Genres> genres = List();
    for(final node in data){
      final todo = Genres.fromJson(node);
      genres.add(todo);
    }
    print(genres[0].Name);
// open the database
    //db = await openDatabase(path);
  }
}

