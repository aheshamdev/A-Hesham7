import 'dart:convert';

import 'ai_mode.dart';

/// Basic plan item representing a task with target pages and an AI mode.
class PlanItem {
  final String id;
  final String title; // Arabic title to show in UI
  final AiMode aiMode; // reading_validation | memorization_check
  final List<String> pages; // List of page/ayah ranges in Arabic

  const PlanItem({
    required this.id,
    required this.title,
    required this.aiMode,
    required this.pages,
  });

  factory PlanItem.fromJson(Map<String, dynamic> json) {
    return PlanItem(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      aiMode: AiModeCodec.fromKey(json['ai_mode']?.toString() ?? 'reading_validation'),
      pages: (json['pages'] as List<dynamic>? ?? const []).map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'ai_mode': aiMode.key,
        'pages': pages,
      };
}

/// Preparation plan split into weekly, nightly, and pre-session preparation.
class PreparationPlan {
  final List<PlanItem> weekly;
  final List<PlanItem> nightly;
  final List<PlanItem> pre;

  const PreparationPlan({
    required this.weekly,
    required this.nightly,
    required this.pre,
  });

  factory PreparationPlan.fromJson(Map<String, dynamic> json) {
    List<PlanItem> _parse(String key) {
      return (json[key] as List<dynamic>? ?? const [])
          .map((e) => PlanItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return PreparationPlan(
      weekly: _parse('weekly'),
      nightly: _parse('nightly'),
      pre: _parse('pre'),
    );
  }

  Map<String, dynamic> toJson() => {
        'weekly': weekly.map((e) => e.toJson()).toList(),
        'nightly': nightly.map((e) => e.toJson()).toList(),
        'pre': pre.map((e) => e.toJson()).toList(),
      };
}

/// Full daily plan including preparation and the review tasks for the day.
class DailyPlan {
  final PreparationPlan preparation;
  final List<PlanItem> memorizationToday;
  final List<PlanItem> nearReviewToday;
  final List<PlanItem> farReviewToday;

  const DailyPlan({
    required this.preparation,
    required this.memorizationToday,
    required this.nearReviewToday,
    required this.farReviewToday,
  });

  factory DailyPlan.fromJson(Map<String, dynamic> json) {
    List<PlanItem> _parseToday(String group) {
      final groupData = json[group] as Map<String, dynamic>?;
      final today = groupData != null ? groupData['today'] as List<dynamic>? : null;
      return (today ?? const [])
          .map((e) => PlanItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return DailyPlan(
      preparation: PreparationPlan.fromJson(json['preparation'] as Map<String, dynamic>? ?? const {}),
      memorizationToday: _parseToday('memorization'),
      nearReviewToday: _parseToday('near_review'),
      farReviewToday: _parseToday('far_review'),
    );
  }

  Map<String, dynamic> toJson() => {
        'preparation': preparation.toJson(),
        'memorization': {
          'today': memorizationToday.map((e) => e.toJson()).toList(),
        },
        'near_review': {
          'today': nearReviewToday.map((e) => e.toJson()).toList(),
        },
        'far_review': {
          'today': farReviewToday.map((e) => e.toJson()).toList(),
        },
      };

  static DailyPlan decode(String jsonStr) {
    return DailyPlan.fromJson(json.decode(jsonStr) as Map<String, dynamic>);
  }

  String encode() => json.encode(toJson());
}
