#!/bin/sh

ROOT_REPO=https://github.com/theowenyoung/env.git
PRIVATE_REPO=https://github.com/theowenyoung/private.git
git clone $ROOT_REPO ~/env

# clone private 
git clone $PRIVATE_REPO ~/env/private