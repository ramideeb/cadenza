class Genre{
  final String genreID;
  final String genreName;
  final String genreImageUrl;


  Genre({this.genreID, this.genreImageUrl, this.genreName});

  Map<String,dynamic> toMap(){
    return{
      "genreID": genreID,
      "genreName": genreName,
      "genreImageUrl": genreImageUrl,
    };
  }
}