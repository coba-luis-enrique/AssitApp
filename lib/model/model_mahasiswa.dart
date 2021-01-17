class ModelTutoria {
  int id;
  String asesorName;
  String materiaName;
  String fechaName;
  String matriculaName;
  String email;

  ModelTutoria({
    this.asesorName,
    this.materiaName,
    this.fechaName,
    this.matriculaName,
    this.email,
  });

  ModelTutoria.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.asesorName = map['asesorName'];
    this.materiaName = map['materiaName'];
    this.fechaName = map['fechaName'];
    this.matriculaName = map['matriculaName'];
    this.email = map['email'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['asesorName'] = asesorName;
    map['materiaName'] = materiaName;
    map['fechaName'] = fechaName;
    map['matriculaName'] = matriculaName;
    map['email'] = email;

    return map;
  }
}
