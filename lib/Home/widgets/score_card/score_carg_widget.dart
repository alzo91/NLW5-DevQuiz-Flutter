import 'package:devquiz/Home/widgets/chart/chart_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final double userPercent;
  const ScoreCardWidget({Key? key, required this.userPercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(percent: this.userPercent,),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vamos começar",
                          style: AppTextStyles.heading,
                        ),
                        Text(
                          "Complete os desafios e avance em conhecimentos.",
                          style: AppTextStyles.body,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}