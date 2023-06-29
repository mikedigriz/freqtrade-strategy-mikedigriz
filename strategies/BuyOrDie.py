import freqtrade.vendor.qtpylib.indicators as qtpylib
import numpy as np
import talib.abstract as ta
from freqtrade.strategy.interface import IStrategy
from pandas import DataFrame, DatetimeIndex, merge, Series
from technical.indicators import hull_moving_average


class BuyOrDie(IStrategy):
    # Buy hyperspace params:
    buy_params = {

    }

    # Sell hyperspace params:
    sell_params = {

    }

    # ROI table:
    minimal_roi = {
        '0': 1000
    }

    # Stoploss:
    stoploss = -0.02

    # Trailing stop:
    trailing_stop = True
    trailing_stop_positive = 0.332
    trailing_stop_positive_offset = 0.364
    trailing_only_offset_is_reached = True
    timeframe = '5m'
    use_exit_signal = False
    exit_profit_only = False
    ignore_roi_if_entry_signal = True

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
