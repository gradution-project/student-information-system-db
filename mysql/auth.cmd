@Echo off
flyway -configFiles=conf/auth.conf -locations=auth %*
