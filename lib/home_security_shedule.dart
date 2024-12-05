

import 'package:flutter/material.dart';

class HomeSecurityScheduleScreen extends StatefulWidget {
  @override
  _HomeSecurityScheduleScreenState createState() => _HomeSecurityScheduleScreenState();
}

class _HomeSecurityScheduleScreenState extends State<HomeSecurityScheduleScreen> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _pickTime(BuildContext context, bool isStartTime) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Security Schedule', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[800]!, Colors.black87],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Your Home Security Schedule:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Start Time Picker
              _buildTimePicker(
                context: context,
                label: "Start Time",
                time: startTime,
                isStartTime: true,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 20),

              // End Time Picker
              _buildTimePicker(
                context: context,
                label: "End Time",
                time: endTime,
                isStartTime: false,
                color: Colors.redAccent,
              ),
              SizedBox(height: 30),

              // Display schedule confirmation text
              if (startTime != null && endTime != null)
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.greenAccent, width: 2),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Smart Home security is activated from ${startTime!.format(context)} to ${endTime!.format(context)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              SizedBox(height: 30),

              // Activate Schedule Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (startTime != null && endTime != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Smart Home security is activated from ${startTime!.format(context)} to ${endTime!.format(context)}',
                          ),
                        ),
                      );
                    }
                  },
                  icon: Icon(Icons.lock, color: Colors.white),
                  label: Text('Activate Schedule'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    elevation: 5,
                    shadowColor: Colors.greenAccent,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Shield Icon for visual enhancement
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.shield,
                    size: 120,
                    color: Colors.greenAccent.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for building time pickers (for both start and end times)
  Widget _buildTimePicker({
    required BuildContext context,
    required String label,
    required TimeOfDay? time,
    required bool isStartTime,
    required Color color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        ElevatedButton(
          onPressed: () => _pickTime(context, isStartTime),
          child: Text(
            time != null ? time.format(context) : 'Select Time',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}

