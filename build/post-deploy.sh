
echo "Begins post deploy"
pwd



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
