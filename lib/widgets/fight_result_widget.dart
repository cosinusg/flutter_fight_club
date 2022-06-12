// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/pages/fight_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/resources/fight_club_images.dart';

class FightResultWidget extends StatelessWidget {
  final FightResult fightResult;
  const FightResultWidget({
    Key? key,
    required this.fightResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ColoredBox(
                color: Colors.white,
              )),
              Expanded(
                  child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFFC5D1EA)],
                )),
              )),
              Expanded(
                  child: ColoredBox(
                color: Color(0xFFC5D1EA),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You',
                    style: TextStyle(
                        color: FightClubColors.darkGreyText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    FightClubImages.youAvatar,
                    height: 92,
                    width: 92,
                  ),
                ],
              ),
              Container(
                height: 44,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4,),
                //width: fightResult == FightResult.won ? 72 : 88,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: fightResult.color,),
                child: Center(
                  child: Text(
                        fightResult.result.toLowerCase(),
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16),
                      ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enemy',
                    style: TextStyle(
                        color: FightClubColors.darkGreyText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    FightClubImages.enemyAvatar,
                    height: 92,
                    width: 92,
                  ),
                ],
              ),
              SizedBox(width: 8,),
            ],
          ),
        ],
      ),
    );
  }
}

