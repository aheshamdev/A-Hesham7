class UserProgress {
  final int streak;
  final int lessonsCompleted;
  final Map<String, dynamic> dailyStats;

  const UserProgress({
    this.streak = 0,
    this.lessonsCompleted = 0,
    this.dailyStats = const {},
  });

  UserProgress copyWith({
    int? streak,
    int? lessonsCompleted,
    Map<String, dynamic>? dailyStats,
  }) {
    return UserProgress(
      streak: streak ?? this.streak,
      lessonsCompleted: lessonsCompleted ?? this.lessonsCompleted,
      dailyStats: dailyStats ?? this.dailyStats,
    );
  }

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      streak: (json['streak'] ?? 0) as int,
      lessonsCompleted: (json['lessonsCompleted'] ?? 0) as int,
      dailyStats: (json['dailyStats'] as Map<String, dynamic>?) ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'streak': streak,
      'lessonsCompleted': lessonsCompleted,
      'dailyStats': dailyStats,
    };
  }
}
