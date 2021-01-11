#!/bin/bash

set -ex

sudo mkdir -p jenkins
sudo mkdir -p jenkins2
sudo mkdir -p sonarqube/{data,extensions,logs,temp}
sudo mkdir -p pgsql/data
sudo chown -R 999:999 sonarqube/
sudo chown -R root:root pgsql/
sudo chown -R 1000:1000 jenkins/ jenkins2

