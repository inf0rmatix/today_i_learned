import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/router/router.dart';

class AllLearningsPage extends StatelessWidget {
  const AllLearningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed(AppRoutes.dashboard),
          child: const Text('Dashboard'),
        ),
      ),
    );
  }
}
