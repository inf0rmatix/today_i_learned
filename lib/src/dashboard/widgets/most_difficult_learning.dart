import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/all_learnings/widgets/widgets.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/dashboard/blocs/blocs.dart';

class MostDifficultLearning extends StatelessWidget {
  const MostDifficultLearning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardCubit, DashboardState, LearningModel?>(
      selector: (state) => state.mostDifficultLearningPast90Days,
      builder: (context, mostDifficultLearningPast90Days) {
        if (mostDifficultLearningPast90Days == null) {
          return Container();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.M),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.M),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.bolt_rounded,
                      size: AppIconSize.L,
                    ),
                    // dense: true,
                    title: CustomText.headline1('Most difficult learning'),
                    subtitle: Text('Your biggest challenge in 90 days'),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(cardColor: AppColors.greenSheen),
                    child: LearningsListElement(learning: mostDifficultLearningPast90Days),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
