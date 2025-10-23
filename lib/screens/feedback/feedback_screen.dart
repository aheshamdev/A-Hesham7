import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/audio_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/rtl_scaffold.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();
    final auth = context.watch<AuthProvider>();

    return RtlScaffold(
      appBar: AppBar(title: const Text('التغذية الراجعة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: audio.isRecording
                  ? null
                  : () async {
                      await context.read<AudioProvider>().startRecording();
                    },
              icon: const Icon(Icons.mic),
              label: const Text('بدء التسجيل'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: audio.isRecording && auth.userId != null
                  ? () async {
                      await context.read<AudioProvider>().stopAndSend(userId: auth.userId!);
                    }
                  : null,
              icon: const Icon(Icons.stop),
              label: const Text('إيقاف وإرسال'),
            ),
            const SizedBox(height: 24),
            if (audio.lastFeedback != null) ...[
              const Text('نتائج أولية:'),
              Text(audio.lastFeedback!.toString()),
            ],
          ],
        ),
      ),
    );
  }
}
