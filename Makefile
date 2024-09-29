.PHONY: all
all: bosim

bosim: main.ml
	ocamlopt -o bosim main.ml

.PHONY: install
install: bosim
	install -m 755 bosim /usr/local/bin/

.PHONY: uninstall
uninstall:
	$(RM) /usr/local/bin/bosim

.PHONY: clean
clean:
	$(RM) *.cmi *.cmo *.cmx *.o bosim
