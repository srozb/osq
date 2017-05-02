BEGIN TRANSACTION;
CREATE TABLE "tag" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`name`	TEXT NOT NULL UNIQUE,
	`description`	TEXT,
	`client_id` INTEGER,
	`event_query_id` INTEGER,
	FOREIGN KEY (client_id)  REFERENCES osquery_client(id),
    FOREIGN KEY (event_query_id)  REFERENCES event_query(id)
);
CREATE TABLE "osquery_client" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`node_key`	TEXT,
	`hostname`	TEXT,
	`uuid`	TEXT
, bussiness_unit INTEGER REFERENCES bussiness_unit(id));
INSERT INTO `osquery_client` VALUES (11,'0dd78919289bd5485d60841529904612','mymate','5212ef67-66fb-44b1-bdb1-c50e004e00bb',0);
CREATE TABLE "event_query" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`name`	TEXT NOT NULL,
	`description`	TEXT,
	`value`	TEXT NOT NULL,
	`enabled`	TEXT,
	`interval`	INTEGER NOT NULL
);
INSERT INTO `event_query` VALUES (1,'test','takie tam testowe','SELECT * FROM USERS LIMIT 2;','True',30);
INSERT INTO `event_query` VALUES (2,'adresy','pobierz adresy interfejsow','select address,mask from interface_addresses;','True',15);
CREATE TABLE "client_config" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`pidfile`	TEXT,
	`disable_watchdog`	TEXT,
	`watchdog_level`	INTEGER,
	`watchdog_memory_limit`	INTEGER,
	`watchdog_utilization_limit`	INTEGER,
	`utc`	TEXT,
	`database_path`	TEXT,
	`disable_extensions`	TEXT,
	`extensions_socket`	TEXT,
	`extensions_autoload`	TEXT,
	`extensions_timeout`	INTEGER,
	`extensions_interval`	INTEGER,
	`modules_autoload`	TEXT,
	`extensions_require`	TEXT,
	`tls_hostname`	TEXT,
	`tls_client_cert`	TEXT,
	`tls_client_key`	TEXT,
	`tls_server_certs`	TEXT,
	`disable_enrollment`	TEXT,
	`enroll_secret_path`	TEXT,
	`config_tls_endpoint`	TEXT,
	`config_tls_refresh`	INTEGER,
	`config_tls_max_attempts`	INTEGER,
	`logger_tls_endpoint`	TEXT,
	`enrollment_tls_endpoint`	TEXT,
	`logger_tls_period`	INTEGER,
	`logger_tls_compress`	TEXT,
	`logger_tls_max`	INTEGER,
	`logger_min_status`	INTEGER,
	`distributed_tls_read_endpoint`	TEXT,
	`distributed_tls_write_endpoint`	TEXT,
	`distributed_tls_max_attempts`	INTEGER,
	`read_max`	INTEGER,
	`schedule_splay_percent`	INTEGER,
	`pack_refresh_interval`	INTEGER,
	`pack_delimiter`	INTEGER,
	`disable_caching`	TEXT,
	`schedule_default_interval`	INTEGER,
	`disable_tables`	TEXT,
	`disable_events`	TEXT,
	`events_expiry`	INTEGER,
	`events_optimize`	TEXT,
	`events_max`	INTEGER,
	`windows_event_channels`	TEXT,
	`hardware_disabled_types`	TEXT,
	`logger_plugin`	TEXT,
	`disable_logging`	TEXT,
	`logger_event_type`	TEXT,
	`host_identifier`	TEXT,
	`verbose`	TEXT,
	`logger_path`	TEXT,
	`logger_mode`	INTEGER,
	`value_max`	INTEGER,
	`logger_syslog_facility`	INTEGER,
	`logger_syslog_prepend_cee`	TEXT,
	`logtostderr`	TEXT,
	`stderrthreshold`	INTEGER,
	`distributed_plugin`	TEXT,
	`disable_distributed`	TEXT,
	`distributed_interval`	INTEGER,
	`enable_syslog`	TEXT,
	`syslog_pipe_path`	TEXT,
	`syslog_rate_limit`	INTEGER
);
INSERT INTO `client_config` VALUES (2,'/tmp/osq.pid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'uuid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE "bussiness_unit" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`name`	TEXT NOT NULL,
	`secret`	TEXT NOT NULL,
	`description`	TEXT
);
INSERT INTO `bussiness_unit` VALUES (0,'test_bu','eee502bee5855b14ce99b1867ea52a67b14478801bbf4449efe00a6b6ea0cea9cf159efc605f8103b43a75d8537e0ab82b1e0840628224186c9dd53ee685036c',NULL);
COMMIT;
