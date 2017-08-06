## Usage

All methods provided by ```Poloniex``` are class methods, and are of the same name as the api ( except that "return"s have been removed ).

For example, ```https://www.poloniex.com/public?command=returnTicker``` is written as ```Poloniex.ticker```

The Poloniex module accepts a setup block for configuration:

```
Poloniex.setup do | config |
    config.key = 'my api key'
    config.secret = 'my secret token'
end
```

GET requests ( to /public ) do not need authentication, and therefor do not need Poloniex to be configured.

POST requests ( to /tradingApi ) will need authentication, and you will have to have your own key and secret token.