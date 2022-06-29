#!/usr/bin/env bash

mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS testing;
<<<<<<< HEAD
    GRANT ALL PRIVILEGES ON testing.* TO '$MYSQL_USER'@'%';
=======
    GRANT ALL PRIVILEGES ON \`testing%\`.* TO '$MYSQL_USER'@'%';
>>>>>>> dev-1
EOSQL
