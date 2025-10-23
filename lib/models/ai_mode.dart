/// AI modes used by the app for different validation flows.
/// Keep keys in sync with JSON values in `daily_plan.json`.
enum AiMode {
  readingValidation, // reading_validation
  memorizationCheck, // memorization_check
}

extension AiModeCodec on AiMode {
  String get key => switch (this) {
        AiMode.readingValidation => 'reading_validation',
        AiMode.memorizationCheck => 'memorization_check',
      };

  String get arabicLabel => switch (this) {
        AiMode.readingValidation => 'تحقق القراءة',
        AiMode.memorizationCheck => 'تحقق الحفظ',
      };

  static AiMode fromKey(String value) {
    switch (value) {
      case 'memorization_check':
        return AiMode.memorizationCheck;
      case 'reading_validation':
      default:
        return AiMode.readingValidation;
    }
  }
}
