title: Subtitled QuickTime
date: 2005/06/06 21:00:00 -0700
tags: [books]
author: Jez Nicholson
alias: /subtitled-quicktime

​​​​Thursday February 19, 2009
The Business & IP Centre at The British Library
I visited The British Library yesterday and discovered the Business & IP Centre. My guess is that this place would be really useful for anyone starting or running a software business, especially for the games industry which appears to be riddled with patents.

You have to get a Library Reader Pass by bringing two types of address ID.

( Feb 19 2009, 05:19:54 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
MeasurementCamp #?
Despite being put "at risk" of redundancy last week, which will almost certainly end in actual redundancy next month I have decided to carry on as usual with any activities and events that attend. Today I went up to London to attend MeasurementCamp for the second time.

What is MeasurementCamp?
Well, first off, it isn't actually a "Camp" in the commonly used sense of the word, e.g. "BarCamp", but it started from a Camp event and involves participation from all the attendees, i.e. it isn't a presentation that people attend, listen, then go away again. It is a workshop where we discuss how, practically, we can measure the effectiveness of various social media (Twitter, FaceBook Apps, blogging, etc.). I think that I rambled about this previously, but basically this matters to anyone in the I.T. Systems Supply chain, be they the person who wants to commission some work, a consultant, or the techie who wants to build some exciting Web 2.0 features. There is a school of management thought that says, "if you can't measure it, you can't manage it". Accepting that some people have gone ahead with features on a leap of faith and suceeded (Twitter, FaceBook...err, all the social networking features that we might choose to use) if we can't measure whether it works then the people in Management who control the purse strings will not be convinced to part with the cash, that is if they even understand what we are proposing in the first place.

Something has to be done...

Someone needs to work out some best practice...

That 'someone' might as well be us.

Eating our own dogfood
I suggested at this month's meeting that we track the spread of the MeasurementCamp meme and see if we can 'eat our own dogfood'. What is starting to emerge are three-fold

A rough methodology for specifying the goals, methods and measurements of a social networking campaign
A number of metrics + methods to generate the metrics
A number of commonly used techniques for different situations
The latter of these points is starting to look like an ideal case for creating Design Patterns, e.g. pattern: encourage personal Twittering for all staff, situation: where you trust all staff and are prepared to accept some loss of control. I will introduce the idea via the wiki.

( Feb 19 2009, 03:24:25 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090213 Friday February 13, 2009
my Web Dev toolset
These are the tools that I regularly use for web development

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
Free zip utility

( Feb 13 2009, 04:07:10 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090204 Wednesday February 04, 2009
Mysql Errcode:13 and McAfee
I had another case of the "Mysql Errcode:13" last week and found that it was caused by McAfee virus checker. Just thought that i'd put a note here so that a) I remember, or b) it helps someone else

When MySql carries out a mysqldump it creates temp files. McAfee virus checker will spot this and think that they are illegal virus files. Similarly, when a large data operation is carried out (e.g. lots of update statements) a temp file may get created in mysql/data.

To get around this problem, go into McAfee VirusScan/All Processes/Exclusions... and add your mysql temp and data directories. If you are using an enterprise solution then your local settings might get updated by the enterprise rules, in which case you'll have to request from your IT department to have a named directory added, to which you can move your mysql temp and data. Reconfigure the locations in my.cnf

( Feb 04 2009, 04:02:51 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090115 Thursday January 15, 2009
Measuring the effectiveness of social media @MeasurementCamp
So, how do you convince the guy with the money to let you build that fun Facebook App/Flash game/etc.? It's one thing explaining it so that they agree that it's a good idea, but it's another getting them to cough up with the cash (or go-ahead to build it, which can essentially be seen as ultimately as 'cash'). These type of social media applications need to have their own ways of being measured so that we know that we aren't just throwing good money away. Traditionally, Marketing has developed things like magazine readership figures, TV viewing figures, Cost per lead from a mailshot, etc. to try to measure 'success'. Can similar metrics be defined for social media?

MeasurementCamp
I went to a monthly event called Measurement Camp today. The purpose of which is to create a set of open source resources which allow interested parties to measure their social media communications online and offline. The event is refered to as a Camp partly to jump on the BarCamp tip, but mainly because it is a sort of casual workshop where people from different backgrounds work together to share their experiences.

This month's workshop was based around a scenario.

The Scenario
Building on the success of the British Cycling at the Olympics, Tour de France, Giro and many other road and track events in 2008, "Halfjords" are working with 15 regional cycling clubs covering Great Britain and providing £500k worth of cycles and kit and awards to create specialist events for 8-16 year old boys and girls.

Objective is to encourage young cyclists without means or equipment to train and try competitive track/road cycling and provide support to clubs generating interest at a grass roots level.

"Halfjords" wish to be positioned as a supporter of grass roots cycling, supportive national/local business and to increase turnover from sales of kid’s bikes and cycling equipment outside of key Christmas/Summer sales periods.

Using traditional, online, broadcast PR, local, national and in-store advertising/P.O.S, in-store events, educational materials for schools, supporting web site with community creation tools, email campaigns, search campaigns, dedicated helpline telephone number etc, how would you:

Benchmark and measure success using traditional marketing metrics?
What can you learn from traditional marketing metrics that you might use in your campaign? Do they apply? Are they useful?
What is your social media strategy and how would you measure this?
Do any SM metrics stand out in this campaign as 'hard to measure using any other media or marketing channel?
The Discussion
Lots of things came out of the discussion:

What is the actual aim of the brief: "do something nice + be seen to be doing something nice -> increased sales outside of Xmas"
What is the target measure: "increase in year-on-year sales"
What is the strategy: lots of different social media things could be done and each can be measured in similar and different ways
How do you know that it was the social media that did it?: Have a geographical control area where you don't do your traditional TV and billboard marketing
There were a lot more points than this, but these was some of the key ones for me. I was heartened by the focus on defining the campaigns before they were implemented rather than just saying "let's build a Facebook App!". I look forward to next month's session.

( Jan 15 2009, 05:59:42 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090114 Wednesday January 14, 2009
is Twitter dangerous to companies?
I've been keen on using social media for marketing and supporting gaming communities. On our site for Aion I added a feature to the backend CMS to enable the community guys to auto-tweet whenever they post to their official blog. We decided to experiment with the feeds being game+language specific so that we could maintain the service if a community representative moved jobs aion_en, aion_de,aion_fr. The feeds have worked quite well and the community reps are tweeting in addition to the article autotweets, which is great because otherwise they are just glorified RSS feeds.

The possible problem starts when company member's personal Twitter feeds are publisised. I think that people realise that blogs are personal and do not represent the company, but maybe it's not so clear that games company employees have a public face and a private face. Obviously, everyone who publishes any information into the outside world has to keep in mind that it can be read by anyone, but Twitter is just so quick and personal.

So, should we insist that company members keep their Twitter feeds private? or maybe just remind everyone that they need to be responsible in what they say, exactly as if they were blogging?

UPDATE: I forgot to mention that Jen looked into this a fair bit and included a clause in the company handbook that specifically covers employee conduct in all social spaces. Some people end up having two accounts which they use for their public and private personas.

( Jan 14 2009, 11:20:43 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
FlashBrighton: Designing and developing multi-user Flash games
I went to FlashBrighton last night to see Iain Lobb talk about Flash multiplayer games. Iain has built games such as ZW0K!, Stackopolis and Pop Pirates, so really I should have sued him for all the lost man/hours of staff wasting their time playing his addictive games!

Lobby
A lobby should work for a casual multiuser Flash game (let people join games asap, populate with bots if nobody else available, don't put people in a game all on their own).

Game Servers
For use with Flash there are media servers that could be used for games: Flash Media Server (pricey) or Red5 (open source). There are also generic multiplayer game servers: SmartFoxServer (used by Club Penguin) and ElectroServer (used by WebKinz). Both the game servers have trial licences, so could be used for free to start a development and then paid for if and when the game grows.

Easing
Iain showed how movement can be smoothed by easing a sprite towards it's actual position rather than jumping to it.

Project Darkstar from Sun
Project Darkstar is a game server from Sun that will act as an MMO server. This appears to be very new (since June/July 08) and i'm quite excited about trying it out.

. I see also that they will be talking at Austin GDC and other venues.
( Jan 14 2009, 09:30:03 AM GMT ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20090105 Monday January 05, 2009
Flash games: threaded or single execution loop
Whilst writing a Flash mini-game the discussion came up whether the objects themselves should manage their proximity checking, etc. or whether there should be a single game execution loop that steps through a container of game characters. I'm making a note here because I am going for Inbox Zero and am about to delete the emails about it.

Me being a Java Dev, I tried an object-based approach first and it all ran really slowly. I'm not sure how good Flash (as in Actionscript 3.0) is at multi-threading, but my guess is nothing like as good as Java, so we tried the single "game loop" approach. This has the added benefit of being simple to pause the game and/or look at the current game state. I guess that the problem then becomes more about efficiently handling stepping through a set of objects giving them their 'turn'. It all takes me back to mainframe days of round-robin and priority scheduling.

The single game loop seems fairly effective for small-ish numbers of objects, so maybe it is sensible to just accept that and use it. I know that there are other schemes based on splitting the screen into cells and only checking for collisions between close objects (to me, this sounds like a database index). http://lab.polygonal.de/2007/09/09/quadtree-demonstration/

Another area to investigate later would be more efficient containers e.g. http://code.google.com/p/as3ds/ and plenty of good examples here: http://lab.polygonal.de/category/data-structures/

( Jan 05 2009, 12:27:17 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20081209 Tuesday December 09, 2008
Setting up Xampp on the Mac OS X
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

( Dec 09 2008, 09:35:09 AM GMT ) Permalink Comments [5] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
Self-organising game communities / Emergent functionality
I was very proud to be accepted into The Home Guard clan for Day of Defeat:Source yesterday.

Emergent Functionality
One of the things that interested me is that this is a game community that is organised without there being specific functions in Steam to assist it. It is a convention to append your clan sig after your character name, I am now 'Zendog |HG'. When someone is an applicant then they use lower case, e.g. 'Zendog |hg', and post to a special forum thread with some personal details. They will then be monitored by the senior clan members on the servers for a couple of weeks to see if they meet the appropriate playing style (in the case of The Home Guard this is that you 'have fun and play fair').

Now, Steam could add some new forms into their control panel to help clans manage memberships, or they could enhance the system by parsing the naming convention. See machine tags in Flickr for an example of emergent functionality

( Dec 09 2008, 08:40:21 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20081204 Thursday December 04, 2008
All Day Coding Dojo
A month ago, I ran an "All Day Coding Dojo" event as part of the London Games Festival Fringe 2008. The idea is to run a complete game development project in a single day so that the attendees can experience working in a team and discover first hand the trials and tribulations of making a game.

Brighton Coding Dojo
I first experienced Coding Dojos at the Brighton Coding Dojo. These were held in the evening and lasted a couple of hours. This worked well for forming a disparate group of people. I tried this at work with my team, but we found that work intruded to easily and people found it hard to concentrate.

All Day Coding Dojo format
This is a new term that I have coined. As part of my Agile/Scrum process we operate a "Gold Day" where developers are allowed to do any work they want to for a whole day every two-week sprint. This is somewhat akin to the Google 10%. I decided to run an All Day Coding Dojo which would act as a mini Agile/Scrum project.

The Schedule
The day is split into planned chunks. This is important as it sets limits of discussions and a clear deadline for work. The All Day Coding Dojo being a microcosm of a real development project, the intention is to produce a working product by the end of the day. I also posted some restrictions to what we would be doing.

 

Planning
My initial thought was to prepare a game idea in advance so that the group would have something definite to work on, but my team convinced me that the group devising the game idea themselves is one of the interesting bits and ultimately gets people more involved. We decided to restrict the game to being based around a prebuilt game control mechanism, in this case a Whack-a-mole (screen divided into 9 sections accessible from the numeric keypad. This can be used to make mobile phone games.)



The group spent an hour going through ideas of what could be built. User stories are written on filecards which are stuck to the wall with bluetack.



I facilitated the discussion by standing in front of the group, keeping the talk flowing, throwing in points to be discussed and scribbling down the cards. The group decided to build a game called "Death Death Revolution" in which the player would have to play a musical phrase with the numeric keypad which would cause humans from a crowd walking over a set of trap doors to fall through. The humans would then be eaten by our pet zombie living below, and, to make a higher level, occasionally turn the human into a further zombie that will need to be fed.



Develop
Coding Dojo-style, a computer is set up with a monitor and a large screen display that everyone can see. One person sits at the keyboard to type and another joins them to guide the action. As an Agile technique, they select a user story which they will work on. They have 10 minutes (use 15 if you have less than 5 people) to work together on the feature. The audience watches and keeps up, but doesn't butt in. After 10 minutes, the typist rejoins the audience, the guider sites at the keyboard, and a member of the audience joins them to be the guider.



Lunch
Always a good idea. We stumbled out of the 01Zero-One venue in Soho and found a Zilli Fish restaurant. It was made even better when we realised that Aldo Zilli was in front of the door and let us in.

Retrospective
The team review progress so far and can change how they work in the afternoon if it hasn't worked well in the morning. It is a good Agile technique to frequently re-assess your working method at adjust it.

Develop
Do some more coding. In this session we created a second group to look after the artwork needed for the game. One of the instructions was that the game "features images of the attendees". I wouldn't normally break up the team, but if it works then do it. In this case it worked really well as the artwork team were able to keep an eye on what the programming team were doing.

 

Demo
At the end of the sprint we demo to the 'client'. It was useful having an external person to demo to because it concentrated the developers on producing a working product at the end of the day.

Retrospective
Stick three post-its on the wall for ideas; "Good", "Not So Good", "Could Do Better". Everyone in the team has a stack of post-its and a pen. They write ideas on them and stick them to the wall. Keep going until there are no more ideas. It doesn't matter if something appears more than once as it shows popularity. We then discuss as a group all the things that people said.



( Dec 04 2008, 09:17:55 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20081119 Wednesday November 19, 2008
The desirable qualities of a game
I've been reading "Man, Play and Games" by Roger Caillois and saw this list of the qualities of a game:

The need to prove one's superiority
The desire to challenge, make a record, or merely overcome an obstacle
The hope for and the pursuit of the favour of destiny
Pleasure in secrecy, make-believe, or disguise
Fear or inspiring of fear
The search for repetition or symmetry, or in contrast, the joy of improvising, inventing, or infinitely varying solutions
Solving a mystery or riddle
The satisfaction procured from all arts involving contrivance
The desire to test one's strength, skill, speed, endurance, equilibrium, or ingenuity
Conformity to rules and laws, the duty to respect them, and the temptation to circumvent them
And lastly, the intoxication, longing for ecstasy, and desire for voluptuous panic
Caillois splits games into three partitions (or combinations of them): Agon (competition); Alea (chance); Mimicry (simulation); Ilinx (vertigo).

What I find interesting is that these were written in 1958 and they are still applicable. I have found the book good so far for analysing what and why people play online.

( Nov 19 2008, 12:35:36 PM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20081117 Monday November 17, 2008
the relevance of Agile development methods to the gaming industry
I had a question come through on my LinkedIn account, "I am curious as to how relevant Agile development methods are to the gaming industry?". For posterity, here is my reply:

"Agile and Scrum are extremely relevant to games development as well as to the web portals that market and support them."

"The games industry generally works on a publisher-developer basis where small dev studios produce a game concept which is then taken up and published by a larger publishing company (compare to films with producers and directors, or music with bands and record companies). By using an Agile process the independent dev studio may be able to better manage the negotiations with the producer over what has to produced and by when. Often it is unclear exactly how a game should work until it exists. The eventual aim is to make something that is 'fun', 'easy to pick but difficult to master' which has a way to be monetized. How this is achieved doesn't matter, but it must be achieved for the game to be successful and I believe that Agile will help to focus on the desired result rather than the path. I'm not sure how many studios actually do this yet, but Agile is definitely taken hold internally in studios."

"When it comes to web site and systems creation (billing systems, e-commerce sites, etc.) I have used Agile to negotiate with the business how to apply limited programming team resources. By planning every 2 weeks it has made us more able to adapt to changing requirements and has let the business feel more in control over what is built."

( Nov 17 2008, 11:23:57 AM GMT ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20081007 Tuesday October 07, 2008
my second Processing program (3D spheres)
I revisited my first Processing program this morning and had a play with 3D objects. This is incredibly easy as all I had to do was take a quick look at an example then use a 'Matrix'

/**
* 3D Lorenz Attractor : 3D spheres
*/

float h=0.01;
float x=0.6;
float y=0.6;
float z=0.6;
float xnew,ynew,znew;
int npoints = 100;
float scaler = 3;
float offset = 300;
float frac=8/3;
int k=0;
float maxz = 0;
float minz = 0;

void setup() {
 size(600, 600, P3D);
 background(102);
}

void draw() {
 lights();
 noStroke();

  if (k < 10000) {
   pushMatrix();
   xnew = x + h*10*(y-x);
   ynew = y + h*((-x*z) + 28*x-y);
   znew = z + h*(x*y - frac*z);
   color c1 = color((z/50) * 255, (z/50) * 255 , 60);
   translate(x*scaler+offset, y*scaler+offset, z*scaler*4);
   sphere(1);
   popMatrix();
   x=xnew;
   y=ynew;
   z=znew;
   k++;
  }

}