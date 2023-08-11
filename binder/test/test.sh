#!/bin/bash

if [ -n "$DISPLAY" ]; then
    has_display="true"
else
    has_display="false"
fi

source /home/Multiverse/multiverse_ws/devel/setup.bash && \
  roslaunch --wait /home/binder/test/multiverse.launch &

source /home/Multiverse/giskard_ws/devel/setup.bash && \
  roslaunch --wait /home/binder/test/giskard.launch has_display:=$has_display &

cp /home/binder/test/app.json /home/Multiverse/giskard_ws/src/rvizweb/webapps/app.json

rosbag play /home/binder/test/test.bag -q --loop

wait