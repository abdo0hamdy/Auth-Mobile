class User {

  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token; 
  String refreshToken; 
  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token,
      required this.refreshToken,  
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        image: json['image'],
        token: json['token'],
        refreshToken: json['refreshToken'],
        );
  }

  static Map<String, dynamic> toJson(User user) => {
        "id": user.id,
        "username": user.username,
        "email": user.email,
        "firstName": user.firstName,
        "lastName": user.lastName,
        "gender": user.gender,
        "image": user.image,
        "token": user.token,
        "refreshToken": user.refreshToken,
      };
}

