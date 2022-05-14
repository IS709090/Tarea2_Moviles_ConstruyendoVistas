import 'dart:math';

class IMC {
  double altura = 0;
  double peso = 0;
  String sexo = "Mujer";
  String tablaMujeres =
      "Edad\t\tIMC Ideal\n16-17\t\t19-24\n18-18\t\t19-24\n19-24\t\t19-24\n25-34\t\t20-25\n35-44\t\t21-26\n45-54\t\t22-27\n55-64\t\t23-28\n65-90\t\t25-30\n";
  String tablaHombres =
      "Edad\t\tIMC Ideal\n16-17\t\t18-23\n18-18\t\t19-24\n19-24\t\t19-27\n25-34\t\t20-26\n35-44\t\t21-30\n45-54\t\t22-27\n55-64\t\t23-28\n65-90\t\t25-30\n";
  double imcTotal = 0;

  setPeso(peso) {
    this.peso = peso;
  }

  setAltura(altura) {
    this.altura = altura;
  }

  setSexo(sexo) {
    this.sexo = sexo;
  }

  setIMC(peso, altura) {
    this.imcTotal = this.peso / pow(this.altura, 2);
  }

  getIMC() {
    return this.imcTotal;
  }
}
