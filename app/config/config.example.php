<?php

/*
  +------------------------------------------------------------------------+
  | Phosphorum                                                             |
  +------------------------------------------------------------------------+
  | Copyright (c) 2013-2014 Phalcon Team and contributors                  |
  +------------------------------------------------------------------------+
  | This source file is subject to the New BSD License that is bundled     |
  | with this package in the file docs/LICENSE.txt.                        |
  |                                                                        |
  | If you did not receive a copy of the license and are unable to         |
  | obtain it through the world-wide-web, please send an email             |
  | to license@phalconphp.com so we can send you a copy immediately.       |
  +------------------------------------------------------------------------+
*/

$services = json_decode($_ENV['VCAP_SERVICES'], true);
$mysql_svc = $services['cleardb'][0]['credentials'];
$smtp_svc = $services['sendgrid'][0]['credentials'];

return new \Phalcon\Config(array(

    'database'    => array(
        'adapter'  => 'Mysql',
        'host'     => $mysql_svc['hostname'],
        'port'     => $mysql_svc['port'],
        'username' => $mysql_svc['username'],
        'password' => $mysql_svc['password'],
        'dbname'   => $mysql_svc['name'],
        'charset'  => 'utf8'
    ),
    'application' => array(
        'controllersDir' => APP_PATH . '/app/controllers/',
        'modelsDir'      => APP_PATH . '/app/models/',
        'viewsDir'       => APP_PATH . '/app/views/',
        'pluginsDir'     => APP_PATH . '/app/plugins/',
        'libraryDir'     => APP_PATH . '/app/library/',
        'development'    => array(
            'staticBaseUri' => '/',
            'baseUri'       => '/'
        ),
        'production'     => array(
            'staticBaseUri' => 'http://static.phosphorum.com/',
            'baseUri'       => '/'
        ),
        'debug'          => true
    ),
    'mandrillapp' => array(
        'secret' => ''
    ),
    'github'      => array(
        'clientId'     => '',
        'clientSecret' => '',
        'redirectUri'  => 'http://pforum.loc/login/oauth/access_token/'
    ),
    'amazonSns'   => array(
        'secret' => ''
    ),
    'smtp'        => array(
        'host'     => $smtp_svc['hostname'],
        'port'     => 25,
        'security' => "tls",
        'username' => $smtp_svc['username'],
        'password' => $smtp_svc['password']
    ),
    'beanstalk'   => array(
        'host' => '127.0.0.1'
    )
));
