import logging
import config

class Logger(object):
    console_log_format = "%(asctime)-15s %(name)s %(message)s"
    def __init__(self, mod_name):
        self.logger = logging.getLogger(mod_name)
        self.logger.setLevel(config.LOG_LEVEL)
        self.formatter = logging.Formatter(self.console_log_format)
        self.handler = logging.StreamHandler()
        self.handler.setFormatter(self.formatter)
        self.logger.addHandler(self.handler)

    def debug(self, buf):
        self.logger.debug(buf)

    def info(self, buf):
        self.logger.info(buf)

    def warn(self, buf):
        self.logger.warn(buf)

    def error(self, buf):
        self.logger.error(buf)

    def critical(self, buf):
        self.logger.critical(buf)
