import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Messages',
              style: AppTheme.subheadingStyle,
            ),
            SizedBox(height: 16),
            
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search conversations...',
                prefixIcon: Icon(Icons.search, color: AppTheme.primaryColor),
                filled: true,
                fillColor: AppTheme.surfaceColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            SizedBox(height: 16),
            
            // No messages message
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
                      ),
                      child: Icon(
                        Icons.message,
                        size: 40,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Messages Yet',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textColorPrimary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Connect with filmmakers to start chatting',
                      style: TextStyle(
                        color: AppTheme.textColorSecondary,
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.people),
                      label: Text('Discover Filmmakers'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
