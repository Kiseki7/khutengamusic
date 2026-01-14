import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioService with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentSongId;
  PlayerState _playerState = PlayerState.stopped;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String? get currentSongId => _currentSongId;
  PlayerState get playerState => _playerState;
  Duration get duration => _duration;
  Duration get position => _position;
  bool get isPlaying => _playerState == PlayerState.playing;

  AudioService() {
    _setupListeners();
  }

  void _setupListeners() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _playerState = state;
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      _duration = duration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      _position = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
      notifyListeners();
    });
  }

  Future<void> playSong(String songId, String audioPath) async {
    try {
      if (_currentSongId == songId && isPlaying) {
        await pause();
        return;
      }

      if (_currentSongId != songId) {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource(audioPath));
        _currentSongId = songId;
      } else {
        await _audioPlayer.resume();
      }

      _playerState = PlayerState.playing;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error playing song: $e');
      }
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    _playerState = PlayerState.paused;
    notifyListeners();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _playerState = PlayerState.stopped;
    _position = Duration.zero;
    _currentSongId = null;
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}