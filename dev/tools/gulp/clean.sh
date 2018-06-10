#! /bin/sh

rm -R pub/static/*

php bin/magento cache:clean
