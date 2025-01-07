import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DynamicInputsScreen(),
    );
  }
}

class DynamicInputsScreen extends StatefulWidget {
  @override
  _DynamicInputsScreenState createState() => _DynamicInputsScreenState();
}

class _DynamicInputsScreenState extends State<DynamicInputsScreen> {
  int inputCount = 0; // Número de inputs
  List<TextEditingController> controllers = []; // Controladores para los inputs
  final TextEditingController _controller = TextEditingController();
  String _displaytext1="";
  int? _numberone=0;
  // Método para actualizar la cantidad de inputs
 void _savetext(){
  setState(() {
    _displaytext1=_controller.text;
    _numberone = int.parse(_displaytext1);

    
  });
 }
 
  void updateInputs(int count) {
    setState(() {
      inputCount = count;
      controllers = List.generate(count, (index) => TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Inputs Dinámicos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input para ingresar la cantidad de TextFields
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Número de Inputs',
                
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: inputCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: controllers[index],
                      decoration: InputDecoration(
                        labelText: 'Input ${index + 1}',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
  onPressed: () {
    _savetext();
    updateInputs(_numberone!);
  },
  child: const Text('Imprimir Valores'),
),
          ],
        ),
      ),
    );
  }
}
