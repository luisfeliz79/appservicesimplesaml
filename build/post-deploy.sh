
echo "Begins post deploy"
pwd


echo "Cleaning up previous files ..."
rm -R /home/site/wwwroot/*
echo "Copying app files ..."
mv /home/site/repository/app/* /home/site/wwwroot/
mv /home/site/repository/index.php /home/site/wwwroot
mv /home/site/repository/testphp.php /home/site/wwwroot

BASEURL="https://$WEBSITE_HOSTNAME/idp/www"
sed -i -e "s|@@@BASEPATHURL@@@|${BASEURL}|g" /home/site/wwwroot/idp/config/config.php


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

