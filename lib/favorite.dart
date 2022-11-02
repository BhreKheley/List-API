class FootballFields {
  static final List<String> values = [id, title, teambadge];

  // table name
  static const favorite_team = 'favorite';

  // column
  static final String id = 'id';
  static final String title = 'title';
  static final String teambadge = 'teambadge';
}

// column model
class PremierLeagueFootballFav {
  final int? id;
  final String? title;
  final String? teambadge;

  PremierLeagueFootballFav(
      {this.id, required this.title, required this.teambadge});

  factory PremierLeagueFootballFav.fromMap(Map<String, dynamic> json) {
    return PremierLeagueFootballFav(
      id: json['id'] as int?,
      title: json['title'] as String?,
      teambadge: json['teambadge'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        FootballFields.id: id,
        FootballFields.title: title,
        FootballFields.teambadge: teambadge,
      };
}
