import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<Map<String, dynamic>> _playlists = [
    {
      'name': 'Liked Songs',
      'songCount': 24,
      'color': Colors.red,
    },
    {
      'name': 'Zambian Classics',
      'songCount': 15,
      'color': Colors.blue,
    },
    {
      'name': 'Workout Mix',
      'songCount': 32,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Library',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildLibraryItem(
                    icon: Icons.favorite,
                    label: 'Liked Songs',
                    color: Colors.red,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  _buildLibraryItem(
                    icon: Icons.download,
                    label: 'Downloads',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  _buildLibraryItem(
                    icon: Icons.history,
                    label: 'Recently Played',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Playlists',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: _createNewPlaylist,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _playlists.length,
                  itemBuilder: (context, index) {
                    final playlist = _playlists[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: playlist['color'].withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.queue_music, color: playlist['color']),
                        ),
                        title: Text(
                          playlist['name'],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        subtitle: Text(
                          '${playlist['songCount']} songs',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                          ),
                        ),
                        trailing: Icon(Icons.play_arrow, color: Colors.green),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLibraryItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createNewPlaylist() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        title: Text(
            'Create Playlist',
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground)
        ),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Playlist name',
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
          ),
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
                'Cancel',
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7))
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: Create playlist
              Navigator.pop(context);
            },
            child: const Text('Create', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}