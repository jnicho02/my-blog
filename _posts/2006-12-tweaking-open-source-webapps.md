title: Tweaking installed open source webapps
date: 2006/12/04
tags: [events]
author: Jez Nicholson
alias: /tweaking-open-source-webapps

I'm a big fan of open source web applications like Mantis, Moodle and Mediawiki (and some not starting with 'M' too). In my experience, when using systems like these within a company you soon find need for minor tweaks. It's always best to stick with the released version as much as possible, but sometimes it is the difference between the product being accepted by users or not. Obviously, if your tweak works then the ideal is to feed it back to the open source project and have it accepted as a patch.

As these are PHP systems (yes, I know that this is a Java blog site, but I use these tools to manage my Java projects, plus I think that PHP people should be encouraged to take up build tools such as Ant even if it is Java-based) it is tempting to just unzip the distribution, install it on the server and maybe check all the files in to source control (+5 for subversion!). But, when it comes round to upgrading the software with the next release it could be a pain to find out which files you tweaked.

I like all my projects to be buildable from scratch via an Ant build, and I treat the installation and upkeep of a bugtracking system exactly the same as a system we are developing in-house. The ultimate aim is that a new developer can check out the project from subversion, run an Ant build and the system will run. I use a cut-down version of the AppFuse build.xml and properties. This includes a lib.properties file that specifies which version of a library is being used.

The final piece of the jigsaw is to set CruiseControl up on the server, that way any developer can configure the app by checking a tweak into subversion. There is no need for anyone to have access to the server at all.

The files
directory structure
lib
svnant-1.1.0-RC2
...unzipped svnant...
lib.properties
mantis-1.0.6.tar.gz
MantisConnect-1.0a5.zip
src
...check in any files you tweak here...
...put the original in first and you'll be able to diff against it...
build.properties (optional)
build.xml
properties.xml
build.xml
<?xml version="1.0" encoding="UTF-8"?>
<project name="Mantis" basedir="." default="deploy">

    <!-- import properties (app settings, classpath, jar file locations) -->
    <import file="properties.xml"/>

    <path id="svnant.classpath">
        <fileset dir="${svnant.dir}" includes="*.jar"/>
    </path>

    <typedef resource="org/tigris/subversion/svnant/svnantlib.xml" classpathref="svnant.classpath" />

    <target name="init" description="defines custom tasks">
        <echo>Create a file ${user.home}\${ant.project.name}-build.properties to override project properties</echo>
        <echo>or a file ${user.home}\build.properties to globally override properties</echo>
    </target>

    <target name="deploy" depends="update">
        <mkdir dir="${build.dir}"/>
        <gunzip src="${mantis.tar.gz}" dest="${build.dir}/mantis.tar"/>
        <untar src="${build.dir}/mantis.tar" dest="${build.dir}"/>
        <move todir="${build.dir}/${webapp.name}">
            <fileset dir="${build.dir}/mantis-${mantis.version}"/>
        </move>
        <unzip src="${mantisconnect.zip}" dest="${build.dir}"/>
        <copy todir="${build.dir}/${webapp.name}/mc">
            <fileset dir="${build.dir}/MantisConnect-${mantisconnect.version}/webservice"/>
        </copy>
        <copy todir="${build.dir}/${webapp.name}">
            <fileset dir="src"/>
        </copy>
        <copy file="metadata/${user.name}-config_inc.php" tofile="${build.dir}/${webapp.name}/config_inc.php"/>
        <copy file="metadata/${user.name}-MantisNotify.exe.config" tofile="${build.dir}/MantisConnect-${mantisconnect.version}/bin/MantisNotify.exe.config" overwrite="true"/>
        <copy file="metadata/${user.name}-MantisFilters.exe.config" tofile="${build.dir}/MantisConnect-${mantisconnect.version}/bin/MantisFilters.exe.config" overwrite="true"/>
        <copy file="metadata/${user.name}-MantisSubmit.exe.config" tofile="${build.dir}/MantisConnect-${mantisconnect.version}/bin/MantisSubmit.exe.config" overwrite="true"/>
    </target>

    <target name="update" depends="init">
        <echo>Updating ${ant.project.name} from subversion</echo>
        <svn>
            <update dir="."/>
        </svn>
    </target>    

    
</project>
properties.xml
<?xml version="1.0" encoding="UTF-8"?>
<project>
    <!-- Load user overrides -->
    <property file="${user.home}/${ant.project.name}-build.properties"/>
    <property file="${user.home}/build.properties"/>
    <property name="config.filename" value="${user.name}.properties"/>
    <property file="config/${config.filename}"/>
    <property file="build.properties"/>
    
    <!-- Directory structure of the project -->
    <property name="build.dir" value="${basedir}/build"/>
    <property name="dist.dir" value="${basedir}/dist"/>
    <property name="test.dir" value="${build.dir}/test"/>
    
    <!-- Library versions and JARs -->
    <property name="lib.dir" location="lib"/>
    <property file="${lib.dir}/lib.properties"/>
</project>
lib.properties
#
# Mantis 
#
mantis.version=1.0.6
mantis.tar.gz=${lib.dir}/mantis-${mantis.version}.tar.gz

#
# MantisConnect 
#
mantisconnect.version=1.0a5
mantisconnect.zip=${lib.dir}/MantisConnect-${mantisconnect.version}.zip

#
# SvnAnt
#
svnant.version=1.1.0-RC2
svnant.dir=${lib.dir}/svnant-${svnant.version}/lib