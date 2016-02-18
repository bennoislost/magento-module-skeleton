# Magento Module Skeleton

A snapshot of how a Magento 1.x module should be started.

## Snapshot

To use this as your starting point clone this repository and squash the commit history?

## Extra tooling

Download the following tools for more win.

* [Composer](https://getcomposer.org/)
* [n98-magerun](https://github.com/netz98/n98-magerun)
* [modman](https://github.com/colinmollenhour/modman)


## Usage

### Composer

Install composer dependancies with `composer install`

### Structure

Magento core will be installed to `src/magento`

Using `n98-magerun` you can create a new module form the above directory

### PHPSpec

To avoid Mage-god-class-hell, PHPSpec will create your classes in `src/Magento/lib`

## Roadmap

* Scrutinizer
* BehatMage

