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
  bool isLocallyStored;
  String url;

  Song(
      {this.songID,
      this.genre,
      this.artist,
      this.name,
      this.album,
      this.url,
      this.isLocallyStored});
}

class OnlineSong extends Song {
//  final String url;

  OnlineSong({
    String songID,
    String name,
    Genre genre,
    Artist artist,
    Album album,
    String url,
  }) : super(
          isLocallyStored: false,
          url: url,
          songID: songID,
          name: name,
          album: album,
          artist: artist,
          genre: genre,
        );
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
          isLocallyStored: true,
          songID: songID,
          name: name,
          genre: genre,
          artist: artist,
          album: album,
        ){this.encryptedSong = url;}

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
