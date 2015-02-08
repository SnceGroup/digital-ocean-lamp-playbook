#Digital Ocean Ansible provisioning

##Instructions

###Install Ansible via Homebew (MacOS)
```shell
brew install ansible
```

###Install dopy
```shell
sudo easy_install pip
sudo pip install dopy
```
###Discover Digital Ocean internal ids (sizes, regions, images, ssh_keys)

```shell
$ export DO_CLIENT_ID=YOUR DIGITAL OCEAN CLIENT ID
$ export DO_API_KEY=YOUR DIGITAL OCEAN API KEY
$ chmod +x do.sh
$ ./do.sh
```
####Output (regions example)
```json
{
    "regions": [
        {
            "id": 3,
            "name": "San Francisco 1",
            "slug": "sfo1"
        },
        {
            "id": 4,
            "name": "New York 2",
            "slug": "nyc2"
        },
        {
            "id": 5,
            "name": "Amsterdam 2",
            "slug": "ams2"
        },
        {
            "id": 6,
            "name": "Singapore 1",
            "slug": "sgp1"
        }
    ],
    "status": "OK"
}
```
Grab the ids that you need

###Update the correct DO values in playbook/vars/do.yml

```yml
do_client_id: yourclientid
do_api_key: yourapikey
do_ssh_key_ids: yourid1, yourid2 #Comma separated list
do_image_id: 3240850 #Centos 6.5 x64
do_size_id: 66 #512MB - 20GB 1CPU
do_region_id: 5 #ams2
```

###Variables values
Change variables values according to your needs in .yml files inside the /vars folder

###Run Ansible playbook
```shell
$ ansible-playbook -i local playbook/provisioning.yml
```

##Miscellaneous info
* backups_enabled parameter in digital_ocean ansible module is currently not supported, [it will be in ansible 1.6](http://docs.ansible.com/digital_ocean_module.html)
* A standard [eZ Publish 5.x](http://confluence.ez.no) Vhost will be added during the HTTPD installation (The ServerName is specified inside the /playbook/vars/apache.yml config file)
* Last [Composer](http://getcomposer.com) package will be installed by default
* PHP packeges are splitted in 2 groups to avoid ansible/yum hanging

##Installed applications
* libselinux-python
* python-pip
* boto
* git
* vim
* wget
* htop
* zip
* unzip
* telnet
* ImageMagick
* ImageMagick-devel
* ImageMagick-perl
* httpd
* php (5.4.x)
* php-cli
* php-common
* php-devel
* php-gd
* php-mbstring
* php-pdo
* php-pecl-apc
* php-xml
* php-curl
* php-imagick
* php-intl
* php-memcache
* php-mcrypt
* php-mhash
* php-mysqlnd
* php-xsl
* composer
* mysql-community-server (5.6.x)
* mysql
* MySQL-python
* memcached (1.4.x)
* node.js
* npm
