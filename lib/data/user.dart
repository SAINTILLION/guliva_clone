class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  // Method to convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
