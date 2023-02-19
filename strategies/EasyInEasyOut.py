import freqtrade.vendor.qtpylib.indicators as qtpylib
from freqtrade.strategy.interface import IStrategy
from pandas import DataFrame, DatetimeIndex, merge, Series
from technical.indicators import hull_moving_average


class EasyInEasyOut(IStrategy):
    # Buy hyperspace params:
    buy_params = {

    }

    # Sell hyperspace params:
    sell_params = {

    }

    minimal_roi = {
        "0": 0.02,
        "60": 0.03,
        "120": 0.02,
        "900": 0.01
    }

    stoploss = -1

    timeframe = '1m'

    sell_profit_only = True

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe['hma_20'] = qtpylib.hull_moving_average(dataframe['close'], window=20)
        dataframe['close_prev'] = dataframe['close'].shift(2)
        dataframe['hma_20_prev'] = dataframe['hma_20'].shift(2)
        dataframe['close_curr'] = dataframe['close'].shift(1)
        dataframe['hma_20_current'] = dataframe['hma_20'].shift(1)

        return dataframe

    def populate_buy_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[

            (
                    (dataframe['close_curr'] > dataframe['hma_20_current']) &
                    (dataframe['close_prev'] < dataframe['hma_20_prev'])

            )
            ,
            'buy'
        ] = 1

        return dataframe

    def populate_sell_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        return dataframe
