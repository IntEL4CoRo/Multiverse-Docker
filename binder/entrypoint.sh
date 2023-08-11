#!/bin/bash
source /home/Multiverse/giskard_ws/devel/setup.bash

roscore &

/bin/bash /home/binder/test/test.sh &

# Use xvfb virtual display when there is no display connected.
if [ -n "$DISPLAY" ]; then
    exec "$@"
else
    xvfb-run exec "$@"
fi
