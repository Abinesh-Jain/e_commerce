class UserDetails {
  final String? name;
  final String? profileImage;
  final String? company;
  final String? designation;

  const UserDetails({
    this.name,
    this.profileImage,
    this.company,
    this.designation,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      name: json['name'],
      profileImage: json['profile_image'],
      company: json['company'],
      designation: json['designation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profile_image': profileImage,
      'company': company,
      'designation': designation,
    };
  }
}
