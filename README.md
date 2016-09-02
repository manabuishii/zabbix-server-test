zabbix-server-test
==================

Install zabbix server
Setup zabbix web interface via apache httpd
Using mysql as backend database

install
=======

1. install mysql-devel by mysql::client
2. Apache httpd
3. MySQL
4. Zabbix client
5. Zabbix database
6. Zabbix server
7. Zabbix web

test
====
* mysql 3306
* zabbix 10050
* zabbix server 10051
* apache 80

TIPS
====

if build fail with some prebuild file 404.
Maybe upgrade is required.

TODO
====

to test using [infrataster](https://github.com/ryotarai/infrataster)
research zabbix server use DNS default to connect to client

using mysql cookbook 6
