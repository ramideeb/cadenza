import 'package:cadenza/modules/Album.dart';
import 'package:cadenza/modules/artist.dart';
import 'package:cadenza/modules/genre.dart';
import 'package:cadenza/modules/playlist.dart';
import 'package:cadenza/modules/song.dart';
import 'package:cadenza/modules/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Library extends ChangeNotifier{
  User user;
  List<Song> songs=[];
  Map<String,Album> albums={};
  List<Playlist> playlists=[];
  List<Genre> genres=[];
  List<Artist> artists=[];

  Library();
  
  void initialzieSongsFromOnline(DocumentSnapshot onlineLibrarySnapshot){
    for(String key in onlineLibrarySnapshot.data['songs'].keys){
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
  }
}