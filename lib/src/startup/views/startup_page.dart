import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/app/app.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starting...'),
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance?.addPostFrameCallback((_) => context.goNamed(AppRoutes.dashboard));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
