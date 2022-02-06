NAME = tau-logos
XML = backgrounds/desktop-backgrounds-fedora.xml

all: bootloader/fedora.icns

VERSION := $(shell awk '/Version:/ { print $$2 }' $(NAME).spec)
TAG=$(NAME)-$(VERSION)

bootloader/fedora.icns: pixmaps/fedora-logo-small.png
	png2icns bootloader/fedora.icns pixmaps/fedora-logo-small.png

tag:
	@git tag -a -f -m "Tag as $(TAG)" -f $(TAG)
	@echo "Tagged as $(TAG)"

archive: tag
	@git archive --format=tar --prefix=$(NAME)-$(VERSION)/ HEAD > $(TAG).tar
	@gzip -f $(TAG).tar
	@echo "$(TAG).tar.gz created" 
	@sha1sum $(TAG).tar.gz > $(TAG).sha1sum

clean:
	rm -f *~ *bz2 bootloader/fedora.icns
