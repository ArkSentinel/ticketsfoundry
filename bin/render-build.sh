#!/usr/bin/env bash
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean
bin/rails db:migrate

# ESTA ES LA LÍNEA QUE NECESITAS:
bin/rails db:seed