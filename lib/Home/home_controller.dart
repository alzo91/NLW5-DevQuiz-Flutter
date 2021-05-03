import 'package:devquiz/Home/home_repository.dart';
import 'package:devquiz/Home/home_state.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepostiory();
  void getUser() async {
    state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));
    // user = UserModel(
    //   name: 'Alisson Dev',
    //   photoUrl: 'https://avatars.githubusercontent.com/u/19477370?s=60&v=4',
    //   score: 0,
    // );
    user = await repository.getUser();
    // state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    // await Future.delayed(Duration(seconds: 2));
    /* quizzes = [
      QuizModel(
        title: 'NLW 5 Flutter',
        image: AppImages.blocks,
        level: Level.facil,
        questionAwnsered: 1,
        questions: [
          QuestionModel(
            title: 'Esta curtindo o flutter?',
            awnsers: [
              AwnserModel(title: "Estou curtindo!"),
              AwnserModel(title: "Amando o Flutter"),
              AwnserModel(title: "Muito top"),
              AwnserModel(title: "Show de bola", isRight: true),
            ],
          ),
          QuestionModel(
            title: 'Esta curtindo o flutter?',
            awnsers: [
              AwnserModel(title: "Estou curtindo!"),
              AwnserModel(title: "Amando o Flutter"),
              AwnserModel(title: "Muito top"),
              AwnserModel(title: "Show de bola", isRight: true),
            ],
          )
        ],
      ),
      QuizModel(
        title: 'Flutter hard',
        image: AppImages.hierarchy,
        level: Level.facil,
        questionAwnsered: 0,
        questions: [
          QuestionModel(
            title: 'Esta curtindo o flutter?',
            awnsers: [
              AwnserModel(title: "Estou curtindo!"),
              AwnserModel(title: "Amando o Flutter"),
              AwnserModel(title: "Muito top"),
              AwnserModel(title: "Show de bola", isRight: true),
            ],
          ),
          QuestionModel(
            title: 'Esta curtindo o flutter?',
            awnsers: [
              AwnserModel(title: "Estou curtindo!"),
              AwnserModel(title: "Amando o Flutter"),
              AwnserModel(title: "Muito top"),
              AwnserModel(title: "Show de bola", isRight: true),
            ],
          )
        ],
      )
    ];*/
    state = HomeState.success;
  }
}
