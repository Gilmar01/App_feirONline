
class Vendedor{

  int id;
  String nome;
  String naturalidade;
  DateTime dataNascimento;
  String linkWhatsapp;
  String email;
  String password = "";

  Vendedor({
    required this.id, required this.nome,
    required this.naturalidade, 
    required this.dataNascimento, 
    required this.linkWhatsapp,
    required this.email
  });
  
  Vendedor.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    nome = json["nome"],
    naturalidade = json['naturalidade'],
    dataNascimento = DateTime.parse(json["link_whatsapp"]),
    linkWhatsapp = json['whatsapp'],
    email = json["email"];

}



class VendedorProduto{
  String nome;
  String linkWhatsapp;
  String email;

  VendedorProduto({
    required this.nome, 
    required this.linkWhatsapp,
    required this.email
  });

  VendedorProduto.fromJson(Map<String, dynamic> json)
   :nome = json["nome"],
    linkWhatsapp = json['whatsapp'],
    email = json["email"];
}