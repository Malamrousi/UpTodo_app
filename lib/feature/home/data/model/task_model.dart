// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TaskModel {
  final String? uid;

  final String title;
  final String description;

  final bool? isDone;
  final Map<String, dynamic> category;

  final DateTime date;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;

  final String taskPriority;
  TaskModel({
    this.uid,
    required this.title,
    required this.description,
    this.isDone =false,
    required this.category,
    required this.date,
    this.startTime,
    this.endTime,
    required this.taskPriority,
  });

  factory TaskModel.fromJson(json) {
    return TaskModel(
      uid: json['uid'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'],
      category: json['category'],
      date: json['date'],
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
      'date': date.toIso8601String(),
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
      'taskPriority': taskPriority,
    };
  }
}
