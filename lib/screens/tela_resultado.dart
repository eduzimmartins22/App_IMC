import 'package:flutter/material.dart';
import '../controlers/controler_result.dart';   // ajuste o caminho se necessário

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required double imc})
      : _controller = ControllerResult(imc);

  final ControllerResult _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado do IMC')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(_controller.icone, size: 100, color: _controller.cor),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'IMC: ${_controller.imc.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: _controller.cor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Classificação:',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              _controller.interpretacao,
              style: TextStyle(fontSize: 24, color: _controller.cor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text('Saúde', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: _controller.progresso,
              minHeight: 20,
              color: _controller.cor,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 32),
            Card(
              color: _controller.cor.withOpacity(0.1),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _controller.mensagemPersonalizada(),
                  style: const TextStyle(fontSize: 18),
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
}
