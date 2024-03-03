#! /bin/bash

# hg & rg 09.07.2017

SCRIPTNAME=$0
PARAMETER=$1

echo "$SCRIPTNAME gestartet mit $PARAMETER"

case "$1" in
        start)
            sudo service zeitraffer start
            ;;
         
        stop)
            sudo service zeitraffer stop
            ;;
         
        status)
            echo "not implemented"
            ;;
        restart)
            sudo service zeitraffer stop
            sudo service zeitraffer start
            ;;
        condrestart)
            if test "x`pidof anacron`" != x; then
                stop
                start
            fi
            ;;
         
        *)
            echo $"Usage: $0 {start|stop|restart|status}"
            exit 1
 
esac



