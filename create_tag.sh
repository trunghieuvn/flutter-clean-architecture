#!/bin/bash

# [envName]_[versionName]_[yyMMddHH]_[versionCode]
# TAG_NAME=uat_1.0.2_23032703_60
VERSION_NAME=2.0.0
VERSION_CODE=3
DATE=230403
TAG_NAME="prod_"$VERSION_NAME"_$DATE_"$VERSION_CODE

git tag $TAG_NAME
git push origin $TAG_NAME

# flutter build apk --build-name=1.0.3 --build-number=581
