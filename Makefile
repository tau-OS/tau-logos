NAME = tau-logos
XML = backgrounds/desktop-backgrounds-fedora.xml

all: bootloader/fedora.icns

bootloader/fedora.icns: pixmaps/fedora-logo-small.png
	png2icns bootloader/fedora.icns pixmaps/fedora-logo-small.png

clean:
	rm -f *~ *bz2 bootloader/fedora.icns
