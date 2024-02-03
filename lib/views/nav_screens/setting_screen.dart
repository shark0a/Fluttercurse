import 'package:flutter/material.dart';
import 'package:task/config/setting_util.dart';
import 'package:task/const.dart';
import 'package:task/views/login_page.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String cashedusername = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    cashedusername = await AppSettings.getCashedusername();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                color: Colors.blue,
                size: 60,
              ),
              backgroundColor: Colors.blue[100],
            ),
            Center(
                child: Text(
              'User Name : $cashedusername ',
              style: TextStyle(color: Colors.black),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: ListTile(
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
                child: ListTile(
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
                child: ListTile(
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
                  leading: Icon(Icons.logout),
                  title: Text('Sign out'),
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
