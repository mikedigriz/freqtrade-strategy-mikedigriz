import talib.abstract as ta
import pandas
from pandas import DataFrame
import freqtrade.vendor.qtpylib.indicators as qtpylib
from freqtrade.strategy.interface import IStrategy


class RSI_BB(IStrategy):
    ticker_interval = '1d'

    # ROI table:
    minimal_roi = {
        "0": 0.85,
        "11343": 0.407,
        "23766": 0.16,
        "41495": 0
    }

    # Stoploss:
    stoploss = -1

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe['rsi'] = ta.RSI(dataframe)
        bollinger1 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=20, stds=1)
        dataframe['bb_lowerband1'] = bollinger1['lower']
        bollinger3 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=20, stds=3)
        dataframe['bb_upperband3'] = bollinger3['upper']

        return dataframe

    def populate_buy_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[
            (
                (dataframe["close"] < dataframe['bb_lowerband1'])
            ),
            'buy'] = 1
        return dataframe

    def populate_sell_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[
            (
                    (dataframe['rsi'] > 56) &
                    (dataframe["close"] > dataframe['bb_upperband3'])
            ),
            'sell'] = 1

        return dataframe
