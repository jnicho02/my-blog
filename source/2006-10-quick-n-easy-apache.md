---
title: my quick n' easy Apache2 set up
date: 2006/10/30
tags: [ideas]
author: Jez Nicholson
alias: /quick-n-easy-apache
---
Whilst developing or trialling web applications I often find that I have to change my Apache2 setup. I'm starting a new job next Monday so i'm going to write up my quick n' easy way for posterity. I'm sure that someone will tell me that there's a better way, but here goes (BTW: I'm on a Windows box):

modules
In my httpd.conf, at the bottom of section two I include any .conf in my config directory:
#
# Bring in additional module-specific configurations
#
<IfModule mod_ssl.c>
  Include C:/cygwin/etc/httpd/conf/ssl.conf
</IfModule>

include C:/cygwin/etc/httpd/conf/*.conf

The conf files include these:

php4.conf
ScriptAlias /php/ "C:/Program Files/php-4.4.1-Win32/"

# For PHP 4
Action application/x-httpd-php "/php/php.exe"

# For PHP 4 do something like this:
LoadModule php4_module "C:/php-4.4.1-Win32/sapi/php4apache2.dll"
AddType application/x-httpd-php .php

# configure the path to php.ini
PHPIniDir "C:/Program Files/php-4.4.1-Win32"

# Uncomment one of the following (but not both)
# Use for PHP 4.x:
AddHandler php-script php

AddType text/html php

# PHP Syntax Coloring
# (optional but useful for reading PHP source for debugging):
AddType application/x-httpd-php-source phps
php504.conf
ScriptAlias /php/ "C:/Program Files/php-5.0.4-Win32/"

# For PHP 5
#Action application/x-httpd-php "/php/php-cgi.exe"

AddType application/x-httpd-php .php

LoadModule php5_module "c:/Program Files/php-5.0.4-Win32/php5apache2.dll"

# configure the path to php.ini
PHPIniDir "C:/Program Files/php-5.0.4-Win32"

# Uncomment one of the following (but not both)
AddHandler php5-script php 

AddType text/html php

# PHP Syntax Coloring
# (optional but useful for reading PHP source for debugging):
AddType application/x-httpd-php-source phps
php516.conf
ScriptAlias /php/ "C:/Program Files/php-5.1.6-Win32/"

# For PHP 5
#Action application/x-httpd-php "/php/php-cgi.exe"

AddType application/x-httpd-php .php

LoadModule php5_module "c:/Program Files/php-5.1.6-Win32/php5apache2.dll"

# configure the path to php.ini
PHPIniDir "C:/Program Files/php-5.1.6-Win32"

# Uncomment one of the following (but not both)
AddHandler php5-script php 

AddType text/html php

# PHP Syntax Coloring
# (optional but useful for reading PHP source for debugging):
AddType application/x-httpd-php-source phps
jrun4.conf
LoadModule jrun_module modules/mod_jrun20.so

<IfModule mod_jrun20.c>
  JRunConfig Verbose false
  JRunConfig Apialloc false
  JRunConfig Ssl false
  JRunConfig Ignoresuffixmap false
  JRunConfig Serverstore "C:/JRun4/lib/wsconfig/1/jrunserver.store"
  JRunConfig Bootstrap 127.0.0.1:51000
  AddHandler jrun-handler .jsp .jws
</IfModule>
virtual hosts
then at the bottom of httpd.conf I create a virtual host and pick up any .vhost files:
NameVirtualHost 127.0.0.1
include C:/cygwin/etc/httpd/conf/*.vhost

phpmyadmin270.vhost
<VirtualHost localhost:80>
  ServerName phpmyadmin.badger:80
  DocumentRoot D:/phpMyAdmin-2.7.0-pl1
  CustomLog D:/logs/access_log combined
  ErrorLog D:/logs/error_log
  <IfModule mod_ssl.c>
    SSLEngine off
  </IfModule>
  <Directory D:/phpMyAdmin-2.7.0-pl1>
    <IfModule sapi_apache2.c>
      php_admin_flag engine on
       php_admin_value open_basedir "D:/phpMyAdmin-2.7.0-pl1:D:/tmp"
     </IfModule>
    Options -Includes -ExecCGI
  </Directory>
</VirtualHost>
hosts
Final thing is to set up a memorable domain name for your local site. Add a line to your C:/WINDOWS/system32/drivers/etc/hosts file to direct http calls to that domain to your localhost (127.0.0.1) so that Apache can receive it:
127.0.0.1 localhost
127.0.0.1 badger
127.0.0.1 mantis.badger
127.0.0.1 moodle144.badger
127.0.0.1 moodle153.badger
127.0.0.1 moodle163.badger
127.0.0.1 phpmyadmin.badger
127.0.0.1 bb.badger

I then change the file extension for any that I don't want: 