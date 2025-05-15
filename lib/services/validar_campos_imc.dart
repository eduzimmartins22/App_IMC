class InputValidators {
  static String? validatePositiveDouble(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return fieldName != null 
          ? '$fieldName é obrigatório' 
          : 'Este campo é obrigatório';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return fieldName != null
          ? '$fieldName deve ser um número válido'
          : 'Digite um número válido';
    }

    if (number <= 0) {
      return fieldName != null
          ? '$fieldName deve ser positivo'
          : 'O valor deve ser positivo';
    }

    return null;
  }
}