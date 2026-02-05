#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean
bin/rails db:migrate
# Opcional: bin/rails db:seed (si quieres que los usuarios se creen solos al subirlo)