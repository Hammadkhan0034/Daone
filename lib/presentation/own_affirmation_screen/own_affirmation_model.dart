import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OwnAffirmationModel{
  String affirmation,imageUrl;
  Timestamp date;
  TimeOfDay dateEnd, dateStart;
  int affirmationCount;

  OwnAffirmationModel({
    required this.affirmation,
    required this.imageUrl,
    required this.date,
    required this.dateEnd,
    required this.dateStart,
    required this.affirmationCount,
  });

  String get documentID=> date.millisecondsSinceEpoch.toString();

  Map<String, dynamic> toMap() {
    return {
      'affirmation': this.affirmation,
      'imageUrl': this.imageUrl,
      'date': this.date,
      'dateEnd': timeOfDayToFirebase(this.dateEnd),
      'dateStart': timeOfDayToFirebase(this.dateStart),
      'affirmationCount': this.affirmationCount,
    };
  }
 static Map timeOfDayToFirebase(TimeOfDay timeOfDay){
    return {
      'hour':timeOfDay.hour,
      'minute':timeOfDay.minute
    };
  }


  static TimeOfDay firebaseToTimeOfDay(Map data){
    return TimeOfDay(
        hour: data['hour'],
        minute: data['minute']);
  }
  factory OwnAffirmationModel.fromMap(Map<String, dynamic> map) {
    return OwnAffirmationModel(
      affirmation: map['affirmation'] as String,
      imageUrl: map['imageUrl'] as String,
      date: map['date'] as Timestamp,
      dateEnd: firebaseToTimeOfDay( map['dateEnd']),
      dateStart:firebaseToTimeOfDay( map['dateStart'] ),
      affirmationCount: map['affirmationCount'] as int,
    );
  }
}