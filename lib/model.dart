class User{
  String name = "";
  String email = "";
  User.fromJson(Map<String,dynamic> json):name=json['name'],email=json['email'];
}