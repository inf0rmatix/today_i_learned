import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/all_learnings/widgets/widgets.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/dashboard/blocs/blocs.dart';

class LastLearned extends StatelessWidget {
  const LastLearned({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.M),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.history_rounded,
                size: AppIconSize.L,
              ),
              title: CustomText.headline1(LocaleKeys.dashboard_last_learned_title.translate()),
            ),
            Theme(
              data: Theme.of(context).copyWith(cardColor: AppColors.greenSheen),
              child: BlocSelector<DashboardCubit, DashboardState, List<LearningModel>>(
                selector: (state) => state.mostRecentLearnings,
                builder: (context, learnings) {
                  return Column(
                    children: List.generate(
                      learnings.length,
                      (index) => LearningsListElement(
                        learning: learnings[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
