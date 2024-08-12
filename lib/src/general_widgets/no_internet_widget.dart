// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:todo_app/src/core/utils/enums.dart';
import 'package:todo_app/src/core/utils/strings/strings.dart';
import 'package:todo_app/src/features/photos/notifiers/photo_notifier.dart';
import 'package:todo_app/src/general_widgets/general_widget_exports.dart';

// Project imports:

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExceptionIndicator(
      assetName: 'assets/animations/noNetwork.json',
      title: "Network Error",
      retryWidget: Consumer(builder: (context, ref, _) {
        final loadState =
            ref.watch(photoNtifierProvider.select((value) => value.loadState));
        return AppButton(
            // width: 150.w,
            text: 'RETRY',
            isEnabled: true,
            isLoading: loadState.isLoading,
            onPressed: () async {
              await ref
                  .read(photoNtifierProvider.notifier)
                  .fetchPhotos(loadMore: false, limit: 10);
            });
      }),
      message: 'No internet connection.${Strings.connectionError}',
    );
  }
}
