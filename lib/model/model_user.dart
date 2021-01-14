class Modeluser {
  int id;
  String username;
  String password;
  String email;

  Modeluser({
    this.username,
    this.password,
    this.email,
  });

  Modeluser.fromMap(Map<String, dynamic> map) {
    this.username = map['username'];
    this.password = map['password'];
    this.email = map['email'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['username'] = this.username;
    map['password'] = this.password;
    map['email'] = this.email;

    return map;
  }
}
