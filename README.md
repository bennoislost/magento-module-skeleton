# Magento Module Skeleton

[![Build Status](https://travis-ci.org/bennoislost/magento-module-skeleton.svg?branch=feature%2Ftravis)](https://travis-ci.org/bennoislost/magento-module-skeleton)

A snapshot to begin your Magento 1 module

## Installation

Clone repository..

```
git clone git@github.com:bennoislost/magento-module-skeleton.git .
```

## Usage

`composer install` command will download and extract magento core with useful development modules into `./magento`. From here you can use a tool like `n98-magerun.phar` to create your skeleton module structure.


## Composer script commands

* `mage:redeploy` - Redeploy `magento-module` & `magento-core` composer packages into Magento root directory.
* `mage:cache:flush` - Will purge cache directory.

## Extra tooling

Download the following tools for more win.

* [n98-magerun](https://github.com/netz98/n98-magerun)
* [modman](https://github.com/colinmollenhour/modman)

