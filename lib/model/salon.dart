class Salon {
  String? grado;
  String? seccion;

  Salon({this.grado, this.seccion});

  Salon.fromJson(Map<String, dynamic> json) {
    grado = json['grado'];
    seccion = json['seccion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grado'] = this.grado;
    data['seccion'] = this.seccion;
    return data;
  }
}