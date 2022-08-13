
echo "Begins post deploy"
pwd


echo "Cleaning up previous files ..."
rm -R /home/site/wwwroot/*
echo "Copying app files ..."
mv /home/site/repository/app/* /home/site/wwwroot/


echo "Copying initial user data to /data if needed"

echo "Creating Config directory ..."
if [ ! -d /data/config ]; then
  mkdir /data/config
  cp /home/site/wwwroot/idp/config-templates/* /data/config/

  # Change the BaseUrlPath on the config to include the App Service's hostname
  BASEURL="https://$WEBSITE_HOSTNAME"
  sed -i -e "s|@@@BASEPATHURL@@@|${BASEURL}|g" /data/config/config.php

fi

echo "Creating certs directory and initial signing certs ..."
if [ ! -d /data/cert ]; then
  mkdir /data/cert
  openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout /data/cert/server.pem -out /data/cert/server.crt -config /home/site/repository/build/templates/sign-cert.conf -extensions  'v3_req'
fi

echo "Creating log directory ..."
if [ ! -d /data/log ]; then
  mkdir /data/log
fi

echo "Creating metadata directory and copying templates ..."
if [ ! -d /data/metadata ]; then
  mkdir /data/metadata
  cp /home/site/wwwroot/idp/metadata/* /data/metadata/
fi

