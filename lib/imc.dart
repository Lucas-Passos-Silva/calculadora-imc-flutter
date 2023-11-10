import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


enum Gender { Male, Female }


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double result = 0.0;
  Gender selectedGender = Gender.Male; 

  void calculateIMC() {
    double weight = double.tryParse(pesoController.text) ?? 0.0;
    double height = double.tryParse(alturaController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double IMC = weight / (height * height);

      if (selectedGender == Gender.Male) {
        setState(() {
          result = IMC;
        });
      } else {
        setState(() {
          result = IMC;
        });
      }
    }
  }

  String getIMCStatus() {
    if (selectedGender == Gender.Male) {
      if (result < 20.7) {
        return 'Abaixo do peso';
      } else if (result >= 20.7 && result <= 26.4) {
        return 'Peso Ideal';
      } else if (result >= 26.5 && result <= 27.8) {
        return 'Pouco acima do peso';
      } else if (result >= 27.9 && result <= 31.1) {
        return 'Acima do peso';
      } else {
        return 'Obesidade';
      }
    } else {
      if (result < 19.1) {
        return 'Abaixo do peso';
      } else if (result >= 19.1 && result <= 25.8) {
        return 'Peso Ideal';
      } else if (result >= 25.9 && result <= 27.3) {
        return 'Pouco acima do peso';
      } else if (result >= 27.4 && result <= 32.3) {
        return 'Acima do peso';
      } else {
        return 'Obesidade';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lucas Passos da Silva',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'RA: 1431432312022',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            DropdownButton<Gender>(
              value: selectedGender,
              onChanged: (Gender? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedGender = newValue;
                  });
                }
              },
              items: [
                DropdownMenuItem<Gender>(
                  value: Gender.Male,
                  child: Text('Masculino'),
                ),
                DropdownMenuItem<Gender>(
                  value: Gender.Female,
                  child: Text('Feminino'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(labelText: 'Peso (kg)'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              decoration: InputDecoration(labelText: 'Altura (m)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateIMC();
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              'IMC: ${result.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Situação do IMC: ${getIMCStatus()}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}