import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:windspace_members/home_cards/home_card_size.dart';
import 'package:windspace_members/providers/wether_provider.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: CardSize().cardVerticalPaddingSize,
          horizontal: CardSize().cardHorizontalPaddingSize,
        ),
        child: weatherAsync.when(
          data: (weather) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('現在の新舞子', style: TextStyle(fontSize: 15)),
                weather.icon,
                Text(
                  '🌡 ${weather.temperature}°C',
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  '💨 ${weather.windSpeed} m/s',
                  style: const TextStyle(fontSize: 15),
                ), // アイコンを表示
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('申し訳ございません。情報の取得に失敗しました。')),
        ),
      ),
    );
  }
}
