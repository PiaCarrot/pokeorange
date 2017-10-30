Tileset10GFX: ; 0x20be1
INCBIN "gfx/tilesets/10.2bpp.lz"
; 0x213e1

Tileset16GFX: ; 0xb74e8
INCBIN "gfx/tilesets/16.2bpp.lz"
; 0xb79a8

Tileset16Meta: ; 0xb79a8
INCBIN "tilesets/16_metatiles.bin"
; 0xb7da8

Tileset16Coll: ; 0xb7da8
INCLUDE "tilesets/16_collision.asm"
; 0xb7ea8

Tileset04Meta: ; 0xdee90
INCBIN "tilesets/04_metatiles.bin"
; 0xdf690

Tileset04Coll: ; 0xdf690
INCLUDE "tilesets/04_collision.asm"
; 0xdf890

Tileset13GFX: ; 0x1de2c
INCBIN "gfx/tilesets/13.2bpp.lz"
; 0x1e58c

Tileset13Meta: ; 0x1e58c
INCBIN "tilesets/13_metatiles.bin"
; 0x1e98c

Tileset13Coll: ; 0x1e98c
INCLUDE "tilesets/13_collision.asm"
; 0x1ea8c

Tileset32Coll:
INCLUDE "tilesets/32_collision.asm"

Tileset32GFX:
INCBIN "gfx/tilesets/32.2bpp.lz"

Tileset32Meta:
INCBIN "tilesets/32_metatiles.bin"