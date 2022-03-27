import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/bloc/dashboard/dashboard_cubit.dart';
import 'package:today_i_learned/src/config/app_spacing.dart';
import 'package:today_i_learned/src/models/learning_model.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository.dart';
import 'package:today_i_learned/src/router/app_routes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
        learningRepository: context.read<LearningRepository>(),
      ),
      child: const _DashboardPageView(),
    );
  }
}

class _DashboardPageView extends StatelessWidget {
  const _DashboardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.create_rounded),
        onPressed: () => context.goNamed(AppRoutes.createLearning),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocSelector<DashboardCubit, DashboardState, List<LearningModel>>(
              selector: (state) => state.learnings,
              builder: (context, learnings) {
                return ListView.separated(
                  itemCount: learnings.length,
                  itemBuilder: (context, index) {
                    var learning = learnings[index];

                    return Card(
                      child: ListTile(
                        title: Text(learning.title),
                        subtitle: Text(learning.description),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.M),
                );
              },
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Refresh'),
            onPressed: () => context.read<DashboardCubit>().reload(),
          ),
        ],
      ),
    );
  }
}
