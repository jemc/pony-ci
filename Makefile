
all: pipelines
.PHONY: pipelines deploy

pipelines: pony-packages.yml

pony-packages.yml: pony-packages.erb.yml
	erb pony-packages.erb.yml > pony-packages.yml

deploy: pipelines
	fly sp -t ci.ilvain.com -c pony-packages.yml -p pony-packages -n
