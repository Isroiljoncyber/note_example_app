import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:note_example_app/feature/home/presentation/bloc/note_cubit.dart';

class WeatherInfoPart extends StatefulWidget {
  const WeatherInfoPart({
    super.key,
  });

  @override
  State<WeatherInfoPart> createState() => _WeatherInfoPartState();
}

class _WeatherInfoPartState extends State<WeatherInfoPart> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state.weatherStatus.isInitial) {
          context.read<NoteCubit>().getWeather(
            (e) {
              showSnack(e, false);
            },
          );
          return const SizedBox.shrink();
        } else if (state.weatherStatus.isInProgress) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CupertinoActivityIndicator()),
          );
        } else if (state.weatherStatus.isSuccess) {
          return Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_city_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${state.weatherEntity.location.name}, ${state.weatherEntity.location.country}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    state.weatherEntity.location.localtime,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.sentiment_satisfied_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    state.weatherEntity.current.condition.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.thermometer,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${state.weatherEntity.current.tempC}°C",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.wind_power_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${state.weatherEntity.current.windKph} Kpm form ${state.weatherEntity.current.windDir}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Something went wrong!\n Check your internet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          );
        }
      },
    );
  }

  showSnack(String message, bool isSuccess) {
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(message),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
