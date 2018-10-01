from datetime import time
from zipline.utils.memoize import lazyval
from pandas.tseries.offsets import CustomBusinessDay
from pytz import timezone
from .trading_calendar import TradingCalendar


class TwentyFourHR(TradingCalendar):
    """
    Exchange calendar for 24/7 trading.

    Open Time: 12am, UTC
    Close Time: 11:59pm, UTC

    """
    @property
    def name(self):
        return "twentyfourhr"

    @property
    def tz(self):
        return timezone("EST")

    @property
    def open_time(self):
        return datetime(16, 59)

    @property
    def close_time(self):
        return datetime(17, 00)

    @lazyval
    def day(self):
        return CustomBusinessDay(
            weekmask='Mon Tue Wed Thu Fri Sun',
        )

    @property
    def special_closes(self):
        return [time(17), CustomBusinessDay(weekmask='Fri')]

    @property
    def special_opens(self):
        return [time(16,59), CustomBusinessDay(weekmask='Sun')]
