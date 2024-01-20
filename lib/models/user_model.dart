import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilePic;
  final String banner;
  final String uid;
  final bool isAuthenticated;
  final int karma;
  final List<String> awards;
  UserModel({
    required this.name,
    required this.profilePic,
    required this.banner,
    required this.uid,
    required this.isAuthenticated,
    required this.karma,
    required this.awards,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? banner,
    bool? isAuthenticated,
    int? karma,
    List<String>? awards,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      karma: karma ?? this.karma,
      awards: awards ?? this.awards,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'profilePic': profilePic});
    result.addAll({'banner': banner});
    result.addAll({'isAuthenticated': isAuthenticated});
    result.addAll({'karma': karma});
    result.addAll({'awards': awards});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      uid: map['uid'] ?? '',
      banner: map['banner'] ?? '',
      isAuthenticated: map['isAuthenticated'] ?? false,
      karma: map['karma']?.toInt() ?? 0,
      awards: List<String>.from(map['awards']),
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, banner: $banner, isAuthenticated: $isAuthenticated, karma: $karma, awards: $awards)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.profilePic == profilePic &&
        other.banner == banner &&
        other.isAuthenticated == isAuthenticated &&
        other.karma == karma &&
        listEquals(other.awards, awards);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        banner.hashCode ^
        isAuthenticated.hashCode ^
        karma.hashCode ^
        awards.hashCode;
  }
}
