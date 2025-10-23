import 'dart:async';

import 'package:flutter_sound/flutter_sound.dart';

// خدمة الصوت: تسجيل وإخراج بايتات PCM الجاهزة للتحليل
class AudioService {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    await _recorder.openRecorder();
    _initialized = true;
  }

  Future<void> dispose() async {
    if (!_initialized) return;
    await _recorder.closeRecorder();
    _initialized = false;
  }

  Future<void> startRecording() async {
    await init();
    await _recorder.startRecorder(toStream: (buffer) {
      // سيتكامل لاحقًا: تحويل الصوت إلى PCM bytes
    });
  }

  Future<List<int>> stopAndGetPcmBytes() async {
    await _recorder.stopRecorder();
    // إرجاع بيانات وهمية الآن؛ سيتكامل لاحقًا
    return <int>[];
  }

  bool get isRecording => _recorder.isRecording;
}
