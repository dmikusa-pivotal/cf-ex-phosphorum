Phosphorum 2
============

This is the official Phalcon Forum you can adapt it to your own needs or improve it if you want.  This fork of the repository has been modified to run on CloudFoundry.


CloudFoundry
------------

List of changes to make this run on CloudFoundry.

- Remote `.htaccess` files.  These are not necessary on CF.
- Added `manifest.yml` file.  This is not strictly necessary, but helps making pushes easier.
- Modified `app/config/config.example.php` to pull MySQL and SMTP credentials from VCAP_SERVICES.
- Modified `app/config/services.php` and [changed FileLogger to StreamLogger](https://github.com/dmikusa-pivotal/cf-ex-phosphorum/commit/5ede7a705756d7dff391c80652bef0b10832b027) so that logs are written to stderr.  This ensures that the logs are streamed properly to `cf logs`.
- Added some `ignore.txt` files under the `cache` directory.  This was necessary so that `cf push` would upload the empty directories (unfortunately using a hidden file did not seem to help).
- Added `.cfignore` to instruct `cf push` what to skip on upload.  Skips things like tests and docs.  Not strictly necessary, but makes the upload go quicker.
- Added `.bp-config/options.json` to enable phalcon, openssl and curl extensions.
- Added `.bp-config/httpd/extra/httpd-php.conf` custom rewrite rules to modify how HTTPD interacts with PHP-FPM.  This is essentially what was in the `.htaccess` file with some modifications to work with a FastCGI setup.
- Added `.bp-config/httpd/extra/httpd-mime.conf` to set the `DirectoryIndex` and `AddDefaultCharset` options.  Could have put these elsewhere, but adding them here was convenient.


Requirements
------------
You can clone the repository and then install dependencies using composer:

```bash
php composer.phar install
```

Change the owner of `app/logs` and `app/cache` to whatever user your web server is running as.

This application uses Github as authentication system, you need a client id and secret id
to be set up in the configuration (app/config/config.php):

* Curl extension (http://php.net/manual/en/book.curl.php)
* Openssl extension (http://php.net/manual/en/book.openssl.php)

NOTE
----
The master branch will always contain the latest stable version. If you wish
to check older versions or newer ones currently under development, please
switch to the relevant branch.

Required version: >= 1.2.6

Get Started
-----------

#### Requirements

To run this application on your machine, you need at least:

* PHP >= 5.3.9
* Apache Web Server with mod rewrite enabled or Nginx Web Server
* Latest Phalcon Framework extension installed and enabled

Then you'll need to create the database and initialize schema:

    echo 'CREATE DATABASE forum CHARSET=utf8 COLLATE=utf8_unicode_ci' | mysql -u root
    cat schemas/forum.sql | mysql -u root forum

Tests
-----
Phosphorum use [Codeception](http://codeception.com) functional tests. Execute:

```bash
php codecept.phar run
```

Detailed output:

```bash
php codecept.phar run --debug
```

License
-------
Phosphorum is open-sourced software licensed under the New BSD License.
