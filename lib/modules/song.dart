import 'dart:typed_data';

import 'package:cadenza/modules/Album.dart';
import 'package:flutter/services.dart';

import 'artist.dart';
import 'genre.dart';

class Song {

  final String name;
  final Album album;
  int playtime;
  final String artistName;
  final String url;

  Song({this.name, this.album, this.artistName, this.url});
}

class OfflineSong extends Song {
  final String songID;
  final Genre genre;
  final Artist artist;

  final String decryptionKey;
  final ByteBuffer encryptedSong;

  OfflineSong({String name,Album album,this.songID, this.genre, this.artist, this.decryptionKey, this.encryptedSong}) :super(name: name,album:album,artistName:artist.username);


  Map<String, dynamic> toMap() {
    return {
      "songID": songID,
      "songName": name,
      "songAlbum": album.albumID,
      "songGenre": genre.genreID,
      "artiest": artist.username,
      "decryptionKey": decryptionKey,
      "encryptedSong": storeEncryptedSong(),
    };
  }

  String storeEncryptedSong() {
    //TODO: should store the encrypted song and return the name file at the local storage
    return "not implemnted";
  }
}
