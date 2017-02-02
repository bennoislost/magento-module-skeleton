# Magento Module Skeleton

[![Build Status](https://travis-ci.org/bennoislost/magento-module-skeleton.svg?branch=feature%2Ftravis)](https://travis-ci.org/bennoislost/magento-module-skeleton)

A snapshot to begin your Magento 1 module

## Installation

Clone repository..

```
git clone git@github.com:bennoislost/magento-module-skeleton.git .
```

To install the `magento/magento-eqp` package you will have to authenticate against `repo.magento.com`

```
"http-basic": {
    "repo.magento.com": {
        "username":"<your public key>",
        "password":"<your private key>"
    }
}
```

You can create magento authentication keys here: [http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html)

You can define Composer authentication here: [https://getcomposer.org/doc/articles/http-basic-authentication.md](https://getcomposer.org/doc/articles/http-basic-authentication.md)

## Usage

`composer install` command will download and extract magento core with useful development modules into `./magento`. From here you can use a tool like `n98-magerun.phar` to create your skeleton module structure.


## Composer script commands

* `mage:redeploy` - Redeploy `magento-module` & `magento-core` composer packages into Magento root directory.
* `mage:cache:flush` - Will purge cache directory.

## Extra tooling

Download the following tools for more win.

* [n98-magerun](https://github.com/netz98/n98-magerun)
* [modman](https://github.com/colinmollenhour/modman)

