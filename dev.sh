
#PHP specific
composer global require "phpunit/phpunit=4.5.*"
composer global require "squizlabs/php_codesniffer=*"
composer global require "phpmd/phpmd=*"
composer global require 'sebastian/phpcpd=*'
composer global require 'phploc/phploc=*'

#GEM packages
gem install scss-lint
gem install compass

#NPM packages
sudo npm install -g jshint
sudo npm install -g csslint

export PATH=$PATH:/home/vagrant/.composer/vendor/bin
#Adminer
sudo mkdir /usr/share/adminer
sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
echo "Alias /adminer.css /usr/share/adminer/adminer.css" | sudo tee /etc/apache2/conf-available/adminer.conf
sudo wget "https://raw.github.com/vrana/adminer/master/designs/pappu687/adminer.css"
sudo a2enconf adminer.conf

#PHP utilities
git clone https://github.com/raveren/kint.git
wget https://raw.githubusercontent.com/JosephLenton/PHP-Error/master/src/php_error.php
touch prepend.php && 
touch prepend.ini && 
echo '<?php require_once("/home/vagrant/php_error.php");' >> prepend.php
echo 'require_once("/home/vagrant/kint/Kint.class.php");' >> prepend.php
echo 'auto_prepend_file="/etc/php5/apache2/conf.d/prepend.php"' >> prepend.ini
echo 'php_error.autorun=On' >> prepend.ini
sudo mv -f prepend.ini /etc/php5/apache2/conf.d/prepend.ini && 
sudo mv -f prepend.php /etc/php5/apache2/conf.d/prepend.php

#$Xdebug
sudo apt-get install php5-xdebug -y

touch xdebug.ini
echo 'zend_extension="/usr/lib/php5/20121212/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_mode=req
xdebug.remote_host=127.0.0.1
xdebug.var_display_max_depth=-1
xdebug.var_display_max_children=-1
xdebug.var_display_max_data=-1
xdebug.remote_port=9000' >> xdebug.ini
sudo mv -f xdebug.ini /etc/php5/apache2/conf.d/xdebug.ini &&


sudo service apache2 restart


#SSH keys
cd .ssh
cp -r /var/www/ssh/* .
chmod 600 *
eval "$(ssh-agent -s)"
ssh-add assembla
ssh-add bh.key
ssh-add sentry 
ssh-add neuron
