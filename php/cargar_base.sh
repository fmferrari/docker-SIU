#!/bin/bash
su - postgres -c "/usr/lib/postgresql/9.1/bin/psql -U postgres -c \"DROP DATABASE IF EXISTS guarani_prod\""
su - postgres -c "/usr/lib/postgresql/9.1/bin/psql -U postgres -c \"CREATE DATABASE guarani_prod\""
export PGPASSWORD='postgres'
psql -h localhost -p 5432 -U postgres -f /var/www/proyectos/guarani.sql guarani_prod