import freqtrade.vendor.qtpylib.indicators as qtpylib
import talib.abstract as ta
from freqtrade.strategy import (DecimalParameter, IStrategy, IntParameter)
from freqtrade.strategy.interface import IStrategy
from pandas import DataFrame, DatetimeIndex, merge, Series


class CCI_BB(IStrategy):
    # Buy hyperspace params:
    buy_params = {

    }

    # Sell hyperspace params:
    sell_params = {

    }

    minimal_roi = {
        "0": 0.02,
        "60": 0.04,
        "120": 0.02,
    }

    stoploss = -1
    timeframe = '5m'
    exit_profit_only = False


    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe['cci'] = ta.CCI(dataframe)
        bollinger1 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=20, stds=2)
        dataframe['bb_lowerband1'] = bollinger1['lower']
        return dataframe


    def populate_buy_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[

            (
                    (dataframe['cci'] <= -134) &
                    (dataframe["close"] < dataframe['bb_lowerband1'])

            )
            ,
            'buy'
        ] = 1

        return dataframe


    def populate_sell_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        return dataframe
