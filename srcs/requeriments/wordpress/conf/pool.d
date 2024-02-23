[global]
pid = /var/run/php-fpm.pid
emergency_restart_threshold = 10
emergency_restart_interval = 1m
daemonize = no

[www]
listen = 0.0.0.0:9000
user = sdiaz-ru
group = inception
pm = dynamic
pm.max_children = 75 
pm.start_servers = 10 
pm.min_spare_servers = 5 
pm.max_spare_servers = 20 
pm.process_idle_timeout = 10s