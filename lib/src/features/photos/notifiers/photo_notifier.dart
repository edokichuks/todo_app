// Flutter imports:

// Dart imports:

// Package imports:
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/application/repositories/photos/photo_repo.dart';
import 'package:todo_app/src/core/config/exceptions/app_exceptions.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';
import 'package:todo_app/src/features/photos/model/photo_model/photo_model.dart';
import 'package:todo_app/src/features/photos/notifiers/photo_state.dart';

class PhotoNtifier extends AutoDisposeNotifier<PhotoState> {
  PhotoNtifier();
  late PhotoRepository _photoRepository;

  @override
  PhotoState build() {
    _photoRepository = ref.read(photoRepoProvider);

    return PhotoState.initial();
  }

  int start = 0;

  Future<void> fetchPhotos({required int limit, bool loadMore = false}) async {
    try {
      if (loadMore) {
        start = start + limit;
        state = state.copyWith(loadState: LoadState.loadmore);
      } else {
        state = state.copyWith(loadState: LoadState.loading);
      }
      final photosList =
          await _photoRepository.allPhotos(start: start, limit: limit);
      if (photosList.$s2.isNotEmpty) {
        state = state.copyWith(
            photos: [...state.photoList, ...photosList.$s2],
            loadState: LoadState.success,
            errorMessage: '');
      } else {
        state = state.copyWith(loadState: LoadState.done, errorMessage: '');
      }
    } catch (error) {
      debugPrint('In notifier: ${error.toString()}');
      final savedPhotos = _photoRepository.getMealCategoriesLocally();
      state = state.copyWith(
          loadState: LoadState.error,
          errorMessage: 'No Internet connection',
          photos: savedPhotos);
    }
  }
}

final photoNtifierProvider =
    NotifierProvider.autoDispose<PhotoNtifier, PhotoState>(PhotoNtifier.new);
