what:;  @echo "make what? (srv pub)"
.PHONY: what srv pub

srv:;	hugo server \
	  --buildDrafts \
	  --buildFuture \
	  --noHTTPCache \
	  --disableFastRender \
	  --cleanDestinationDir

pub:;	hugo server \
	  --noHTTPCache \
	  --disableFastRender \
	  --cleanDestinationDir

#?	  --navigateToChanged \

