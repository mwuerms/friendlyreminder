/**
 * Martin Wuerms
 * 2015-11-30
 *
 * color definitions
 * rrggbb name
 * ff0000 red
 * ff0066 piggy pink
 * ff00ff pink
 * 9900ff dark pink
 * 0000ff blue
 * 0099ff light blue
 * ff3300 orange 1
 * ffff00 yellow
 * cc9900 dark yellow
 * 00ff00 green
 * 669900 dark green
 * 66ff33 poison green
 * 00ffff turkis
 */

/* - includes --------------------------------------------------------------- */
#include <avr/io.h>
#include <string.h>
#include "arch.h"
#include "wdtTimer.h"
#include "ledAnimation.h"
#include "ledDriver.h"
#include "fade.h"

/* - defines ---------------------------------------------------------------- */
#define cNB_LEDs            (5)
#define cBRIGHTNESS_0       (0)
#define cBRIGHTNESS_1       (45)
#define cBRIGHTNESS_2       (90)
#define cBRIGHTNESS_STEP    (1)

/*
 * current consumption for trailer backlight
 * Iyellow = 45/255 * 2 (red+green) * 2 (strips) * 7 (LEDs) * 20 mA (full current @ 255)
 *         = ca. 100 mA
 * Ired = 45/255 * 1 (red) * 2 (strips) * 8 (LEDs) * 20 mA (full current @ 255)
 *      = ca. 55 mA
 * Iyellow + Ired < 200 mA
 */

#define mSETCOLOR(red, green, blue, r, g, b)    do { red = r; green = g; blue = b; } while(0)

/* - typedef ---------------------------------------------------------------- */

/* - variables -------------------------------------------------------------- */
static const rgb_color_t colors[] = {
    {.red = 50, .green = 0, .blue = 0},   // 0
    {.red = 50, .green = 0, .blue = 50},  // 1
    {.red = 0, .green = 0, .blue = 50},   // 2
    {.red = 0, .green = 50, .blue = 50},  // 3
    {.red = 0, .green = 50, .blue = 0},   // 4
    {.red = 50, .green = 50, .blue = 0},  // 5
    {.red = 50, .green = 25, .blue = 0},  // 6
    {.red = 50, .green = 25, .blue = 25}, // 7
    {.red = 0, .green = 25, .blue = 50},  // 8
    {.red = 0, .green = 50, .blue = 25},  // 9
    {.red = 0, .green = 25, .blue = 25},  // 10
    {.red = 25, .green = 50, .blue = 0},  // 11
    {.red = 25, .green = 25, .blue = 50}, // 12
};
#define cNB_COLORS (sizeof(colors)/sizeof(colors[0]))

static rgb_color_t leds1[cNB_LEDs];
static uint8_t leds1_pin;

static uint8_t led_state;//, led_timeout;

static fade_color_t fade_color;
static rgb_color_t current_fade_color;
#define NB_FADE_STEPS   (8)

/* - private functions ------------------------------------------------------ */

/**
 * set all red leds to a given value
 */
static void inline _SetAllRedLEDs(rgb_color_t *l, uint8_t nb, uint8_t value) {
    uint8_t i;
    for(i = 0; i < nb; i++) {
        l[i].red = value;
    }
}

/**
 * set all yellow leds to a given value
 */
static void inline _SetAllYellowLEDs(rgb_color_t *l, uint8_t nb, uint8_t value) {
    uint8_t i;
    for(i = 0; i < nb; i++) {
        l[i].red = value;
        l[i].green = value;
    }
}

/**
 * set all leds to a given color
 */
static void inline _SetAllLEDsColor(rgb_color_t *l, uint8_t nb, rgb_color_t *col) {
    uint8_t i;
    for(i = 0; i < nb; i++) {
        l[i].red = col->red;
        l[i].green = col->green;
        l[i].green = col->blue;
    }
}

static inline uint8_t _inc(uint8_t value, uint8_t max) {
    if(value < max)
        return(value+1);
    return(0);
}

/* - public functions ------------------------------------------------------- */

/**
 * initialize
 */
void ledAnimation_Init(void) {
    led_state = 0;
    //memset(leds1, 0, sizeof(leds1));

    leds1_pin = _BV(2);
    _SetAllLEDsColor(leds1, cNB_LEDs, &colors[0]);
    ledDriver_Set(leds1, cNB_LEDs, leds1_pin);

    fade_Start(&colors[0], &colors[1], &fade_color, NB_FADE_STEPS);
    //ledAnimation_Update();
}

/**
 * process the leds
 */
void ledAnimation_Update(void) {
    static uint8_t fade_col_index_0 = 0;
    static uint8_t fade_col_index_1 = 1;
    uint8_t fade_res;

    fade_res = fade_Next(&fade_color);
    fade_GetCurrentColor(&fade_color, &current_fade_color);
    _SetAllLEDsColor(leds1, cNB_LEDs, &current_fade_color);
    ledDriver_Set(leds1, cNB_LEDs, leds1_pin);

    if(fade_res == 0) {
        // done, next color
        fade_col_index_0 = fade_col_index_1;
        fade_col_index_1 = _inc(fade_col_index_1, (cNB_COLORS - 1));
        fade_Start(&colors[fade_col_index_0], &colors[fade_col_index_1], &fade_color, NB_FADE_STEPS);
    }
}
