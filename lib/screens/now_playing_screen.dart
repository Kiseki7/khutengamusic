import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/audio_service.dart';
import '../data/sample_data.dart';
import '../models/music_models.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  double _currentSliderValue = 0.0;
  bool _isLiked = false;
  bool _showLyrics = false;

  void _toggleLyrics() {
    setState(() {
      _showLyrics = !_showLyrics;
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioService = Provider.of<AudioService>(context);
    final currentSongId = audioService.currentSongId;

    if (currentSongId == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Text(
            'No song playing',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      );
    }

    final currentSong = SampleData.songs.firstWhere(
          (song) => song.id == currentSongId,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    _showLyrics ? 'LYRICS' : 'NOW PLAYING',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Expanded(
              child: _showLyrics ? _buildLyricsView(audioService, currentSong) : _buildPlayerView(audioService, currentSong),
            ),

            // Bottom Controls
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                          onChangeEnd: (value) {
                            final newPosition = Duration(
                              seconds: (currentSong.duration.inSeconds * (value / 100)).round(),
                            );
                            audioService.seek(newPosition);
                          },
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey.withOpacity(0.3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatDuration(Duration(
                                seconds: (currentSong.duration.inSeconds * (_currentSliderValue / 100)).round(),
                              )),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              _formatDuration(currentSong.duration),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Controls
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shuffle, size: 30),
                          color: Theme.of(context).colorScheme.onBackground,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_previous, size: 40),
                          color: Theme.of(context).colorScheme.onBackground,
                          onPressed: () {},
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            icon: Icon(
                              audioService.isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (audioService.isPlaying) {
                                audioService.pause();
                              } else {
                                audioService.playSong(currentSong.id, currentSong.audioPath);
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next, size: 40),
                          color: Theme.of(context).colorScheme.onBackground,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.repeat, size: 30),
                          color: Theme.of(context).colorScheme.onBackground,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Lyrics Toggle Button
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: _toggleLyrics,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _showLyrics ? Icons.album : Icons.lyrics,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _showLyrics ? 'Show Player' : 'Show Lyrics',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerView(AudioService audioService, Song currentSong) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Album Art
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Song Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentSong.title,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentSong.artist,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.green : Theme.of(context).colorScheme.onBackground,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLyricsView(AudioService audioService, Song currentSong) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Current playing line (highlighted)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.green),
            ),
            child: Text(
              'Life Mfwaya, life imfwaya',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Full lyrics
          Text(
            _getFullLyrics(),
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _getFullLyrics() {
    return '''
city kings!!, dj hecta gold
i got you we legendary
nga twafwa baka panga statue
ahh i never, relate na sober

still rock muka
boba fye amalungo
Mwe bantu mulelanda amalungo
Life Mfwaya, life imfwaya

Nalila, nalila fye
Nalila fye uluse
Life Mfwaya, life imfwaya
Tulelanda amalungo

This is the story of our lives
We're just passing through
Making the most of every moment
Life is precious, handle with care
''';
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}