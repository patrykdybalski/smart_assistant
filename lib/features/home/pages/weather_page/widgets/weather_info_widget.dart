import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/weather_model/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({required this.weatherModel, super.key});
  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            FirstInfoBoard(weatherModel),
            const SizedBox(height: 16),
            SecondInfoBoard(weatherModel),
            const SizedBox(height: 8),
            const Divider(
              endIndent: 80,
              indent: 80,
              thickness: 0.4,
              color: AppColors.accentColor,
            ),
            const SizedBox(height: 8),
            ThirdInfoBoard(weatherModel)
          ],
        ),
      ),
    );
  }
}

class FirstInfoBoard extends StatelessWidget {
  const FirstInfoBoard(this.weatherModel, {super.key});
  final WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.greenLoginColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.whiteColor,
            blurRadius: 0.8,
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${weatherModel?.current.tempC}°C',
                  style: TextStyles.textStyleWhite(47),
                ),
                Text(
                  'Odczuwalne ${weatherModel?.current.feelslikeC}°C',
                  style: TextStyles.textStyleWhite(13),
                ),
              ],
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 150,
                height: 115,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '${weatherModel?.current.condition.text}',
                        style: TextStyles.textStyleWhite(19),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                const BoxedIcon(
                  WeatherIcons.wind,
                ),
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
                const BoxedIcon(
                  WeatherIcons.cloudy,
                ),
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
                const BoxedIcon(
                  WeatherIcons.umbrella,
                ),
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
                const BoxedIcon(
                  WeatherIcons.barometer,
                ),
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

class ThirdInfoBoard extends StatelessWidget {
  const ThirdInfoBoard(this.weatherModel, {super.key});

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on_outlined),
        Text(
          ' ${weatherModel?.location.nameWithCountry} ',
          style: TextStyles.textStyle2(18),
        ),
      ],
    );
  }
}
