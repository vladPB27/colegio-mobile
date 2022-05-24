class Docente {
  String? id;
  String? nombres;
  String? apellidos;
  String? sexo;
  String? celular;
  String? dni;
  String? email;
  String? especialidad;
  String? estadoCivil;
  String? direccion;

  Docente(
      {this.id,
        this.nombres,
        this.apellidos,
        this.sexo,
        this.celular,
        this.dni,
        this.email,
        this.especialidad,
        this.estadoCivil,
        this.direccion});

  Docente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombres = json['nombres'];
    apellidos = json['apellidos'];
    sexo = json['sexo'];
    celular = json['celular'];
    dni = json['dni'];
    email = json['email'];
    especialidad = json['especialidad'];
    estadoCivil = json['estadoCivil'];
    direccion = json['direccion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombres'] = this.nombres;
    data['apellidos'] = this.apellidos;
    data['sexo'] = this.sexo;
    data['celular'] = this.celular;
    data['dni'] = this.dni;
    data['email'] = this.email;
    data['especialidad'] = this.especialidad;
    data['estadoCivil'] = this.estadoCivil;
    data['direccion'] = this.direccion;
    return data;
  }
}