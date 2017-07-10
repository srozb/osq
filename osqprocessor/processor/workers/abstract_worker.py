from logger.logger import Logger

class AbstractWorker(object):
    name = "Abstract Worker"
    def __init__(self):
        ""
    def __repr__(self):
        return self.name
    def _setup_logger(self, mod_name):
        self.l = Logger(mod_name)
    def debug(self, message):
        self.l.debug(message)
    def match(self, message):
        return True
    def run(self, message):
        return message
