import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Track visibility of "Account" options
  bool _isAccountExpanded = false;

  // Track visibility of "Settings" options
  bool _isSettingsExpanded = false;

  // Toggle the visibility of Account options
  void _toggleAccountExpansion() {
    setState(() {
      _isAccountExpanded = !_isAccountExpanded;
    });
  }

  // Toggle the visibility of Settings options
  void _toggleSettingsExpansion() {
    setState(() {
      _isSettingsExpanded = !_isSettingsExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.orange.shade100,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orange),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: _toggleAccountExpansion,
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.orange,
                      size: 40,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _isAccountExpanded ? 'Account' : 'Account',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              if (_isAccountExpanded) ...[
                GestureDetector(
                  onTap: () {
                    //Action for "Change Account Name"
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, top: 20),
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.orange, size: 25),
                        SizedBox(width: 10),
                        Text(
                          "Change Account Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Action for "Change Avatar"
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, top: 20),
                    child: Row(
                      children: [
                        Icon(Icons.photo, color: Colors.orange, size: 25),
                        SizedBox(width: 10),
                        Text(
                          "Change Avatar",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Action for "Change Password"
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, top: 20),
                    child: Row(
                      children: [
                        Icon(Icons.key, color: Colors.orange, size: 25),
                        SizedBox(width: 10),
                        Text(
                          "Change Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //Action for "Change Email"
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, top: 20),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.orange, size: 25),
                        SizedBox(width: 10),
                        Text(
                          "Change Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              TextButton(
                onPressed: _toggleSettingsExpansion,
                child: Row(
                  children: [
                    const Icon(Icons.notifications,
                        color: Colors.orange, size: 40),
                    const SizedBox(width: 10),
                    Text(
                      _isSettingsExpanded ? 'Notifications' : 'Notifications',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              if (_isSettingsExpanded) ...[],
              const SizedBox(height: 20),
              TextButton(
                onPressed: _toggleSettingsExpansion,
                child: Row(
                  children: [
                    const Icon(Icons.tune, color: Colors.orange, size: 40),
                    const SizedBox(width: 10),
                    Text(
                      _isSettingsExpanded ? 'Preferences' : 'Preferences',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
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
