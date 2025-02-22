import 'followers_range.dart';

class RequestDetails {
  final List<String>? cities;
  final List<String>? categories;
  final List<String>? languages;
  final List<String>? platform;
  final String? brand;
  final FollowersRange? followersRange;

  RequestDetails({
    required this.cities,
    required this.categories,
    required this.languages,
    required this.platform,
    this.brand,
    this.followersRange,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      cities: json['cities']?.cast<String>(),
      categories: json['categories']?.cast<String>(),
      languages: json['languages']?.cast<String>(),
      platform: json['platform']?.cast<String>(),
      brand: json['brand'],
      followersRange: json['followers_range'] != null
          ? FollowersRange.fromJson(json['followers_range'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cities': cities,
      'categories': categories,
      'languages': languages,
      'platform': platform,
      'brand': brand,
      'followers_range': followersRange?.toJson(),
    };
  }
}
