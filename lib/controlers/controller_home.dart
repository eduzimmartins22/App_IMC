import 'package:flutter/material.dart';

class ControllerHome {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  double? imc;
  String? interpretacao;

  void calcularIMC({
    required BuildContext context,
    required VoidCallback onResultadoPronto,
  }) {
    final double? altura = double.tryParse(alturaController.text);
    final double? peso = double.tryParse(pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      imc = peso / (altura * altura);

      if (imc! < 18.5) {
        interpretacao = 'Abaixo do peso';
      } else if (imc! < 24.9) {
        interpretacao = 'Peso ideal';
      } else if (imc! < 29.9) {
        interpretacao = 'Sobrepeso';
      } else {
        interpretacao = 'Obesidade';
      }

      onResultadoPronto();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha os campos corretamente')),
      );
    }
  }

  void dispose() {
    alturaController.dispose();
    pesoController.dispose();
  }
}
