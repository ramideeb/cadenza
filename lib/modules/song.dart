import 'dart:io';
import 'dart:typed_data';
import 'package:aes_crypt/aes_crypt.dart';
import 'package:cadenza/modules/Album.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'artist.dart';
import 'genre.dart';

class Song {
  String songID;
  Genre genre;
  String genreName;
  Artist artist;
  String artistName;
  String name;
  Album album;
  String albumTitle;
  String url;
  String actualURL;
  bool urlReady = false;
  bool gettingURL = false;
  String albumArtURL;
  int timesPlayed;
  bool isDownloaded;
  Timestamp lastPlayed;

  Song(
      {this.songID,
      this.genre,
      this.artist,
      this.name,
      this.album,
      this.artistName,
      this.genreName,
      this.albumTitle,
      this.isDownloaded,
      this.url,
      this.albumArtURL,
      this.timesPlayed,
      this.lastPlayed});

  Future<dynamic> getActualURL() async {
    print("Wrong class");
    return null;
  }
}

class OnlineSong extends Song {
  DocumentReference albumRef;
  DocumentReference artistRef;

  OnlineSong({
    String songID,
    String name,
    Genre genre,
    Artist artist,
    Album album,
    String url,
    String albumArtURL,
    Timestamp lastPlayed,
    int timesPlayed,
    String artistName,
    String genreName,
    String albumTitle,
    this.albumRef,
    this.artistRef,
  }) : super(
            songID: songID,
            name: name,
            album: album,
            artist: artist,
            genre: genre,
            url: url,
            albumArtURL: albumArtURL,
            lastPlayed: lastPlayed,
            timesPlayed: timesPlayed,
            albumTitle: albumTitle,
            genreName: genreName,
            artistName: artistName);
  @override
  Future<dynamic> getActualURL() async {
    return FirebaseStorage.instance.ref().child(url).getDownloadURL();
  }
}

class OfflineSong extends Song {
  final String decryptionKey;
  String encryptedSong;

  OfflineSong({
    String name,
    String url,
    Album album,
    String songID,
    Genre genre,
    Artist artist,
    this.decryptionKey,
  }) : super(
          url: url,
          songID: songID,
          name: name,
          genre: genre,
          artist: artist,
          album: album,
        ) {
    this.encryptedSong = url;
  }
  static String  decryptSong(
      Map<dynamic,dynamic> map) {
    String id = map['id'];
    String ecryptedFilePath = map['encryptedFilePath'];
    String decryptedFilePath = map['decryptedFilePath'];
    AesCrypt crypt = AesCrypt();
    crypt.setPassword(id);
    crypt.setOverwriteMode(AesCryptOwMode.on);
    return crypt.decryptFileSync(ecryptedFilePath, decryptedFilePath);
  }

  Map<String, dynamic> toMap() {
    return {
      "songID": songID,
      "songName": name,
      "songAlbum": album.albumID,
      "songGenre": genre.genreID,
      "artist": artist.uid,
      "decryptionKey": decryptionKey,
      "encryptedSong": encryptedSong,
    };
  }

  @override
  Future<String> getActualURL() async{
    Directory cacheDir = await getTemporaryDirectory();
    String cachePath = cacheDir.path;
    String fileName = "$name.mp3";
    String decryptedFilePath = "$cachePath/$fileName";
    String encrpytedFilePath = url;
    String key = songID;
    Map<dynamic,dynamic> map={
      "id":key,
      "encryptedFilePath":encrpytedFilePath,
      "decryptedFilePath":decryptedFilePath
    };
    return compute(decryptSong,map);
  }
  String storeEncryptedSong() {
    //TODO: should store the encrypted song and return the name file at the local storage
    //TODO: it should return the encrypted song name at the file system
    return "not implemnted";
  }

  @override
  String toString() {
    return 'song{id: $songID, name: $name,}';
  }
}
