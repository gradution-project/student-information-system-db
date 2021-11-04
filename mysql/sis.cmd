@Echo off
flyway -configFiles=conf/local/sis.conf -locations=sis %*
