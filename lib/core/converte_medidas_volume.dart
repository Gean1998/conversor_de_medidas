class ConverteMedidasVolume {
  double converteLitro({required String medida, required double valor}) {
    switch (medida) {
      case 'Metro Cúbico':
        return valor * 1000;
      case 'Mililitro':
        return valor / 1000;
      default:
        return 0;
    }
  }

  double converteMililitro({required String medida, required double valor}) {
    switch (medida) {
      case 'Metro Cúbico':
        return valor * 1e+6;
      case 'Litro':
        return valor * 1000;
      default:
        return 0;
    }
  }

  double converteMetroCubico({required String medida, required double valor}) {
    switch (medida) {
      case 'Mililitro':
        return valor / 1e+6;
      case 'Litro':
        return valor / 1000;
      default:
        return 0;
    }
  }
}
