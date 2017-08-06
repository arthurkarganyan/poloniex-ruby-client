## Usage

All methods provided by ```Poloniex::Client``` are class methods, and are of the same name as the api ( except that "return"s have been removed ).

```
Poloniex::Client.ticker
```

GET requests ( to /public ) do not need authentication, and therefor do not need Poloniex to be configured.

POST requests ( to /tradingApi ) will need authentication, and you will have to have your own key and secret token.