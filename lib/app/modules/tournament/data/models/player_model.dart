class Player {
  final String name;
  final String avatar;
  final int? score;
  final int? position;
   bool isSelected;

  Player({
    required this.name,
    required this.avatar,
    this.isSelected = false,
    this.score,
    this.position,
  });

  Player copyWith ({
    String? name,
    String? avatar,
    int? score,
    int? position,
    bool? isSelected,
  }) {
    return Player(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      score: score ?? this.score,
      position: position ?? this.position,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
