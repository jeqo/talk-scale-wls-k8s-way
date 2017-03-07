#!/bin/bash
#
# Copyright (c) 2014-2015 Oracle and/or its affiliates. All rights reserved.
#

# Wait for AdminServer to become available for any subsequent operation
/u01/oracle/waitForAdminServer.sh

# Start Node Manager
# echo "Starting NodeManager in background..."
# nohup ${DOMAIN_HOME}/bin/startNodeManager.sh > log.nm 2>&1 &
# echo "NodeManager started."


# print log
# tail -f log.nm
${DOMAIN_HOME}/bin/startNodeManager.sh
