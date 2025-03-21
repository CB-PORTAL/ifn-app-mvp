import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../discover/discover_screen.dart';
import '../projects/projects_screen.dart';
import '../messages/messages_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    DiscoverScreen(),
    ProjectsScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];
  
  final List<String> _titles = [
    'Discover',
    'Projects',
    'Messages',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.secondaryColor, width: 2),
              ),
              child: Center(
                child: Text(
                  'IFN',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(_titles[_currentIndex]),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Implement notifications
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.primaryColor,
          selectedItemColor: AppTheme.secondaryColor,
          unselectedItemColor: AppTheme.textColorSecondary,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                // Navigate to create project screen
              },
              backgroundColor: AppTheme.primaryColor,
              child: Icon(Icons.add, color: AppTheme.secondaryColor),
            )
          : null,
    );
  }
}
