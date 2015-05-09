title: my Web Dev toolset
date: 2009/02/13
tags: [ideas]
author: Jez Nicholson
alias: /my-webdev-toolset

​​​​These are the tools that I regularly use for web development

Contents
1 Ant 1.7.1
1.1 Shared scripts
1.1.1 Ant
1.1.2 EE Utilities
1.2 Groovy Integration
2 Apache (standalone)
3 CamStudio
4 Cropper
5 CruiseControl
6 CygWin
7 Eclipse
8 ExpressionEngine
9 Firefox 2 and 3
10 Firefox (plug-ins)
11 Freemind
12 Gimp
13 Google Analytics
14 Google Chrome
15 Grails
16 Internet Exporer 6, 7 and 8
17 Java
18 jEdit
19 KDiff3
20 Linux
21 MediaWiki
22 MySql (standalone)
23 Notepad++
24 Opera 9
25 Perforce P4V and P4 clients
26 Perl
27 PHP (standalone)
28 PHPUnit
28.1 Windows
28.2 Ant integration
29 Safari (for Windows)
30 Selenium
31 Subversion
32 Tomcat
33 TortoiseSVN
33.1 Ignore list
34 Ultramon 2.7.1
35 VMWare
36 WampServer
36.1 Virtual Hosts
36.2 Databases
37 WinSCP
38 XAMPP 1.7.0
38.1 Add to path
38.1.1 Windows
38.1.2 Vista
38.1.3 Linux/Mac
38.2 Mysql Temp directory
38.2.1 Linux/Mac
38.3 If Apache doesn't seem to work
38.3.1 Windows
38.3.2 Linux/Mac
38.4 Turn on vhosts
38.5 Turn on mod_rewrite
38.6 Choose the right XML Parser
38.7 Increase the PHP RegEx Backtrack Limit
38.8 use /Sites/ for Mac
38.9 Shell files on the Mac
38.10 If PHPUnit does not work
38.11 Using SSL
38.11.1 Create certificate & private key
38.11.2 Import certificate into browser
38.11.3 Add virtual host
39 7-Zip
Ant 1.7.1
A project build tool.

version: 1.7.1 (upgrade to current version whenever released)

Each project has a build.xml file. This contains the instructions for Apache Ant to build and test the project ready for it to be run.

http://ant.apache.org/

install Java JDK
create a JAVA_HOME environment variable pointing to the jdk directory so that tools.jar is picked up e.g. "C:\Program Files\Java\jdk1.5.0_09"
add the ant \bin directory in your path (I have an ANT_HOME environment variable C:\Program Files\apache-ant-1.7.1 and then add to my path:
;%ANT_HOME%\bin
test: open a command window and type 'ant'
to build a project, open a command window, change directory to the root of the project (where the build.xml lives) and type 'ant'. There may be additional functions available depending on the individual project.
projects might have separate properties files. In which case you can override the default settings on your individual machine.

C:/Documents and Settings/~username~/~Project Name~-build.properties will override properties for an individual project. e.g.

C:/Documents and Settings/~username~/build.properties will override properties on ALL projects (e.g. for passing in username, password) e.g. intranet.basedir=C:/Intranet will mean that all the intranet projects put their files into that directory.

Shared scripts
Ant

There is a shared location in the ncbwebdev2 repository that contains Ant target scripts that are common to most of our projects.

To add the shared scripts to a project, use TortoiseSVN -> properties and add the property "svn:externals" (available in the drop-down).

Set this to include this line:

shared https://ee-shared-utils.googlecode.com/svn/trunk/
You must then commit the property change to SVN.

Note that you must commit this change first before you can commit changes to the shared/ant files.

More info...

You can then include this into the project-specific build.xml using:

<import file="shared/ant/general_targets.xml" />
or

<import file="shared/ant/ee_targets.xml" />
Groovy Integration
To use the Groovy scripting language within an Ant build script, firstly download Groovy from http://groovy.codehaus.org/Download and unzip.

Copy the groovy-all-1.0.jar from the embeddable folder into the project you wish to use groovy with.

Add the following code to your build.xml to enable groovy. The classpath is relative to the build.xml:

<taskdef name="groovy" classname="org.codehaus.groovy.ant.Groovy" classpath="groovy-all-1.0.jar"/>
You may now use groovy script within your build.xml, for example:

<groovy>
   println "Hello World"
</groovy>
Apache (standalone)
We generally use XAMPP which has Apache built in.

live = httpd-2.0.54-10.3

Jez wrote a bit about Apache setup and virtual hosts in his blog

CamStudio
http://www.camstudio.org/

for recording demos and documentation

Cropper
http://www.codeplex.com/cropper/Release/ProjectReleases.aspx?ReleaseId=2231

for doing screen grabs

CruiseControl
http://cruisecontrol.sourceforge.net/

Login to ncbwebdev2 with your user account and...

sudo /sbin/service cruisecontrol start|stop|status|restart
CygWin
a Linux-like environment for Windows. This can be useful for doing Linux commands in DOS

http://www.cygwin.com/

hunt for 'openssh' in the list of packages

Eclipse
ExpressionEngine
see \\ncbstorage\WebDevelopment\Resources\Software

Most of the Web Development projects contain EE and will install it for you

Firefox 2 and 3
We currently support Firefox 2 and Firefox 3 (see Browser Usage), so need to have both versions installed. Firefox 2 is not used for day-to-day use as it may have security issues.

Firefox (plug-ins)
Firebug http://www.joehewitt.com/software/firebug/
Web Developer http://chrispederick.com/work/webdeveloper/
HTML Validator http://users.skynet.be/mgueury/mozilla/
View Source Chart http://jennifermadden.com/scripts/ViewRenderedSource.html
IE Tab https://addons.mozilla.org/firefox/1419/
Drag Drop Upload https://addons.mozilla.org/firefox/2190/
Screen grab! https://addons.mozilla.org/en-US/firefox/addon/1146
Freemind
Mindmap software.

http://freemind.sourceforge.net/

Gimp
Graphics software.

http://www.gimp.org/

Google Analytics
Accessed online.

Google Chrome
http://www.google.com/chrome

Grails
Grails aims to bring the "coding by convention" paradigm to Groovy. It's an open-source web application framework that leverages the Groovy language and complements Java Web development. You can use Grails as a standalone development environment that hides all configuration details or integrate your Java business logic. Grails aims to make development as simple as possible and hence should appeal to a wide range of developers not just those from the Java community.

http://www.grails.org/

create a GRAILS_HOME environment variable, e.g. C:\Program Files\grails-1.0.4

add it to Path

%GRAILS_HOME%/bin;
Java must be installed and a JAVA_HOME environment variable created

to test, open the command prompt and

grails -v
Internet Exporer 6, 7 and 8
An install method is required here.

Java
JDK 1.6+

http://java.sun.com/javase/downloads/index.jsp

create a JAVA_HOME environment variable (used by Grails), e.g. C:\Program Files\Java\jdk1.6.0_11

to test, open the command prompt and

java -version
jEdit
A file editor that strong on character sets, etc.

http://www.jedit.org/

KDiff3
Nice diff program.

http://kdiff3.sourceforge.net/

Linux
live = Fedora Core 4 Linux.

MediaWiki
http://www.mediawiki.org/

MySql (standalone)
We generally use XAMPP which has MySql built in.

live = mysql-server-4.1.16-1.FC4.1

phpMyAdmin is one way to access your databases

EMS SQL Manager 2005 Lite for MySQL is another

Download the Windows Essentials http://dev.mysql.com/downloads/mysql/4.1.html#win32

After I installed MySQL 4 I found C:\WINDOWS\system32\libmySQL.dll. PHP uses it to talk to mySQL but it must be the dll that matches that version of PHP. Rename C:\WINDOWS\system32\libmySQL.dll to C:\WINDOWS\system32\libmySQL.dll_xxxx or similar. The PHP directory itself has a dll which will be used.

Notepad++
A good lightweight file editor.

http://notepad-plus.sourceforge.net/

Opera 9
we support the latest version of this browser (see Browser Usage). It seems quite good at getting people to upgrade.

http://www.opera.com/

Perforce P4V and P4 clients
It is a direct competitor to Subversion and is rated equally highly. http://www.regdeveloper.co.uk/2006/03/23/subversion_perforce/

On Windows, use the 'P4V' client, and 'P4' on the command line. http://www.perforce.com/perforce/downloads/index.html

Perl
On my PC i'm using ActiveState perl + have these repositories added:

http://theoryx5.uwinnipeg.ca/ppms/package.lst

http://www.roth.net/perl/packages/
http://www.bribes.org/perl/ppm/package.lst
http://trouchelle.com/ppm/package.xml
PHP (standalone)
We generally use XAMPP which has PHP built in.

live = php-5.0.4-10.5

to test, create test.php in the Apache htdocs directory

<?php
  // Show all information, defaults to INFO_ALL
  phpinfo();
  // Show just the module information.
  // phpinfo(8) yields identical results.
  phpinfo(INFO_MODULES);
?>
in the php.ini we use the following extensions

;Windows Extensions
;Note that ODBC support is built in, so no dll is needed for it.
;
extension=php_mbstring.dll
extension=php_bz2.dll
;extension=php_cpdf.dll
extension=php_curl.dll
;extension=php_dba.dll
extension=php_dbase.dll
;extension=php_dbx.dll
extension=php_exif.dll
;extension=php_fdf.dll
;extension=php_filepro.dll
extension=php_gd2.dll
;extension=php_gettext.dll
;extension=php_ifx.dll
;extension=php_iisfunc.dll
extension=php_imap.dll
;extension=php_interbase.dll
;extension=php_java.dll
;extension=php_ldap.dll
;extension=php_mcrypt.dll
;extension=php_mhash.dll
extension=php_mime_magic.dll
;extension=php_ming.dll
;extension=php_mssql.dll
;extension=php_msql.dll
extension=php_mysql.dll
;extension=php_mysqli.dll
;extension=php_oci8.dll
extension=php_openssl.dll
;extension=php_oracle.dll
;extension=php_pdf.dll
;extension=php_pgsql.dll
;extension=php_shmop.dll
;extension=php_snmp.dll
extension=php_sockets.dll
;extension=php_sybase_ct.dll
;extension=php_tidy.dll
;extension=php_w32api.dll
extension=php_xmlrpc.dll
extension=php_xsl.dll
;extension=php_yaz.dll
;extension=php_zip.dll
PHPUnit
We generally use XAMPP which has PHPUnit built in.

http://www.phpunit.de/pocket_guide/3.0/en/installation.html
http://pear.phpunit.de/get/
Install the PEAR module for PHP

Windows
go-pear.bat

create PHP_HOME environment variable, value e.g. "C:\Program Files\php-5.1.6-Win32"
download PHP Unit from http://pear.phpunit.de
create PHPUNIT_HOME environment variable, value e.g. "C:\Program Files\PHPUnit-3.0.0"
add both to your Path
to check, in a command prompt type:
php -version
phpunit -version
Ant integration
Amend your ant build.xml so there is a target tag for testing, for example:

<target name="test" depends="compile">
 <echo>Running PHPUnit tests for ${ant.project.name}. If any fail then files won't be deployed</echo>
  <exec dir="${basedir}/ncb_holidays/" executable="cmd" failonerror="true">
   <arg line="/c phpunit HolidaysTest.php" />
  </exec>

</target>
'exec' tag tells ant to run an executable
'dir' is the directory where you want to run the executable (${basedir} is the directory you have called ant from)
'executable' is self explanitory, however in Unix you can access shell commands directly so you can use 'phpunit' here rather than 'cmd', in Windows we must use 'cmd' to run any commands, therefore 'phpunit' gets pushed into the args
'arg' tag contains the arguments passed to the executable, /c is required since we're using the cmd task, HolidaysTest.php is the phpunit file containing the tests
Safari (for Windows)
We currently support this as a browser (albeit on the Mac).

Selenium
This allows you to run system tests in multiple browsers and test GUI interactions/results http://www.openqa.org/selenium-rc/

Selenium integrates into PHPUnit so that system tests can be run with ANT.

In order to use this you must do the following:

Unzip \\ncbstorage\WebDevelopment\Resources\Software\selenium-remote-control-0.9.0.zip to your local machine.
Set up the Selenium server to run when you start up your machine (or just start it manually). The command is java -jar selenium-server.jar
Install the PEAR Selenium module: pear install Testing_Selenium-0.3.0
In your PHPUnit test class, include the Selenium module and write your test cases using the Selenium API
(more info: http://www.openqa.org/selenium-rc/tutorial.html and http://www.phpunit.de/pocket_guide/3.0/en/selenium.html)

In your ANT build script, set up a deployment target for system testing (you probably won't want to run system tests on every single build).
The Firefox Selenium Extension makes it easy to record and export new tests. Record your macro by following the normal browser operations and then export as Java tests (this is simple to translate into PHPUnit / PEAR Selenium module syntax). Alternatively, if you save files in HTML format you can use them with the Selenium Test Runner (see SCRAM for example).

Subversion
Source code control system

Free on-line O'reilly Subversion book available here: http://svnbook.red-bean.com/

Projects follow a convention of

root +-> branches

root +-> tags +-> 0.01, 0.02, etc.

root +-> trunk

'trunk' is the latest version of the project and the folder that you would normally checkout to work on.

'tags' keeps a record of all of the separate file versions involved in a release number.

TortoiseSVN is our preferred Windows client.

Tomcat
Version: 5.5.23

Installed here: /var/www/apache-tomcat-5.5.23

Port: 8888 ( http://ncbwebdev2:8888 [^] - port 8080 was already in use)

tomcat_users.xml set to

<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
  <role rolename="manager"/>
  <user username="tomcat" password="s3cret" roles="manager"/>
</tomcat-users>
Installed from binaries provided by apache.org

Permissions are set to allow 'webeditor' to edit all files.

Service is started.

The Tomcat service should restart when the server does (in case it's rebooted).

Commands:

/sbin/service tomcat start
/sbin/service tomcat stop
/sbin/service tomcat restart
/sbin/service tomcat status
Alternatively:

/var/www/apache-tomcat-5.5.23/bin/startup.sh
/var/www/apache-tomcat-5.5.23/bin/shutdown.sh
TortoiseSVN
A Windows Explorer add-in to access subversion source code repositories

Download and install from http://tortoisesvn.net/downloads

To use

open Windows Explorer
right-click on a folder
you should see new commands for 'SVN Checkout...' and 'TortoiseSVN >'
under 'TortoiseSVN >' you can use the Repo-browser to view http://ncbwebdev2/repos/work_rep/ This is also viewable in a standard web browser
use 'SVN Checkout...' to get a project onto your own PC.
periodically right-click on the root folder of the project and do an 'Update' to get the latest versions
Ignore list
under TortoiseSVN/Settings there is a global ignore pattern. Useful ones to ignore are:

Thumbs.db build dist *.*~
Ultramon 2.7.1
As we use 2 screens, Ultramon is used to stretch the desktop across.

This is a licensed product.

http://www.realtimesoft.com/ultramon/download.asp

VMWare
Hopefully we won't have to use this again in a hurry.

We use the free version.

WampServer
We generally use XAMPP, but this could be used as an alternative.

For local development we now use http://www.wampserver.com/en/

Virtual Hosts
You will probably need to change the fairly hefty 'Deny from all' in httpd.conf

<Directory />
   Options FollowSymLinks
   AllowOverride None
   Order deny,allow
#    Deny from all
   Allow from all

</Directory>
modules to uncomment are:

rewrite_module
?
For virtual hosts, it is easiest to include all *.vhost files as we give copies away in the metadata folder of all projects:

# Virtual hosts
#Include conf/extra/httpd-vhosts.conf
NameVirtualHost 127.0.0.1
Include conf/extra/*.vhost
and add each one to windows/drivers/etc/hosts

Databases
On the PC, add mysql\bin and php to the Path. I generally create environment variables MYSQL_HOME and PHP_HOME for this.

Most projects will create a database for you:

ant create-db
WinSCP
Client for ftp or scp'ing files to live servers

WinSCP can unpack a tar/gzip file by right-clicking on it and selecting 'Custom Commands'

http://winscp.net/eng/download.php

XAMPP 1.7.0
A single package containing Apache web server, MySql database server, PHP and Perl. This provides an all-in-one web development environment

http://www.apachefriends.org/en/xampp.html

Add to path
Windows

On Windows you'll need to add Mysql/bin and PHP to your path. I normally do this by creating environment variables for MYSQL_HOME and PHP_HOME

MYSQL_HOME F:\xampp\mysql
PHP_HOME F:\xampp\php
Path yada;yada;%MYSQL_HOME%\bin;%PHP_HOME%;%PHP_HOME%\PEAR;
to check it worked, start mysql from the xampp control panel, open command line and

php -v
mysql
Vista

if 'php -v' fails in Vista comment out the line in php.ini

;extension=php_mysqli.dll

Linux/Mac

On Linux/mac add a .bash_profile file to your home directory

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
note that i've put the Xampp stuff before the standard path. This is so that the Mac uses Xampp's php and not the standard /etc/bin/php

to check that it has worked

which mysql
which php
both should be from /Applications/xampp/xamppfiles

Mysql Temp directory
Mysql will throw a wobbly during mysqldump if you use the xampp/tmp directory for mysql. You may also encounter weird random errors caused by McAfee Virus Scanner being concerned about temp files being created. Those nice people from IT have added a temp directory to the scan plan.

Edit xampp/mysql/bin/my.cnf (Windows will try to tell you that it is a modem config file, but ignore it and edit it anyway)

mysqltempdir = C:/mysql
or

tmpdir="C:/mysql"
Linux/Mac

The Mac appears to have troubles when the socket file is created in the default place.

edit etc/php.ini

mysql.default_socket = /Applications/xampp/xamppfiles/var/mysql/mysql.sock
edit etc/my.cnf and under client and mysqld

socket = /Applications/xampp/xamppfiles/var/mysql/mysql.sock
If Apache doesn't seem to work
You can go into the command line and run

Windows

/xampp/apache/bin/apache -S
Linux/Mac

apachectl -S

Turn on vhosts
add to xampp/apache/conf/extra/httpd-vhosts.conf

NameVirtualHost *:80
<VirtualHost *:80>
   ServerName default
   DocumentRoot /xampp/htdocs
</VirtualHost>

Include conf/extra/*.vhost
Turn on mod_rewrite
edit xampp/apache/conf/httpd.conf and uncomment the line (if it is commented)

LoadModule rewrite_module modules/mod_rewrite.so
Choose the right XML Parser
edit /xampp/php/php.ini

;extension=php_domxml.dll
Increase the PHP RegEx Backtrack Limit
With the latest version of PHP (5.2.0 onwards) the default regex backtracking limit is too restrictive.

Add this to the Apache php.ini /xamp/apache/bin/php.ini

[regex]
pcre.backtrack_limit = 500000

use /Sites/ for Mac
On the Mac, add a build.properties file to your home directory

dist.dir = ${user.home}/Sites/${ant.project.name}
Shell files on the Mac
to make a double-clickable runner

edit ant.command

#! /bin/sh
cd Documents/coh_combined
ant
than make in runnable

chmod u+x ant.command
If PHPUnit does not work
You may find that ANT tests defined in some projects (e.g. ee_qa_planner_module) fail with the error:

Could not open input file: \xampp\php\pear/PHPUnit2/TextUI/TestRunner.php
This will stop the project from building successfully. To resolve the issue follow these steps:

Open a command prompt
Reinstall PEAR by executing c:\xampp\php\go-pear.bat and follow the onscreen instructions. If this doesn't work continue on to the next step.
Discover PHPUnit channel by executing c:\xampp\php\pear channel-discover pear.phpunit.de
Uninstall all versions of PHPUnit installed, for example: c:\xampp\php\pear uninstall phpunit, c:\xampp\php\pear uninstall phpunit/PHPUnit, c:\xampp\php\pear uninstall pear/PHPUnit
Reinstall PHPUnit by executing c:\xampp\php\pear install phpunit/PHPUnit-3.0.0. Version 3.0.0 is the one running on the server
Using SSL
Most of this is from http://robsnotebook.com/xampp-ssl-encrypt-passwords

Create certificate & private key

In order to enable the encryption of your password, you must create an SSL certificate (containing your public key) and a server private key. XAMPP provides a default certificate/key that can be used, but it is better to create a new one since the default key is available to anyone who downloads XAMPP. If someone knows your key, they can decrypt your packets. XAMPP provides a batch file for creating a new certificate/key with random encryption keys. To execute this batch file, do the following:

Open a command window (Start->Run, type “cmd” and press “OK)
cd c:\xampp\apache
makecert
You will then see this:

C:\xampp\apache>newcert
Loading 'screen' into random state - done
Generating a 1024 bit RSA private key
............................++++++
.....................................++++++
writing new private key to 'privkey.pem'
Enter PEM pass phrase:
Enter in a pass phrase for decrypting your private server key, and press Enter. Write down this passphrase so you don’t forget it. Now you will be asked to verify it:

Verifying - Enter PEM pass phrase:
Enter your passphrase a second time and hit Enter. Now, you’ll see this:

-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
Enter in your 2 letter country code. You’ll be asked for a few more items (shown below). Enter is what you think is most appropriate, but stop when you are asked for “Common Name”

State or Province Name (full name) [Some-State]:NY
Locality Name (eg, city) []:New York
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Rob's Great Company
Organizational Unit Name (eg, section) []:
Common Name (eg, YOUR name) []:
For “Common Name”, you need to enter in the DNS name or IP address of your website. The name that you enter in here will need to match the server name that is entered into the browser that is accessing the page. It is important that this common name match the address that goes into a browser, otherwise you will get extra warnings when navigating to your secure web pages. If you are running this website over the public internet on an IP address that changes sometimes, you can use a Dynamic DNS service such as dyndns.org to get a free domain name that always points to your server. After you enter in the “Common Name”, you are asked for more information. Fill in what you think is appropriate, but it is OK to just hit ENTER to accept the defaults. Eventually, you will be asked for the pass phrase for privkey.pem:

Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Enter pass phrase for privkey.pem:
Enter the pass phrase that you created earlier, and now you will see this:

writing RSA key
Loading 'screen' into random state - done
Signature ok
subject=/C=xx/ST=xx/L=xxxx/O=xxx/CN=commonname
Getting Private key

—–
Das Zertifikat wurde erstellt.
The certificate was provided.

Press any key to continue . . .

C:\xampp\apache>

You are now finished creating your SSL certificate and private key. The makecert.bat script will move your server private key and certificates in the appropriate directories for you.

Import certificate into browser

Since this certificate is self signed, and is not signed by a well known Certificate Authority (CA), when you browse to the protected pages you’ll get a warning. To turn off this warning, the certificate should be imported as a trusted CA into any browsers that you will use to access your server.

Add virtual host

You now need to set up a virtual host for the site you wish to encrypt. These use the standard SSL port of 443, the SSLEngine needs to be turned on for that host and the certificate and private key need to be referenced. Finally you must enforce SSL in the site directory.

<VirtualHost *:443>
   ServerName nce_extranet
   DocumentRoot "C:\Projects\extranet/dist"
   
   SSLEngine on
   SSLCipherSuite ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP:+eNULL
   SSLCertificateFile conf/ssl.crt/server.crt
   SSLCertificateKeyFile conf/ssl.key/server.key

   
   RewriteEngine On
   RewriteCond ^/%{REQUEST_FILENAME} -f
   RewriteRule ^(.*)$ /$1 [L]
   RewriteRule ^/de/(.*)$ /de/index.php/$1 [L]
   RewriteRule ^/en/(.*)$ /en/index.php/$1 [L]
   RewriteRule ^/fr/(.*)$ /fr/index.php/$1 [L]

   AddDefaultCharset UTF-8
   
   <Directory "V:\Projects\nce_extranet/dist">
       Options ExecCGI FollowSymLinks Indexes
       AllowOverride None
       Order allow,deny
       Allow from all
       SSLRequireSSL
   </Directory>

</VirtualHost>
Free zip utility.