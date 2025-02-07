class User {
  final String id;
  final String? name;
  final String? username;
  final String? profileUrl;

  User({required this.id, this.name, this.username, this.profileUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      profileUrl: json['profile_url']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'profile_url': profileUrl
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, profileUrl: $profileUrl)';
  }
}
