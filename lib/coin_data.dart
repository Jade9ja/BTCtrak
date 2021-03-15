import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
String apiKey = '32BFCF51-1D4D-493E-8F87-30DD48B07382';

class CoinData {
  CoinData({this.selectedCurrency, this.selectedCrypto});
  String selectedCurrency;
  String selectedCrypto;
  var rate;
  Future getExchangeRate() async {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$selectedCrypto/$selectedCurrency?apikey=$apiKey';
    http.Response exchangeData = await http.get(
      Uri.parse(url),
    );
    if (exchangeData.statusCode == 200) {
      var decodedData = jsonDecode(exchangeData.body);
      return decodedData['rate'].toDouble().toInt();
    }
  }
}
