sudo apt-get install npm 
#PHP extensions
#sudo apt-get install php-xml libapache2-mod-php 

#composer

#EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
#php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

#if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
#then
    #php composer-setup.php 
    #RESULT=$?
    #rm composer-setup.php
    #sudo mv composer.phar /usr/local/bin/composer
#else
    #>&2 echo 'ERROR: Invalid installer signature'
    #rm composer-setup.php
    #exit 1
#fi


#PHP specific
composer global require "phpunit/phpunit=4.5.*" --update-no-dev
composer global require "squizlabs/php_codesniffer=*"
composer global require "phpmd/phpmd=*"
composer global require 'sebastian/phpcpd=*'
composer global require 'phploc/phploc=*'
composer global require 'pdepend/pdepend=*'
composer global require 'phpmetrics/phpmetrics'
composer global require friendsofphp/php-cs-fixer

#padwan server
composer global require mkusher/padawan

#GEM packages
#gem install scss-lint
#gem install compass

#NPM packages
#sudo npm install -g jshint
#sudo npm install -g csslint


docker pull eko3alpha/docker-phpqa
echo '*************'
echo 'Do not forget to add the bash alias to start this service. See https://hub.docker.com/r/eko3alpha/docker-phpqa/'
echo '*************'

#export PATH=$PATH:/home/vagrant/.composer/vendor/bin
#Adminer
#sudo mkdir /usr/share/adminer
#sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
#sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
#echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
#echo "Alias /adminer.css /usr/share/adminer/adminer.css" | sudo tee /etc/apache2/conf-available/adminer.conf
#sudo wget "https://raw.github.com/vrana/adminer/master/designs/pappu687/adminer.css"
#sudo a2enconf adminer.conf

#PHP utilities
#git clone https://github.com/raveren/kint.git
#wget https://raw.githubusercontent.com/JosephLenton/PHP-Error/master/src/php_error.php
#touch prepend.php && 
#touch prepend.ini && 
#echo '<?php require_once("/home/vagrant/php_error.php");' >> prepend.php
#echo 'require_once("/home/vagrant/kint/Kint.class.php");' >> prepend.php
#echo 'auto_prepend_file="/etc/php5/apache2/conf.d/prepend.php"' >> prepend.ini
#echo 'php_error.autorun=On' >> prepend.ini
#sudo mv -f prepend.ini /etc/php5/apache2/conf.d/prepend.ini && 
#sudo mv -f prepend.php /etc/php5/apache2/conf.d/prepend.php

#$Xdebug
#sudo apt-get install php5-xdebug -y

#touch xdebug.ini
#echo 'zend_extension="/usr/lib/php/20151012/xdebug.so"
#xdebug.remote_enable=1
#xdebug.remote_handler=dbgp
#xdebug.remote_mode=req
#xdebug.remote_host=127.0.0.1
#xdebug.var_display_max_depth=-1
#xdebug.var_display_max_children=-1
#xdebug.var_display_max_data=-1
#xdebug.remote_port=9000' >> xdebug.ini
#sudo mv -f xdebug.ini /etc/php/7.0/apache2/conf.d/xdebug.ini &&

#Workflow
#tmuxp stuff 
pip install tmuxp
#pomodoro stuff
cd ~
wget https://raw.githubusercontent.com/yogsototh/get-shit-done/master/get-shit-done -O /usr/local/bin/get-work-done &&
sudo chmod +x /usr/local/bin/get-work-done
git clone https://github.com/yogsototh/pomodoro.git




#sudo service apache2 restart


#SSH keys
#cd .ssh
#cp -r /var/www/ssh/* .
#chmod 600 *
#eval "$(ssh-agent -s)"
#ssh-add assembla
#ssh-add bh.key
#ssh-add sentry 
#ssh-add neuron
