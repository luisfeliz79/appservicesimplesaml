wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v1.19.6/simplesamlphp-1.19.6.tar.gz -O simplesaml.tar.gz

tar xzf simplesaml.tar.gz
mv simplesamlphp* idp
rm simplesaml.tar.gz
rm -r idp/config
cp templates/config.php idp/config-templates/config.php
cp templates/testphp.php idp/www/testphp.php


#  mv idp ../app/

