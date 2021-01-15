AR=ar
DEBPKG=dbus-introspect_1.0.0_all.deb
RM=rm -fr
TAR=tar
TARFLAGS=--group root --owner root -ch

all: $(DEBPKG)

clean:
	$(RM) $(DEBPKG)

control.tar.xz: control md5sums
	$(TAR) $(TARFLAGS) -f - $^ | xz -cez9 - > $@ && $(RM) md5sums

data.tar.xz:
	$(TAR) $(TARFLAGS) -f - $(shell for name in `ls`; do test -d $$name && echo $$name; done | xargs) | xz -cez9 - > $@

debian-binary:
	@echo 2.0 > $@

md5sums:
	find . -type f | grep -v -e '/\.' | while read name; do echo $$name | cut -d'/' -f2- | grep '/' > /dev/null && echo $$name; done | xargs md5sum > $@

.PHONY: clean

$(DEBPKG): control.tar.xz data.tar.xz debian-binary
	$(AR) cr $@ $^ && $(RM) $^
