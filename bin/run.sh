#!/usr/bin/env bash

mix ecto.create   # create database
mix ecto.migrate  # migrate database
mix escript.build # create application executable

./blitz_bot  # run application script
