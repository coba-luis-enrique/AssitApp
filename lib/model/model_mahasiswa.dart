class ModelMahasiswa {
  int id;
  String firstName;
  String lastName;
  String jurusan;
  String mobileNumber;
  String email;

  ModelMahasiswa({
    this.firstName,
    this.lastName,
    this.jurusan,
    this.mobileNumber,
    this.email,
  });

  ModelMahasiswa.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.firstName = map['firstName'];
    this.lastName = map['lastName'];
    this.jurusan = map['jurusan'];
    this.mobileNumber = map['mobileNumber'];
    this.email = map['email'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['jurusan'] = jurusan;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;

    return map;
  }
}
