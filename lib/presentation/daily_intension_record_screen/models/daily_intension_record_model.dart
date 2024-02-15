import 'package:cloud_firestore/cloud_firestore.dart';

/// This class defines the variables used in the [daily_intension_record_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DailyIntentionModel {
  String tags,title,videoUrl;
  Timestamp date;

  DailyIntentionModel({
    required this.tags,
    required this.title,
    required this.videoUrl,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'tags': this.tags,
      'title': this.title,
      'videoUrl': this.videoUrl,
      'date': this.date,
    };
  }

  factory DailyIntentionModel.fromMap(Map<String, dynamic> map) {
    return DailyIntentionModel(
      tags: map['tags'] as String,
      title: map['title'] as String,
      videoUrl: map['videoUrl'] as String,
      date: map['date'] as Timestamp,
    );
  }
}
