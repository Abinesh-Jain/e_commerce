class FollowersRange {
  final String? igFollowersMin;
  final String? igFollowersMax;

  FollowersRange({this.igFollowersMin, this.igFollowersMax});

  factory FollowersRange.fromJson(Map<String, dynamic> json) {
    return FollowersRange(
      igFollowersMin: json['ig_followers_min'],
      igFollowersMax: json['ig_followers_max'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ig_followers_min': igFollowersMin,
      'ig_followers_max': igFollowersMax,
    };
  }
}
