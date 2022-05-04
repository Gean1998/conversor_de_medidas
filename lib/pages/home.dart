import 'package:conversor_de_medidas/core/converte_medidas_volume.dart';
import 'package:flutter/material.dart';

import '../core/converte_medidas_comprimento.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController baseController = TextEditingController();
  TextEditingController resultadoController = TextEditingController();

  double base = 0;
  double resultado = 0;

  String medidaBase = 'Centímetro';
  String medidaResultado = 'Metro';

  String tipo = 'Comprimento';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Medidas'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField(
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('Comprimento'),
                  value: 'Comprimento',
                ),
                DropdownMenuItem(
                  child: Text('Volume'),
                  value: 'Volume',
                ),
              ],
              value: tipo,
              onChanged: (String? texto) {
                setState(() {
                  tipo = texto!;

                  if (tipo == 'Comprimento') {
                    medidaBase = 'Metro';
                    medidaResultado = 'Centímetro';
                  } else {
                    medidaBase = 'Litro';
                    medidaResultado = 'Mililitro';
                  }
                });
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite o valor...',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: baseController,
                    onChanged: (String? valorDigitado) {
                      setState(() {
                        if (tipo == 'Comprimento') {
                          calculaMedidasComprimento(valorDigitado);
                        } else {
                          calculaMedidasVolume(valorDigitado);
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButtonFormField(
                      items: tipo == 'Comprimento'
                          ? medidasDeComprimento()
                          : medidasDeVolume(),
                      value: medidaBase,
                      onChanged: (String? texto) {
                        setState(() {
                          if (texto == medidaResultado) {
                            medidaResultado = medidaBase;
                          }

                          medidaBase = texto!;

                          if (tipo == 'Comprimento') {
                            calculaMedidasComprimento(base.toString());
                          } else {
                            calculaMedidasVolume(base.toString());
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text('=', style: TextStyle(fontSize: 36.0)),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite o valor...',
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: resultadoController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButtonFormField(
                      items: tipo == 'Comprimento'
                          ? medidasDeComprimento()
                          : medidasDeVolume(),
                      value: medidaResultado,
                      onChanged: (String? texto) {
                        setState(() {
                          if (texto == medidaBase) {
                            medidaBase = medidaResultado;
                          }

                          medidaResultado = texto!;

                          if (tipo == 'Comprimento') {
                            calculaMedidasComprimento(base.toString());
                          } else {
                            calculaMedidasVolume(base.toString());
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  medidasDeComprimento() {
    return <DropdownMenuItem<String>>[
      DropdownMenuItem(
        child: Text('Quilômetro'),
        value: 'Quilômetro',
      ),
      DropdownMenuItem(
        child: Text('Metro'),
        value: 'Metro',
      ),
      DropdownMenuItem(
        child: Text('Centímetro'),
        value: 'Centímetro',
      ),
      DropdownMenuItem(
        child: Text('Milímetro'),
        value: 'Milímetro',
      ),
    ].toList();
  }

  medidasDeVolume() {
    return <DropdownMenuItem<String>>[
      DropdownMenuItem(
        child: Text('Metro Cúbico'),
        value: 'Metro Cúbico',
      ),
      DropdownMenuItem(
        child: Text('Litro'),
        value: 'Litro',
      ),
      DropdownMenuItem(
        child: Text('Mililitro'),
        value: 'Mililitro',
      ),
    ].toList();
  }

  calculaMedidasComprimento(String? value) {
    if (value != null && value.isNotEmpty) {
      base = double.tryParse(value)!;
      final conversor = ConverteMedidasComprimento();

      switch (medidaResultado) {
        case 'Quilômetro':
          resultadoController.text = conversor
              .converteQuilometro(medida: medidaBase, valor: base)
              .toString();
          break;
        case 'Metro':
          resultadoController.text = conversor
              .converteMetro(medida: medidaBase, valor: base)
              .toString();
          break;
        case 'Centímetro':
          resultadoController.text = conversor
              .converteCentimetro(medida: medidaBase, valor: base)
              .toString();
          break;
        case 'Milímetro':
          resultadoController.text = conversor
              .converteMilimetro(medida: medidaBase, valor: base)
              .toString();
          break;
        default:
          break;
      }
    } else {
      resultadoController.text = '';
    }
  }

  void calculaMedidasVolume(String? value) {
    if (value != null && value.isNotEmpty) {
      base = double.tryParse(value)!;
      final conversor = ConverteMedidasVolume();

      switch (medidaResultado) {
        case 'Metro Cúbico':
          resultadoController.text = conversor
              .converteMetroCubico(medida: medidaBase, valor: base)
              .toString();
          break;
        case 'Litro':
          resultadoController.text = conversor
              .converteLitro(medida: medidaBase, valor: base)
              .toString();
          break;
        case 'Mililitro':
          resultadoController.text = conversor
              .converteMililitro(medida: medidaBase, valor: base)
              .toString();
          break;
        default:
          break;
      }
    } else {
      resultadoController.text = '';
    }
  }
}
