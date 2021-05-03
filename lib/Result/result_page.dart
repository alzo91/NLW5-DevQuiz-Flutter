import 'package:devquiz/Challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz/Home/home_page.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int sizeQuestions;
  final int qtdAwnseredRight;

  const ResultPage({
    Key? key,
    required this.title,
    required this.sizeQuestions,
    required this.qtdAwnseredRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text: "\n$title\n", style: AppTextStyles.bodyBold),
                        TextSpan(
                            text:
                                "com $qtdAwnseredRight de $sizeQuestions acertos\n",
                            style: AppTextStyles.bodyBold),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                            label: "Compartilhar",
                            onTap: () {
                              // print("Clicou");
                              Share.share(
                                "DevQuiz - Flutter\nResultado do Quiz: $title\nObtive:${(this.qtdAwnseredRight/this.sizeQuestions)*100}% de aproveitamento.!"
                                );
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                            label: "Voltar ao início!",
                            onTap: () => {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()))
                                }),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
