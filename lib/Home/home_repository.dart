import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepostiory {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString('assets/databases/user.json');
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString('assets/databases/quizzes.json');
    final list = jsonDecode(response) as List; // UserModel.fromJson(response);
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
