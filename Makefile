
all: pipelines
.PHONY: pipelines deploy

pipelines: pony-packages.yml

pony-packages.yml: pony-packages.erb.yml
	erb pony-packages.erb.yml > pony-packages.yml

deploy: pipelines
	fly sp -t ci.ilvain.com -p pony-packages -c pony-packages.yml -n
	fly up -t ci.ilvain.com -p pony-packages
	fly ep -t ci.ilvain.com -p pony-packages
