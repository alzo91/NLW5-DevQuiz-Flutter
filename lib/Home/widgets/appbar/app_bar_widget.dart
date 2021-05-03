import 'package:devquiz/Home/widgets/score_card/score_carg_widget.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
            preferredSize: Size.fromHeight(230),
            child: Container(
              decoration: BoxDecoration(gradient: AppGradients.linear),
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                              text: 'Olá',
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: user.name,
                                    style: AppTextStyles.titleBold)
                              ]),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(user.photoUrl)
                                )
                              ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment(0.0, 1.0),
                      child:
                      ScoreCardWidget(userPercent: user.score,)
                  ),
                ],
              ),
            ));
}
