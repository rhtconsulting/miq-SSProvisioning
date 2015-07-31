# miq-SSProvisioning
Self Service Provisioning

This is provided as is.

To install simply run the install script... ./install.sh

What gets installed:
* A SSProvision Domain that is a self contained environment.  This domain name can be changed in the variable DOMAIN_NAME at the top
* A Service catalog: Self Service Provisioning
* A Catalog item Provision Service
* Automate code for provisioning new systems.

The system needs a Satellite 6 system set up for the following:
*  Services are defined by the Host group, an example would be a hostgroup for JBossEAP.
