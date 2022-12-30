#!/bin/bash

supervisorctl restart nginx
supervisorctl restart web
supervisorctl restart x:lxpanel
supervisorctl restart x:novnc
supervisorctl restart x:pcmanfm
supervisorctl restart x:wm
supervisorctl restart x:x11vnc
supervisorctl restart x:xvfb
