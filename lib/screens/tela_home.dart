import 'package:flutter/material.dart';
import '/controlers/controller_home.dart';

import 'tela_resultado.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ControllerHome  _controller = ControllerHome();

  void _onResultadoPronto() {
    setState(() {}); 

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(imc: _controller.imc!),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FlutterLogo(size: 120),
            const SizedBox(height: 24),
            ValueListenableBuilder<String?>(
              valueListenable: _controller.alturaError,
              builder: (context, error, _) {
                return TextField(
                  controller: _controller.alturaController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Altura (m)',
                    border: const OutlineInputBorder(),
                    errorText: error,
                    hintText: 'Ex: 1.75',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (_) {
                    _controller.alturaError.value = null;
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<String?>(
              valueListenable: _controller.pesoError,
              builder: (context, error, _) {
                return TextField(
                  controller: _controller.pesoController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Peso (kg)',
                    border: const OutlineInputBorder(),
                    errorText: error,
                    hintText: 'Ex: 65',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (_) {
                    _controller.pesoError.value = null;
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _controller.calcularIMC(
                context: context,
                onResultadoPronto: _onResultadoPronto,
              ),
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 24),
            if (_controller.imc != null && _controller.interpretacao != null)
              Card(
                color: Colors.blue.shade50,
                margin: const EdgeInsets.only(top: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Resultado anterior:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'IMC: ${_controller.imc!.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _controller.interpretacao!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
