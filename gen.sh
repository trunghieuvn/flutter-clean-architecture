#!/bin/bash
set -e

flutter packages pub run build_runner build --delete-conflicting-outputs

echo "Build Data Done !!!"