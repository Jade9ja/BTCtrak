import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedItem = 'USD';
  List<String> displayitems = [];
  Future<String> exchangeDisplay(
      String selectedCurrency, String selectedCrypto) async {
    CoinData myCoinData = CoinData(
        selectedCrypto: selectedCrypto, selectedCurrency: selectedCurrency);
    var exchangeRate = await myCoinData.getExchangeRate();
    String displayText = '1 $selectedCrypto = $exchangeRate $selectedCurrency';
    return displayText;
  }

  List<DropdownMenuItem<dynamic>> getDropDownItems() {
    List<DropdownMenuItem<dynamic>> currencies = [];
    for (String item in currenciesList) {
      var test = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      currencies.add(test);
    }
    return currencies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: FutureBuilder(
                  future: exchangeDisplay(selectedItem, cryptoList[0]),
                  builder: (BuildContext context, AsyncSnapshot<String> text) {
                    return Text(
                      text.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: FutureBuilder(
                  future: exchangeDisplay(selectedItem, cryptoList[1]),
                  builder: (BuildContext context, AsyncSnapshot<String> text) {
                    return Text(
                      text.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: FutureBuilder(
                  future: exchangeDisplay(selectedItem, cryptoList[2]),
                  builder: (BuildContext context, AsyncSnapshot<String> text) {
                    return Text(
                      text.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              items: getDropDownItems(),
              onChanged: (value) {
                setState(() {
                  print(value);
                  selectedItem = value;
                });
              },
              value: selectedItem,
            ),
          ),
        ],
      ),
    );
  }
}
