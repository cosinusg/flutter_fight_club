import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatisticsPageContent();
  }
}

class _StatisticsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
              ),
              height: 40,
              child: Text(
                'Statistics',
                style: TextStyle(
                  color: const Color(0xFF161616),
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return SizedBox();
                  }
                  final SharedPreferences sp = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Won: ${sp.getInt("stats_won") ?? 0}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffffffff),
                          )),
                      SizedBox(height: 6,),
                      Text('Lost: ${sp.getInt("stats_lost") ?? 0}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffffffff),
                          )),
                      SizedBox(height: 6,),
                      Text('draw: ${sp.getInt("stats_draw") ?? 0}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffffffff),
                          )),
                    ],
                  );
                }),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: SecondaryActionButton(
                  text: 'Back',
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
