import 'package:flutter/material.dart';

class NotFoundWeatherScreen extends StatelessWidget {
  const NotFoundWeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ops! .. There is No Weather 😔',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              'You Need to search now 🔍',
              style: TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
