// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
    String token;
    String userEmail;
    String userNicename;
    String userDisplayName;

    UserProfile({
        required this.token,
        required this.userEmail,
        required this.userNicename,
        required this.userDisplayName,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
    };
}
