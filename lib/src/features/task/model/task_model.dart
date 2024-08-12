import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int? id;
  final String? title;
  final bool? firstItem;
  final bool? completed;
  final String? startTime, endTime;

  const TaskModel({
    this.id,
    this.title,
    this.firstItem,
    this.startTime,
    this.endTime,this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json['title'] as String?,
        id: json['id'] as int?,
        firstItem: json['first_item'] as bool?,
        completed: json['completed'] as bool?,
        startTime: json['start_time'] as String?,
        endTime: json['end_time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'first_item': firstItem,
        'start_time': startTime,
        'end_time': endTime,
        'completed': completed,
      };

  TaskModel copyWith({
    int? id,
    String? title,
    bool? firstItem,
    String? startTime,
    String? endTime,
    bool? completed,

  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      firstItem: firstItem ?? this.firstItem,
      endTime: endTime ?? this.endTime,
      startTime: startTime ?? this.startTime,
      completed: completed?? this.completed,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        firstItem,
        startTime,
        endTime,
        completed,
      ];
}
