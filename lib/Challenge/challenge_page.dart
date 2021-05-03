import 'package:devquiz/Challenge/challenge_controller.dart';
import 'package:devquiz/Challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz/Challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/Challenge/widget/quiz/quiz_widget.dart';
import 'package:devquiz/Result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
// import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String titleQuiz;
  ChallengePage({Key? key, required this.questions, required this.titleQuiz})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(microseconds: 750), curve: Curves.bounceInOut);
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAwnseredRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BackButton(),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: controller.currentPage,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value < widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.white(
                            label: 'Pular',
                            onTap: () {
                              print("Pular");
                              nextPage();
                            },
                          )),
                        if (value == widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.green(
                              label: 'Confirmar',
                              onTap: () {
                                print("Confirmar");
                                // Navigator.pop(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage(
                                              title: widget.titleQuiz,
                                              sizeQuestions:
                                                  widget.questions.length,
                                                  qtdAwnseredRight: this.controller.qtdAwnseredRight,
                                            )));
                              },
                            ),
                          )
                      ],
                    ))),
      ),
    );
  }
}
