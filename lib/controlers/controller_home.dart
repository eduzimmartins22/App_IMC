import 'package:flutter/material.dart';
import '../services/validar_campos_imc.dart';

class ControllerHome {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  final ValueNotifier<String?> alturaError = ValueNotifier(null);
  final ValueNotifier<String?> pesoError = ValueNotifier(null);

  double? imc;
  String? interpretacao;

  void calcularIMC({
    required BuildContext context,
    required VoidCallback onResultadoPronto,
  }) {
    alturaError.value = InputValidators.validatePositiveDouble(
      alturaController.text,
      fieldName: 'Altura',
    );
    
    pesoError.value = InputValidators.validatePositiveDouble(
      pesoController.text,
      fieldName: 'Peso',
    );

    if (alturaError.value != null || pesoError.value != null) {
      return;
    }

    final altura = double.parse(alturaController.text);
    final peso = double.parse(pesoController.text);

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
  }

  void dispose() {
    alturaController.dispose();
    pesoController.dispose();
    alturaError.dispose();
    pesoError.dispose();
  }
}