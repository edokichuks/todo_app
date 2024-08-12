// Project imports:
import 'package:flutter/material.dart';
import 'package:todo_app/src/core/utils/enums.dart';
import 'package:todo_app/src/features/photos/model/photo_model/photo_model.dart';

class PhotoState {
  PhotoState({
    required this.loadState,
    required this.photoList,
    required this.errorMessage,
  });
  factory PhotoState.initial() {
    return PhotoState(
      loadState: LoadState.idle,
      photoList: [],
      errorMessage: '',
    );
  }

  final LoadState loadState;
  final String errorMessage;
  final List<PhotoModel> photoList;

  PhotoState copyWith({
    LoadState? loadState,
    List<PhotoModel>? photos,
    String? errorMessage,
  }) {    
    return PhotoState(
      loadState: loadState ?? this.loadState,
      photoList: photos ?? photoList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
