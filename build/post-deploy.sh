
echo "Begins post deploy"
pwd


echo "Cleaning up previous files ..."
rm -R /home/site/wwwroot/*
echo "Copying app files ..."
mv /home/site/repository/app/* /home/site/wwwroot/
#mv /home/site/repository/app/.htaccess /home/site/wwwroot
mv /home/site/repository/index.php /home/site/wwwroot
mv /home/site/repository/testphp.php /home/site/wwwroot

BASEURL="https://$WEBSITE_HOSTNAME/simplesaml"
sed -i -e "s|@@@BASEPATHURL@@@|${BASEURL}|g" /home/site/wwwroot/simplesamlphp/config/config.php


echo "Copying initial user data to /data if needed"
if [ ! -d /data/config ]; then
  mkdir /data/config
  cp /home/site/wwwroot/simplesamlphp/config/* /data/config/
fi

if [ ! -d /data/cert ]; then
  mkdir /data/cert
fi

if [ ! -d /data/log ]; then
  mkdir /data/log
fi


if [ ! -d /data/metadata ]; then
  mkdir /data/metadata
  cp /home/site/wwwroot/simplesamlphp/metadata/* /data/metadata/
fi

# set the environment variable to the config to /data

export SIMPLESAMLPHP_CONFIG_DIR=/data/config
