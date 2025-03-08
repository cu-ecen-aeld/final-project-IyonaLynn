#!/bin/sh

case "$1" in
    start)
        echo "Loading SCULL module"
        /usr/bin/scull_load
        echo "Loading faulty module"
        /usr/bin/module_load faulty
        echo "Loading hello module"
        modprobe hello
        ;;
    stop)
        echo "Unloading SCULL module"
        /usr/bin/scull_unload
        echo "Unloading faulty module"
        /usr/bin/module_unload
        echo "Removing hello module"
        rmmod hello
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac
exit 0
