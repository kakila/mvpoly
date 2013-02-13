# Makefile for octave package

VER   = 0.90
BUILD = mvpoly-$(VER)
PKG   = $(BUILD).tar.gz

$(BUILD) :
	mkdir -p $(BUILD)
	cp -r ../m/* $(BUILD)/
	cp doc/* $(BUILD)/
	sh ../changelog.sh > $(BUILD)/ChangeLog

source : $(BUILD)

$(PKG) : $(BUILD)
	tar -zcvf $(PKG) $(BUILD)

package : $(PKG)

clean :
	rm -rf mvpoly-$(VER)
	rm -f $(PKG)