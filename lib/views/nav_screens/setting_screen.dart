import 'package:flutter/material.dart';
import 'package:task/config/setting_util.dart';
import 'package:task/const.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String cashedusername = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    cashedusername = await AppSettings.getCashedusername();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue[100],
              child: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 60,
              ),
            ),
            Center(
                child: Text(
              'User Name : $cashedusername ',
              style: const TextStyle(color: Colors.black),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: const ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit Profile'),
                  subtitle: Text('Manage aour account'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('App Settings'),
                  subtitle: Text('Manage your Setting'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: const ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About app  '),
                  subtitle: Text('data about developer and Application'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: ListTile(
                  onTap: () {
                    SettingsUtil.signOutFlow(context);
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign out'),
                  iconColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
