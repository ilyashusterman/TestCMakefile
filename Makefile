################################################################################
# Makefile for encrypting and decrypting secure credentials
################################################################################

# Prefer bash shell
export SHELL=/bin/bash

self := $(abspath $(lastword $(MAKEFILE_LIST)))
parent := $(dir $(self))
include $(parent)/verbose.makefile

#--database=mysql
DEFAULT_DATABASE_PASSWORD=localone
DEFAULT_DATABASE_USER=root
DEFAULT_DATABASE_PORT=3306
MYSQL_ARGS:=-h 127.0.0.1 --user=$(DEFAULT_DATABASE_USER) --password=$(DEFAULT_DATABASE_PASSWORD) --port=$(DEFAULT_DATABASE_PORT)


.PHONY: all
all:
	echo "Initiating hello protorol"
.PHONY: create_local_db
create_local_db:
	$(VERBOSE) echo "Created test_ilya successfully"
	$(VERBOSE) mysql $(MYSQL_ARGS) <<< "CREATE SCHEMA \`test_ilya\` DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;"
.PHONY: db_drop_local
db_drop_local:
	$(VERBOSE) echo "Dropping local test_ilya  database"
	-$(VERBOSE) mysql $(MYSQL_ARGS) <<< "DROP DATABASE \`test_ilya\`;"
.PHONY: test
test:
	$(VERBOSE) nosetests -sv --collect-only