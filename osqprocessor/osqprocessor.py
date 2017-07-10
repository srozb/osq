#!/usr/bin/env python3

import daemon
import config
from processor.processor import Processor
from processor.workers import debug_worker
from logger.logger import Logger
from dbconn.dbconn import DBConn

INSTALLED_WORKERS = [debug_worker]

def setup_logger():  # TODO: to file if daemon
    if config.DAEMON:
        return Logger(__name__)
    else:
        return Logger(__name__)


def setup_processor():
    p = Processor()
    for worker in INSTALLED_WORKERS:
        p.register(worker.Worker())
    return p

def setup_db():
    return DBConn()

def main():
    if config.DAEMON:
        print("daemonizing...")
        with daemon.DaemonContext():
            loop()
    else:
        l.debug("osqprocessor initialized, entering main loop")
        loop()

def loop():
    p = setup_processor()
    r = setup_db()
    while True:
        message = r.get_message()
        p.process(message)
        r.store_message(message)

l = setup_logger()

if __name__ == "__main__":
    main()
