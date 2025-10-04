import 'package:flutter/material.dart';

class FirstContent extends StatelessWidget {
  const FirstContent({super.key});

  @override
  Widget build(BuildContext context) {
     TextTheme textTheme = Theme.of(context).textTheme;
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
