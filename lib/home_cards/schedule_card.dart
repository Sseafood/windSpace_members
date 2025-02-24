import 'package:flutter/material.dart';
import 'package:wind_space_members/home_cards/home_card_size.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final getTodayEvent = 'TODO : 取得処理作成';
    final getTomorrowEvent = 'TODO : 取得処理作成';
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: CardSize().cardVerticalPaddingSize,
                horizontal: CardSize().cardHorizontalPaddingSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('本日のイベント：$getTodayEvent'),
                Text('翌日のイベント：$getTomorrowEvent')
              ],
            )));
  }
}
