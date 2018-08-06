BOTTOM_DXF :=	bottom-xy_00.dxf bottom-xy_01.dxf \
		bottom-yz_00.dxf bottom-yz_01.dxf bottom-yz_02.dxf

all: laptop.png bottom.dxf

laptop.png: laptop-assembly.scad
	openscad -o $@ $< --camera=1,1,1,0,0,0 --autocenter --viewall --imgsize=1280,1024

bottom.dxf: $(BOTTOM_DXF)
	python ./odmt/odmt/odmt.py -i $(BOTTOM_DXF) -o $@

%.dxf: %.scad
	openscad -o $@ $<

clean:
	rm -f *.png *.dxf
