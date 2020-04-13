

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Album.dart';
import 'genre.dart';
import 'playlist.dart';
import 'song.dart';

class DatabaseController {
  static Database _database;

  static Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  static initializeDatabase() {
    return openDatabase(
      join(getDatabasesPath().toString(), 'local_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE OfflineSong(songID TEXT PRIMARY KEY, songName TEXT, songAlbum TEXT, songGenre TEXT, artist TEXT , decryptionKey TEXT , encryptedSong TEXT );
        CREATE TABLE Album(albumID TEXT PRIMARY KEY, songID TEXT, albumName TEXT, artist TEXT, albumArtImageUrl TEXT);
        CREATE TABLE Genre(genreID TEXT PRIMARY KEY, genreName TEXT, genreImageUrl TEXT);
        CREATE TABLE Playlist(playlistId TEXT PRIMARY KEY, songID TEXT, PlaylistName TEXT, description TEXT, imageUrl TEXT);
        ''',
        );
      },
    );
  }

  static Future<void> insertSong(OfflineSong offlineSong) async {
    await _database.insert(
      'OfflineSong',
      offlineSong.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  static Future<void> insertAlbum(Album album) async {
    await _database.rawInsert(
        'INSERT INTO Album(albumID, songID, albumName, artist, albumArtImageUrl) VALUES(?, ?, ?, ?, ?)',
        album.toMap()
    );
  }
  static Future<void> insertGenre(Genre genre) async {
    await _database.insert(
      'Genre',
      genre.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  static Future<void> insertPlaylist(Playlist playlist) async {
    await _database.rawInsert(
        'INSERT INTO Album(playlistId, songID, PlaylistName, description, imageUrl) VALUES(?, ?, ?, ?, ?)',
        playlist.toMap()
    );
  }
  static Future<List<Song>> getOfflineSong() async {
    final List<Map<String, dynamic>> maps = await _database.query('OfflineSong');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      OfflineSong offlineSong = OfflineSong(
        songID: maps[i]['songID'],
        name: maps[i]['songName'],
//        album: maps[i]['songAlbum'],
//        name: maps[i]['songGenre'],
//        name: maps[i]['artist'],
        decryptionKey: maps[i]['decryptionKey'],
//        encryptedSong: maps[i]['encryptedSong'],
      );
      print(offlineSong);
      return offlineSong;
    });
  }
}
