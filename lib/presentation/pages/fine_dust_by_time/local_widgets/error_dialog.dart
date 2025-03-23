import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nuvilab_project/presentation/riverpods/fine_dust_by_time_notifier.dart';

class ErrorDialog extends ConsumerWidget {
  final Object? error;

  const ErrorDialog({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String errorMessage = '';

    if ((error! as String) == 'network-error') {
      errorMessage = '네트워크 에러가 발생했습니다.';
    } else if ((error! as String) == 'no-data') {
      errorMessage = '데이터를 받아올 수 없습니다.';
    } else {
      errorMessage = '알 수 없는 에러 발생했습니다.';
    }

    return WillPopScope(
      child: AlertDialog(
        title: Text('오류 발생'),
        content: Text('${errorMessage}\n오프라인 모드로 전환합니다.'),
        actions: [
          TextButton(
            onPressed: () {
              ref
                  .read(fineDustByTimeNotifierProvider.notifier)
                  .getDataFromLocalStorage();

              context.pop();
            },
            child: Text('확인'),
          ),
        ],
      ),
      onWillPop: () {
        print('onWillPIP');

        ref
            .read(fineDustByTimeNotifierProvider.notifier)
            .getDataFromLocalStorage();

        return Future(() => true);
      },
    );
  }
}
