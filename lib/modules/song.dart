import 'dart:typed_data';
import 'package:cadenza/modules/Album.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'artist.dart';
import 'genre.dart';

class Song {
  String songID;
  Genre genre;
  Artist artist;
  String name;
  Album album;
  String url;
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
      this.isDownloaded,
      this.url,
      this.albumArtURL,
      this.timesPlayed,
      this.lastPlayed});
}

class OnlineSong extends Song {
  String genreName;
  String artistName;
  String albumTitle;
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
    this.artistName,
    this.genreName,
    this.albumTitle,
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
      "encryptedSong": storeEncryptedSong(),
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
