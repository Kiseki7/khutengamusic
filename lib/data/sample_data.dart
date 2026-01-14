import '../models/music_models.dart';

class SampleData {
  static List<Song> get songs => [
    Song(
      id: '1',
      title: 'Life Mfwaya',
      artist: 'Trooth Boaller Coziem',
      album: 'Zambian Hits',
      coverUrl: 'https://picsum.photos/200',
      audioPath: 'audio/songs/trooth-boaller_trooth-boaller-coziem-titile-life-mfwaya.mp3',
      duration: const Duration(minutes: 3, seconds: 45),
      streamCount: 1500,
    ),
    Song(
      id: '2',
      title: 'Zambian Sunshine',
      artist: 'Local Artist',
      album: 'African Rhythms',
      coverUrl: 'https://picsum.photos/201',
      audioPath: 'audio/songs/song2.mp3',
      duration: const Duration(minutes: 4, seconds: 20),
      streamCount: 2300,
    ),
    Song(
      id: '3',
      title: 'Kalindula Groove',
      artist: 'Traditional Band',
      album: 'Heritage Sounds',
      coverUrl: 'https://picsum.photos/202',
      audioPath: 'audio/songs/song3.mp3',
      duration: const Duration(minutes: 3, seconds: 15),
      streamCount: 1800,
    ),
  ];

  static List<Playlist> get playlists => [
    Playlist(
      id: '1',
      name: 'Zambian Classics',
      description: 'The best of Zambian music',
      coverUrl: 'https://picsum.photos/203',
      songs: songs,
    ),
    Playlist(
      id: '2',
      name: 'Modern Zambian',
      description: 'Contemporary Zambian hits',
      coverUrl: 'https://picsum.photos/204',
      songs: songs.sublist(0, 1),
    ),
  ];

  static List<Podcast> get podcasts => [
    Podcast(
      id: 'p1',
      title: 'Stories from Africa',
      host: 'James Mwale',
      description: 'Untold stories and hidden gems from across Africa',
      coverUrl: 'https://picsum.photos/400',
      episodes: [
        Episode(
          id: 'e1',
          title: 'The Rise of Zambian Tech',
          description: 'Exploring technology innovation in Zambia',
          audioPath: 'audio/podcasts/episode1.mp3',
          duration: const Duration(minutes: 45),
          releaseDate: DateTime(2025, 12, 15),
          listenCount: 5420,
        ),
        Episode(
          id: 'e2',
          title: 'Music and Culture',
          description: 'How traditional music shapes modern Zambia',
          audioPath: 'audio/podcasts/episode2.mp3',
          duration: const Duration(minutes: 38),
          releaseDate: DateTime(2025, 12, 8),
          listenCount: 3210,
        ),
      ],
      subscriberCount: 45000,
      category: 'Culture',
    ),
    Podcast(
      id: 'p2',
      title: 'Zambian News Daily',
      host: 'Michael Chitikiro',
      description: 'Daily news and current events from Zambia',
      coverUrl: 'https://picsum.photos/401',
      episodes: [
        Episode(
          id: 'e3',
          title: 'Weekly Roundup',
          description: 'News highlights from the week',
          audioPath: 'audio/podcasts/episode3.mp3',
          duration: const Duration(minutes: 25),
          releaseDate: DateTime(2025, 12, 20),
          listenCount: 8900,
        ),
      ],
      subscriberCount: 120000,
      category: 'News',
    ),
    Podcast(
      id: 'p3',
      title: 'Laugh Track Comedy',
      host: 'Comedy Crew',
      description: 'Funny stories and comedy sketches',
      coverUrl: 'https://picsum.photos/402',
      episodes: [
        Episode(
          id: 'e4',
          title: 'Episode 1: Life in the City',
          description: 'Hilarious takes on city living',
          audioPath: 'audio/podcasts/episode4.mp3',
          duration: const Duration(minutes: 32),
          releaseDate: DateTime(2025, 12, 18),
          listenCount: 6750,
        ),
      ],
      subscriberCount: 78000,
      category: 'Comedy',
    ),
    Podcast(
      id: 'p4',
      title: 'Tech Talk Africa',
      host: 'Sarah Johnson',
      description: 'Technology trends and entrepreneurship',
      coverUrl: 'https://picsum.photos/403',
      episodes: [
        Episode(
          id: 'e5',
          title: 'AI in Africa',
          description: 'Artificial intelligence transforming the continent',
          audioPath: 'audio/podcasts/episode5.mp3',
          duration: const Duration(minutes: 52),
          releaseDate: DateTime(2025, 12, 17),
          listenCount: 12450,
        ),
      ],
      subscriberCount: 95000,
      category: 'Technology',
    ),
  ];

  static List<RadioStation> get radioStations => [
    RadioStation(
      id: 'r1',
      name: 'Lusaka FM',
      genre: 'Mixed',
      streamUrl: 'https://stream.lusaka.fm',
      logoUrl: 'https://picsum.photos/500',
      description: 'Your favorite mix of music and talk',
      listeners: 125000,
      isLive: true,
    ),
    RadioStation(
      id: 'r2',
      name: 'Afrobeats Radio',
      genre: 'Afrobeats',
      streamUrl: 'https://stream.afrobeats.fm',
      logoUrl: 'https://picsum.photos/501',
      description: 'Non-stop Afrobeats and African music',
      listeners: 89000,
      isLive: true,
    ),
    RadioStation(
      id: 'r3',
      name: 'Copperbelt Voice',
      genre: 'News & Talk',
      streamUrl: 'https://stream.copperbelt.fm',
      logoUrl: 'https://picsum.photos/502',
      description: 'Local news and community talk',
      listeners: 67000,
      isLive: true,
    ),
    RadioStation(
      id: 'r4',
      name: 'Jazz Nights',
      genre: 'Jazz',
      streamUrl: 'https://stream.jazznights.fm',
      logoUrl: 'https://picsum.photos/503',
      description: 'Smooth jazz for the evening',
      listeners: 45000,
      isLive: true,
    ),
    RadioStation(
      id: 'r5',
      name: 'Traditional Sounds',
      genre: 'Traditional',
      streamUrl: 'https://stream.traditional.fm',
      logoUrl: 'https://picsum.photos/504',
      description: 'Celebrating Zambian heritage music',
      listeners: 56000,
      isLive: true,
    ),
    RadioStation(
      id: 'r6',
      name: 'Youth Station',
      genre: 'Hip-Hop/Pop',
      streamUrl: 'https://stream.youthstation.fm',
      logoUrl: 'https://picsum.photos/505',
      description: 'Latest hip-hop and pop hits',
      listeners: 98000,
      isLive: true,
    ),
  ];

  // Method to get lyrics for a song
  static String getLyrics(String songId) {
    switch (songId) {
      case '1':
        return '''
Life Mfwaya, life imfwaya
Tulelanda amalungo
Mwe bantu mulelanda amalungo
Life Mfwaya, life imfwaya

Bamubile ifyo balanda
Tulelanda fye amalungo
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
      case '2':
        return '''
Zambian sunshine, shining so bright
Lighting up my world, day and night
The rhythm of the drums, the beat of my heart
In this Zambian sunshine, we'll never part
''';
      case '3':
        return '''
Kalindula groove, moving my feet
To the traditional rhythm, so sweet
The sound of heritage, the pride of our land
Kalindula music, so grand
''';
      default:
        return 'Lyrics not available for this song.';
    }
  }
}