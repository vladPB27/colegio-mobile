class Alumno {
  String? id;
  String? nombres;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? sexo;
  String? dni;
  String? fechaNacimiento;
  String? celular;
  String? email;
  String? datosDelPadre;
  String? datosDelaMadre;
  String? direccion;

  Alumno(
      {
        this.id,
        this.nombres,
        this.apellidoPaterno,
        this.apellidoMaterno,
        this.sexo,
        this.dni,
        this.fechaNacimiento,
        this.celular,
        this.email,
        this.datosDelPadre,
        this.datosDelaMadre,
        this.direccion});

  Alumno.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombres = json['nombres'];
    apellidoPaterno = json['apellidoPaterno'];
    apellidoMaterno = json['apellidoMaterno'];
    sexo = json['sexo'];
    dni = json['dni'];
    fechaNacimiento = json['fechaNacimiento'];
    celular = json['celular'];
    email = json['email'];
    datosDelPadre = json['datosDelPadre'];
    datosDelaMadre = json['datosDelaMadre'];
    direccion = json['direccion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['nombres'] = this.nombres;
    data['apellidoPaterno'] = this.apellidoPaterno;
    data['apellidoMaterno'] = this.apellidoMaterno;
    data['sexo'] = this.sexo;
    data['dni'] = this.dni;
    data['fechaNacimiento'] = this.fechaNacimiento;
    data['celular'] = this.celular;
    data['email'] = this.email;
    data['datosDelPadre'] = this.datosDelPadre;
    data['datosDelaMadre'] = this.datosDelaMadre;
    data['direccion'] = this.direccion;
    return data;
  }
}