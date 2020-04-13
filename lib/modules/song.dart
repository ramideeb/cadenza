import 'dart:typed_data';
import 'package:cadenza/modules/Album.dart';
import 'package:flutter/services.dart';

import 'artist.dart';
import 'genre.dart';

class Song {
  final String songID;
  final Genre genre;
  final Artist artist;
  final String name;
  final Album album;
  int playtime;

  //TODO: temp remove it
   String url;

  Song({this.songID, this.genre, this.artist, this.name, this.album});
}

class OnlineSong extends Song {
  final String url;

  OnlineSong(
      {String songID,
      String name,
      Genre genre,
      Artist artist,
      Album album,
      this.url})
      : super(
          songID: songID,
          name: name,
          album: album,
          artist: artist,
          genre: genre,
        );
}

class OfflineSong extends Song {
  final String decryptionKey;
  final ByteBuffer encryptedSong;

  OfflineSong(
      {String name,
      Album album,
      String songID,
      Genre genre,
      Artist artist,
      this.decryptionKey,
      this.encryptedSong})
      : super(
          songID: songID,
          name: name,
          genre: genre,
          artist: artist,
          album: album,
        );

  Map<String, dynamic> toMap() {
    return {
      "songID": songID,
      "songName": name,
      "songAlbum": album.albumID,
      "songGenre": genre.genreID,
      "artist": artist.uid,
      "decryptionKey": decryptionKey,
      "encryptedSong": "ffffff",
    };
  }

  String storeEncryptedSong() {
    //TODO: should store the encrypted song and return the name file at the local storage
    return "not implemnted";
  }
  @override
  String toString() {
    return 'song{id: $songID, name: $name,}';
  }
}
