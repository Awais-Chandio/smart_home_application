




import 'package:flutter/material.dart';
import 'package:smart_home_application/energy_usage.dart';
import 'package:smart_home_application/firmware_screen.dart';
import 'package:smart_home_application/home_security_shedule.dart';
import 'package:smart_home_application/voice_controll.dart';
 // Import the energy usage report screen
import 'automations_screen.dart'; // Import the automations screen
 // Import the firmware updates screen
import 'notifications_screen.dart'; // Import the notifications screen

class AdditionalSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSettingItem(
              context,
              'Voice Control',
              Icons.mic,
              'Control your smart home devices using your voice.',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VoiceControlScreen()),
                );
              },
            ),
            _buildSettingItem(
              context,
              'Home Security Schedule',
              Icons.access_time,
              'Set schedules for your home security system.',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeSecurityScheduleScreen()),
                );
              },
            ),
            _buildSettingItem(
              context,
              'Energy Usage Report',
              Icons.show_chart,
              'View reports on your energy consumption and savings.',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnergyUsageReportScreen()),
                );
              },
            ),
            _buildSettingItem(
              context,
              'Automations',
              Icons.autorenew,
              'Create and manage automations for your devices.',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AutomationsScreen()),
                );
              },
            ),
            _buildSettingItem(
              context,
              'Firmware Updates',
              Icons.system_update,
              'Check for firmware updates for your devices.',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirmwareUpdatesScreen()),
                );
              },
            ),
            _buildSettingItem(
              context,
              'Notifications',
              Icons.notifications,
              'Manage notifications for your smart devices.',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, IconData icon, String description, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.teal[700]),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal[700]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
