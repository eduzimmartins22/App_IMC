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

  @override
  Widget build(BuildContext context) {
    final cor = getCor();
    final interpretacao = getInterpretacao();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cor.withOpacity(0.1),
            border: Border.all(color: cor, width: 3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.favorite, size: 80, color: Colors.pink),
              const SizedBox(height: 16),
              Text(
                'Seu IMC é:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                imc.toStringAsFixed(2),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: cor),
              ),
              const SizedBox(height: 16),
              Text(
                interpretacao,
                style: TextStyle(fontSize: 24, color: cor),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Calcular novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
