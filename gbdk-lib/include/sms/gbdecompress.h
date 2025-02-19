/** @file gb/gbdecompress.h
    
    GB-Compress decompressor
    Compatible with the compression used in GBTD
*/

#ifndef __GBDECOMPRESS_H_INCLUDE
#define __GBDECOMPRESS_H_INCLUDE

#include <stdint.h>

/** gb-decompress data from sour into dest

    @param sour   Pointer to source gb-compressed data
    @param dest   Pointer to destination buffer/address

    @see gb_decompress_bkg_data, gb_decompress_win_data, gb_decompress_sprite_data
 */
uint16_t gb_decompress(const uint8_t * sour, uint8_t * dest) __z88dk_callee __preserves_regs(b, c);

#endif