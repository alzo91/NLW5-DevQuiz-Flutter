import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String label;
  final String completed;
  final double percent;
  final String image;
  final VoidCallback onTap;

  const QuizCardWidget({
      Key? key,
      required this.label,
      required this.completed,
      required this.percent,
      required this.image,
      required this.onTap
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages
                  .blocks), // Image.asset(this.image),// Image.asset(image),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              label,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      completed,
                      style: AppTextStyles.body11,
                    )),
                Expanded(
                    flex: 4,
                    child: ProgressIndicatorWidget(
                      value: percent,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}