#!/bin/bash
BUILDDIR=$(pwd)
ITEMS="dialogs/ service_catalogs/"
DOMAINDIR="${BUILDDIR}/Automate"
DOMAIN_NAME="SSProvisioning"

pushd /var/www/miq/vmdb > /dev/null
   for i in ${ITEMS};do
     if echo ${i} | egrep "/$" > /dev/null; then
       i=$(echo ${i} | sed -e 's/\/$//') # ugly
       for dir in $(find ${BUILDDIR}/${i} -type d);do
         BUNDLE_GEMFILE=./Gemfile bin/rake rhconsulting:${i}:import[${dir}]
       done
     else
       BUNDLE_GEMFILE=./Gemfile bin/rake rhconsulting:${i}:import[${BUILDDIR}/${i}.yml]
     fi
   done
   BUNDLE_GEMFILE=./Gemfile bin/rake evm:automate:import PREVIEW=false DOMAIN=miq-Marketplace IMPORT_AS=${DOMAIN_NAME} IMPORT_DIR=${DOMAINDIR} ENABLED=true
 popd > /dev/null
