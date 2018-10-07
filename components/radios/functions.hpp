class radios
{
#ifdef RADIO_ACRE
    file = "components\radios\acre2";
    class giveSideRadio{};
    class setupRadioPresets{};
    class giveRadioAction{};
#endif
#ifdef RADIO_TFR
    file = "components\radios\tfr";
    class addRadios{};
    class configureSpectatorChat{};
    class removeRadios{};
    class serverRadioInit{};
    class setRadioFrequencies{};
#endif
    class radioInit{};
    class clientRadioInit{};
};
