# Makefile for octave package

NAME = $(PACKAGE_NAME)
VER  = $(PACKAGE_VERSION)
PKG  = $(NAME)-$(VER).tar.gz

default all : package

include ../Common.mk

source : $(NAME)

$(NAME) :
	mkdir -p $(NAME)/inst
	cp -r ../m/* $(NAME)/inst
	cp doc/* $(NAME)/
	sh ../changelog.sh > $(NAME)/ChangeLog

$(PKG) : $(NAME)
	tar -zcvf $(PKG) $(NAME)

package : $(PKG)

install : package
	octave --eval "pkg install $(PKG)"

uninstall :
	octave --eval "pkg uninstall $(NAME)"

clean :
	rm -rf $(NAME)/
	rm -f $(PKG)
