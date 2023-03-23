#!/usr/bin/env sh

while ! nc -z ${TYPO3_DB_HOST} ${TYPO3_DB_PORT}; do   
  sleep 0.1 # wait for mysql
done
cd /challenge

set -xe 

#./vendor/bin/typo3 setup --dbname=$TYPO3_DB_NAME --force --no-interaction
mysql -u ${TYPO3_DB_USERNAME} -p${TYPO3_DB_PASSWORD} -h ${TYPO3_DB_HOST} ${TYPO3_DB_NAME} < sql/dump.sql
rm -rf sql
mv /challenge/app/LocalConfiguration.php /challenge/public/typo3conf/LocalConfiguration.php
touch /challenge/public/typo3conf/LocalConfiguration.php

# Mercurial
echo '[ui]' > $HOME/.hgrc
echo 'username = Alex Zeecka <alex@zeecka.tld>' >> $HOME/.hgrc
hg init
hg add composer.json
hg commit -m "Init typo3 project"

mkdir -p /challenge/config/sites/main
mv /challenge/app/index.php /challenge/public/fileadmin/index.php
mv /challenge/app/static /challenge/public/art-static
mv /challenge/app/config.yaml /challenge/config/sites/main/config.yaml

hg add *
hg commit -m "Create website"

composer require andersundsehr/aus-driver-amazon-s3
hg add /challenge/public/typo3conf/ext/aus_driver_amazon_s3
hg commit -m "Working on /debug-contact-form/"

hg forget *
hg add public/art-static
hg commit -m "Keep only art-static folder"

mv .hg/ public/

# chown -R apache:apache /challenge
chmod +w /challenge
# note /challenge/var doit etre accessible en ecriture pour apache
#chown -R root:root /challenge
#find . -type d -exec chmod o+rwx {} \;

rm build.sh
