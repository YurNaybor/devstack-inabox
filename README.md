# devstack-inabox

A playground for setting up and using an OpenStack test environment.


## Setup / Requirements

- Vagrant
- VMWare (the Virtualbox variant did not receive much love, recently)
- Terraform


## Usage

First, look at the Vagrantfile and check if the variables at the provisioning ar
OK. (eg. GIT_BASE) amd modify if necessary.

For quicker setup and less network traffic, there is a docker for proxying the git repos of openstack. Find it under "git-proxy".

Note that the oldest working version of OpenStack appears to be Queens. Ocata
 and Pike throw "ImportError: No module named openstack_auth" at Horizon.

``
vagrant up
``

Now login to http://192.168.33.10/dashboard using admin/secret and export his
openrc v3 file. Then, you can source the file and run terraform:

Note that you have to use the admin login, because this provides access to the pre defined private network.

``
source ./demo-openrc.sh
cd terraform/cluster-base
./terraform init
./terraform state push .terraform/terraform.tfstate # dunno why this is necessary
./terraform apply
``

Note: For Terraform <0.12, you need to unset one variable before running
terraform:

``
unset OS_USER_DOMAIN_NAME
`
See https://github.com/hashicorp/terraform/issues/18569 for details.


## accessing compute nodes

For accessing the nodes / instances (via a floating / public ip), you need to
add a route:

sudo route -n add -net 172.24.4.0/24  192.168.33.10
``
``

## Additional infos / references / links

- Magnum: https://docs.openstack.org/magnum/2.1.0/dev/quickstart.html#quickstart
- https://gist.github.com/TranDinhKhang/90f88b28ce7f4b5d0da22573d1f1078c
