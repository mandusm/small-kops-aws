#!/bin/bash
export PATH=/bin:/usr/local/bin:/sbin:${PATH}
export PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
cd /home/centos/awssb
oc cluster up --public-hostname=${PUBLIC_IP}.nip.io --logging=true --metrics=true --service-catalog=true --use-existing-config=true