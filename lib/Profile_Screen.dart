import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                    radius: 60,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Hi, Devendra Parmar',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text('Welcome to Dev Medical Store', style: TextStyle(fontSize: 18),),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile',style: TextStyle(fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Edit Profile Screen
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('My orders',style: TextStyle(fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to My Orders Screen
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Billing',style: TextStyle(fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Billing Screen
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Faq',style: TextStyle(fontSize: 18),),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to FAQ Screen
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle tap
        },
      ),
    );
  }
}
