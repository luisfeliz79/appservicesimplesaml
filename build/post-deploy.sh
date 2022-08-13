
echo "Begins post deploy"
pwd


echo "Cleaning up previous files ..."
rm -R /home/site/wwwroot/*
echo "Copying app files ..."
mv /home/site/repository/app/* /home/site/wwwroot/

echo "Updating nginx config and reloading..."
mkdir /etc
mkdir /etc/nginx
mkdir /etc/nginx/sites-enabled
ls /etc
cp /home/site/repository/build/templates/default  /etc/nginx/sites-enabled/default
nginx -s reload

BASEURL="https://$WEBSITE_HOSTNAME"
sed -i -e "s|@@@BASEPATHURL@@@|${BASEURL}|g" /home/site/wwwroot/idp/config-templates/config.php

echo "Copying initial user data to /data if needed"
if [ ! -d /data/config ]; then
  mkdir /data/config
  cp /home/site/wwwroot/idp/config-templates/* /data/config/
fi

if [ ! -d /data/cert ]; then
  mkdir /data/cert
fi

if [ ! -d /data/log ]; then
  mkdir /data/log
fi


if [ ! -d /data/metadata ]; then
  mkdir /data/metadata
  cp /home/site/wwwroot/idp/metadata/* /data/metadata/
fi

