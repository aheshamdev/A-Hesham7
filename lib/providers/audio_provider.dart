import 'package:flutter/foundation.dart';

import '../services/audio_service.dart';
import '../services/api_service.dart';

class AudioProvider with ChangeNotifier {
  final AudioService audioService;
  final ApiService apiService;

  AudioProvider({required this.audioService, required this.apiService});

  bool get isRecording => audioService.isRecording;
  Map<String, dynamic>? _lastFeedback;

  Map<String, dynamic>? get lastFeedback => _lastFeedback;

  Future<void> startRecording() async {
    await audioService.startRecording();
    notifyListeners();
  }

  Future<void> stopAndSend({required String userId}) async {
    final path = await audioService.stopRecordingAndGetFilePath();
    if (path == null) return;
    _lastFeedback = await apiService.sendAudioForFeedback(userId: userId, filePath: path);
    notifyListeners();
  }
}
