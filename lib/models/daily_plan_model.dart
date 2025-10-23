class VerseRange {
  final String surah;
  final int from;
  final int to;

  const VerseRange({
    required this.surah,
    required this.from,
    required this.to,
  });

  factory VerseRange.fromJson(Map<String, dynamic> json) {
    return VerseRange(
      surah: json['surah'] as String,
      from: json['from'] as int,
      to: json['to'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surah': surah,
      'from': from,
      'to': to,
    };
  }
}

class PlanItem {
  final String id;
  final String title;
  final String? description;
  final String aiMode;
  final List<VerseRange> verses;

  const PlanItem({
    required this.id,
    required this.title,
    required this.aiMode,
    required this.verses,
    this.description,
  });

  factory PlanItem.fromJson(Map<String, dynamic> json) {
    final List<VerseRange> verses = (json['verses'] as List<dynamic>)
        .map((e) => VerseRange.fromJson(e as Map<String, dynamic>))
        .toList();
    return PlanItem(
      id: json['id'] as String,
      title: json['title'] as String,
      aiMode: json['ai_mode'] as String,
      verses: verses,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ai_mode': aiMode,
      'verses': verses.map((e) => e.toJson()).toList(),
    };
  }
}

class PreparationPlan {
  final List<PlanItem> weekly;
  final List<PlanItem> nightly;
  final List<PlanItem> preSession;

  const PreparationPlan({
    this.weekly = const [],
    this.nightly = const [],
    this.preSession = const [],
  });

  factory PreparationPlan.fromJson(Map<String, dynamic> json) {
    List<PlanItem> parseList(String key) {
      final list = (json[key] as List<dynamic>? ?? []);
      return list
          .map((e) => PlanItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return PreparationPlan(
      weekly: parseList('weekly'),
      nightly: parseList('nightly'),
      preSession: parseList('pre_session'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weekly': weekly.map((e) => e.toJson()).toList(),
      'nightly': nightly.map((e) => e.toJson()).toList(),
      'pre_session': preSession.map((e) => e.toJson()).toList(),
    };
  }
}

class DailyPlan {
  final PreparationPlan preparation;
  final List<PlanItem> memorization;
  final List<PlanItem> nearReview;
  final List<PlanItem> farReview;
  final List<PlanItem> dailyRecitation;

  const DailyPlan({
    this.preparation = const PreparationPlan(),
    this.memorization = const [],
    this.nearReview = const [],
    this.farReview = const [],
    this.dailyRecitation = const [],
  });

  factory DailyPlan.fromJson(Map<String, dynamic> json) {
    List<PlanItem> parseList(String key) {
      final list = (json[key] as List<dynamic>? ?? []);
      return list
          .map((e) => PlanItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return DailyPlan(
      preparation:
          PreparationPlan.fromJson((json['preparation'] as Map<String, dynamic>? ?? {})),
      memorization: parseList('memorization'),
      nearReview: parseList('near_review'),
      farReview: parseList('far_review'),
      dailyRecitation: parseList('daily_recitation'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'preparation': preparation.toJson(),
      'memorization': memorization.map((e) => e.toJson()).toList(),
      'near_review': nearReview.map((e) => e.toJson()).toList(),
      'far_review': farReview.map((e) => e.toJson()).toList(),
      'daily_recitation': dailyRecitation.map((e) => e.toJson()).toList(),
    };
  }
}
