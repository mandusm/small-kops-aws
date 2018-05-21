#!/bin/bash
echo "Preparing OpenShift Origin Node"
mkdir -p /tmp/oc
curl -kLo /tmp/oc.tar.gz "https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-server-v3.9.0-191fece-linux-64bit.tar.gz"
tar -xf /tmp/oc.tar.gz -C /tmp/oc
mv /tmp/oc/openshift-origin-server-v3.9.0-191fece-linux-64bit/* /usr/local/bin/
rm -rf /tmp/oc
