import 'package:flutter/material.dart';

class ControllerResult {
  final double imc;

  ControllerResult(this.imc);


  String get interpretacao {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade grau 1';
    if (imc < 39.9) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }

  Color get cor {
    if (imc < 18.5) return Colors.yellow;
    if (imc < 24.9) return Colors.green;
    if (imc < 29.9) return Colors.orange;
    if (imc < 34.9) return Colors.deepOrange;
    if (imc < 39.9) return Colors.red;
    return Colors.redAccent;
  }

  IconData get icone {
    if (imc < 18.5) return Icons.sentiment_dissatisfied;
    if (imc < 24.9) return Icons.sentiment_very_satisfied;
    if (imc < 29.9) return Icons.sentiment_neutral;
    return Icons.sentiment_very_dissatisfied;
  }

  double get progresso {
    // IMC comum varia de 10‒45
    final p = (imc - 10) / (45 - 10);
    return p.clamp(0.0, 1.0);
  }

  String mensagemPersonalizada() {
    switch (interpretacao) {
      case 'Abaixo do peso':
        return 'Você está abaixo do peso ideal. Considere procurar um nutricionista para orientação.';
      case 'Peso normal':
        return 'Parabéns! Seu peso está dentro da faixa ideal.';
      case 'Sobrepeso':
        return 'Atenção: você está com sobrepeso. Um estilo de vida mais ativo pode ajudar.';
      case 'Obesidade grau 1':
        return 'Cuidado! Seu IMC indica obesidade grau 1. Avalie mudanças no seu dia a dia.';
      case 'Obesidade grau 2':
        return 'Alerta: obesidade grau 2. Procure ajuda médica para orientação personalizada.';
      case 'Obesidade grau 3':
        return 'Risco elevado à saúde. Procure um profissional de saúde o quanto antes.';
      default:
        return '';
    }
  }
}
