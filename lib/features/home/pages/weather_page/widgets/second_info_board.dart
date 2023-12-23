import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

class SecondInfoBoard extends StatelessWidget {
  const SecondInfoBoard(this.weatherModel, {super.key});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BoxedIcon(WeatherIcons.wind),
                const SizedBox(width: 3),
                Text(
                  weatherModel?.current.windDir ?? 'null',
                  style: TextStyles.textStyleRed(13),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const BoxedIcon(WeatherIcons.cloudy),
                const SizedBox(width: 3),
                Text(
                  '${weatherModel?.current.cloud} %',
                  style: TextStyles.textStyleRed(13),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BoxedIcon(WeatherIcons.strong_wind),
                const SizedBox(width: 3),
                Text(
                  '${weatherModel?.current.windMph} km/h',
                  style: TextStyles.textStyleRed(13),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const BoxedIcon(WeatherIcons.umbrella),
                const SizedBox(width: 3),
                Text(
                  '${weatherModel?.current.precipMm} mm',
                  style: TextStyles.textStyleRed(13),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BoxedIcon(WeatherIcons.barometer),
                const SizedBox(width: 3),
                Text(
                  '${weatherModel?.current.pressureMb} hPa',
                  style: TextStyles.textStyleRed(13),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const BoxedIcon(WeatherIcons.humidity),
                const SizedBox(width: 3),
                Text(
                  '${weatherModel?.current.humidity} %',
                  style: TextStyles.textStyleRed(13),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
