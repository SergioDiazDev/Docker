[global]
pid = /var/run/php-fpm.pid
emergency_restart_threshold = 10
emergency_restart_interval = 1m
daemonize = no

[app]
listen = 0.0.0.0:9000
user = sdiaz-ru
group = inception
pm = static