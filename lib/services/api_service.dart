import 'dart:convert';

import 'package:http/http.dart' as http;

// خدمة API للاتصال بـ FastAPI لاستلام نتائج تحليل الصوت
class ApiService {
  ApiService({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        _baseUrl = baseUrl ?? 'http://10.0.2.2:8000'; // Android emulator localhost

  final http.Client _client;
  final String _baseUrl;

  Future<Map<String, dynamic>> analyzeAudio({
    required List<int> pcmBytes,
    required String aiMode,
  }) async {
    final uri = Uri.parse('$_baseUrl/analyze');
    final resp = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'mode': aiMode,
        'audio': base64Encode(pcmBytes),
      }),
    );

    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      return jsonDecode(resp.body) as Map<String, dynamic>;
    }
    throw Exception('API error: ${resp.statusCode}');
  }
}
