#!/usr/bin/env bash
echo "LOADING DB FROM DUMP"
/usr/bin/mysqld_safe --datadir=/var/lib/mysql&
sleep 1 && nohup /usr/bin/mysqld '--basedir=/usr' '--datadir=/var/lib/mysql' '--plugin-dir=/usr/lib64/mysql/plugin' '--user=mysql' '--log-error=/var/lib/mysql/log.err' '--socket=/run/mysqld/mysqld.sock' '--port=3306'&
sleep 1 && \
  echo 'Creating DB' \
  mysql -u root -e "SET autocommit=0; \
            SOURCE db_dump.sql;" --verbose && \
  echo 'Imported DB'
