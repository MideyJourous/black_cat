import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: ListView(
        children: [
          SwitchListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text("This is SwitchListTile"),
          ),
          CheckboxListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text("This is CheckboxListTile"),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now(),
              );
              print(date);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2024 - 01 - 01),
                lastDate: DateTime(2025 - 01 - 01),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },

            title: Text("What is your birthday?"),
          ),
          ListTile(
            title: Text("Log out(iOS)", style: TextStyle(color: Colors.red)),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder:
                    (context) => CupertinoAlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Please don't go"),
                      actions: [
                        CupertinoDialogAction(
                          child: Text("No, I'm not sure"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: Text("Yes"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
              );
            },
          ),
          ListTile(
            title: Text("Log out(AOS)", style: TextStyle(color: Colors.red)),
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Please don't go"),
                      actions: [
                        TextButton(
                          child: Text("No, I'm not sure"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: Text("Yes"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
              );
            },
          ),
          ListTile(
            title: Text(
              "Log out(iOS / Buttom)",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => CupertinoActionSheet(
                      title: Text("Are you sure?"),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Text("Not log out"),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          isDestructiveAction: true,
                          child: Text("Yes please"),
                        ),
                      ],
                    ),
              );
            },
          ),

          AboutListTile(),
        ],
      ),
    );
  }
}
