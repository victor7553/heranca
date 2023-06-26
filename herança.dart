void main (){

  String nome = "laranja";
  double peso = 100.2;
  String cor = "verde";
  String sabor = "doce";
  int diasDeColheita = 20;
  bool isMadura; // <- argumento


  // instancioando a classe em objeto
  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasDeColheita);
  Fruta fruta02 = Fruta("uva", 42, "roxo", "doce", 23);

  // acessando as propriedades
  print(fruta01.nome);
  fruta01.estaMadura(30);

  print(fruta02.sabor);
  fruta02.estaMadura(12);

  // criando objetos
  Legumes mandioca1= Legumes('mandioca', 1200, 'marron', true);
  Fruta uva1 = Fruta('uva', 10, 'roxa', 'doce', 30);
  Citricas limao1 = Citricas('limao', 60, 'verde', 'azedo', 30, 8);
  Nozes avela = Nozes("avelã", 34, 'amarelo', 'doce', 30, 23);

  mandioca1.printAlimento();
  uva1.printAlimento();
  limao1.printAlimento();
  avela.printAlimento();

  mandioca1.cozinhar();
  limao1.fazerSuco();

}

class Fruta extends Alimento{
  String sabor;
  int diasDeColheita;
  bool? isMadura;

  Fruta(String nome, double peso, String cor, this.sabor, this.diasDeColheita, {this.isMadura}): super(nome, peso,cor);// <- construtor de parametro posicional

  // método
  estaMadura(int diasParaMadura){
    isMadura = diasDeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diasDeColheita dias, e precisa de $diasParaMadura para poder comer. Ela está madura ? $isMadura");
  }
  void fazerSuco(){
    print('voce fez um otimo suco de $nome');
  }

}

class Alimento{
    String nome;
    double peso;
    String cor;
    Alimento(this.nome, this.peso, this.cor);

    void printAlimento(){
      print('este(a) $nome tem o peso de $peso gramas, sua cor é $cor');


    }
}

// herança
class Legumes extends Alimento{
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar): super(nome, peso, cor); //<- super referencia ao pai da classe

// método
  void cozinhar(){
    if(isPrecisaCozinhar){
      print('pronto, $nome está cozinhando');
    }else{
      print('nem precisa cozinhar');
    }
  }
}

class Citricas extends Fruta{
  double nivelCitrica;

  Citricas(String nome, double peso, String cor, String sabor, int diasDeColheita, this.nivelCitrica): super(nome, peso, cor, sabor, diasDeColheita);

  void existeRefri(bool existe){
    if(existe){
      print('existe refrigerante de $nome');
    }else{
      print('nao existe refri de $nome');
    }
  }
}

class Nozes extends Fruta{
  double porcentagemOleNatural;
  Nozes(String nome, double peso, String cor, String sabor, int diasDeColheita, this.porcentagemOleNatural): super(nome, peso, cor, sabor, diasDeColheita);
}