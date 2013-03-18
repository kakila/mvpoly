# Makefile for octave package

NAME = $(PACKAGE_NAME)
VER  = $(PACKAGE_VERSION)
PKG  = $(NAME)-matlab-$(VER).zip

default all : package

include ../Common.mk

source : $(NAME)

$(NAME) :
	mkdir -p $(NAME)/
	cp -r ../m/* $(NAME)/
	cp doc/* $(NAME)/
	sh ../changelog.sh > $(NAME)/ChangeLog

$(PKG) : $(NAME)
	zip -r $(PKG) $(NAME)

package : $(PKG)

install : package
	echo "matlab installation is manual"

uninstall :
	echo "nothing to do"

clean :
	rm -rf $(NAME)/
	rm -f $(PKG)
