module Poloniex
  module Client
    def self.method_missing(sym, *args)
      puts "#{sym}, #{args}"
      res = try_send(sym, *args)
      JSON.parse(res)
    end

    DEAL_THRESHOLD = 10

    def self.order_book(pair)
      res = super

      {sells: res["asks"].select { |i| i.first.to_i * i.last > DEAL_THRESHOLD }.map { |i| [i.first.to_f, i.last] },
       buys: res["bids"].select { |i| i.first.to_i * i.last > DEAL_THRESHOLD }.map { |i| [i.first.to_f, i.last] }}
    end

    def self.real_ticker(pair)
      orders = order_book(pair)
      {sell: orders[:sells].first.first, buys: orders[:buys].first.first}
    end

    def self.try_send(sym, *args)
      Poloniex.public_send(sym, *args)
    end
  end
end