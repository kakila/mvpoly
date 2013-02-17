all : 
	cd src ; $(MAKE) all ; cd ..

install :
	cd src ; $(MAKE) install ; cd ..

clean :
	cd src ; $(MAKE) clean ; cd ..

config-clean veryclean spotless : clean
	$(RM) config.log config.status
	rm -rf autom4te.cache