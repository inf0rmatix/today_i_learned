import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/dashboard/blocs/blocs.dart';

class LearningsLatestScores extends StatelessWidget {
  const LearningsLatestScores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.M),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: CustomText.headline1('Your latest scores'),
              leading: Icon(
                Icons.emoji_events_rounded,
                size: AppIconSize.L,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.M),
              child: Column(
                children: [
                  BlocSelector<DashboardCubit, DashboardState, int>(
                    selector: (state) => state.learningsPastSevenDays,
                    builder: (context, learningsPastSevenDays) {
                      return Row(
                        children: [
                          Text(
                            learningsPastSevenDays.toString(),
                            style: const TextStyle(fontSize: AppFontSize.superLarge),
                          ),
                          const SizedBox(width: AppSpacing.M),
                          const Expanded(
                            child: Text(
                              'things learned past seven days',
                              style: TextStyle(fontSize: AppFontSize.headline1),
                              softWrap: true,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  BlocSelector<DashboardCubit, DashboardState, int>(
                    selector: (state) => state.learningsPastThirtyDays,
                    builder: (context, learningsPastThirtyDays) {
                      return Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'so much knowledge gathered in thirty days',
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: AppFontSize.headline1),
                              softWrap: true,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.M),
                          Text(
                            learningsPastThirtyDays.toString(),
                            style: const TextStyle(fontSize: AppFontSize.superLarge),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
