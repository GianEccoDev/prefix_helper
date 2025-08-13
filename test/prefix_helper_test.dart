import 'package:flutter_test/flutter_test.dart';

import 'package:prefix_helper/prefix_helper.dart';

void main() {
  test('adds one to input values', () {
    final phone = Telephone(number: '324234', prefix: '39');
    expect(phone.prefix, '+39');
  });
}
