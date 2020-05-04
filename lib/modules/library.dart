import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cadenza/modules/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Library extends ChangeNotifier {
  User user;
  List<Song> songs = [];
  bool songsReady = false;
  List<Album> albums = [];
  bool albumsReady = false;
  List<Playlist> playlists = [];
  List<Genre> genres = [];
  bool genresReady = false;
  List<Artist> artists = [];
  bool artistsReady = false;

  Library();

  void initialzieSongsFromOnline(DocumentSnapshot onlineLibrarySnapshot) {
    for (String key in onlineLibrarySnapshot.data['songs'].keys) {
      var songMap = onlineLibrarySnapshot.data['songs'][key];
      songs.add(OnlineSong(
        songID: key,
        name: songMap['songName'],
        albumTitle: songMap['albumName'],
        genreName: songMap['genreName'],
        artistName: songMap['artistName'],
        url: songMap['songURL'],
        albumRef: songMap['albumRef'],
        artistRef: songMap['artistRef'],
        albumArtURL: songMap['albumArtURL'],
        timesPlayed: songMap['timesPlayed'],
        lastPlayed: songMap['lastPlayed'],
      ));
    }
    songsReady = true;
  }

  Future<void> fetchAlbums() async {
    List<DocumentReference> albumRefs = [];
    for (Song song in songs) {
      if (!albumRefs.contains(song.albumRef)) albumRefs.add(song.albumRef);
    }
    for (DocumentReference ref in albumRefs) {
      DocumentSnapshot albumSnapshot = await ref.get();
      Map<String, dynamic> album = albumSnapshot.data;
      albums.add(Album(
        albumID: albumSnapshot.documentID,
        albumName: album['title'],
        albumArtImageUrl: album['albumArtURL'],
        artistName: album['artistName'],
        artistRef: album['artistRef'],
        albumRef: ref,
        genreName: album['genreName'],
        albumSongs: [],
        isSnippet: true,
      ));
    }
    albumsReady = true;
  }

  Future<void> fetchArtists() async {
    List<DocumentReference> artistRefs = [];
    for (Song song in songs) {
      if (!artistRefs.contains(song.artistRef)) artistRefs.add(song.artistRef);
    }
    for (DocumentReference ref in artistRefs) {
      DocumentSnapshot artistSnapshot = await ref.get();
      Map<String, dynamic> artist = artistSnapshot.data;
      artists.add(Artist(
        username: artist['username'],
        profilePictureURL: artist['profilePictureURL'],
        uid: artistSnapshot.documentID,
        songsCount: songs.where((s) {
          if (s.artistRef == ref) return true;
          return false;
        }).length,
      ));
    }
    artistsReady = true;
  }

  Future<void> fetchGenres() async {
    List<String> genreNames = [];
    for (Song song in songs) {
      if (!genreNames.contains(song.genreName)) genreNames.add(song.genreName);
    }
    for (String name in genreNames) {
      QuerySnapshot genreQuery = await Firestore.instance
          .collection("genres")
          .where("name", isEqualTo: name)
          .getDocuments();
      DocumentSnapshot genreSnapshot = genreQuery.documents[0];
      Map<String, dynamic> genre = genreSnapshot.data;
      genres.add(Genre(
        genreName: genre['name'],
        genreImageUrl: genre['imageURL'],
        genreID: genreSnapshot.documentID,
      ));
    }
    genresReady = true;
  }
}
