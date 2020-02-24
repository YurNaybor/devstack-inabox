#!/bin/bash

set -e

GIT_BASE=https://opendev.org
# noVNC comes from github
REPOS="devstack neutron horizon requirements swift placement keystone cinder designate designate-tempest-plugin tempest nova designate-dashboard glance magnum barbican ceilometer python-magnumclient magnum-ui python-barbicanclient heat heat-dashboard python-heatclient"

for i in ${REPOS}; do
	if [ ! -d ${i} ]; then
		git clone --bare ${GIT_BASE}/openstack/${i}.git
		cd ${i}.git
		mv hooks/post-update.sample hooks/post-update
		chmod a+x hooks/post-update
		git update-server-info
		cd -
	fi
done

#/opt/stack/neutron/.git
#/opt/stack/horizon/.git
#/opt/stack/requirements/.git
#find: â/opt/stack/data/etcd/memberâ: Permission denied
#/opt/stack/swift/.git
#/opt/stack/placement/.git
#/opt/stack/keystone/.git
#/opt/stack/noVNC/.git
#/opt/stack/cinder/.git
#/opt/stack/designate/.git
#/opt/stack/designate-tempest-plugin/.git
#/opt/stack/tempest/.git
#/opt/stack/nova/.git
#/opt/stack/designate-dashboard/.git
#/opt/stack/glance/.git
