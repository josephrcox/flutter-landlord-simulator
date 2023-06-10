// help screen widget

import 'package:flutter/material.dart';

// stateless widget
class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: const Text('How to play'),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: HelpScreenContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpScreenContent extends StatelessWidget {
  const HelpScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Column(
        children: [
          Text(
            'Objective',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your goal is to stay in business, and make as much money as possible. As you purchase more properties and upgrade them, you will face more challenges. You will need to balance your income and expenses, and keep your tenants happy.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              height: 1.8,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Gameplay',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You start with a single property. Set the rent and tap on the property to search for tenants. Searching cost 1/10th of the rent. If you are lucky, you will find a tenant. If not, you will have to search again. 1 month takes about 30 seconds. ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              height: 1.8,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'To customize your property, slide right-to-left and tap on Upgrades. Some upgrades help make residents happier, some make you more money, and some do both. You are limited in the number of upgrades per property.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              height: 1.8,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'All income is subject to a tax rate that changes over time. You can view the tax rate in the top header.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
