import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final Object? error;

  const ErrorDialog({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    String errorMessage = '';

    if ((error! as String) == 'network-error') {
      errorMessage = '네트워크 에러가 발생했습니다.';
    } else if ((error! as String) == 'no-data') {
      errorMessage = '데이터를 받아올 수 없습니다.';
    } else {
      errorMessage = '알 수 없는 에러 발생했습니다.';
    }

    return AlertDialog(
      title: Text('오류 발생'),
      content: Text('${errorMessage}\n오프라인 모드로 전환합니다.'),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text('확인'),
        ),
      ],
    );
  }
}
