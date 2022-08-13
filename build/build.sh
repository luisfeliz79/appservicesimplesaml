wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v1.19.6/simplesamlphp-1.19.6.tar.gz -O simplesaml.tar.gz

tar xzf simplesaml.tar.gz
mv simplesamlphp* simplesamlphp
rm simplesaml.tar.gz

cp templates/config.php simplesamlphp/config/config.php

