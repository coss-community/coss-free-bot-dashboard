# README

This is a free accumulating bot with dashboard that runs on [coss.io](https://coss.io/c/reg?r=BDMG5L7K9J)

To install it just click this button:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Then sign up to [heroku.com](https://heroku.com) if you don't yet have an account there. Bot runs on a free plan. For free plan no credit card is required on Heroku.

You will be asked to setup bot with your variables.

| Parameter     | Description                                              |
| ------------- | -------------------------------------------------------- |
| App name      | Assuming its "coss_bot", dashboard will be available at: coss_bot.herokuapp.com |
| LOT_SIZE      | How many tokens will be traded per cycle                 |
| INTERVAL      | How often trading cycle will happen                      |
| PROFIT        | Estimated profit for each trade                          |
| PAIR          | Pair where bot will be working, for example COSS_ETH     |
| TRADE_LIMIT   | If pair is COSS_ETH and your ETH balance is lower than this value, trading cycle will be skiped |
| PUBLIC_KEY    | Should be created in coss profile |
| PRIVATE_KEY   | Should be created in coss profile |

Click "Deploy" button. Wait couple of minutes while bot is deploying. Use "View app" to see the dashboard.

This bot is running and its dashboard is available at: http://bot.coss.community

It uses ETH wallet for trading which you can use for donations and keeping him running. Current bot lot size if 10.777 so you can see it running on the exchange.

0xbbd84ece935c538007dc0d6b5ef774d19e7ed993 (ETH)