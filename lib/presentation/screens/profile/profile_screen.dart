import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppTheme.backgroundColor,
        child: Column(
          children: [
            // Profile header with vintage style
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.primaryColor,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Filmmaker',
                    style: AppTheme.headingStyle,
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.humanColor.withOpacity(0.1),
                      border: Border.all(color: AppTheme.humanColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Human Creator',
                      style: TextStyle(
                        color: AppTheme.humanColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: AppTheme.textColorSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Atlanta, GA',
                        style: TextStyle(
                          color: AppTheme.textColorSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Independent filmmaker with a passion for documentary and narrative storytelling.',
                    textAlign: TextAlign.center,
                    style: AppTheme.bodyStyle,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            
            // Stats section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildStatCard('Projects', '7'),
                  SizedBox(width: 8),
                  _buildStatCard('Connections', '43'),
                  SizedBox(width: 8),
                  _buildStatCard('Reviews', '12'),
                ],
              ),
            ),
            
            // Projects section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Projects',
                    style: AppTheme.subheadingStyle,
                  ),
                  SizedBox(height: 16),
                  _buildProjectCard('The Silent Journey', 'Short Film', 'In Progress'),
                  SizedBox(height: 12),
                  _buildProjectCard('City Lights', 'Documentary', 'Completed'),
                  SizedBox(height: 12),
                  _buildProjectCard('Tomorrow\'s Dream', 'Feature Film', 'Planning'),
                ],
              ),
            ),
            
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.primaryColor.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: AppTheme.textColorSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProjectCard(String title, String type, String status) {
    Color statusColor = status == 'Completed' 
        ? AppTheme.humanColor 
        : status == 'In Progress' 
            ? AppTheme.secondaryColor 
            : AppTheme.aiColor;
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.movie,
              color: AppTheme.secondaryColor,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColorPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textColorSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: statusColor),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
