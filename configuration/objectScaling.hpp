
/*

    Enables in-framework object scaling support.
    This allows you to assign a scale factor to objects in the mission editor.

    To use this feature, make sure the option ENABLE_SCALE_SUPPORT is enabled below.

    To scale an object, select any object in the editor and set its name to:

        'scale_1p0'  for 1.0x
        'scale_2p0'  for 2.0x
        'scale_2p5'  for 2.5x
        'scale_10p0' for 10x
        'scale_0p5'  for 0.5x

    The scale persists when you move the object around and the scale is automatically applied in-game.
    You can safely copy and paste these objects without disrupting the scale factor. 'scale_2p0_1' is valid and will result in a 2.0x scale.

    It is recommended to leave this feature disabled until it is needed, as it causes a performance penalty at mission start-time.

*/




// To disable object scaling support, comment-out or delete the line below.
// #define ENABLE_SCALE_SUPPORT
