# LICENSE CDDL 1.0 + GPL 2.0
#
# Copyright (c) 2014-2015 Oracle and/or its affiliates. All rights reserved.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This is the Dockerfile for Oracle WebLogic Server 12.2.1.2 Generic Distro
#
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) fmw_12.2.1.2.0_wls_Disk1_1of1.zip
#     Download the Generic installer from http://www.oracle.com/technetwork/middleware/weblogic/downloads/wls-for-dev-1703574.html
#
# (2) server-jre-8uXX-linux-x64.tar.gz
#     Download from http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run:
#      $ docker build -f Dockerfile.generic -t oracle/weblogic:12.2.1.2-generic .
#
# IMPORTANT
# ---------
# The resulting image of this Dockerfile contains a WLS Empty Domain.
#
# Pull base image
# From the Oracle Registry
# -------------------------
FROM jeqo/weblogic

# Maintainer
# ----------
MAINTAINER Monica Riccelli <monica.riccelli@oracle.com>

# WLS Configuration (editable during build time)
# ------------------------------
ARG ADMIN_PASSWORD


# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV SCRIPT_FILE=/u01/oracle/createAndStartEmptyDomain.sh \
    DEBUG_FLAG=true \
    PRODUCTION_MODE=dev \
    DOMAIN_NAME="${DOMAIN_NAME:-base_domain}" \
    DOMAIN_HOME=/u01/oracle/user_projects/domains/${DOMAIN_NAME:-base_domain} \
    ADMIN_PORT="${ADMIN_PORT:-7001}" \
    ADMIN_PASSWORD=welcome1 \
    PATH=$PATH:${DOMAIN_HOME}/bin

# Copy packages
# -------------
COPY container-scripts/* ${ORACLE_HOME}/

RUN chmod +xr ${ORACLE_HOME}/*

# Setup filesystem and oracle user
# Install and configure Oracle JDK
# Adjust file permissions, go to /u01 as user 'oracle' to proceed with WLS installation
# ------------------------------------------------------------
RUN sh createAndStartEmptyDomain.sh

RUN ./wlst app-deploy.py

VOLUME ${DOMAIN_HOME}/servers/AdminServer/logs

# Define default command to start script.
CMD ${DOMAIN_HOME}/startWebLogic.sh
