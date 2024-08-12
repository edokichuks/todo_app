// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/extensions/extension_exports.dart';
import 'package:todo_app/src/core/utils/colors.dart';
import 'package:todo_app/src/core/utils/enums.dart';
import 'package:todo_app/src/core/utils/margin_util.dart';
import 'package:todo_app/src/core/utils/styles/theme_helper.dart';
import 'package:todo_app/src/features/photos/notifiers/photo_notifier.dart';
import 'package:todo_app/src/features/photos/widgets/animiated_gridview.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

class PhotosScreen extends ConsumerStatefulWidget {
  const PhotosScreen({super.key});

  @override
  ConsumerState<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends ConsumerState<PhotosScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await ref
            .read(photoNtifierProvider.notifier)
            .fetchPhotos(loadMore: false, limit: 10);
        showNoInternet();
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref
          .read(photoNtifierProvider.notifier)
          .fetchPhotos(loadMore: true, limit: 10);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showNoInternet() {
    final photoState = ref.watch(photoNtifierProvider);
    if (photoState.errorMessage.isNotEmpty) {
      AppOverLay.of(context).showMessage(
          message: photoState.errorMessage,
          title: 'Error',
          messageType: MessageType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final photoState = ref.watch(photoNtifierProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Photos',
                  style: theme.textTheme.s22w600.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ),
              const YMargin(8),
              photoState.loadState.isLoading
                  ? const Center(child: AppLoader())
                  : AnimiateGridview(
                      photoList: photoState.photoList,
                    ),
              const YMargin(16),
              if (photoState.errorMessage.isNotEmpty &&
                  photoState.loadState != LoadState.loading)
                const NoInternetWidget(),
              const YMargin(16),
              if (photoState.loadState.isLoadMore) const AppLoader(),
              const YMargin(32),
            ],
          ),
        ),
      ),
    );
  }
}
