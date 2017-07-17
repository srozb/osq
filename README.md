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

## slowstart

1. clone this repo with submodules: `git clone --recursive https://github.com/srozb/osq.git`
1. generate tls certificates and deploy it to your osquery clients (`haproxy/gen-certs.sh` might help)
2. generate enrollment secret and flagfile and deploy it to your clients
3. run haproxy (or nginx) and osqmanager docker containers
4. run DB (like postgresql or sqlite)
5. configure database backend in django `settings.py` and make sure it works for your DB
6. make django migrations
8. install default dataset with `./manage.py install`
7. run `osqonnector` container and make sure it uses the same database as `osqmanager`
8. create `default` bussiness unit in your database using `osqmanager`
9. create `default` config template using osqmanager
10. you may also create some tags and tag assignment rules to auto-assign new clients
11. configure and run `osqprocessor`
12. inspect all the logs for errors
13. deploy osquery to your clients (consult osquery configuration for more info)
