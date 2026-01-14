enum ContentType { music, podcast, radio }

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final String audioPath;
  final Duration duration;
  final int streamCount;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
    required this.audioPath,
    required this.duration,
    required this.streamCount,
  });
}

class Podcast {
  final String id;
  final String title;
  final String host;
  final String description;
  final String coverUrl;
  final List<Episode> episodes;
  final int subscriberCount;
  final String category;

  Podcast({
    required this.id,
    required this.title,
    required this.host,
    required this.description,
    required this.coverUrl,
    required this.episodes,
    required this.subscriberCount,
    required this.category,
  });
}

class Episode {
  final String id;
  final String title;
  final String description;
  final String audioPath;
  final Duration duration;
  final DateTime releaseDate;
  final int listenCount;

  Episode({
    required this.id,
    required this.title,
    required this.description,
    required this.audioPath,
    required this.duration,
    required this.releaseDate,
    required this.listenCount,
  });
}

class RadioStation {
  final String id;
  final String name;
  final String genre;
  final String streamUrl;
  final String logoUrl;
  final String description;
  final int listeners;
  final bool isLive;

  RadioStation({
    required this.id,
    required this.name,
    required this.genre,
    required this.streamUrl,
    required this.logoUrl,
    required this.description,
    required this.listeners,
    required this.isLive,
  });
}

class Playlist {
  final String id;
  final String name;
  final String? description;
  final String coverUrl;
  final List<Song> songs;

  Playlist({
    required this.id,
    required this.name,
    this.description,
    required this.coverUrl,
    required this.songs,
  });
}

class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
  });
}