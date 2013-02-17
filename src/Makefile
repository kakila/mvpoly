BUILD = octave

all : 
	for dir in $(BUILD) ; do cd $$dir ; $(MAKE) all ; cd .. ; done

install :
	for dir in $(BUILD) ; do cd $$dir ; $(MAKE) install ; cd .. ; done

clean :
	for dir in $(BUILD) ; do cd $$dir ; $(MAKE) clean ; cd .. ; done

