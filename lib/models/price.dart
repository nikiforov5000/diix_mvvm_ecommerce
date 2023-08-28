class Price {
  final double price;

  Price(this.price) {
    fillMoneyVariables();
  }

  int? _thousands;
  int? _whole;
  int? _cents;

  String? _thousandsStr;
  String? _wholeStr;
  String? _centsStr;

  String get thousands => _thousandsStr ?? '';
  String get whole => _wholeStr ?? '';
  String get cents => _centsStr ?? '';

  void fillMoneyVariables() {
    _thousands = (price / 1000).floor();
    _whole = (price % 1000).floor();
    _cents = (price % 1 * 100).floor();

    if (_thousands! > 0) {
      _thousandsStr = '$_thousands.';
    } else {
      _thousandsStr = '';
    }

    _wholeStr = _whole.toString();
    if (_thousands! > 0 && _whole! < 100) {
      _wholeStr = '0${_wholeStr!}';
    }
    _centsStr = _cents.toString();
    if (_cents! < 10) {
      _centsStr = '0${_centsStr!}';
    }
  }
}