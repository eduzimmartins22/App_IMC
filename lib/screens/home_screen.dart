import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  void _calcularIMC() {
    final double? altura = double.tryParse(_alturaController.text);
    final double? peso = double.tryParse(_pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      final double imc = peso / (altura * altura);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(imc: imc),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha os campos corretamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const FlutterLogo(size: 120),
            const SizedBox(height: 24),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: const Text('Calcular IMC'),
            ),
          ],
        ),
      ),
    );
  }
}
