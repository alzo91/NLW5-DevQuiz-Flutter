import 'package:devquiz/Challenge/challenge_page.dart';
import 'package:devquiz/Home/home_controller.dart';
import 'package:devquiz/Home/home_state.dart';
import 'package:devquiz/Home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/Home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/Home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ), //Garantindo que não é null
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LevelButtonWidget(
                      label: 'Fácil',
                    ),
                    LevelButtonWidget(
                      label: 'Médio',
                    ),
                    LevelButtonWidget(
                      label: 'Difícil',
                    ),
                    LevelButtonWidget(
                      label: 'Perito',
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: GridView.count(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          label: e.title,
                          percent: e.questionAwnsered / e.questions.length,
                          completed:
                              "${e.questionAwnsered}/${e.questions.length}",
                          image: e.image,
                          onTap: () {
                            print("${e.title} was clicked");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChallengePage(questions: e.questions, titleQuiz: e.title,))
                            );
                          },
                        ))
                    .toList(),
                /* [
                QuizCardWidget(label: 'Gerenciamento de Estado'),
                QuizCardWidget(label: 'Gerenciamento de Estado'),
                QuizCardWidget(label: '2. Gerenciamento '),
                QuizCardWidget(label: '2. Gerenciamento '),
                QuizCardWidget(label: '2. Gerenciamento '),
              ],*/
              ))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
