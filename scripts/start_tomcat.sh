#!/bin/bash

# 톰캣 재시작
/opt/tomcat9/bin/shutdown.sh
sleep 5
/opt/tomcat9/bin/startup.sh