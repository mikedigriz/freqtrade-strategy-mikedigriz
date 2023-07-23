# freqtrade-strategy-mikedigriz
Strategy for crypto trading bot freqtrade and some useful utils.

In folder **strategies** you can find strategies.

Folder **utils** contain scripts.

<details>
  <summary>Backtest output</summary>
<details>
  <summary>Command</summary>
freqtrade backtesting -s Strategy_name --timerange 20200101-20230222 --dry-run-wallet 1000 --stake-amount 25 -i TIMEFRAME_from_strategy
</details>
<details>
  <summary>Pairs</summary>
 "ADA/USDT", "DOT/USDT", "BAT/USDT", "SOL/USDT", "ETC/USDT", "CELO/USDT", "AUDIO/USDT", "ATOM/USDT", "MINA/USDT", "BNB/USDT", "ETH/USDT"
</details>

Backtesting with data from 2020-01-01 up to 2023-02-21 (1147 days) - Binance
|   Strategy |   Entries |   Avg Profit % |   Cum Profit % |   Tot Profit USDT |   Tot Profit % |    Avg Duration |   Win  Draw  Loss  Win% |             Drawdown |
|------------|-----------|----------------|----------------|-------------------|----------------|-----------------|-------------------------|----------------------|
| FisherHull |       310 |          19.22 |        5958.42 |           1491.880|          149.19| 35 days, 5:20:00|  136      0    174 43.9 | 358.168 USDT  13.40% |
|   BuyOrDie |      3035 |           1.77 |        5357.43 |           1342.505|          134.25| 3 days, 13:40:00|  141      0   2894  4.6 | 522.866 USDT  20.02% |
|  SmartMoney|        95 |           38.57|        3664.45 |           916.758 |          91.68 | 92 days, 9:58:00|  87       0      8 91.6 | 139.433 USDT   6.78% |
|     CCI_BB |      1517 |           1.51 |        2297.29 |           573.934 |          57.39 | 7 days, 0:52:00 |  1506     0     11 99.3 | 214.287 USDT  11.98% |
|     RSI_BB |      7664 |           0.25 |        1930.78 |           483.021 |          48.30 | 1 day,  4:08:00 |  4797     0   2867 62.6 | 352.892 USDT  20.37% |
|EasyInEasyOut|     1425 |           1.19 |        1702.17 |           426.333 |          42.63 | 7 days, 15:41:00|  1414     0    11  99.2 | 219.389 USDT  13.33% |

*In Smart money strategy the less timeframe i chose - the better total profit: 1m - 159.46 Tot Profit% .*

</details>


## Strategy review
- [Smart money](https://www.dutchalgotrading.com/strategies/the-smart-money-trading-strategy/)

## Links
- [Bloom Algorithmic Trading](https://www.youtube.com/playlist?list=PLK_6xaeGngVBKfN6iqpUIwNy81AK2cySb) - For start
- [Trading Strategy Guides](https://tradingstrategyguides.com/cryptocurrency-strategies/) - For learn and implementation TA strategy
- [Freqtrade Backtesting Project](https://bt.robot.co.network/)
- [Dutch Crypto Dad](https://www.dutchalgotrading.com/)

