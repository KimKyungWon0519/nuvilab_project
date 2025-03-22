import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('yyyy-MM-dd').format(
            DateTime.now(),
          ),
        ),
      ),
    );
  }
}
