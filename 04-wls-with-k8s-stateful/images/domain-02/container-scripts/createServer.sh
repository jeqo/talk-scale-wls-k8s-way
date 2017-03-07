#!/bin/bash
#
# Copyright (c) 2014-2015 Oracle and/or its affiliates. All rights reserved.
#

# If log.nm does not exists, container is starting for 1st time
# So it should start NM and also associate with AdminServer, as well Managed Server
# Otherwise, only start NM (container is being restarted)
# if [ ! -f /logs/$HOSTNAME.log ]; then
#    ADD_SERVER=1
#fi

# Wait for AdminServer to become available for any subsequent operation
/u01/oracle/waitForAdminServer.sh

# Wait for AdminServer to become available for any subsequent operation
/u01/oracle/waitForNodeManager.sh

# Start Node Manager
# echo "Starting NodeManager in background..."
# nohup ${DOMAIN_HOME}/bin/startNodeManager.sh > log.nm 2>&1 &
# echo "NodeManager started."

# Add this 'Machine' and 'ManagedServer' to the AdminServer only if 1st execution
if [ ! -f "/logs/$HOSTNAME.log" ]; then
  ${ORACLE_HOME}/wlst /u01/oracle/add-machine.py
  ${ORACLE_HOME}/wlst /u01/oracle/add-server.py
  # cp /secrets/boot.properties /u01/oracle/user_projects/domains/base_domain/servers/$HOSTNAME/security/boot.properties
  mkdir -p /u01/oracle/user_projects/domains/$DOMAIN_NAME/servers/$HOSTNAME/security
  echo "username=weblogic" > /u01/oracle/user_projects/domains/$DOMAIN_NAME/servers/$HOSTNAME/security/boot.properties
  echo "password=$ADMIN_PASSWORD" >> /u01/oracle/user_projects/domains/$DOMAIN_NAME/servers/$HOSTNAME/security/boot.properties
fi

# print log
# tail -f /u01/oracle/user_projects/domains/$DOMAIN_NAME/servers/$HOSTNAME/logs/$HOSTNAME.out
${DOMAIN_HOME}/bin/startManagedWebLogic.sh $HOSTNAME t3://wls-domain-as:7001
