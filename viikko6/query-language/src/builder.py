from matchers import All, PlaysIn, HasAtLeast, HasFewerThan

class QueryBuilder:
    def __init__(self):
        self._all = All()

    def playsIn(self, team):
        self._all = PlaysIn(team)
        return self._all

    def hasAtLeast(self, value, attr):
        self._all = HasAtLeast(value, attr)
        return self._all

    def hasFewerThan(self, value, attr):
        self._all = HasFewerThan(value, attr)
        return self._all

    def build(self):
        return self._all