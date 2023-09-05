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
static const char *ng0 = "D:/COA_LAB/assignment_6/src/branch_jmp.v";
static unsigned int ng1[] = {9U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {10U, 0U};
static unsigned int ng5[] = {11U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {7U, 0U};
static unsigned int ng8[] = {12U, 0U};
static unsigned int ng9[] = {13U, 0U};
static unsigned int ng10[] = {14U, 0U};



static void Always_22_0(char *t0)
{
    char t9[8];
    char t20[8];
    char t29[8];
    char t37[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    char *t76;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(22, ng0);

LAB5:    xsi_set_current_line(23, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t4, 6);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB21;

LAB22:
LAB24:
LAB23:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(24, ng0);

LAB26:    xsi_set_current_line(25, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t8 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t7) != 0)
        goto LAB29;

LAB30:    t16 = (t9 + 4);
    t17 = *((unsigned int *)t9);
    t18 = *((unsigned int *)t16);
    t19 = (t17 || t18);
    if (t19 > 0)
        goto LAB31;

LAB32:    memcpy(t37, t9, 8);

LAB33:    t69 = (t37 + 4);
    t70 = *((unsigned int *)t69);
    t71 = (~(t70));
    t72 = *((unsigned int *)t37);
    t73 = (t72 & t71);
    t74 = (t73 != 0);
    if (t74 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(28, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB47:    goto LAB25;

LAB9:    xsi_set_current_line(30, ng0);

LAB48:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t4 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t4);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB52;

LAB50:    if (*((unsigned int *)t3) == 0)
        goto LAB49;

LAB51:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB52:    memset(t20, 0, 8);
    t8 = (t9 + 4);
    t17 = *((unsigned int *)t8);
    t18 = (~(t17));
    t19 = *((unsigned int *)t9);
    t23 = (t19 & t18);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t8) != 0)
        goto LAB55;

LAB56:    t16 = (t20 + 4);
    t25 = *((unsigned int *)t20);
    t26 = *((unsigned int *)t16);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB57;

LAB58:    memcpy(t37, t20, 8);

LAB59:    t51 = (t37 + 4);
    t70 = *((unsigned int *)t51);
    t71 = (~(t70));
    t72 = *((unsigned int *)t37);
    t73 = (t72 & t71);
    t74 = (t73 != 0);
    if (t74 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB69:    goto LAB25;

LAB11:    xsi_set_current_line(36, ng0);

LAB70:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t4 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t4);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB74;

LAB72:    if (*((unsigned int *)t3) == 0)
        goto LAB71;

LAB73:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB74:    t8 = (t9 + 4);
    t17 = *((unsigned int *)t8);
    t18 = (~(t17));
    t19 = *((unsigned int *)t9);
    t23 = (t19 & t18);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB75;

LAB76:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB77:    goto LAB25;

LAB13:    xsi_set_current_line(42, ng0);

LAB78:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB25;

LAB15:    xsi_set_current_line(45, ng0);

LAB79:    xsi_set_current_line(46, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB25;

LAB17:    xsi_set_current_line(48, ng0);

LAB80:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB25;

LAB19:    xsi_set_current_line(51, ng0);

LAB81:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t4);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB82;

LAB83:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB84:    goto LAB25;

LAB21:    xsi_set_current_line(57, ng0);

LAB85:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t4 + 4);
    t10 = *((unsigned int *)t3);
    t11 = (~(t10));
    t12 = *((unsigned int *)t4);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB89;

LAB87:    if (*((unsigned int *)t3) == 0)
        goto LAB86;

LAB88:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB89:    t8 = (t9 + 4);
    t17 = *((unsigned int *)t8);
    t18 = (~(t17));
    t19 = *((unsigned int *)t9);
    t23 = (t19 & t18);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB90;

LAB91:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB92:    goto LAB25;

LAB27:    *((unsigned int *)t9) = 1;
    goto LAB30;

LAB29:    t15 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB30;

LAB31:    t21 = (t0 + 1528U);
    t22 = *((char **)t21);
    memset(t20, 0, 8);
    t21 = (t22 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t22);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB37;

LAB35:    if (*((unsigned int *)t21) == 0)
        goto LAB34;

LAB36:    t28 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t28) = 1;

LAB37:    memset(t29, 0, 8);
    t30 = (t20 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t20);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t30) != 0)
        goto LAB40;

LAB41:    t38 = *((unsigned int *)t9);
    t39 = *((unsigned int *)t29);
    t40 = (t38 & t39);
    *((unsigned int *)t37) = t40;
    t41 = (t9 + 4);
    t42 = (t29 + 4);
    t43 = (t37 + 4);
    t44 = *((unsigned int *)t41);
    t45 = *((unsigned int *)t42);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t47 = *((unsigned int *)t43);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB42;

LAB43:
LAB44:    goto LAB33;

LAB34:    *((unsigned int *)t20) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t29) = 1;
    goto LAB41;

LAB40:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB41;

LAB42:    t49 = *((unsigned int *)t37);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t49 | t50);
    t51 = (t9 + 4);
    t52 = (t29 + 4);
    t53 = *((unsigned int *)t9);
    t54 = (~(t53));
    t55 = *((unsigned int *)t51);
    t56 = (~(t55));
    t57 = *((unsigned int *)t29);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (~(t59));
    t61 = (t54 & t56);
    t62 = (t58 & t60);
    t63 = (~(t61));
    t64 = (~(t62));
    t65 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t65 & t63);
    t66 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t66 & t64);
    t67 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t67 & t63);
    t68 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t68 & t64);
    goto LAB44;

LAB45:    xsi_set_current_line(26, ng0);
    t75 = ((char*)((ng2)));
    t76 = (t0 + 1928);
    xsi_vlogvar_assign_value(t76, t75, 0, 0, 1);
    goto LAB47;

LAB49:    *((unsigned int *)t9) = 1;
    goto LAB52;

LAB53:    *((unsigned int *)t20) = 1;
    goto LAB56;

LAB55:    t15 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB56;

LAB57:    t21 = (t0 + 1528U);
    t22 = *((char **)t21);
    memset(t29, 0, 8);
    t21 = (t22 + 4);
    t31 = *((unsigned int *)t21);
    t32 = (~(t31));
    t33 = *((unsigned int *)t22);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t21) != 0)
        goto LAB62;

LAB63:    t38 = *((unsigned int *)t20);
    t39 = *((unsigned int *)t29);
    t40 = (t38 & t39);
    *((unsigned int *)t37) = t40;
    t30 = (t20 + 4);
    t36 = (t29 + 4);
    t41 = (t37 + 4);
    t44 = *((unsigned int *)t30);
    t45 = *((unsigned int *)t36);
    t46 = (t44 | t45);
    *((unsigned int *)t41) = t46;
    t47 = *((unsigned int *)t41);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB64;

LAB65:
LAB66:    goto LAB59;

LAB60:    *((unsigned int *)t29) = 1;
    goto LAB63;

LAB62:    t28 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB63;

LAB64:    t49 = *((unsigned int *)t37);
    t50 = *((unsigned int *)t41);
    *((unsigned int *)t37) = (t49 | t50);
    t42 = (t20 + 4);
    t43 = (t29 + 4);
    t53 = *((unsigned int *)t20);
    t54 = (~(t53));
    t55 = *((unsigned int *)t42);
    t56 = (~(t55));
    t57 = *((unsigned int *)t29);
    t58 = (~(t57));
    t59 = *((unsigned int *)t43);
    t60 = (~(t59));
    t61 = (t54 & t56);
    t62 = (t58 & t60);
    t63 = (~(t61));
    t64 = (~(t62));
    t65 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t65 & t63);
    t66 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t66 & t64);
    t67 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t67 & t63);
    t68 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t68 & t64);
    goto LAB66;

LAB67:    xsi_set_current_line(32, ng0);
    t52 = ((char*)((ng2)));
    t69 = (t0 + 1928);
    xsi_vlogvar_assign_value(t69, t52, 0, 0, 1);
    goto LAB69;

LAB71:    *((unsigned int *)t9) = 1;
    goto LAB74;

LAB75:    xsi_set_current_line(38, ng0);
    t15 = ((char*)((ng2)));
    t16 = (t0 + 1928);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 1);
    goto LAB77;

LAB82:    xsi_set_current_line(53, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 1928);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 1);
    goto LAB84;

LAB86:    *((unsigned int *)t9) = 1;
    goto LAB89;

LAB90:    xsi_set_current_line(59, ng0);
    t15 = ((char*)((ng2)));
    t16 = (t0 + 1928);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 1);
    goto LAB92;

}


extern void work_m_00000000003230382777_2868333798_init()
{
	static char *pe[] = {(void *)Always_22_0};
	xsi_register_didat("work_m_00000000003230382777_2868333798", "isim/main_isim_beh.exe.sim/work/m_00000000003230382777_2868333798.didat");
	xsi_register_executes(pe);
}
