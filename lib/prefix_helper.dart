// ignore_for_file: non_constant_identifier_names

library prefix_helper;

extension _StringExtension on String {
  String get format => replaceAll(RegExp(r'\D'), '');
}

enum CountryType {
  altro,
  eu,
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
      CountryPrefix._('', 'Altro', CountryType.altro, 'assets/flags/other.svg');
  static CountryPrefix austria =
      CountryPrefix._('+43', 'Austria', CountryType.eu, 'assets/flags/aut.svg');
  static CountryPrefix belgio =
      CountryPrefix._('+32', 'Belgio', CountryType.eu, 'assets/flags/bel.svg');
  static CountryPrefix bulgaria = CountryPrefix._(
      '+359', 'Bulgaria', CountryType.eu, 'assets/flags/bgr.svg');
  static CountryPrefix cipro =
      CountryPrefix._('+357', 'Cipro', CountryType.eu, 'assets/flags/cyp.svg');
  static CountryPrefix croazia = CountryPrefix._(
      '+385', 'Croazia', CountryType.eu, 'assets/flags/hrv.svg');
  static CountryPrefix danimarca = CountryPrefix._(
      '+45', 'Danimarca', CountryType.eu, 'assets/flags/dnk.svg');
  static CountryPrefix estonia = CountryPrefix._(
      '+372', 'Estonia', CountryType.eu, 'assets/flags/est.svg');
  static CountryPrefix finlandia = CountryPrefix._(
      '+358', 'Finlandia', CountryType.eu, 'assets/flags/fin.svg');
  static CountryPrefix francia =
      CountryPrefix._('+33', 'Francia', CountryType.eu, 'assets/flags/fra.svg');
  static CountryPrefix germania = CountryPrefix._(
      '+49', 'Germania', CountryType.eu, 'assets/flags/deu.svg');
  static CountryPrefix grecia =
      CountryPrefix._('+30', 'Grecia', CountryType.eu, 'assets/flags/grc.svg');
  static CountryPrefix irlanda = CountryPrefix._(
      '+353', 'Irlanda', CountryType.eu, 'assets/flags/irl.svg');
  static CountryPrefix italia =
      CountryPrefix._('+39', 'Italia', CountryType.eu, 'assets/flags/ita.svg');
  static CountryPrefix lettonia = CountryPrefix._(
      '+371', 'Lettonia', CountryType.eu, 'assets/flags/lva.svg');
  static CountryPrefix lituania = CountryPrefix._(
      '+370', 'Lituania', CountryType.eu, 'assets/flags/ltu.svg');
  static CountryPrefix lussenburgo = CountryPrefix._(
      '+352', 'Lussemburgo', CountryType.eu, 'assets/flags/lux.svg');
  static CountryPrefix malta =
      CountryPrefix._('+356', 'Malta', CountryType.eu, 'assets/flags/mlt.svg');
  static CountryPrefix paesi_bassi = CountryPrefix._(
      '+31', 'Paesi bassi', CountryType.eu, 'assets/flags/nld.svg');
  static CountryPrefix polonia =
      CountryPrefix._('+48', 'Polonia', CountryType.eu, 'assets/flags/pol.svg');
  static CountryPrefix portogallo = CountryPrefix._(
      '+351', 'Portogallo', CountryType.eu, 'assets/flags/prt.svg');
  static CountryPrefix repubblica_ceca = CountryPrefix._(
      '+420', 'Repubblica Ceca', CountryType.eu, 'assets/flags/cze.svg');
  static CountryPrefix romania =
      CountryPrefix._('+40', 'Romania', CountryType.eu, 'assets/flags/rou.svg');
  static CountryPrefix slovacchia = CountryPrefix._(
      '+421', 'Slovacchia', CountryType.eu, 'assets/flags/svk.svg');
  static CountryPrefix slovenia = CountryPrefix._(
      '+386', 'Slovenia', CountryType.eu, 'assets/flags/svn.svg');
  static CountryPrefix spagna =
      CountryPrefix._('+34', 'Spagna', CountryType.eu, 'assets/flags/esp.svg');
  static CountryPrefix svezia =
      CountryPrefix._('+46', 'Svezia', CountryType.eu, 'assets/flags/swe.svg');
  static CountryPrefix ungheria = CountryPrefix._(
      '+36', 'Ungheria', CountryType.eu, 'assets/flags/hun.svg');

  final String prefisso;
  final String stato;
  final CountryType tipo;
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

  CountryPrefix._(this.prefisso, this.stato, this.tipo, this.svg);

  static CountryPrefix find({String? prefix, String? stato}) =>
      CountryPrefix.values.firstWhere(
        (element) => prefix != null && stato != null
            ? element.prefisso.format == prefix.format &&
                element.stato.toLowerCase() == stato.toLowerCase()
            : element.prefisso.format == prefix?.format ||
                element.stato.toLowerCase() == stato?.toLowerCase(),
        orElse: () => CountryPrefix.altro,
      );

  static List<CountryPrefix> filter(String data) => data.isNotEmpty
      ? values
          .where((element) =>
              (element.prefisso.format.startsWith(data.format) &&
                  int.tryParse(data) != null) ||
              (element.stato.toLowerCase().startsWith(data.toLowerCase()) &&
                  element.stato.toLowerCase().contains(data.toLowerCase())))
          .toList()
      : CountryPrefix.values;

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

  /// SVG
  ///
  /// usa " package: '' " in SvgPicture.asset per usare la bandiera
  ///
  /// SvgPicture.asset( Telephone(prefix: '39', number: 'number').flag, ----> package: '' <----, height: 100),

  String get flag => 'prefix_helper/${_prefix.svg}';

  String get state => _prefix.stato;

  CountryType get country => _prefix.tipo;

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
  String toString() =>
      'Telephone(number: $number, prefix: ${_prefix.prefisso} [${_prefix.stato}])';

  @override
  bool operator ==(covariant Telephone other) {
    if (identical(this, other)) return true;

    return other.number == number && other._prefix == _prefix;
  }

  @override
  int get hashCode => number.hashCode ^ _prefix.hashCode;
}
