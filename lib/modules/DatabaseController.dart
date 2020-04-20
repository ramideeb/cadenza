
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Album.dart';
import 'FileHandler.dart';
import 'genre.dart';
import 'artist.dart';
import 'playlist.dart';
import 'song.dart';

class DatabaseController {
  static Database _database;
  static FileHandler _fileHandler;

  static Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  static FileHandler get fileHandler {
    if (_fileHandler == null) {
      _fileHandler = FileHandler();
    }
    return _fileHandler;
  }

  static Database ret() => _database;

  static initializeDatabase() {
    return openDatabase(
      join(getDatabasesPath().toString(), 'local_database.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE OfflineSong (songID TEXT PRIMARY KEY, songName TEXT, songAlbum TEXT, songGenre TEXT, artist TEXT , decryptionKey TEXT , encryptedSong TEXT )");
        db.execute(
            "CREATE TABLE Album (albumID TEXT , albumName TEXT, artist TEXT, albumArtImageUrl TEXT, PRIMARY KEY (albumID))");
        db.execute(
            "CREATE TABLE Genre (genreID TEXT PRIMARY KEY, genreName TEXT, genreImageUrl TEXT)");

        db.execute("CREATE TABLE Artist (uid TEXT PRIMARY KEY, username TEXT)");
        return db.execute(
            "CREATE TABLE Playlist (playlistId TEXT, songID TEXT, PlaylistName TEXT, description TEXT, imageUrl TEXT, PRIMARY KEY (playlistId, songID))");
      },
    );
  }

  static Future<void> insertArtist(Artist artist) async {
    final Database db = await database;
    await db.insert(
      'Artist',
      artist.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertSong(OfflineSong offlineSong) async {
    insertAlbum(offlineSong.album);
    insertGenre(offlineSong.genre);
    insertArtist(offlineSong.artist);
    final Database db = await database;

    await db.insert(
      'OfflineSong',
      offlineSong.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertAlbum(Album album) async {
    final Database db = await database;
    await db.insert(
      'Album',
      album.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertGenre(Genre genre) async {
    final Database db = await database;

    await db.insert(
      'Genre',
      genre.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertPlaylist(Playlist playlist) async {
    final Database db = await database;

    playlist.toMap().forEach((f) {
      db.insert(
        "Playlist",
        f,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  static Future<List<Album>> getAlbum({String albumID, Artist artist}) async {
    final Database db = await database;

    final List<Artist> artists = await getArtist();

    List<Map<String, dynamic>> maps;
    if (albumID != null) {
      maps =
          await db.query('Album', where: "albumID = ?", whereArgs: [albumID]);
    } else if (artist != null) {
      maps =
          await db.query('Album', where: "artist = ?", whereArgs: [artist.uid]);
    } else {
      maps = await db.query(
        'Album',
        orderBy: "albumID",
      );
    }

    return List.generate(maps.length, (i) {
      return Album(
        albumID: maps.elementAt(i)["albumID"],
        albumName: maps.elementAt(i)["albumName"],
        albumArtImageUrl: maps.elementAt(i)["albumArtImageUrl"],
        artist: artists.elementAt(
            artists.indexWhere((art) => art.uid == maps[i]['artist'])),
      );
    });
  }

  static Future<List<Genre>> getGenre({String genreID}) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = (genreID == null)
        ? await db.query(
            'Genre',
          )
        : await db.query('Genre', where: "albumID = ?", whereArgs: [genreID]);

    print(maps);
    return List.generate(maps.length, (i) {
      return Genre(
        genreID: maps.elementAt(i)["genreID"],
        genreImageUrl: maps.elementAt(i)["genreImageUrl"],
        genreName: maps.elementAt(i)["genreName"],
      );
    });
  }

  static Future<List<Artist>> getArtist({String uid}) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = (uid == null)
        ? await db.query('Artist')
        : await db.query('Artist', where: "uid = ?", whereArgs: [uid]);
    return List.generate(maps.length, (i) {
      return Artist(
        uid: maps.elementAt(i)["uid"],
        username: maps.elementAt(i)["username"],
      );
    });
  }

  static Future<List<Song>> getOfflineSong(
      {String artistID, String genreID, String albumID}) async {
    final Database db = await database;
    List<Album> albums = await getAlbum();
    List<Genre> genres = await getGenre();
    List<Artist> artist = await getArtist();

    List<Map<String, dynamic>> maps; //= await _database.query('OfflineSong');

    if (artistID != null)
      maps = await db
          .query('OfflineSong', where: "artist = ?", whereArgs: [artistID]);
    else if (genreID != null)
      maps = await db
          .query('OfflineSong', where: "songGenre = ?", whereArgs: [genreID]);
    else if (albumID != null)
      maps = await db
          .query('OfflineSong', where: "songAlbum = ?", whereArgs: [albumID]);
    else
      maps = await db.query('OfflineSong');

    return List.generate(maps.length, (i) {
      OfflineSong offlineSong = OfflineSong(
        songID: maps[i]['songID'],
        name: maps[i]['songName'],
        album: albums.elementAt(albums
            .indexWhere((album) => album.albumID == maps[i]['songAlbum'])),
        genre: genres.elementAt(genres
            .indexWhere((genre) => genre.genreID == maps[i]['songGenre'])),
        artist: artist.elementAt(
            artist.indexWhere((art) => art.uid == maps[i]['artist'])),
        decryptionKey: maps[i]['decryptionKey'],
      );
      return offlineSong;
    });
  }

  static Future<List<Playlist>> getPlayList({String playlistID}) async {
//    "CREATE TABLE Playlist (playlistId , songID TEXT, PlaylistName TEXT, description TEXT, imageUrl TEXT, PRIMARY KEY (playlistId, songID))");
    final Database db = await database;

    List<Song> songs = await getOfflineSong();
    final List<Map<String, dynamic>> maps = (playlistID == null)
        ? await db.query('Playlist', orderBy: "Playlist")
        : await db.query('Playlist',
            orderBy: "Playlist",
            where: "playlistId = ?",
            whereArgs: [playlistID]);

    List<Map<String, dynamic>> tempList;
    List<Playlist> toReturnPlaylist = new List<Playlist>();
    Playlist tempPlaylist;
    int tempLastIndex = 0;

    while (maps.isNotEmpty) {
      tempLastIndex = maps.lastIndexWhere(
          (string) => string["playlistId"] == maps[0]["playlistId"]);
      tempList = maps.sublist(0, tempLastIndex);
      tempPlaylist = Playlist(
        playlistId: maps.elementAt(0)["playlistId"],
        PlaylistName: maps.elementAt(0)["PlaylistName"],
        description: maps.elementAt(0)["description"],
        imageUrl: maps.elementAt(0)["imageUrl"],
      );
      while (tempList.isNotEmpty) {
        tempPlaylist.playlistSongs.add(songs.elementAt(
            songs.indexWhere((song) => song.songID == tempList[0]["songID"])));
        tempList.removeAt(0);
      }
      toReturnPlaylist.add(tempPlaylist);
      maps.removeRange(0, tempLastIndex);
    }
    return toReturnPlaylist;
  }

  static Future<void> deleteOfflineSong(
      {OfflineSong offlineSong, Album album}) async {
    final Database db = await database;
    if (offlineSong != null) {
      await db.delete(
        'OfflineSong',
        where: "songID = ?",
        whereArgs: [offlineSong.songID],
      );
    }
    if (album != null) {
      await db.delete(
        'OfflineSong',
        where: "songAlbum = ?",
        whereArgs: [album.albumID],
      );
    }
  }

  static Future<void> deleteAlbum(Album album) async {
    final Database db = await database;
    await db.delete(
      'Album',
      where: "albumID = ?",
      whereArgs: [album.albumID],
    );
  }

  static Future<void> deleteArtist(Artist artist) async {
    final Database db = await database;
    await db.delete(
      'Artist',
      where: "uid = ?",
      whereArgs: [artist.uid],
    );
  }

  static Future<void> deleteGenre(Genre genre) async {
    final Database db = await database;
    await db.delete(
      'Genre',
      where: "genreID = ?",
      whereArgs: [genre.genreID],
    );
  }

  static Future<void> deletePlaylist(Playlist playlist) async {
    final Database db = await database;
    await db.delete(
      'Playlist',
      where: "playlistId = ?",
      whereArgs: [playlist.playlistId],
    );
  }
}
