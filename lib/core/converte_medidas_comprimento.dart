class ConverteMedidasComprimento {
  double converteQuilometro({required String medida, required double valor}) {
    switch (medida) {
      case 'Metro':
        return valor / 1000;
      case 'Centímetro':
        return valor / 1e+5;
      case 'Milímetro':
        return valor / 1e+6;
      default:
        return 0;
    }
  }

  double converteMetro({required String medida, required double valor}) {
    switch (medida) {
      case 'Quilômetro':
        return valor * 1000;
      case 'Centímetro':
        return valor / 100;
      case 'Milímetro':
        return valor / 1000;
      default:
        return 0;
    }
  }

  double converteCentimetro({required String medida, required double valor}) {
    switch (medida) {
      case 'Quilômetro':
        return valor * 100000;
      case 'Metro':
        return valor * 100;
      case 'Milímetro':
        return valor / 10;
      default:
        return 0;
    }
  }

  double converteMilimetro({required String medida, required double valor}) {
    switch (medida) {
      case 'Quilômetro':
        return valor * 1e+6;
      case 'Metro':
        return valor * 1000;
      case 'Centímetro':
        return valor * 10;
      default:
        return 0;
    }
  }
}
