#!/bin/bash
export PATH=/bin:/usr/local/bin:/sbin:${PATH}

# Get Instance IP
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

echo "Preparing OpenShift Origin Node"
mkdir -p /tmp/oc

# Download OC Binaries from Github
download_oc() {
    while true; do
        curl -kLo /tmp/oc.tar.gz "https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-server-v3.9.0-191fece-linux-64bit.tar.gz" && return
    done
}
download_oc
tar -xf /tmp/oc.tar.gz -C /tmp/oc
mv /tmp/oc/openshift-origin-server-v3.9.0-191fece-linux-64bit/* /bin/
rm -rf /tmp/oc

# Install Docker 
echo "Installing Docker"
yum install -y docker


# Launch OpenShift Cluster
# Make sure Docker Is running
check_docker(){
	while true; do
		docker ps && return
		service docker start
    done
}
check_docker

