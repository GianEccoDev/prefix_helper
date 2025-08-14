import 'package:flutter_test/flutter_test.dart';

import 'package:prefix_helper/prefix_helper.dart';

void main() {
  test('adds one to input values', () {
    final phone = Telephone(number: '324234', prefix: '39');
    expect(phone.prefix, '+39');
    expect(CountryPrefix.filter('').length, 28);
    expect(CountryPrefix.filter('39').length, 1);
    expect(CountryPrefix.filter('IT').length, 1);
    expect(CountryPrefix.filter('+39').length, 1);
    expect(CountryPrefix.filter('italia').length, 1);
    expect(CountryPrefix.filter('39 IT').length, 0);
    expect(CountryPrefix.filter('IT 39').length, 0);
    expect(CountryPrefix.filter('39').first.tipo, CountryType.eu);
    expect(CountryPrefix.find(prefix: '3').stato, 'Altro');
    expect(CountryPrefix.find(prefix: '3', stato: 'ITALIA').stato, 'Altro');
    expect(CountryPrefix.find(prefix: '39').stato, 'Italia');
    expect(CountryPrefix.find(stato: 'Italia').stato, 'Italia');
    expect(CountryPrefix.find(stato: 'ITALIA').stato, 'Italia');
    expect(CountryPrefix.find(prefix: '39', stato: 'ITALIA').stato, 'Italia');
  });
}
