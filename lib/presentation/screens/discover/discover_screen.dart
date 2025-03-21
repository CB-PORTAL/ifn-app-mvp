import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Human', 'AI', 'Hybrid'];
  
  // Mock data for filmmakers
  final List<Map<String, dynamic>> _filmmakers = [
    {
      'name': 'Jordan Smith',
      'role': 'Director',
      'type': 'Human',
      'location': 'Atlanta, GA',
      'image': null, // Placeholder for actual image
    },
    {
      'name': 'Alex Johnson',
      'role': 'Cinematographer',
      'type': 'Human',
      'location': 'Atlanta, GA',
      'image': null,
    },
    {
      'name': 'Morgan Lee',
      'role': 'Writer',
      'type': 'Hybrid',
      'location': 'Atlanta, GA',
      'image': null,
    },
    {
      'name': 'Taylor Rivera',
      'role': 'VFX Artist',
      'type': 'AI',
      'location': 'Atlanta, GA',
      'image': null,
    },
    {
      'name': 'Casey Wilson',
      'role': 'Producer',
      'type': 'Human',
      'location': 'Atlanta, GA',
      'image': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter filmmakers based on selected filter
    List<Map<String, dynamic>> filteredFilmmakers = _selectedFilter == 'All'
        ? _filmmakers
        : _filmmakers.where((filmmaker) => filmmaker['type'] == _selectedFilter).toList();

    return Container(
      color: AppTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location header
          Container(
            padding: EdgeInsets.all(16),
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
            child: Row(
              children: [
                Icon(Icons.location_on, color: AppTheme.primaryColor),
                SizedBox(width: 8),
                Text(
                  'Atlanta, Georgia',
                  style: TextStyle(
                    color: AppTheme.textColorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                TextButton.icon(
                  icon: Icon(Icons.edit_location_alt, color: AppTheme.primaryColor),
                  label: Text(
                    'Change',
                    style: TextStyle(color: AppTheme.primaryColor),
                  ),
                  onPressed: () {
                    // Implement location change
                  },
                ),
              ],
            ),
          ),
          
          // Filter chips
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover Filmmakers',
                  style: AppTheme.subheadingStyle,
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _filters.map((filter) {
                      bool isSelected = _selectedFilter == filter;
                      Color filterColor = filter == 'Human'
                          ? AppTheme.humanColor
                          : filter == 'AI'
                              ? AppTheme.aiColor
                              : filter == 'Hybrid'
                                  ? AppTheme.hybridColor
                                  : AppTheme.primaryColor;
                      
                      return Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: FilterChip(
                          label: Text(filter),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : filterColor,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: AppTheme.backgroundColor,
                          selectedColor: filterColor,
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                          },
                          side: BorderSide(color: filterColor),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          
          // Filmmakers list
          Expanded(
            child: filteredFilmmakers.isEmpty
                ? Center(
                    child: Text(
                      'No filmmakers found',
                      style: TextStyle(color: AppTheme.textColorSecondary),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: filteredFilmmakers.length,
                    itemBuilder: (context, index) {
                      final filmmaker = filteredFilmmakers[index];
                      final typeColor = filmmaker['type'] == 'Human'
                          ? AppTheme.humanColor
                          : filmmaker['type'] == 'AI'
                              ? AppTheme.aiColor
                              : AppTheme.hybridColor;
                      
                      return Card(
                        margin: EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: AppTheme.backgroundColor,
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: typeColor.withOpacity(0.2),
                                      child: Text(
                                        filmmaker['name'].substring(0, 1),
                                        style: TextStyle(
                                          color: typeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            filmmaker['name'],
                                            style: TextStyle(
                                              color: AppTheme.textColorPrimary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                filmmaker['role'],
                                                style: TextStyle(
                                                  color: AppTheme.textColorSecondary,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Icon(
                                                Icons.location_on,
                                                size: 12,
                                                color: AppTheme.textColorSecondary,
                                              ),
                                              SizedBox(width: 2),
                                              Text(
                                                filmmaker['location'],
                                                style: TextStyle(
                                                  color: AppTheme.textColorSecondary,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: typeColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: typeColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        filmmaker['type'],
                                        style: TextStyle(
                                          color: typeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          // View profile
                                        },
                                        child: Text('View Profile'),
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(vertical: 12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Connect
                                        },
                                        child: Text('Connect'),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(vertical: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
