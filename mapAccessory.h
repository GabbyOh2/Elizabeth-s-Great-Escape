
//{{BLOCK(mapAccessory)

//======================================================================
//
//	mapAccessory, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 17 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 544 + 2048 = 3104
//
//	Time-stamp: 2025-11-12, 14:32:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAPACCESSORY_H
#define GRIT_MAPACCESSORY_H

#define mapAccessoryTilesLen 544
extern const unsigned short mapAccessoryTiles[272];

#define mapAccessoryMapLen 2048
extern const unsigned short mapAccessoryMap[1024];

#define mapAccessoryPalLen 512
extern const unsigned short mapAccessoryPal[256];

#endif // GRIT_MAPACCESSORY_H

//}}BLOCK(mapAccessory)
