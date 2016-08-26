#!/bin/bash

# Define project root
if [ ! -z $TRAVIS_BUILD_DIR ] ; then PROJECT_DIR=$TRAVIS_BUILD_DIR; fi

cd $PROJECT_DIR

MAGENTO_ROOT=${PROJECT_DIR}/src/magento
BIN_DIR=${PROJECT_DIR}/bin

mkdir -p ${BIN_DIR}
export PATH=${BIN_DIR}:$PATH

# Magento config opts
if [ -z $MAGENTO_INSTALL_DB_HOST ]; then MAGENTO_INSTALL_DB_HOST="localhost"; fi
if [ -z $MAGENTO_INSTALL_DB_PORT ]; then MAGENTO_INSTALL_DB_PORT="3306"; fi
if [ -z $MAGENTO_INSTALL_DB_USER ]; then MAGENTO_INSTALL_DB_USER="root"; fi
if [ -z $MAGENTO_INSTALL_DB_PASS ]; then MAGENTO_INSTALL_DB_PASS=""; fi
if [ -z $MAGENTO_INSTALL_DB_NAME ]; then MAGENTO_INSTALL_DB_NAME="travis_ci_magento_module"; fi

echo
echo Download tools
echo

wget -O ${BIN_DIR}/n98-magerun.phar https://files.magerun.net/n98-magerun.phar --no-check-certificate
chmod +x ${BIN_DIR}/n98-magerun.phar

wget -O ${BIN_DIR}/selenium-server-standalone.jar https://selenium.googlecode.com/files/selenium-server-standalone-2.31.0.jar --no-check-certificate

echo
echo Create MySQL Database: ${MAGENTO_INSTALL_DB_NAME}
echo

mysql -u${MAGENTO_INSTALL_DB_USER} -h${MAGENTO_INSTALL_DB_HOST} -P${MAGENTO_INSTALL_DB_PORT} -e "DROP DATABASE IF EXISTS \`${MAGENTO_INSTALL_DB_NAME}\`; CREATE DATABASE \`${MAGENTO_INSTALL_DB_NAME}\`;"

echo
echo Install Magento instance
echo

n98-magerun.phar install \
    --dbHost=${MAGENTO_INSTALL_DB_HOST} \
    --dbUser=${MAGENTO_INSTALL_DB_USER} \
    --dbPass=${MAGENTO_INSTALL_DB_PASS} \
    --dbName=${MAGENTO_INSTALL_DB_NAME} \
    --installSampleData=yes \
    --useDefaultConfigParams=yes \
    --magentoVersionByName=${MAGENTO_VERSION} \
    --installationFolder=${MAGENTO_ROOT} \
    --baseUrl="http://magento.travis/" || { echo "Magento install failed"; exit 1; }