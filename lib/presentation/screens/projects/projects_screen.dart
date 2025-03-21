import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

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
              'My Projects',
              style: AppTheme.subheadingStyle,
            ),
            SizedBox(height: 16),
            
            // Project categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('All', true),
                  _buildCategoryChip('In Progress', false),
                  _buildCategoryChip('Completed', false),
                  _buildCategoryChip('Planning', false),
                ],
              ),
            ),
            SizedBox(height: 24),
            
            // No projects message
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
                        Icons.movie_creation,
                        size: 40,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Projects Yet',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textColorPrimary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start creating your film projects',
                      style: TextStyle(
                        color: AppTheme.textColorSecondary,
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Add New Project'),
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
  
  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppTheme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppTheme.backgroundColor,
        selectedColor: AppTheme.primaryColor,
        side: BorderSide(
          color: AppTheme.primaryColor,
        ),
        onSelected: (selected) {},
      ),
    );
  }
}
