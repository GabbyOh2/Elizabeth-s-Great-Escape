
//{{BLOCK(temp)

//======================================================================
//
//	temp, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 39 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1248 + 2048 = 3808
//
//	Time-stamp: 2025-11-04, 10:10:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TEMP_H
#define GRIT_TEMP_H

#define tempTilesLen 1248
extern const unsigned short tempTiles[624];

#define tempMapLen 2048
extern const unsigned short tempMap[1024];

#define tempPalLen 512
extern const unsigned short tempPal[256];

#endif // GRIT_TEMP_H

//}}BLOCK(temp)
