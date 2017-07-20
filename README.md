# osq
osquery fleet management suite
**work in progress, not suitable for production**

## short,compliated and unhelpfull description

```
[osquery clients] -> [osqonnector]
                         \    \
                          \  [db] <- [osqmanager]
                        [redis] -> [osqprocessor] -> [redis] -> [ES+Kibana]
```

This repo contains the following submodules:
* `osqmanager` - django based admin panel to easily manage database
* `osqonnector` - bottle.py based application providing webservices for osquery clients
* `osqprocessor` - osquery messages processor with pluggable workers

and stuff like:
* haproxy container configuration
* redis container configuration
* utils for testing and development

## slowstart (dockerized)

1. clone this repo with submodules: `git clone --recursive https://github.com/srozb/osq.git`
2. generate tls certificates and deploy it to your osquery clients (`haproxy/gen-certs.sh` might help)
3. generate enrollment secret and flagfile and deploy it to your clients
4. run haproxy container (or any other LB/reverse proxy)
5. run DB (like postgresql or sqlite)
6. run redis container
7. configure database backend in django `settings.py` and make sure it works for your DB
8. make django migrations `./manage.py makemigrations && ./manage.py migrate`
9. install default dataset with `./manage.py install`
10. run `osqmanager` container
11. run `osqonnector` container and make sure it uses the same database as `osqmanager`
12. you may also create some tags and tag assignment rules to auto-assign new clients (in osqmanager admin panel)
13. configure and run `osqprocessor`
14. inspect all the logs for errors
15. deploy osquery to your clients (consult osquery configuration for more info)
