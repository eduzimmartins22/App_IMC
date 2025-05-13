import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double imc;

  const ResultScreen({super.key, required this.imc});

  String getInterpretacao() {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade grau 1';
    if (imc < 39.9) return 'Obesidade grau 2';
    return 'Obesidade grau 3';
  }

  Color getCor() {
    if (imc < 18.5) return Colors.yellow;
    if (imc < 24.9) return Colors.green;
    if (imc < 29.9) return Colors.orange;
    if (imc < 34.9) return Colors.deepOrange;
    if (imc < 39.9) return Colors.red;
    return Colors.redAccent;
  }

  IconData getIcon() {
    if (imc < 18.5) return Icons.sentiment_dissatisfied;
    if (imc < 24.9) return Icons.sentiment_very_satisfied;
    if (imc < 29.9) return Icons.sentiment_neutral;
    return Icons.sentiment_very_dissatisfied;
  }

  double getProgressValue() {
    // IMC comum varia de 10 até 45
    double progress = (imc - 10) / (45 - 10);
    return progress.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final cor = getCor();
    final interpretacao = getInterpretacao();
    final icone = getIcon();
    final progresso = getProgressValue();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do IMC')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(icone, size: 100, color: cor),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'IMC: ${imc.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: cor),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Classificação:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              interpretacao,
              style: TextStyle(fontSize: 24, color: cor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text('Saúde', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progresso,
              minHeight: 20,
              color: cor,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 32),
            Card(
              color: cor.withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _mensagemPersonalizada(interpretacao),
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.refresh),
              label: const Text('Calcular novamente'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _mensagemPersonalizada(String interpretacao) {
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
