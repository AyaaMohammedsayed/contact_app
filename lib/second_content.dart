import 'package:flutter/material.dart';

class SecondContent extends StatelessWidget {
  const SecondContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/home_empty.png',
          width: 368,
          height: 368,
          fit: BoxFit.cover,
        ),
        Text('There is No Contacts Added Here', style: textTheme.titleLarge),
      ],
    );
  }
}