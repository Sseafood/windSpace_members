import 'package:flutter/material.dart';
import 'package:wind_space_members/home_cards/login_card.dart';
import 'package:wind_space_members/home_cards/schedule_card.dart';
import 'package:wind_space_members/home_cards/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('WIND SPACE')),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: _HomeCardList()));
        }));
  }
}

class _HomeCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoginCard(),
        Row(
          children: [
            Expanded(child: ScheduleCard()),
            Expanded(child: WeatherCard()),
          ],
        )
      ],
    );
  }
}
