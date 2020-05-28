import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theidiotbox/models/movies.dart';
import 'package:theidiotbox/models/movie_info.dart';

//const API_KEY = "f3ccb078";
//const API_URL = "http://www.omdbapi.com/?i=tt3896198&apikey=f3ccb078";

Future<List<Movie>> search(keyword) async {
//  final response = await http.get('$API_URL$API_KEY&s=$keyword');
  final url = "http://www.omdbapi.com/?s=$keyword&apikey=f3ccb078";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final body = jsonDecode( response.body );
    final Iterable json = body["Search"];
    return json.map( (item) => Movie.fromJson( item ) ).toList( );
//    Map data = json.decode(response.body);
//
//    if (data['Response'] == "True") {
//      var list = (data['Search'] as List)
//          .map((item) => Movie.fromJson(item))
//          .toList();
//      return list;
//    } else {
//      throw Exception(data['Error']);
//    }
  } else {
    throw Exception( 'Something went wrong!' );
  }
}

Future<MovieInfo> getMovie(movieId) async {
//  final response = await http.get('$API_URL$API_KEY&i=$movieId');
  final url = "http://www.omdbapi.com/?s=$movieId&apikey=f3ccb078";
  final response = await http.get( url );

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
      return MovieInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}