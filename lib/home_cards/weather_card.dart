import 'package:flutter/material.dart';
import 'package:wind_space_members/home_cards/home_card_size.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: CardSize().cardVerticalPaddingSize,
                horizontal: CardSize().cardHorizontalPaddingSize),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('TODO : 天気情報の取得')],
            )));
  }
}
