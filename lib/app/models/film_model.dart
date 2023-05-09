// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FilmModel {
  final String title;
  final int vote_count;
  final double popularity;

  FilmModel(
    this.title,
    this.vote_count,
    this.popularity,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'vote_count': vote_count,
      'popularity': popularity,
    };
  }

  factory FilmModel.fromMap(Map<String, dynamic> map) {
    return FilmModel(
      map['title'] as String,
      map['vote_count'] as int,
      map['popularity'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmModel.fromJson(String source) =>
      FilmModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
