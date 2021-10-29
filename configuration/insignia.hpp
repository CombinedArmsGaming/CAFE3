/*

    Insignia framework
    First version by Bubbus, overhauled and improved by Gibbs.

    This file allows you to choose the "insignia mode".

    Advanced Insignia mode:
        This allows more informative "Gibbs" insignia to appear on units.  If the unit role or group name meet certain criteria, special patches will appear.
            * Unit role is considered first - if you are a medic, EOD tech etc, you will receive a medic or EOD patch etc.
            * If the unit does not already have a patch, their team is considered - if your team is named ALPHA, A1 etc, you will receive a team patch.
            * If the unit still does not have a patch, they will receive a generic colour patch by default.

        This mode provides more information on the patch, but be aware that the patch's colour may not always match the team colour on the map.
        The list of team names and unit roles which receive special patches is located in the "insignia/insignia_custom.sqf" file.

    Basic insignia mode (Advanced mode disabled):
        Units will always receive a generic colour patch according to the colour their team leader has chosen.  Leaders receive a special variant of the colour patch.
        These patches can be changed at will by the leader and will always match the team colour on the map.

    Patches can be overridden on a per-unit basis in both of these modes.  Paste the following line into a unit's "init" field in the editor:

        this setVariable ["f_var_insignia", "med"];

    That unit will now have a medic patch by default.  To learn more about creating *custom* patches, see the /res/insignia folder.

*/

// Enables the usage of the Advanced Insignia mode.
// To disable Advanced Insignia mode for all units, comment-out or delete the line below.
//#define ENABLE_ADVANCED_INSIGNIA
