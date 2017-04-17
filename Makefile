.PHONY: CURRENT_VERSION now
GITBUCKET_RELEASE := $(shell wget -q --max-redirect=1 -S -O - https://github.com/takezoe/gitbucket/releases/latest 2>&1 | grep -e 'Location: ' | grep -o "http.*" | grep "tag")
GITBUCKET_VERSION := $(shell echo $(GITBUCKET_RELEASE) | sed -e "s!^http.*/tag/!!")
DOWNLOAD_URL := https://github.com/takezoe/gitbucket/releases/download/$(GITBUCKET_VERSION)/gitbucket.war
$(info GITBUCKET_RELEASE $(GITBUCKET_RELEASE))
$(info GITBUCKET_VERSION $(GITBUCKET_VERSION))
$(info DOWNLOAD_URL $(DOWNLOAD_URL))
PLUGIN_GITBUCKET-GIST := https://github.com/takezoe/gitbucket-gist-plugin/releases/

all: CURRENT_VERSION Dockerfile commit push

now:
	rm -f now
	echo $(GITBUCKET_VERSION) > now

CURRENT_VERSION: now
	if ! grep -q `cat now` CURRENT_VERSION; then cp $< $@; make clean; fi
	rm -f now

Dockerfile: Dockerfile.in
	echo ${GITBUCKET_VERSION}
	sed -e "s!@GITBUCKET_RELEASE@!${GITBUCKET_RELEASE}!g" \
        -e "s!@GITBUCKET_VERSION@!${GITBUCKET_VERSION}!g" \
        -e "s!@DOWNLOAD_URL@!${DOWNLOAD_URL}!g" $< > $@

commit: Dockerfile
	git add $<
	git commit -a -m "Gitbucket version: ${GITBUCKET_VERSION}"
	git tag ${GITBUCKET_VERSION}

push:
	git pull --all
	git push --all
	git push --tags

clean:
	rm -f Dockerfile now
