import 'dart:convert';

import 'package:http/http.dart' as restHttp;
import 'package:myapp2/game.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GameService {
  //REST API
  Future<List<Game>> getGames() async {
    List<Game> games = [];
    var url = Uri.parse(
      "https://free-to-play-games-database.p.rapidapi.com/api/games",
    );
    var headers = {
      "x-rapidapi-key": "7d98ada9eemsh351d96e8abec8c7p1d226ejsnf1ba48755afc",
      "x-rapidapi-host": "free-to-play-games-database.p.rapidapi.com",
    };
    await restHttp.get(url,headers:headers).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        for (var game in data) {
          games.add(Game(game['thumbnail'], game['title'], 200));
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    });
    return games;
  }

  //local
  Future<void> saveGame(Game game) async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, 'fm.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
        CREATE TABLE game (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          image TEXT,
          name TEXT,
          price INTEGER
        )
      ''');
      },
    );
    await database.transaction((tx) async {
      await tx.rawInsert(
        "INSERT INTO game (image, name, price) VALUES (?, ?, ?)",
        [game.image, game.name, game.price],
      );
      print("Game added");
    });
    database.close();
  }

  Future<List<Game>> getAllGames() async {
    List<Game> games = [];
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, 'fm.db');
    Database database = await openDatabase(path, version: 1);
    await database.transaction((tx) async {
      List<Map> maps = await tx.rawQuery("SELECT * FROM game");
      for (var map in maps) {
        games.add(Game(map['image'], map['name'], map['price']));
      }
    });
    database.close();
    return games;
  }
}
