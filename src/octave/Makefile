# Makefile for octave package

NAME = mvpoly
VER  = 0.90
PKG  = $(NAME)-$(VER).tar.gz

source : $(NAME)

$(NAME) :
	mkdir -p $(NAME)/inst
	cp -r ../m/* $(NAME)/inst
	cp doc/* $(NAME)/
	sh ../changelog.sh > $(NAME)/ChangeLog

install : $(PKG)
	octave --eval "pkg install $(PKG)"

uninstall : $(PKG)
	octave --eval "pkg uninstall $(NAME)"

$(PKG) : $(NAME)
	tar -zcvf $(PKG) $(NAME)

package : $(PKG)

clean :
	rm -rf $(NAME)/
	rm -f $(PKG)
