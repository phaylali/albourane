import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class Article {
  Article({
    required this.title,
    required this.content,
    required this.thumbnail,
    required this.date,
    required this.url,
  });

  Article.fromJson(
    Map<String, Object?> json,
  ) : this(
            url: json['url']! as String,
            content: json['content']! as String,
            title: json['title']! as String,
            thumbnail: json['thumbnail']! as String,
            date: json['date']! as String);

  final String content;
  final String title;
  final String thumbnail;
  final String date;
  final String url;

  Map<String, Object?> toJson() {
    return {
      'content': content,
      'title': title,
      'thumbnail': thumbnail,
      'date': date,
      'url': url
    };
  }
}
