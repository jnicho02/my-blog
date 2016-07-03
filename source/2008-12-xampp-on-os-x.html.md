---
title: Setting up Xampp on the Mac OS X
date: 2008/12/09
tags: [ideas]
author: Jez Nicholson
---
I had a small amount of grief recently trying to set up XAMPP on the Apple Mac OS X for some of our designers, so I thought that i'd post my findings here in case it helps someone else.

Install
The install is fairly easy. Get it at Apachefriends

Put it in your path
For my project builds we need to be able to run mysql and php from the command line therefore I add the xampp application to the .bash_profile file in the users home directory

# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
# User specific environment and startup programs
export XAMPP_HOME=/Applications/xampp/xamppfiles
export PATH=${XAMPP_HOME}/bin:${PATH}
export PATH
unset USERNAME

I found that I needed to put the Xampp stuff before the standard path so that the Mac uses Xampp's php and not the standard /etc/bin/php if installed

to check that it has worked, in the terminal type:

which mysql
which php

both should be from /Applications/xampp/xamppfiles

MySql temp directory
For some reason Mysql throws a wobbly if you use the default temp directory. I've experienced this before when trying to do a mysqldump. On the Mac change /Applications/xampp/etc/php.ini to use:

mysql.default_socket = /Applications/xampp/xamppfiles/var/mysql/mysql.sock

and change /Applications/xampp/etc/my.cnf in two places:

[client]
socket = /Applications/xampp/xamppfiles/var/mysql/mysql.sock
[mysqld]
socket = /Applications/xampp/xamppfiles/var/mysql/mysql.sock

to check it's all working, fire up the terminal on type:

mysql
\s

It should tell you that the UNIX socket is /Applications/xampp/xamppfiles/var/mysql/mysql.sock

Vhosts
Personally, I like to use vhosts for Apache and on the Mac the most appropriate place to put web sites would appear to be the /Sites directory

Turn them on
Turn on vhosts by editing /extra/httpd-vhosts.conf

NameVirtualHost *:80
<VirtualHost *:80>
  ServerName default
  DocumentRoot /Applications/xampp/xamppfiles/htdocs
</VirtualHost>
Include etc/extra/*.vhost

This means that everything going to port 80 will be checked by the local Apache installation. The very first site config found by Apache will be the default, so Servername default is defined first to point to the xampp control panel. Individual sites can be configured in their own xxx.vhost file placed in the conf/extras directory. I do this as it is then simple to change the file extension and restart Apache to stop using the site.

Add a vhost
An example vhost file might be example_site.vhost:

<VirtualHost *:80>
  ServerName example_site
  DocumentRoot "/Users/jnicholson/Sites/example_site"

  AddDefaultCharset UTF-8

  <Directory "/Users/jnicholson/Sites/example_site">
    Options ExecCGI FollowSymLinks Indexes
    AllowOverride None
    Order allow,deny
    Allow from all
  </Directory>
</VirtualHost>

/etc/hosts
Change the /etc/hosts file to point 127.0.0.1 to your new site. You may need to use TextWrangler as the hosts file is generally protected. Add the line:

127.0.0.1 example_site

To see if it worked you can run Apache from the terminal:

apachectl -S

This should list all the vhosts that are configured. If this works okay then start up xampp from the control panel and navigate to http://example_site/
