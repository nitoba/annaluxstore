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

  Map<String, dynamic> toJson() => {};
}
