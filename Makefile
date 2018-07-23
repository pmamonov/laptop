all: laptop.png

laptop.png: laptop-assembly.scad
	openscad -o $@ $< --camera=1,1,1,0,0,0 --autocenter --viewall --imgsize=1280,1024

%.dxf: %.scad
	openscad -o $@ $<

clean:
	rm -f *.png *.dxf
