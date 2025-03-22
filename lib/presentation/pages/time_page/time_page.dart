import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'local_widgets/time_fine_dust.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('yyyy-MM-dd').format(DateTime.now()),
        ),
      ),
      body: SingleChildScrollView(
        child: TimeFineDust(),
      ),
    );
  }
}
