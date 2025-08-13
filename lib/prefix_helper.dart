// ignore_for_file: non_constant_identifier_names

library prefix_helper;

extension _StringExtension on String {
  String get format => replaceAll(RegExp(r'\D'), '');
}

class CountryPrefix {
// Austria - 0043
// Belgio - 0032
// Bulgaria - 00359
// Cipro - 00357
// Croazia - 00385
// Danimarca - 0045
// Estonia - 00372
// Finlandia - 00358
// Francia - 0033
// Germania - 0049
// Grecia - 0030
// Irlanda - 00353
// Italia - 0039
// Lettonia - 00371
// Lituania - 00370
// Lussemburgo - 00352
// Malta - 00356
// Paesi bassi - 0031
// Polonia - 0048
// Portogallo - 00351
// Repubblica Ceca - 00420
// Romania - 0040
// Slovacchia - 00421
// Slovenia - 00386
// Spagna - 0034
// Svezia - 0046
// Ungheria - 0036

  static CountryPrefix get altro =>
      CountryPrefix._('', 'Altro', 'assets/flags/other.svg');
  static CountryPrefix austria =
      CountryPrefix._('+43', 'Austria', 'assets/flags/aut.svg');
  static CountryPrefix belgio =
      CountryPrefix._('+32', 'Belgio', 'assets/flags/bel.svg');
  static CountryPrefix bulgaria =
      CountryPrefix._('+359', 'Bulgaria', 'assets/flags/bgr.svg');
  static CountryPrefix cipro =
      CountryPrefix._('+357', 'Cipro', 'assets/flags/cyp.svg');
  static CountryPrefix croazia =
      CountryPrefix._('+385', 'Croazia', 'assets/flags/hrv.svg');
  static CountryPrefix danimarca =
      CountryPrefix._('+45', 'Danimarca', 'assets/flags/dnk.svg');
  static CountryPrefix estonia =
      CountryPrefix._('+372', 'Estonia', 'assets/flags/est.svg');
  static CountryPrefix finlandia =
      CountryPrefix._('+358', 'Finlandia', 'assets/flags/fin.svg');
  static CountryPrefix francia =
      CountryPrefix._('+33', 'Francia', 'assets/flags/fra.svg');
  static CountryPrefix germania =
      CountryPrefix._('+49', 'Germania', 'assets/flags/deu.svg');
  static CountryPrefix grecia =
      CountryPrefix._('+30', 'Grecia', 'assets/flags/grc.svg');
  static CountryPrefix irlanda =
      CountryPrefix._('+353', 'Irlanda', 'assets/flags/irl.svg');
  static CountryPrefix italia =
      CountryPrefix._('+39', 'Italia', 'assets/flags/ita.svg');
  static CountryPrefix lettonia =
      CountryPrefix._('+371', 'Lettonia', 'assets/flags/lva.svg');
  static CountryPrefix lituania =
      CountryPrefix._('+370', 'Lituania', 'assets/flags/ltu.svg');
  static CountryPrefix lussenburgo =
      CountryPrefix._('+352', 'Lussemburgo', 'assets/flags/lux.svg');
  static CountryPrefix malta =
      CountryPrefix._('+356', 'Malta', 'assets/flags/mlt.svg');
  static CountryPrefix paesi_bassi =
      CountryPrefix._('+31', 'Paesi bassi', 'assets/flags/nld.svg');
  static CountryPrefix polonia =
      CountryPrefix._('+48', 'Polonia', 'assets/flags/pol.svg');
  static CountryPrefix portogallo =
      CountryPrefix._('+351', 'Portogallo', 'assets/flags/prt.svg');
  static CountryPrefix repubblica_ceca =
      CountryPrefix._('+420', 'Repubblica Ceca', 'assets/flags/cze.svg');
  static CountryPrefix romania =
      CountryPrefix._('+40', 'Romania', 'assets/flags/rou.svg');
  static CountryPrefix slovacchia =
      CountryPrefix._('+421', 'Slovacchia', 'assets/flags/svk.svg');
  static CountryPrefix slovenia =
      CountryPrefix._('+386', 'Slovenia', 'assets/flags/svn.svg');
  static CountryPrefix spagna =
      CountryPrefix._('+34', 'Spagna', 'assets/flags/esp.svg');
  static CountryPrefix svezia =
      CountryPrefix._('+46', 'Svezia', 'assets/flags/swe.svg');
  static CountryPrefix ungheria =
      CountryPrefix._('+36', 'Ungheria', 'assets/flags/hun.svg');

  String prefisso;
  final String stato;
  final String svg;

  static List<CountryPrefix> get values => <CountryPrefix>[
        CountryPrefix.altro,
        CountryPrefix.austria,
        CountryPrefix.belgio,
        CountryPrefix.bulgaria,
        CountryPrefix.cipro,
        CountryPrefix.croazia,
        CountryPrefix.danimarca,
        CountryPrefix.estonia,
        CountryPrefix.finlandia,
        CountryPrefix.francia,
        CountryPrefix.germania,
        CountryPrefix.grecia,
        CountryPrefix.irlanda,
        CountryPrefix.italia,
        CountryPrefix.lettonia,
        CountryPrefix.lituania,
        CountryPrefix.lussenburgo,
        CountryPrefix.malta,
        CountryPrefix.paesi_bassi,
        CountryPrefix.polonia,
        CountryPrefix.portogallo,
        CountryPrefix.repubblica_ceca,
        CountryPrefix.romania,
        CountryPrefix.slovacchia,
        CountryPrefix.slovenia,
        CountryPrefix.spagna,
        CountryPrefix.svezia,
        CountryPrefix.ungheria,
      ];

  CountryPrefix._(this.prefisso, this.stato, this.svg);

  static CountryPrefix find(
          {String? prefix, String? stato, bool both = false}) =>
      CountryPrefix.values.firstWhere(
        (element) => both
            ? element.prefisso.format == prefix?.format &&
                element.stato.toLowerCase() == stato?.toLowerCase()
            : element.prefisso.format == prefix?.format ||
                element.stato.toLowerCase() == stato?.toLowerCase(),
        orElse: () => CountryPrefix.altro,
      );

  @override
  String toString() =>
      'CountryPrefix(prefisso: $prefisso, stato: $stato, svg: $svg)';
}

class Telephone {
  late String number;
  late CountryPrefix _prefix;
  Telephone({
    required String prefix,
    required this.number,
  }) {
    _prefix = CountryPrefix.find(prefix: prefix);
  }

  Telephone.empty() {
    number = '';
    _prefix = CountryPrefix.altro;
  }

  set setPrefix(String prefix) {
    _prefix = CountryPrefix.find(prefix: prefix);
  }

  String get prefix => _prefix.prefisso;

  String get flag => 'prefix_helper/${_prefix.svg}';

  String get state => _prefix.svg;

  Telephone copyWith({
    String? number,
    String? prefix,
  }) {
    return Telephone(
      number: number ?? this.number,
      prefix: prefix ?? _prefix.prefisso,
    );
  }

  Telephone copy() {
    return Telephone(
      number: number,
      prefix: _prefix.prefisso,
    );
  }

  factory Telephone.fromMap(Map<String, dynamic> map,
      {required String numberKey, required String prefixKey}) {
    return Telephone(
      number: map[numberKey] ?? '',
      prefix: map[prefixKey] ?? '',
    );
  }

  @override
  String toString() => 'Telephone(number: $number, prefix: $_prefix)';

  @override
  bool operator ==(covariant Telephone other) {
    if (identical(this, other)) return true;

    return other.number == number && other._prefix == _prefix;
  }

  @override
  int get hashCode => number.hashCode ^ _prefix.hashCode;
}
