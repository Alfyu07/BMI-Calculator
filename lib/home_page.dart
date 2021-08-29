import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multiprovider/providers/bmi_provider.dart';
import 'package:multiprovider/providers/gender_provider.dart';
import 'package:multiprovider/providers/height_provider.dart';
import 'package:multiprovider/providers/weight_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weightProvider = Provider.of<WeightProvider>(context);
    final heightProvider = Provider.of<HeightProvider>(context);
    final genderProvider = Provider.of<GenderProvider>(context);
    final bmiProvider = Provider.of<BMIProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Female'),
                  const SizedBox(width: 4),
                  Switch(
                    value: genderProvider.isMale,
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.pink,
                    inactiveTrackColor: Colors.pink.withOpacity(0.3),
                    onChanged: (newValue) => genderProvider.isMale = newValue,
                  ),
                  const SizedBox(width: 4),
                  Text('Male'),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Weight',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Slider(
                value: weightProvider.value,
                min: 1,
                max: 200,
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.withOpacity(0.3),
                label: weightProvider.value.round().toString(),
                divisions: 100,
                onChanged: (newValue) {
                  weightProvider.value = newValue;
                  bmiProvider.bmi = (weightProvider.value /
                      pow(heightProvider.value / 100, 2));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Height',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Slider(
                  value: heightProvider.value,
                  min: 1,
                  max: 200,
                  divisions: 100,
                  label: heightProvider.value.round().toString(),
                  activeColor: Colors.pink,
                  inactiveColor: Colors.pink.withOpacity(0.3),
                  onChanged: (newValue) {
                    heightProvider.value = newValue;
                    bmiProvider.bmi = (weightProvider.value /
                        pow(heightProvider.value / 100, 2));
                  }),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Your BMI\n${bmiProvider.bmi.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 80,
              ),
              if (bmiProvider.bmi < 18.5)
                Text('You are underweight.')
              else if (bmiProvider.bmi > 18.5 && bmiProvider.bmi <= 25.0)
                Text(
                  'Your weight is normal.',
                )
              else
                Text(
                  'You are overweight.',
                ),
              Text(
                'Your ideal weight is ${(heightProvider.value - 100) - (heightProvider.value - 100) * genderProvider.idealFactor} kg',
              )
            ],
          ),
        ),
      ),
    );
  }
}
