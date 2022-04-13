import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/app.dart';

class LabeledDivider extends StatelessWidget {
  final String label;

  const LabeledDivider({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.M),
      child: Stack(
        children: [
          const Divider(
            thickness: 1,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.M),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Text(
                label,
                style: const TextStyle(
                  height: 1.125,
                  letterSpacing: 1.5,
                  wordSpacing: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
