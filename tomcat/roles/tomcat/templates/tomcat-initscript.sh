#!/bin/bash
#
# chkconfig: 345 99 28
# description: Starts/Stops Apache Tomcat
#
# Tomcat 7 start/stop/status script
# Forked from: https://gist.github.com/valotas/1000094
# @author: Miglen Evlogiev <bash@miglen.com>
#
# Release updates:
# Updated method for gathering pid of the current proccess
# Added usage of CATALINA_BASE
# Added coloring and additional status
# Added check for existence of the tomcat user
#
case $1 in
start)
sh /톰캣위치/bin/startup.sh
;;
stop)
sh /톰캣위치/bin/shutdown.sh
;;
restart)
sh /톰캣위치/bin/shutdown.sh
sleep 2
sh /톰캣위치/bin/startup.sh
;;
esac
exit 0