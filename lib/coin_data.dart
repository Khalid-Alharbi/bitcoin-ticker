import 'dart:convert';
import 'package:http/http.dart' as http;
import 'price_screen.dart';

const apiKey = 'C3103734-B2EE-4340-B6F5-5E310BD7E628';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';


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
class CoinData {



Future getCoinData(String selectedCurrency) async {

  String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';

  http.Response response = await http.get(requestURL);

  if (response.statusCode == 200) {
    String decodedData  = response.body;

    var lastPrice  = jsonDecode(decodedData)['rate'];

    return lastPrice.toStringAsFixed(0);
  }else{
    print(requestURL);
    print(response.statusCode);
  }
}



}
