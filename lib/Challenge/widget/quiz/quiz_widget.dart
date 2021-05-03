import 'package:devquiz/Challenge/widget/awnser/awnser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  // final VoidCallback onChange;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnser(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;

                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            )

          // ...widget.question.awnsers
          //     .map((e) => AwnserWidget(
          //           title: e.title,
          //           isRight: e.isRight,
          //         ))
          //     .toList(),
          // AwnserWidget(
          //   title: 'Possibilita a criação de aplicativos compilados nativamente'
          //   ,
          //   isSelected: true,
          //   isRight: true,
          // ),
          //  AwnserWidget(
          //   title: 'Acho que é uma marca de café do Himalaia',

          //   isSelected: true,
          //   isRight: false,
          // ),
          // AwnserWidget(
          //   title: 'Acho que é uma marca de café do Himalaia'
          // )
        ],
      ),
    );
  }
}