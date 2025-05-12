import 'dart:convert';

import 'package:http/http.dart' as resthttp;
import 'package:myapp2/game.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GameService {
  //REST API
  Future<List<Game>> getGames() async {
  try {
    final url = Uri.parse("https://free-to-play-games-database.p.rapidapi.com/api/games");
    final headers = {
      "x-rapidapi-key": "7d98ada9eemsh351d96e8abec8c7p1d226ejsnf1ba48755afc",
      "x-rapidapi-host": "free-to-play-games-database.p.rapidapi.com",
    };

    final response = await resthttp.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((game) => Game(
        game['thumbnail'] ?? '', 
        game['title'] ?? 'Unknown', 
        200
      )).toList();
    } else {
      print("Error: ${response.statusCode}");
      throw Exception('Failed to load games: ${response.statusCode}');
    }
  } catch (e) {
    print("Exception: $e");
    throw Exception('Failed to load games: $e');
  }
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
    await database.close();
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
    await database.close();
    return games;
  }
}
