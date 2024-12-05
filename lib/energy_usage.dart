


import 'package:flutter/material.dart';

class EnergyUsageReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Usage Report', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Energy Usage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal[700]),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildEnergyUsageBar(context, 'Monday', 20, 100),
                  _buildEnergyUsageBar(context, 'Tuesday', 50, 100),
                  _buildEnergyUsageBar(context, 'Wednesday', 70, 100),
                  _buildEnergyUsageBar(context, 'Thursday', 30, 100),
                  _buildEnergyUsageBar(context, 'Friday', 90, 100),
                  _buildEnergyUsageBar(context, 'Saturday', 40, 100),
                  _buildEnergyUsageBar(context, 'Sunday', 60, 100),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Summary:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[700]),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Darker background for the summary
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Total Energy Used: 350 kWh',
                style: TextStyle(color: Colors.white, fontSize: 16), // White text
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyUsageBar(BuildContext context, String day, double usage, double maxUsage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal[700]),
        ),
        SizedBox(height: 5),
        Stack(
          children: [
            Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              height: 10,
              width: (usage / maxUsage) * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
