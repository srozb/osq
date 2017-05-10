# osq
osquery fleet management suite

**work in progress, not suitable for production**

This repo contains the following modules:
* `osqmanager` - django based admin panel to easily manage database
* `osqonnector` - bottle.py based application providing webservices for osquery clients
* haproxy container configuration
* utils for testing and development

## quickstart

1. generate tls certificates and deploy it to your osquery clients (`haproxy/gen-certs.sh` might help)
2. generate enrollment secret and flagfile and deploy it to your clients
3. run haproxy and osqmanager docker containers
4. configure database backend in django `settings.py` and make sure it works
5. make django migrations
6. run `osqonnector` container and make sure it uses the same database as `osqmanager`
7. create `default` bussiness unit in your database using `osqmanager`

not that quick after all - to be improved.
