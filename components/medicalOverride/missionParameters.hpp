#include "medicalDefaults.hpp"

class ace_medical_level
{
    title = "Medical Level";
    ACE_setting = 1;
    values[] = {1, 2};
    texts[] =  {"Basic", "Advanced"};
    default = ACE_MEDICAL_LEVEL;
};

class ace_medical_paincoefficient
{
    title = "Pain coefficient";
    ACE_setting = 1;
    values[] = {0, 0.1, 0.25, 0.5, 0.75, 0.9, 1, 1.5, 2};
    texts[] =  {"0", "0.1", "0.25", "0.5", "0.75", "0.9", "1", "1.5", "2"};
    default = ACE_MEDICAL_PAINCOEFFICIENT;
};

class ace_medical_bleedingcoefficient
{
    title = "Bleeding coefficient";
    ACE_setting = 1;
    values[] = {0, 0.1, 0.25, 0.5, 0.75, 0.9, 1, 1.5, 2};
    texts[] =  {"0", "0.1", "0.25", "0.5", "0.75", "0.9", "1", "1.5", "2"};
    default = ACE_MEDICAL_BLEEDINGCOEFFICIENT;
};

class ace_medical_enableunconsciousnessai
{
    title = "Enable AI unconsciousness";
    ACE_setting = 1;
    values[] = {0, 1};
    texts[] =  {"Disabled", "Enabled"};
    default = ACE_MEDICAL_ENABLEUNCONSCIOUSNESSAI;
};

class ace_medical_preventinstadeath
{
    title = "Prevent insta-death";
    ACE_setting = 1;
    values[] = {0, 1};
    texts[] =  {"Disabled", "Enabled"};
    default = ACE_MEDICAL_PREVENTINSTADEATH;
};

class ace_medical_healhitpointafteradvbandage
{
    title = "Heal bandaged hitpoints";
    ACE_setting = 1;
    values[] = {0, 1};
    texts[] =  {"Disabled", "Enabled"};
    default = ACE_MEDICAL_HEALHITPOINTAFTERADVBANDAGE;
};

class ace_medical_enableadvancedwounds
{
    title = "Enable re-opening wounds";
    ACE_setting = 1;
    values[] = {0, 1};
    texts[] =  {"Disabled", "Enabled"};
    default = ACE_MEDICAL_ENABLEADVANCEDWOUNDS;
};

class ace_medical_painisonlysuppressed
{
    title = "Pain is only suppressed";
    ACE_setting = 1;
    values[] = {0, 1};
    texts[] =  {"Disabled", "Enabled"};
    default = ACE_MEDICAL_PAINISONLYSUPPRESSED;
};

class ace_medical_menu_maxrange
{
    title = "Medical menu max-range";
    ACE_setting = 1;
    values[] = {2, 3, 5, 7, 10};
    texts[] =  {"2m", "3m", "5m", "7m", "10m"};
    default = ACE_MEDICAL_MENU_MAXRANGE;
};

class ace_medical_medicsetting_basicepi
{
    title = "Allow Epinephrine (Basic only)";
    ACE_setting = 1;
    values[] = {0, 1, 2};
    texts[] =  {"Anyone", "Medics only", "Doctors only"};
    default = ACE_MEDICAL_MEDICSETTING_BASICEPI;
};

class ace_medical_medicsetting_pak
{
    title = "Allow PAK";
    ACE_setting = 1;
    values[] = {0, 1, 2};
    texts[] =  {"Anyone", "Medics only", "Doctors only"};
    default = ACE_MEDICAL_MEDICSETTING_PAK;
};

class ace_medical_medicsetting_surgicalkit
{
    title = "Allow Surgical Kit (Adv. only)";
    ACE_setting = 1;
    values[] = {0, 1, 2};
    texts[] =  {"Anyone", "Medics only", "Doctors only"};
    default = ACE_MEDICAL_MEDICSETTING_SURGICALKIT;
};

class ace_medical_enablerevive
{
    title = "Enable revive-state";
    ACE_setting = 1;
    values[] = {0, 1};
    texts[] =  {"Disabled", "Enabled"};
    default = ACE_MEDICAL_ENABLEREVIVE;
};

class ace_medical_maxrevivetime
{
    title = "Revive time limit";
    ACE_setting = 1;
    values[] = {10, 30, 45, 60, 90, 120, 180, 300, 600};
    texts[] =  {"10s", "30s", "45s", "60s", "1m 30s", "2m", "3m", "5m", "10m"};
    default = ACE_MEDICAL_MAXREVIVETIME;
};

class ace_medical_amountofrevivelives
{
    title = "Amount of revive-lives";
    ACE_setting = 1;
    values[] = {-1, 1, 2, 3, 5, 7, 10};
    texts[] =  {"Unlimited", "1", "2", "3", "5", "7", "10"};
    default = ACE_MEDICAL_AMOUNTOFREVIVELIVES;
};
