import 'dart:convert';

List<Profile> profileFromJson(String str) => List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.contactNumber,
    required this.profilePicture,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String address;
  final String contactNumber;
  final String profilePicture;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    address: json["address"],
    contactNumber: json["contact_number"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "address": address,
    "contact_number": contactNumber,
    "profile_picture": profilePicture,
  };
}
