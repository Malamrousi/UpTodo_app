// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final String uid;

  final String title;
  final String description;

   bool? isDone;
  final Map<String, dynamic> category;

  final DateTime date;
  final String? startTime;
   String? endTime;

  final int taskPriority;
  TaskModel({
  required  this.uid,
    required this.title,
    required this.description,
    this.isDone,
    required this.category,
    required this.date,
    this.startTime,
    this.endTime,
    required this.taskPriority,
  });

    static String timeOfDayToString(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat('h:mm a');
    return format.format(dt);
  }
  


  factory TaskModel.fromJson(json) {
    return TaskModel(
      uid: json['uid'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'],
      category: json['category'],
      date: (json['date'] as Timestamp).toDate(), 
      startTime: json['startTime'],
      endTime: json['endTime'],
      taskPriority: json['taskPriority'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'isDone': isDone,
      'category': category,
      'date': Timestamp.fromDate(date),
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
      'taskPriority': taskPriority,
    };
  }
}
