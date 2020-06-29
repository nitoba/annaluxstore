class AdressModel {
  String cep;
  String logradouro;
  String complemento;
  String bairro;

  AdressModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
  });

  factory AdressModel.fromJson(Map<String, dynamic> json) {
    return AdressModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      complemento: json['complemento'],
      bairro: json['bairro'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    return data;
  }
}
