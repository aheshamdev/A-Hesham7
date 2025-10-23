/// Audio recording/handling skeleton. No actual audio analysis here.
class AudioService {
  bool _isRecording = false;

  bool get isRecording => _isRecording;

  /// Start audio recording. Integrate with a plugin like `record` later.
  Future<void> startRecording() async {
    // TODO: Integrate with platform recording APIs
    _isRecording = true;
  }

  /// Stop recording and return a local file path for the recorded clip.
  Future<String?> stopRecordingAndGetFilePath() async {
    // TODO: Return real file path after recording stops
    _isRecording = false;
    return '/tmp/fake_audio_file.m4a';
  }
}
