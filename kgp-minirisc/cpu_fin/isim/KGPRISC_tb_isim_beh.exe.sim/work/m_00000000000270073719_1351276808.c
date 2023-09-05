/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/COA_LAB/assignment_6/src_final/control_unit.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {324U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {9540U, 0U};
static unsigned int ng5[] = {580U, 0U};
static unsigned int ng6[] = {836U, 0U};
static unsigned int ng7[] = {2U, 0U};
static unsigned int ng8[] = {2756U, 0U};
static unsigned int ng9[] = {2244U, 0U};
static unsigned int ng10[] = {2628U, 0U};
static unsigned int ng11[] = {3U, 0U};
static unsigned int ng12[] = {2116U, 0U};
static unsigned int ng13[] = {4U, 0U};
static unsigned int ng14[] = {2500U, 0U};
static unsigned int ng15[] = {5U, 0U};
static unsigned int ng16[] = {2372U, 0U};
static unsigned int ng17[] = {452U, 0U};
static unsigned int ng18[] = {9668U, 0U};
static unsigned int ng19[] = {5549U, 0U};
static unsigned int ng20[] = {6U, 0U};
static unsigned int ng21[] = {5520U, 0U};
static unsigned int ng22[] = {7U, 0U};
static unsigned int ng23[] = {81920U, 0U};
static unsigned int ng24[] = {8U, 0U};
static unsigned int ng25[] = {9U, 0U};
static unsigned int ng26[] = {10U, 0U};
static unsigned int ng27[] = {49152U, 0U};
static unsigned int ng28[] = {11U, 0U};
static unsigned int ng29[] = {16384U, 0U};
static unsigned int ng30[] = {12U, 0U};
static unsigned int ng31[] = {16390U, 0U};
static unsigned int ng32[] = {13U, 0U};
static unsigned int ng33[] = {14U, 0U};



static void Always_18_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(18, ng0);

LAB5:    xsi_set_current_line(19, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t4, 6);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng20)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng22)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng24)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng25)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng26)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng28)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng30)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng32)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng33)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB35;

LAB36:
LAB38:
LAB37:    xsi_set_current_line(403, ng0);

LAB100:    xsi_set_current_line(415, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 17);

LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(20, ng0);

LAB40:    xsi_set_current_line(21, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);

LAB41:    t7 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 5, t7, 5);
    if (t9 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t8, 5, t2, 5);
    if (t6 == 1)
        goto LAB44;

LAB45:
LAB47:
LAB46:    xsi_set_current_line(50, ng0);

LAB51:    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 17);

LAB48:    goto LAB39;

LAB9:    xsi_set_current_line(66, ng0);

LAB52:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);

LAB53:    t3 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 5, t3, 5);
    if (t9 == 1)
        goto LAB54;

LAB55:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 5, t2, 5);
    if (t6 == 1)
        goto LAB56;

LAB57:
LAB59:
LAB58:    xsi_set_current_line(97, ng0);

LAB63:    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 17);

LAB60:    goto LAB39;

LAB11:    xsi_set_current_line(114, ng0);

LAB64:    xsi_set_current_line(115, ng0);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);

LAB65:    t3 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 5, t3, 5);
    if (t9 == 1)
        goto LAB66;

LAB67:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 5, t2, 5);
    if (t6 == 1)
        goto LAB68;

LAB69:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 5, t2, 5);
    if (t6 == 1)
        goto LAB70;

LAB71:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 5, t2, 5);
    if (t6 == 1)
        goto LAB72;

LAB73:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 5, t2, 5);
    if (t6 == 1)
        goto LAB74;

LAB75:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 5, t2, 5);
    if (t6 == 1)
        goto LAB76;

LAB77:
LAB79:
LAB78:    xsi_set_current_line(206, ng0);

LAB87:    xsi_set_current_line(218, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 17);

LAB80:    goto LAB39;

LAB13:    xsi_set_current_line(223, ng0);

LAB88:    xsi_set_current_line(235, ng0);
    t3 = ((char*)((ng17)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB15:    xsi_set_current_line(238, ng0);

LAB89:    xsi_set_current_line(250, ng0);
    t3 = ((char*)((ng18)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB17:    xsi_set_current_line(253, ng0);

LAB90:    xsi_set_current_line(265, ng0);
    t3 = ((char*)((ng19)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB19:    xsi_set_current_line(268, ng0);

LAB91:    xsi_set_current_line(280, ng0);
    t3 = ((char*)((ng21)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB21:    xsi_set_current_line(283, ng0);

LAB92:    xsi_set_current_line(295, ng0);
    t3 = ((char*)((ng23)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB23:    xsi_set_current_line(298, ng0);

LAB93:    xsi_set_current_line(310, ng0);
    t3 = ((char*)((ng23)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB25:    xsi_set_current_line(313, ng0);

LAB94:    xsi_set_current_line(325, ng0);
    t3 = ((char*)((ng23)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB27:    xsi_set_current_line(328, ng0);

LAB95:    xsi_set_current_line(340, ng0);
    t3 = ((char*)((ng27)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB29:    xsi_set_current_line(343, ng0);

LAB96:    xsi_set_current_line(355, ng0);
    t3 = ((char*)((ng29)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB31:    xsi_set_current_line(358, ng0);

LAB97:    xsi_set_current_line(370, ng0);
    t3 = ((char*)((ng31)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB33:    xsi_set_current_line(373, ng0);

LAB98:    xsi_set_current_line(385, ng0);
    t3 = ((char*)((ng29)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB35:    xsi_set_current_line(388, ng0);

LAB99:    xsi_set_current_line(400, ng0);
    t3 = ((char*)((ng29)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB39;

LAB42:    xsi_set_current_line(22, ng0);

LAB49:    xsi_set_current_line(34, ng0);
    t10 = ((char*)((ng2)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 17);
    goto LAB48;

LAB44:    xsi_set_current_line(36, ng0);

LAB50:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 17);
    goto LAB48;

LAB54:    xsi_set_current_line(68, ng0);

LAB61:    xsi_set_current_line(80, ng0);
    t7 = ((char*)((ng5)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 17);
    goto LAB60;

LAB56:    xsi_set_current_line(82, ng0);

LAB62:    xsi_set_current_line(94, ng0);
    t3 = ((char*)((ng6)));
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 17);
    goto LAB60;

LAB66:    xsi_set_current_line(116, ng0);

LAB81:    xsi_set_current_line(128, ng0);
    t10 = ((char*)((ng8)));
    t11 = (t0 + 1608);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 17);
    goto LAB80;

LAB68:    xsi_set_current_line(131, ng0);

LAB82:    xsi_set_current_line(143, ng0);
    t3 = ((char*)((ng9)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB80;

LAB70:    xsi_set_current_line(146, ng0);

LAB83:    xsi_set_current_line(158, ng0);
    t3 = ((char*)((ng10)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB80;

LAB72:    xsi_set_current_line(161, ng0);

LAB84:    xsi_set_current_line(173, ng0);
    t3 = ((char*)((ng12)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB80;

LAB74:    xsi_set_current_line(176, ng0);

LAB85:    xsi_set_current_line(188, ng0);
    t3 = ((char*)((ng14)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB80;

LAB76:    xsi_set_current_line(191, ng0);

LAB86:    xsi_set_current_line(203, ng0);
    t3 = ((char*)((ng16)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t3, 0, 0, 17);
    goto LAB80;

}


extern void work_m_00000000000270073719_1351276808_init()
{
	static char *pe[] = {(void *)Always_18_0};
	xsi_register_didat("work_m_00000000000270073719_1351276808", "isim/KGPRISC_tb_isim_beh.exe.sim/work/m_00000000000270073719_1351276808.didat");
	xsi_register_executes(pe);
}
