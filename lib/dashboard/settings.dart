import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool bool1 = true;
  bool bool2 = false;
  bool bool3 = false;
  bool bool4 = false;
  bool bool5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Quick Connect",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fastest",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    "quick connect button connects you to selected server.",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              value: bool1,
              onChanged: (value) {
                setState(() {
                  bool1 = value;
                });
              },
              title: Text(
                "VPN Accelerator",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Text(
                "vpn accelerator enables a set unique performance enhancing technologies which can increase VPN speed up to 400%. ",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              value: bool2,
              onChanged: (value) {
                setState(() {
                  bool2 = value;
                });
              },
              title: Text(
                "VPN Accelerator notifications",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Text(
                "get notified when vpn accelerator eswitches you to a faster server. ",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              value: bool3,
              onChanged: (value) {
                setState(() {
                  bool3 = value;
                });
              },
              title: Text(
                "Split Tunneling ",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Text(
                "allows certain apps or IPs to be excluded from the vpn traffic.",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              value: bool4,
              onChanged: (value) {
                setState(() {
                  bool4 = value;
                });
              },
              title: Text(
                "NetShield",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Text(
                "block advertisements, trackers and malware",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              value: bool5,
              onChanged: (value) {
                setState(() {
                  bool5 = value;
                });
              },
              title: Text(
                "Kill Switch",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              subtitle: Text(
                "set uo how VPN behaves if your connection is disrupted.",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
