import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helpfortrauma/core/constants/color_constants.dart';
import 'package:helpfortrauma/screens/auth_home/hover_list_item.dart';

class AppIntegrationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Container(
    height: 850,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Sidebar(),
          MainContent(),
        ],
      )
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,  // Set the width of the sidebar
      decoration: BoxDecoration(
        color: Colors.white,  // Background color of the sidebar
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 2,
        //     blurRadius: 4,
        //   ),
        // ],
      ),
      child: Column(
        children: [
          UserProfile(),  // Include the user profile widget here
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                HoverListItem(iconData: Icons.home, title: "Home"),
                HoverListItem(iconData: Icons.person, title: "Profile"),
                HoverListItem(iconData: Icons.security, title: "Security"),
                HoverListItem(iconData: Icons.account_balance_wallet, title: "Billing"),
                HoverListItem(iconData: Icons.group, title: "Team"),
                HoverListItem(iconData: Icons.notifications, title: "Notifications"),
                HoverListItem(iconData: Icons.integration_instructions, title: "Integration"),
                HoverListItem(iconData: Icons.access_time, title: "Session"),
                HoverListItem(iconData: Icons.social_distance, title: "Social"),
                HoverListItem(iconData: Icons.color_lens, title: "Appearance"),
                HoverListItem(iconData: Icons.exit_to_app, title: "Sign Out"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData iconData, String title) {
    return ListTile(
      leading: Icon(iconData, color: Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[800],
          // fontWeight: FontWeight.bold,
          fontSize: 14
        ),
      ),
      onTap: () {
        // Handle navigation or action here
      },
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,  // Background color, adjust as necessary
      padding: EdgeInsets.all(16),  // Padding around the content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,  // Radius of the avatar
            backgroundImage: AssetImage('assets/images/avatar/avatar-1.jpg'),  // Placeholder image, replace with actual image URL
          ),
          SizedBox(height: 16),  // Space between avatar and text
          Text(
            "Jitu Chauhan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "Personal account",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),  // Space before the link
          TextButton(
            onPressed: () {
              // Add action to view the site/profile
            },
            child: Text(
              "View site / profile",
              style: TextStyle(
                color: Colors.blue,  // Color of the text, use Theme of the app if needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final List<Map<String, dynamic>> integrations = [
    {
      'name': 'Twitter',
      'description': 'Automatically tweet when you get a coffee with a message. Your fans would love it!',
      'connected': true,
    },
    {
      'name': 'LinkedIn',
      'description': 'Automatically tweet when you get a coffee with a message. Your fans would love it!',
      'connected': false,
    },
    // Add more integrations...
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Integrations',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 34),
          Expanded(child: Container(
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Extend Blocks with apps', style: TextStyle(fontSize: 22),),
                SizedBox(height: 12),
                Text("Here's an ongoing list of integrations to help you earn more supporters and to better connect with them.", style: TextStyle(fontSize: 14)),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      AppIntegrationTile(
                        icon: FontAwesomeIcons.twitter,
                        title: "Twitter",
                        description: "Automatically tweet when you get a coffee with a message. Your fans would love it!",
                        isConnected: true,
                      ),
                      Divider(color: greyText, thickness: 0.5),
                      AppIntegrationTile(
                        icon: FontAwesomeIcons.linkedin,
                        title: "LinkedIn",
                        description: "Automatically tweet when you get a coffee with a message. Your fans would love it!",
                        isConnected: false,
                      ),
                      Divider(color: greyText, thickness: 0.5),
                      AppIntegrationTile(
                        icon: FontAwesomeIcons.instagram,
                        title: "LinkedIn",
                        description: "Automatically tweet when you get a coffee with a message. Your fans would love it!",
                        isConnected: false,
                      ),
                      Divider(color: greyText, thickness: 0.5),
                      AppIntegrationTile(
                        icon: FontAwesomeIcons.slack,
                        title: "LinkedIn",
                        description: "Automatically tweet when you get a coffee with a message. Your fans would love it!",
                        isConnected: false,
                      ),
                      Divider(color: greyText, thickness: 0.5),
                      AppIntegrationTile(
                        icon: FontAwesomeIcons.youtube,
                        title: "LinkedIn",
                        description: "Automatically tweet when you get a coffee with a message. Your fans would love it!",
                        isConnected: false,
                      ),
                    ],
                  ),
                ),
              ]
            )
          ))
        ],
      ),
    );
  }
}

class AppIntegrationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isConnected;

  AppIntegrationTile({
    required this.icon,
    required this.title,
    required this.description,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     spreadRadius: 2,
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.blue),  // Icon color and size can be adjusted
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: isConnected ? Colors.red : greyText,  // Background color
              backgroundColor: Colors.white,  // Text color
            ),
            child: Text(isConnected ? 'Disconnect' : 'Connect'),
          ),
        ],
      ),
    );
  }
}
