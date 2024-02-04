import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { work, entertainment, sports, study,shopping,travel}

const categoryIcons = {
  Category.entertainment : Icons.music_video_outlined,
  Category.shopping : Icons.shop_2_outlined,
  Category.sports : Icons.sports_soccer_outlined,
  Category.work : Icons.work_outline,
  Category.study : Icons.library_books_outlined,
  // Category.workout : Icons.sports_gymnastics_outlined,
  Category.travel : Icons.flight_takeoff_outlined
};

class ToDo{
  ToDo({
    required this.title,
    required this.category,
    required this.date
  });

  final String title;
  final Category category;
  final DateTime date;

  String get formattedDate{
  return formatter.format(date);
}
}