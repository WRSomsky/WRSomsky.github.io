what:;  @echo "make what? (srv)"
.PHONY: what srv

srv:;	hugo server \
	  --buildDrafts \
	  --buildFuture \
	  --noHTTPCache \
	  --disableFastRender \
	  --cleanDestinationDir

#?	  --navigateToChanged \

