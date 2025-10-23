import '../models/daily_plan_model.dart';
import '../utils/constants.dart';

class MockDataService {
  DailyPlan buildMockDailyPlan() {
    return DailyPlan(
      preparation: PreparationPlan(
        weekly: [
          PlanItem(
            id: 'prep_week_1',
            title: 'مراجعة مخارج الحروف',
            aiMode: AiModes.readingValidation,
            verses: const [
              VerseRange(surah: 'الفاتحة', from: 1, to: 7),
            ],
            description: 'تمارين على مخارج الحروف لمدة 10 دقائق',
          ),
        ],
        nightly: const [],
        preSession: const [],
      ),
      memorization: const [],
      nearReview: const [],
      farReview: const [],
      dailyRecitation: const [],
    );
  }
}
