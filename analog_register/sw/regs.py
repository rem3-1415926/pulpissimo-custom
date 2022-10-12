#!/usr/bin/env python3
# -*- coding: utf-8 -*-

""" Created with Corsair v1.0.2

Control/status register map.
"""


class _RegI_bias_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def power_down(self):
        """Selection of devices to power down"""
        rdata = self._rmap._if.read(self._rmap.I_BIAS_CONTROL_ADDR)
        return (rdata >> self._rmap.I_BIAS_CONTROL_POWER_DOWN_POS) & self._rmap.I_BIAS_CONTROL_POWER_DOWN_MSK

    @power_down.setter
    def power_down(self, val):
        rdata = self._rmap._if.read(self._rmap.I_BIAS_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.I_BIAS_CONTROL_POWER_DOWN_MSK << self._rmap.I_BIAS_CONTROL_POWER_DOWN_POS))
        rdata = rdata | (val << self._rmap.I_BIAS_CONTROL_POWER_DOWN_POS)
        self._rmap._if.write(self._rmap.I_BIAS_CONTROL_ADDR, rdata)


class _RegI_bias_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def source_sel(self):
        """Selection of Vref source"""
        rdata = self._rmap._if.read(self._rmap.I_BIAS_SW_ADDR)
        return (rdata >> self._rmap.I_BIAS_SW_SOURCE_SEL_POS) & self._rmap.I_BIAS_SW_SOURCE_SEL_MSK

    @source_sel.setter
    def source_sel(self, val):
        rdata = self._rmap._if.read(self._rmap.I_BIAS_SW_ADDR)
        rdata = rdata & (~(self._rmap.I_BIAS_SW_SOURCE_SEL_MSK << self._rmap.I_BIAS_SW_SOURCE_SEL_POS))
        rdata = rdata | (val << self._rmap.I_BIAS_SW_SOURCE_SEL_POS)
        self._rmap._if.write(self._rmap.I_BIAS_SW_ADDR, rdata)


class _RegPga1_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def power_down(self):
        """Selection of devices to power down"""
        rdata = self._rmap._if.read(self._rmap.PGA1_CONTROL_ADDR)
        return (rdata >> self._rmap.PGA1_CONTROL_POWER_DOWN_POS) & self._rmap.PGA1_CONTROL_POWER_DOWN_MSK

    @power_down.setter
    def power_down(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_CONTROL_POWER_DOWN_MSK << self._rmap.PGA1_CONTROL_POWER_DOWN_POS))
        rdata = rdata | (val << self._rmap.PGA1_CONTROL_POWER_DOWN_POS)
        self._rmap._if.write(self._rmap.PGA1_CONTROL_ADDR, rdata)


class _RegPga1_int_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def offset_compensation(self):
        """Selection of switches that are to be put into offset compensation mode"""
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA1_INT_SW_OFFSET_COMPENSATION_POS) & self._rmap.PGA1_INT_SW_OFFSET_COMPENSATION_MSK

    @offset_compensation.setter
    def offset_compensation(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_INT_SW_OFFSET_COMPENSATION_MSK << self._rmap.PGA1_INT_SW_OFFSET_COMPENSATION_POS))
        rdata = rdata | (val << self._rmap.PGA1_INT_SW_OFFSET_COMPENSATION_POS)
        self._rmap._if.write(self._rmap.PGA1_INT_SW_ADDR, rdata)

    @property
    def se(self):
        """LNA input connection switch"""
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA1_INT_SW_SE_POS) & self._rmap.PGA1_INT_SW_SE_MSK

    @se.setter
    def se(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_INT_SW_SE_MSK << self._rmap.PGA1_INT_SW_SE_POS))
        rdata = rdata | (val << self._rmap.PGA1_INT_SW_SE_POS)
        self._rmap._if.write(self._rmap.PGA1_INT_SW_ADDR, rdata)

    @property
    def sm(self):
        """diffamp input connection switch"""
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA1_INT_SW_SM_POS) & self._rmap.PGA1_INT_SW_SM_MSK

    @sm.setter
    def sm(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_INT_SW_SM_MSK << self._rmap.PGA1_INT_SW_SM_POS))
        rdata = rdata | (val << self._rmap.PGA1_INT_SW_SM_POS)
        self._rmap._if.write(self._rmap.PGA1_INT_SW_ADDR, rdata)

    @property
    def sc(self):
        """LNA feedback cap switch"""
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA1_INT_SW_SC_POS) & self._rmap.PGA1_INT_SW_SC_MSK

    @sc.setter
    def sc(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_INT_SW_SC_MSK << self._rmap.PGA1_INT_SW_SC_POS))
        rdata = rdata | (val << self._rmap.PGA1_INT_SW_SC_POS)
        self._rmap._if.write(self._rmap.PGA1_INT_SW_ADDR, rdata)


class _RegPga1_tst_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def si(self):
        """SI switches that are connected to testpads"""
        rdata = self._rmap._if.read(self._rmap.PGA1_TST_SW_ADDR)
        return (rdata >> self._rmap.PGA1_TST_SW_SI_POS) & self._rmap.PGA1_TST_SW_SI_MSK

    @si.setter
    def si(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_TST_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_TST_SW_SI_MSK << self._rmap.PGA1_TST_SW_SI_POS))
        rdata = rdata | (val << self._rmap.PGA1_TST_SW_SI_POS)
        self._rmap._if.write(self._rmap.PGA1_TST_SW_ADDR, rdata)

    @property
    def so(self):
        """SO switches that are connected to testpads"""
        rdata = self._rmap._if.read(self._rmap.PGA1_TST_SW_ADDR)
        return (rdata >> self._rmap.PGA1_TST_SW_SO_POS) & self._rmap.PGA1_TST_SW_SO_MSK

    @so.setter
    def so(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_TST_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_TST_SW_SO_MSK << self._rmap.PGA1_TST_SW_SO_POS))
        rdata = rdata | (val << self._rmap.PGA1_TST_SW_SO_POS)
        self._rmap._if.write(self._rmap.PGA1_TST_SW_ADDR, rdata)


class _RegPga1_oc1:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def oc1_p(self):
        """P side"""
        rdata = self._rmap._if.read(self._rmap.PGA1_OC1_ADDR)
        return (rdata >> self._rmap.PGA1_OC1_OC1_P_POS) & self._rmap.PGA1_OC1_OC1_P_MSK

    @oc1_p.setter
    def oc1_p(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_OC1_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_OC1_OC1_P_MSK << self._rmap.PGA1_OC1_OC1_P_POS))
        rdata = rdata | (val << self._rmap.PGA1_OC1_OC1_P_POS)
        self._rmap._if.write(self._rmap.PGA1_OC1_ADDR, rdata)

    @property
    def oc1_n(self):
        """N side"""
        rdata = self._rmap._if.read(self._rmap.PGA1_OC1_ADDR)
        return (rdata >> self._rmap.PGA1_OC1_OC1_N_POS) & self._rmap.PGA1_OC1_OC1_N_MSK

    @oc1_n.setter
    def oc1_n(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_OC1_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_OC1_OC1_N_MSK << self._rmap.PGA1_OC1_OC1_N_POS))
        rdata = rdata | (val << self._rmap.PGA1_OC1_OC1_N_POS)
        self._rmap._if.write(self._rmap.PGA1_OC1_ADDR, rdata)


class _RegPga1_oc2:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def oc1_p(self):
        """P side"""
        rdata = self._rmap._if.read(self._rmap.PGA1_OC2_ADDR)
        return (rdata >> self._rmap.PGA1_OC2_OC1_P_POS) & self._rmap.PGA1_OC2_OC1_P_MSK

    @oc1_p.setter
    def oc1_p(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_OC2_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_OC2_OC1_P_MSK << self._rmap.PGA1_OC2_OC1_P_POS))
        rdata = rdata | (val << self._rmap.PGA1_OC2_OC1_P_POS)
        self._rmap._if.write(self._rmap.PGA1_OC2_ADDR, rdata)

    @property
    def oc1_n(self):
        """N side"""
        rdata = self._rmap._if.read(self._rmap.PGA1_OC2_ADDR)
        return (rdata >> self._rmap.PGA1_OC2_OC1_N_POS) & self._rmap.PGA1_OC2_OC1_N_MSK

    @oc1_n.setter
    def oc1_n(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_OC2_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_OC2_OC1_N_MSK << self._rmap.PGA1_OC2_OC1_N_POS))
        rdata = rdata | (val << self._rmap.PGA1_OC2_OC1_N_POS)
        self._rmap._if.write(self._rmap.PGA1_OC2_ADDR, rdata)


class _RegPga1_gain1:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain; linear between 1 and 128"""
        rdata = self._rmap._if.read(self._rmap.PGA1_GAIN1_ADDR)
        return (rdata >> self._rmap.PGA1_GAIN1_GAIN_POS) & self._rmap.PGA1_GAIN1_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_GAIN1_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_GAIN1_GAIN_MSK << self._rmap.PGA1_GAIN1_GAIN_POS))
        rdata = rdata | (val << self._rmap.PGA1_GAIN1_GAIN_POS)
        self._rmap._if.write(self._rmap.PGA1_GAIN1_ADDR, rdata)


class _RegPga1_gain2_1:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain; linear between 0.5 and 4"""
        rdata = self._rmap._if.read(self._rmap.PGA1_GAIN2_1_ADDR)
        return (rdata >> self._rmap.PGA1_GAIN2_1_GAIN_POS) & self._rmap.PGA1_GAIN2_1_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_GAIN2_1_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_GAIN2_1_GAIN_MSK << self._rmap.PGA1_GAIN2_1_GAIN_POS))
        rdata = rdata | (val << self._rmap.PGA1_GAIN2_1_GAIN_POS)
        self._rmap._if.write(self._rmap.PGA1_GAIN2_1_ADDR, rdata)


class _RegPga1_gain2_2:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain; linear between 0.5 and 3.5"""
        rdata = self._rmap._if.read(self._rmap.PGA1_GAIN2_2_ADDR)
        return (rdata >> self._rmap.PGA1_GAIN2_2_GAIN_POS) & self._rmap.PGA1_GAIN2_2_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA1_GAIN2_2_ADDR)
        rdata = rdata & (~(self._rmap.PGA1_GAIN2_2_GAIN_MSK << self._rmap.PGA1_GAIN2_2_GAIN_POS))
        rdata = rdata | (val << self._rmap.PGA1_GAIN2_2_GAIN_POS)
        self._rmap._if.write(self._rmap.PGA1_GAIN2_2_ADDR, rdata)


class _RegPga2_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def power_down(self):
        """Selection of devices to power down"""
        rdata = self._rmap._if.read(self._rmap.PGA2_CONTROL_ADDR)
        return (rdata >> self._rmap.PGA2_CONTROL_POWER_DOWN_POS) & self._rmap.PGA2_CONTROL_POWER_DOWN_MSK

    @power_down.setter
    def power_down(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_CONTROL_POWER_DOWN_MSK << self._rmap.PGA2_CONTROL_POWER_DOWN_POS))
        rdata = rdata | (val << self._rmap.PGA2_CONTROL_POWER_DOWN_POS)
        self._rmap._if.write(self._rmap.PGA2_CONTROL_ADDR, rdata)


class _RegPga2_int_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def offset_compensation(self):
        """Selection of switches that are to be put into offset compensation mode"""
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA2_INT_SW_OFFSET_COMPENSATION_POS) & self._rmap.PGA2_INT_SW_OFFSET_COMPENSATION_MSK

    @offset_compensation.setter
    def offset_compensation(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_INT_SW_OFFSET_COMPENSATION_MSK << self._rmap.PGA2_INT_SW_OFFSET_COMPENSATION_POS))
        rdata = rdata | (val << self._rmap.PGA2_INT_SW_OFFSET_COMPENSATION_POS)
        self._rmap._if.write(self._rmap.PGA2_INT_SW_ADDR, rdata)

    @property
    def se(self):
        """LNA input connection switch"""
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA2_INT_SW_SE_POS) & self._rmap.PGA2_INT_SW_SE_MSK

    @se.setter
    def se(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_INT_SW_SE_MSK << self._rmap.PGA2_INT_SW_SE_POS))
        rdata = rdata | (val << self._rmap.PGA2_INT_SW_SE_POS)
        self._rmap._if.write(self._rmap.PGA2_INT_SW_ADDR, rdata)

    @property
    def sm(self):
        """diffamp input connection switch"""
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA2_INT_SW_SM_POS) & self._rmap.PGA2_INT_SW_SM_MSK

    @sm.setter
    def sm(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_INT_SW_SM_MSK << self._rmap.PGA2_INT_SW_SM_POS))
        rdata = rdata | (val << self._rmap.PGA2_INT_SW_SM_POS)
        self._rmap._if.write(self._rmap.PGA2_INT_SW_ADDR, rdata)

    @property
    def sc(self):
        """LNA feedback cap switch"""
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        return (rdata >> self._rmap.PGA2_INT_SW_SC_POS) & self._rmap.PGA2_INT_SW_SC_MSK

    @sc.setter
    def sc(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_INT_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_INT_SW_SC_MSK << self._rmap.PGA2_INT_SW_SC_POS))
        rdata = rdata | (val << self._rmap.PGA2_INT_SW_SC_POS)
        self._rmap._if.write(self._rmap.PGA2_INT_SW_ADDR, rdata)


class _RegPga2_tst_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def si(self):
        """SI switches that are connected to testpads"""
        rdata = self._rmap._if.read(self._rmap.PGA2_TST_SW_ADDR)
        return (rdata >> self._rmap.PGA2_TST_SW_SI_POS) & self._rmap.PGA2_TST_SW_SI_MSK

    @si.setter
    def si(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_TST_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_TST_SW_SI_MSK << self._rmap.PGA2_TST_SW_SI_POS))
        rdata = rdata | (val << self._rmap.PGA2_TST_SW_SI_POS)
        self._rmap._if.write(self._rmap.PGA2_TST_SW_ADDR, rdata)

    @property
    def so(self):
        """SO switches that are connected to testpads"""
        rdata = self._rmap._if.read(self._rmap.PGA2_TST_SW_ADDR)
        return (rdata >> self._rmap.PGA2_TST_SW_SO_POS) & self._rmap.PGA2_TST_SW_SO_MSK

    @so.setter
    def so(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_TST_SW_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_TST_SW_SO_MSK << self._rmap.PGA2_TST_SW_SO_POS))
        rdata = rdata | (val << self._rmap.PGA2_TST_SW_SO_POS)
        self._rmap._if.write(self._rmap.PGA2_TST_SW_ADDR, rdata)


class _RegPga2_oc1:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def oc1_p(self):
        """P side"""
        rdata = self._rmap._if.read(self._rmap.PGA2_OC1_ADDR)
        return (rdata >> self._rmap.PGA2_OC1_OC1_P_POS) & self._rmap.PGA2_OC1_OC1_P_MSK

    @oc1_p.setter
    def oc1_p(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_OC1_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_OC1_OC1_P_MSK << self._rmap.PGA2_OC1_OC1_P_POS))
        rdata = rdata | (val << self._rmap.PGA2_OC1_OC1_P_POS)
        self._rmap._if.write(self._rmap.PGA2_OC1_ADDR, rdata)

    @property
    def oc1_n(self):
        """N side"""
        rdata = self._rmap._if.read(self._rmap.PGA2_OC1_ADDR)
        return (rdata >> self._rmap.PGA2_OC1_OC1_N_POS) & self._rmap.PGA2_OC1_OC1_N_MSK

    @oc1_n.setter
    def oc1_n(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_OC1_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_OC1_OC1_N_MSK << self._rmap.PGA2_OC1_OC1_N_POS))
        rdata = rdata | (val << self._rmap.PGA2_OC1_OC1_N_POS)
        self._rmap._if.write(self._rmap.PGA2_OC1_ADDR, rdata)


class _RegPga2_oc2:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def oc1_p(self):
        """P side"""
        rdata = self._rmap._if.read(self._rmap.PGA2_OC2_ADDR)
        return (rdata >> self._rmap.PGA2_OC2_OC1_P_POS) & self._rmap.PGA2_OC2_OC1_P_MSK

    @oc1_p.setter
    def oc1_p(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_OC2_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_OC2_OC1_P_MSK << self._rmap.PGA2_OC2_OC1_P_POS))
        rdata = rdata | (val << self._rmap.PGA2_OC2_OC1_P_POS)
        self._rmap._if.write(self._rmap.PGA2_OC2_ADDR, rdata)

    @property
    def oc1_n(self):
        """N side"""
        rdata = self._rmap._if.read(self._rmap.PGA2_OC2_ADDR)
        return (rdata >> self._rmap.PGA2_OC2_OC1_N_POS) & self._rmap.PGA2_OC2_OC1_N_MSK

    @oc1_n.setter
    def oc1_n(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_OC2_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_OC2_OC1_N_MSK << self._rmap.PGA2_OC2_OC1_N_POS))
        rdata = rdata | (val << self._rmap.PGA2_OC2_OC1_N_POS)
        self._rmap._if.write(self._rmap.PGA2_OC2_ADDR, rdata)


class _RegPga2_gain1:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain; linear between 1 and 128"""
        rdata = self._rmap._if.read(self._rmap.PGA2_GAIN1_ADDR)
        return (rdata >> self._rmap.PGA2_GAIN1_GAIN_POS) & self._rmap.PGA2_GAIN1_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_GAIN1_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_GAIN1_GAIN_MSK << self._rmap.PGA2_GAIN1_GAIN_POS))
        rdata = rdata | (val << self._rmap.PGA2_GAIN1_GAIN_POS)
        self._rmap._if.write(self._rmap.PGA2_GAIN1_ADDR, rdata)


class _RegPga2_gain2_1:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain; linear between 0.5 and 3.5"""
        rdata = self._rmap._if.read(self._rmap.PGA2_GAIN2_1_ADDR)
        return (rdata >> self._rmap.PGA2_GAIN2_1_GAIN_POS) & self._rmap.PGA2_GAIN2_1_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_GAIN2_1_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_GAIN2_1_GAIN_MSK << self._rmap.PGA2_GAIN2_1_GAIN_POS))
        rdata = rdata | (val << self._rmap.PGA2_GAIN2_1_GAIN_POS)
        self._rmap._if.write(self._rmap.PGA2_GAIN2_1_ADDR, rdata)


class _RegPga2_gain2_2:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain; linear between 0.5 and 3.5"""
        rdata = self._rmap._if.read(self._rmap.PGA2_GAIN2_2_ADDR)
        return (rdata >> self._rmap.PGA2_GAIN2_2_GAIN_POS) & self._rmap.PGA2_GAIN2_2_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.PGA2_GAIN2_2_ADDR)
        rdata = rdata & (~(self._rmap.PGA2_GAIN2_2_GAIN_MSK << self._rmap.PGA2_GAIN2_2_GAIN_POS))
        rdata = rdata | (val << self._rmap.PGA2_GAIN2_2_GAIN_POS)
        self._rmap._if.write(self._rmap.PGA2_GAIN2_2_ADDR, rdata)


class _RegTi_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def pd(self):
        """power_down"""
        rdata = self._rmap._if.read(self._rmap.TI_CONTROL_ADDR)
        return (rdata >> self._rmap.TI_CONTROL_PD_POS) & self._rmap.TI_CONTROL_PD_MSK

    @pd.setter
    def pd(self, val):
        rdata = self._rmap._if.read(self._rmap.TI_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.TI_CONTROL_PD_MSK << self._rmap.TI_CONTROL_PD_POS))
        rdata = rdata | (val << self._rmap.TI_CONTROL_PD_POS)
        self._rmap._if.write(self._rmap.TI_CONTROL_ADDR, rdata)


class _RegTi_gain:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def res(self):
        """resistor selection"""
        rdata = self._rmap._if.read(self._rmap.TI_GAIN_ADDR)
        return (rdata >> self._rmap.TI_GAIN_RES_POS) & self._rmap.TI_GAIN_RES_MSK

    @res.setter
    def res(self, val):
        rdata = self._rmap._if.read(self._rmap.TI_GAIN_ADDR)
        rdata = rdata & (~(self._rmap.TI_GAIN_RES_MSK << self._rmap.TI_GAIN_RES_POS))
        rdata = rdata | (val << self._rmap.TI_GAIN_RES_POS)
        self._rmap._if.write(self._rmap.TI_GAIN_ADDR, rdata)


class _RegTi_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def tp_switch(self):
        """testpad on/off"""
        rdata = self._rmap._if.read(self._rmap.TI_SW_ADDR)
        return (rdata >> self._rmap.TI_SW_TP_SWITCH_POS) & self._rmap.TI_SW_TP_SWITCH_MSK

    @tp_switch.setter
    def tp_switch(self, val):
        rdata = self._rmap._if.read(self._rmap.TI_SW_ADDR)
        rdata = rdata & (~(self._rmap.TI_SW_TP_SWITCH_MSK << self._rmap.TI_SW_TP_SWITCH_POS))
        rdata = rdata | (val << self._rmap.TI_SW_TP_SWITCH_POS)
        self._rmap._if.write(self._rmap.TI_SW_ADDR, rdata)


class _RegAdc1_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def en(self):
        """enable"""
        rdata = self._rmap._if.read(self._rmap.ADC1_CONTROL_ADDR)
        return (rdata >> self._rmap.ADC1_CONTROL_EN_POS) & self._rmap.ADC1_CONTROL_EN_MSK

    @en.setter
    def en(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC1_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.ADC1_CONTROL_EN_MSK << self._rmap.ADC1_CONTROL_EN_POS))
        rdata = rdata | (val << self._rmap.ADC1_CONTROL_EN_POS)
        self._rmap._if.write(self._rmap.ADC1_CONTROL_ADDR, rdata)

    @property
    def holdtype(self):
        """hold type"""
        rdata = self._rmap._if.read(self._rmap.ADC1_CONTROL_ADDR)
        return (rdata >> self._rmap.ADC1_CONTROL_HOLDTYPE_POS) & self._rmap.ADC1_CONTROL_HOLDTYPE_MSK

    @holdtype.setter
    def holdtype(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC1_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.ADC1_CONTROL_HOLDTYPE_MSK << self._rmap.ADC1_CONTROL_HOLDTYPE_POS))
        rdata = rdata | (val << self._rmap.ADC1_CONTROL_HOLDTYPE_POS)
        self._rmap._if.write(self._rmap.ADC1_CONTROL_ADDR, rdata)


class _RegAdc1_delay:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def hold_time(self):
        """number of clock cycles to hold before sampling. Ignored in track&hold."""
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        return (rdata >> self._rmap.ADC1_DELAY_HOLD_TIME_POS) & self._rmap.ADC1_DELAY_HOLD_TIME_MSK

    @hold_time.setter
    def hold_time(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC1_DELAY_HOLD_TIME_MSK << self._rmap.ADC1_DELAY_HOLD_TIME_POS))
        rdata = rdata | (val << self._rmap.ADC1_DELAY_HOLD_TIME_POS)
        self._rmap._if.write(self._rmap.ADC1_DELAY_ADDR, rdata)

    @property
    def high_bits_delay(self):
        """number of clock cycles to wait after switching bits 9..7"""
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        return (rdata >> self._rmap.ADC1_DELAY_HIGH_BITS_DELAY_POS) & self._rmap.ADC1_DELAY_HIGH_BITS_DELAY_MSK

    @high_bits_delay.setter
    def high_bits_delay(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC1_DELAY_HIGH_BITS_DELAY_MSK << self._rmap.ADC1_DELAY_HIGH_BITS_DELAY_POS))
        rdata = rdata | (val << self._rmap.ADC1_DELAY_HIGH_BITS_DELAY_POS)
        self._rmap._if.write(self._rmap.ADC1_DELAY_ADDR, rdata)

    @property
    def mid_bits_delay(self):
        """number of clock cycles to wait after switching bits 6..4"""
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        return (rdata >> self._rmap.ADC1_DELAY_MID_BITS_DELAY_POS) & self._rmap.ADC1_DELAY_MID_BITS_DELAY_MSK

    @mid_bits_delay.setter
    def mid_bits_delay(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC1_DELAY_MID_BITS_DELAY_MSK << self._rmap.ADC1_DELAY_MID_BITS_DELAY_POS))
        rdata = rdata | (val << self._rmap.ADC1_DELAY_MID_BITS_DELAY_POS)
        self._rmap._if.write(self._rmap.ADC1_DELAY_ADDR, rdata)

    @property
    def low_bits_delay(self):
        """number of clock cycles to wait after switching bits 3..0"""
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        return (rdata >> self._rmap.ADC1_DELAY_LOW_BITS_DELAY_POS) & self._rmap.ADC1_DELAY_LOW_BITS_DELAY_MSK

    @low_bits_delay.setter
    def low_bits_delay(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC1_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC1_DELAY_LOW_BITS_DELAY_MSK << self._rmap.ADC1_DELAY_LOW_BITS_DELAY_POS))
        rdata = rdata | (val << self._rmap.ADC1_DELAY_LOW_BITS_DELAY_POS)
        self._rmap._if.write(self._rmap.ADC1_DELAY_ADDR, rdata)


class _RegAdc1_out:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def output_value(self):
        """AD converted value"""
        rdata = self._rmap._if.read(self._rmap.ADC1_OUT_ADDR)
        return (rdata >> self._rmap.ADC1_OUT_OUTPUT_VALUE_POS) & self._rmap.ADC1_OUT_OUTPUT_VALUE_MSK


class _RegAdc2_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def en(self):
        """enable"""
        rdata = self._rmap._if.read(self._rmap.ADC2_CONTROL_ADDR)
        return (rdata >> self._rmap.ADC2_CONTROL_EN_POS) & self._rmap.ADC2_CONTROL_EN_MSK

    @en.setter
    def en(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC2_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.ADC2_CONTROL_EN_MSK << self._rmap.ADC2_CONTROL_EN_POS))
        rdata = rdata | (val << self._rmap.ADC2_CONTROL_EN_POS)
        self._rmap._if.write(self._rmap.ADC2_CONTROL_ADDR, rdata)

    @property
    def holdtype(self):
        """hold type"""
        rdata = self._rmap._if.read(self._rmap.ADC2_CONTROL_ADDR)
        return (rdata >> self._rmap.ADC2_CONTROL_HOLDTYPE_POS) & self._rmap.ADC2_CONTROL_HOLDTYPE_MSK

    @holdtype.setter
    def holdtype(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC2_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.ADC2_CONTROL_HOLDTYPE_MSK << self._rmap.ADC2_CONTROL_HOLDTYPE_POS))
        rdata = rdata | (val << self._rmap.ADC2_CONTROL_HOLDTYPE_POS)
        self._rmap._if.write(self._rmap.ADC2_CONTROL_ADDR, rdata)


class _RegAdc2_delay:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def hold_time(self):
        """number of clock cycles to hold before sampling. Ignored in track&hold."""
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        return (rdata >> self._rmap.ADC2_DELAY_HOLD_TIME_POS) & self._rmap.ADC2_DELAY_HOLD_TIME_MSK

    @hold_time.setter
    def hold_time(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC2_DELAY_HOLD_TIME_MSK << self._rmap.ADC2_DELAY_HOLD_TIME_POS))
        rdata = rdata | (val << self._rmap.ADC2_DELAY_HOLD_TIME_POS)
        self._rmap._if.write(self._rmap.ADC2_DELAY_ADDR, rdata)

    @property
    def high_bits_delay(self):
        """number of clock cycles to wait after switching bits 9..7"""
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        return (rdata >> self._rmap.ADC2_DELAY_HIGH_BITS_DELAY_POS) & self._rmap.ADC2_DELAY_HIGH_BITS_DELAY_MSK

    @high_bits_delay.setter
    def high_bits_delay(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC2_DELAY_HIGH_BITS_DELAY_MSK << self._rmap.ADC2_DELAY_HIGH_BITS_DELAY_POS))
        rdata = rdata | (val << self._rmap.ADC2_DELAY_HIGH_BITS_DELAY_POS)
        self._rmap._if.write(self._rmap.ADC2_DELAY_ADDR, rdata)

    @property
    def mid_bits_delay(self):
        """number of clock cycles to wait after switching bits 6..4"""
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        return (rdata >> self._rmap.ADC2_DELAY_MID_BITS_DELAY_POS) & self._rmap.ADC2_DELAY_MID_BITS_DELAY_MSK

    @mid_bits_delay.setter
    def mid_bits_delay(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC2_DELAY_MID_BITS_DELAY_MSK << self._rmap.ADC2_DELAY_MID_BITS_DELAY_POS))
        rdata = rdata | (val << self._rmap.ADC2_DELAY_MID_BITS_DELAY_POS)
        self._rmap._if.write(self._rmap.ADC2_DELAY_ADDR, rdata)

    @property
    def low_bits_delay(self):
        """number of clock cycles to wait after switching bits 3..0"""
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        return (rdata >> self._rmap.ADC2_DELAY_LOW_BITS_DELAY_POS) & self._rmap.ADC2_DELAY_LOW_BITS_DELAY_MSK

    @low_bits_delay.setter
    def low_bits_delay(self, val):
        rdata = self._rmap._if.read(self._rmap.ADC2_DELAY_ADDR)
        rdata = rdata & (~(self._rmap.ADC2_DELAY_LOW_BITS_DELAY_MSK << self._rmap.ADC2_DELAY_LOW_BITS_DELAY_POS))
        rdata = rdata | (val << self._rmap.ADC2_DELAY_LOW_BITS_DELAY_POS)
        self._rmap._if.write(self._rmap.ADC2_DELAY_ADDR, rdata)


class _RegAdc2_out:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def output_value(self):
        """AD converted value"""
        rdata = self._rmap._if.read(self._rmap.ADC2_OUT_ADDR)
        return (rdata >> self._rmap.ADC2_OUT_OUTPUT_VALUE_POS) & self._rmap.ADC2_OUT_OUTPUT_VALUE_MSK


class _RegDac1_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def pd(self):
        """power down"""
        rdata = self._rmap._if.read(self._rmap.DAC1_CONTROL_ADDR)
        return (rdata >> self._rmap.DAC1_CONTROL_PD_POS) & self._rmap.DAC1_CONTROL_PD_MSK

    @pd.setter
    def pd(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC1_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.DAC1_CONTROL_PD_MSK << self._rmap.DAC1_CONTROL_PD_POS))
        rdata = rdata | (val << self._rmap.DAC1_CONTROL_PD_POS)
        self._rmap._if.write(self._rmap.DAC1_CONTROL_ADDR, rdata)


class _RegDac1_tst_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def switch_position(self):
        """testpad switch position"""
        rdata = self._rmap._if.read(self._rmap.DAC1_TST_SW_ADDR)
        return (rdata >> self._rmap.DAC1_TST_SW_SWITCH_POSITION_POS) & self._rmap.DAC1_TST_SW_SWITCH_POSITION_MSK

    @switch_position.setter
    def switch_position(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC1_TST_SW_ADDR)
        rdata = rdata & (~(self._rmap.DAC1_TST_SW_SWITCH_POSITION_MSK << self._rmap.DAC1_TST_SW_SWITCH_POSITION_POS))
        rdata = rdata | (val << self._rmap.DAC1_TST_SW_SWITCH_POSITION_POS)
        self._rmap._if.write(self._rmap.DAC1_TST_SW_ADDR, rdata)


class _RegDac1_gain:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain selection (0.8, 1, 1.8)"""
        rdata = self._rmap._if.read(self._rmap.DAC1_GAIN_ADDR)
        return (rdata >> self._rmap.DAC1_GAIN_GAIN_POS) & self._rmap.DAC1_GAIN_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC1_GAIN_ADDR)
        rdata = rdata & (~(self._rmap.DAC1_GAIN_GAIN_MSK << self._rmap.DAC1_GAIN_GAIN_POS))
        rdata = rdata | (val << self._rmap.DAC1_GAIN_GAIN_POS)
        self._rmap._if.write(self._rmap.DAC1_GAIN_ADDR, rdata)


class _RegDac1_rout:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def rout(self):
        """output resistance selection (100k, 25k, 6.4k)"""
        rdata = self._rmap._if.read(self._rmap.DAC1_ROUT_ADDR)
        return (rdata >> self._rmap.DAC1_ROUT_ROUT_POS) & self._rmap.DAC1_ROUT_ROUT_MSK

    @rout.setter
    def rout(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC1_ROUT_ADDR)
        rdata = rdata & (~(self._rmap.DAC1_ROUT_ROUT_MSK << self._rmap.DAC1_ROUT_ROUT_POS))
        rdata = rdata | (val << self._rmap.DAC1_ROUT_ROUT_POS)
        self._rmap._if.write(self._rmap.DAC1_ROUT_ADDR, rdata)


class _RegDac2_control:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def pd(self):
        """power down"""
        rdata = self._rmap._if.read(self._rmap.DAC2_CONTROL_ADDR)
        return (rdata >> self._rmap.DAC2_CONTROL_PD_POS) & self._rmap.DAC2_CONTROL_PD_MSK

    @pd.setter
    def pd(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC2_CONTROL_ADDR)
        rdata = rdata & (~(self._rmap.DAC2_CONTROL_PD_MSK << self._rmap.DAC2_CONTROL_PD_POS))
        rdata = rdata | (val << self._rmap.DAC2_CONTROL_PD_POS)
        self._rmap._if.write(self._rmap.DAC2_CONTROL_ADDR, rdata)


class _RegDac2_tst_sw:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def switch_position(self):
        """testpad switch position"""
        rdata = self._rmap._if.read(self._rmap.DAC2_TST_SW_ADDR)
        return (rdata >> self._rmap.DAC2_TST_SW_SWITCH_POSITION_POS) & self._rmap.DAC2_TST_SW_SWITCH_POSITION_MSK

    @switch_position.setter
    def switch_position(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC2_TST_SW_ADDR)
        rdata = rdata & (~(self._rmap.DAC2_TST_SW_SWITCH_POSITION_MSK << self._rmap.DAC2_TST_SW_SWITCH_POSITION_POS))
        rdata = rdata | (val << self._rmap.DAC2_TST_SW_SWITCH_POSITION_POS)
        self._rmap._if.write(self._rmap.DAC2_TST_SW_ADDR, rdata)


class _RegDac2_gain:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def gain(self):
        """gain selection (0.8, 1, 1.8)"""
        rdata = self._rmap._if.read(self._rmap.DAC2_GAIN_ADDR)
        return (rdata >> self._rmap.DAC2_GAIN_GAIN_POS) & self._rmap.DAC2_GAIN_GAIN_MSK

    @gain.setter
    def gain(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC2_GAIN_ADDR)
        rdata = rdata & (~(self._rmap.DAC2_GAIN_GAIN_MSK << self._rmap.DAC2_GAIN_GAIN_POS))
        rdata = rdata | (val << self._rmap.DAC2_GAIN_GAIN_POS)
        self._rmap._if.write(self._rmap.DAC2_GAIN_ADDR, rdata)


class _RegDac2_rout:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def rout(self):
        """output resistance selection (100k, 25k, 6.4k)"""
        rdata = self._rmap._if.read(self._rmap.DAC2_ROUT_ADDR)
        return (rdata >> self._rmap.DAC2_ROUT_ROUT_POS) & self._rmap.DAC2_ROUT_ROUT_MSK

    @rout.setter
    def rout(self, val):
        rdata = self._rmap._if.read(self._rmap.DAC2_ROUT_ADDR)
        rdata = rdata & (~(self._rmap.DAC2_ROUT_ROUT_MSK << self._rmap.DAC2_ROUT_ROUT_POS))
        rdata = rdata | (val << self._rmap.DAC2_ROUT_ROUT_POS)
        self._rmap._if.write(self._rmap.DAC2_ROUT_ADDR, rdata)


class _RegSine_lut_step:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def step_size(self):
        """step size selection (in 1 / 1024 per rotation)"""
        rdata = self._rmap._if.read(self._rmap.SINE_LUT_STEP_ADDR)
        return (rdata >> self._rmap.SINE_LUT_STEP_STEP_SIZE_POS) & self._rmap.SINE_LUT_STEP_STEP_SIZE_MSK

    @step_size.setter
    def step_size(self, val):
        rdata = self._rmap._if.read(self._rmap.SINE_LUT_STEP_ADDR)
        rdata = rdata & (~(self._rmap.SINE_LUT_STEP_STEP_SIZE_MSK << self._rmap.SINE_LUT_STEP_STEP_SIZE_POS))
        rdata = rdata | (val << self._rmap.SINE_LUT_STEP_STEP_SIZE_POS)
        self._rmap._if.write(self._rmap.SINE_LUT_STEP_ADDR, rdata)


class _RegSine_lut_out0:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def out0(self):
        """current sine at 0° tap"""
        rdata = self._rmap._if.read(self._rmap.SINE_LUT_OUT0_ADDR)
        return (rdata >> self._rmap.SINE_LUT_OUT0_OUT0_POS) & self._rmap.SINE_LUT_OUT0_OUT0_MSK


class _RegSine_lut_out90:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def out0(self):
        """current sine at 90° tap"""
        rdata = self._rmap._if.read(self._rmap.SINE_LUT_OUT90_ADDR)
        return (rdata >> self._rmap.SINE_LUT_OUT90_OUT0_POS) & self._rmap.SINE_LUT_OUT90_OUT0_MSK


class _RegLockin_placeholder:
    def __init__(self, rmap):
        self._rmap = rmap

    @property
    def tbd(self):
        """TBD"""
        rdata = self._rmap._if.read(self._rmap.LOCKIN_PLACEHOLDER_ADDR)
        return (rdata >> self._rmap.LOCKIN_PLACEHOLDER_TBD_POS) & self._rmap.LOCKIN_PLACEHOLDER_TBD_MSK

    @tbd.setter
    def tbd(self, val):
        rdata = self._rmap._if.read(self._rmap.LOCKIN_PLACEHOLDER_ADDR)
        rdata = rdata & (~(self._rmap.LOCKIN_PLACEHOLDER_TBD_MSK << self._rmap.LOCKIN_PLACEHOLDER_TBD_POS))
        rdata = rdata | (val << self._rmap.LOCKIN_PLACEHOLDER_TBD_POS)
        self._rmap._if.write(self._rmap.LOCKIN_PLACEHOLDER_ADDR, rdata)


class RegMap:
    """Control/Status register map"""

    # I_BIAS_CONTROL - Control register.
    I_BIAS_CONTROL_ADDR = 0x00000000
    I_BIAS_CONTROL_POWER_DOWN_POS = 0
    I_BIAS_CONTROL_POWER_DOWN_MSK = 0x7

    # I_BIAS_SW - Switch configuration
    I_BIAS_SW_ADDR = 0x00000004
    I_BIAS_SW_SOURCE_SEL_POS = 0
    I_BIAS_SW_SOURCE_SEL_MSK = 0x3

    # PGA1_CONTROL - Control register.
    PGA1_CONTROL_ADDR = 0x00000100
    PGA1_CONTROL_POWER_DOWN_POS = 0
    PGA1_CONTROL_POWER_DOWN_MSK = 0x7

    # PGA1_INT_SW - Switch configuration for internal connectivity
    PGA1_INT_SW_ADDR = 0x00000110
    PGA1_INT_SW_OFFSET_COMPENSATION_POS = 0
    PGA1_INT_SW_OFFSET_COMPENSATION_MSK = 0x3f
    PGA1_INT_SW_SE_POS = 8
    PGA1_INT_SW_SE_MSK = 0x3
    PGA1_INT_SW_SM_POS = 10
    PGA1_INT_SW_SM_MSK = 0x3
    PGA1_INT_SW_SC_POS = 12
    PGA1_INT_SW_SC_MSK = 0x3

    # PGA1_TST_SW - Switch configuration for testpad connectivity
    PGA1_TST_SW_ADDR = 0x00000120
    PGA1_TST_SW_SI_POS = 0
    PGA1_TST_SW_SI_MSK = 0x3f
    PGA1_TST_SW_SO_POS = 6
    PGA1_TST_SW_SO_MSK = 0xf

    # PGA1_OC1 - Offset compensation values for OPAMP1
    PGA1_OC1_ADDR = 0x00000140
    PGA1_OC1_OC1_P_POS = 0
    PGA1_OC1_OC1_P_MSK = 0xff
    PGA1_OC1_OC1_N_POS = 8
    PGA1_OC1_OC1_N_MSK = 0xff

    # PGA1_OC2 - Offset compensation values for OPAMP2
    PGA1_OC2_ADDR = 0x00000144
    PGA1_OC2_OC1_P_POS = 0
    PGA1_OC2_OC1_P_MSK = 0xff
    PGA1_OC2_OC1_N_POS = 8
    PGA1_OC2_OC1_N_MSK = 0xff

    # PGA1_GAIN1 - Gain for first amplifier stage
    PGA1_GAIN1_ADDR = 0x00000150
    PGA1_GAIN1_GAIN_POS = 0
    PGA1_GAIN1_GAIN_MSK = 0x7f

    # PGA1_GAIN2_1 - Gain for second amplifier stage, P path
    PGA1_GAIN2_1_ADDR = 0x00000160
    PGA1_GAIN2_1_GAIN_POS = 0
    PGA1_GAIN2_1_GAIN_MSK = 0x7

    # PGA1_GAIN2_2 - Gain for second amplifier stage, N path
    PGA1_GAIN2_2_ADDR = 0x00000164
    PGA1_GAIN2_2_GAIN_POS = 0
    PGA1_GAIN2_2_GAIN_MSK = 0x7

    # PGA2_CONTROL - Control register.
    PGA2_CONTROL_ADDR = 0x00000200
    PGA2_CONTROL_POWER_DOWN_POS = 0
    PGA2_CONTROL_POWER_DOWN_MSK = 0x7

    # PGA2_INT_SW - Switch configuration for internal connectivity
    PGA2_INT_SW_ADDR = 0x00000210
    PGA2_INT_SW_OFFSET_COMPENSATION_POS = 0
    PGA2_INT_SW_OFFSET_COMPENSATION_MSK = 0x3f
    PGA2_INT_SW_SE_POS = 8
    PGA2_INT_SW_SE_MSK = 0x3
    PGA2_INT_SW_SM_POS = 10
    PGA2_INT_SW_SM_MSK = 0x3
    PGA2_INT_SW_SC_POS = 12
    PGA2_INT_SW_SC_MSK = 0x3

    # PGA2_TST_SW - Switch configuration for testpad connectivity
    PGA2_TST_SW_ADDR = 0x00000220
    PGA2_TST_SW_SI_POS = 0
    PGA2_TST_SW_SI_MSK = 0x3f
    PGA2_TST_SW_SO_POS = 6
    PGA2_TST_SW_SO_MSK = 0xf

    # PGA2_OC1 - Offset compensation values for OPAMP1
    PGA2_OC1_ADDR = 0x00000240
    PGA2_OC1_OC1_P_POS = 0
    PGA2_OC1_OC1_P_MSK = 0xff
    PGA2_OC1_OC1_N_POS = 8
    PGA2_OC1_OC1_N_MSK = 0xff

    # PGA2_OC2 - Offset compensation values for OPAMP2
    PGA2_OC2_ADDR = 0x00000244
    PGA2_OC2_OC1_P_POS = 0
    PGA2_OC2_OC1_P_MSK = 0xff
    PGA2_OC2_OC1_N_POS = 8
    PGA2_OC2_OC1_N_MSK = 0xff

    # PGA2_GAIN1 - Gain for first amplifier stage
    PGA2_GAIN1_ADDR = 0x00000250
    PGA2_GAIN1_GAIN_POS = 0
    PGA2_GAIN1_GAIN_MSK = 0x7f

    # PGA2_GAIN2_1 - Gain for second amplifier stage, P path
    PGA2_GAIN2_1_ADDR = 0x00000260
    PGA2_GAIN2_1_GAIN_POS = 0
    PGA2_GAIN2_1_GAIN_MSK = 0x7

    # PGA2_GAIN2_2 - Gain for second amplifier stage, N path
    PGA2_GAIN2_2_ADDR = 0x00000264
    PGA2_GAIN2_2_GAIN_POS = 0
    PGA2_GAIN2_2_GAIN_MSK = 0x7

    # TI_CONTROL - Transimpedance control register
    TI_CONTROL_ADDR = 0x00000280
    TI_CONTROL_PD_POS = 0
    TI_CONTROL_PD_MSK = 0x1

    # TI_GAIN - Transimpedance gain
    TI_GAIN_ADDR = 0x00000284
    TI_GAIN_RES_POS = 0
    TI_GAIN_RES_MSK = 0x7

    # TI_SW - Transimpedance switch configuration
    TI_SW_ADDR = 0x00000288
    TI_SW_TP_SWITCH_POS = 0
    TI_SW_TP_SWITCH_MSK = 0x1

    # ADC1_CONTROL - Control register
    ADC1_CONTROL_ADDR = 0x00000300
    ADC1_CONTROL_EN_POS = 0
    ADC1_CONTROL_EN_MSK = 0x1
    ADC1_CONTROL_HOLDTYPE_POS = 1
    ADC1_CONTROL_HOLDTYPE_MSK = 0x1

    # ADC1_DELAY - delay settings
    ADC1_DELAY_ADDR = 0x00000310
    ADC1_DELAY_HOLD_TIME_POS = 0
    ADC1_DELAY_HOLD_TIME_MSK = 0x1f
    ADC1_DELAY_HIGH_BITS_DELAY_POS = 5
    ADC1_DELAY_HIGH_BITS_DELAY_MSK = 0xf
    ADC1_DELAY_MID_BITS_DELAY_POS = 9
    ADC1_DELAY_MID_BITS_DELAY_MSK = 0x3
    ADC1_DELAY_LOW_BITS_DELAY_POS = 11
    ADC1_DELAY_LOW_BITS_DELAY_MSK = 0x3

    # ADC1_OUT - ADC output value
    ADC1_OUT_ADDR = 0x00000380
    ADC1_OUT_OUTPUT_VALUE_POS = 0
    ADC1_OUT_OUTPUT_VALUE_MSK = 0xfff

    # ADC2_CONTROL - Control register
    ADC2_CONTROL_ADDR = 0x00000400
    ADC2_CONTROL_EN_POS = 0
    ADC2_CONTROL_EN_MSK = 0x1
    ADC2_CONTROL_HOLDTYPE_POS = 1
    ADC2_CONTROL_HOLDTYPE_MSK = 0x1

    # ADC2_DELAY - delay settings
    ADC2_DELAY_ADDR = 0x00000410
    ADC2_DELAY_HOLD_TIME_POS = 0
    ADC2_DELAY_HOLD_TIME_MSK = 0x1f
    ADC2_DELAY_HIGH_BITS_DELAY_POS = 5
    ADC2_DELAY_HIGH_BITS_DELAY_MSK = 0xf
    ADC2_DELAY_MID_BITS_DELAY_POS = 9
    ADC2_DELAY_MID_BITS_DELAY_MSK = 0x3
    ADC2_DELAY_LOW_BITS_DELAY_POS = 11
    ADC2_DELAY_LOW_BITS_DELAY_MSK = 0x3

    # ADC2_OUT - ADC output value
    ADC2_OUT_ADDR = 0x00000480
    ADC2_OUT_OUTPUT_VALUE_POS = 0
    ADC2_OUT_OUTPUT_VALUE_MSK = 0xfff

    # DAC1_CONTROL - Control register
    DAC1_CONTROL_ADDR = 0x00000500
    DAC1_CONTROL_PD_POS = 0
    DAC1_CONTROL_PD_MSK = 0x1

    # DAC1_TST_SW - Switch register
    DAC1_TST_SW_ADDR = 0x00000510
    DAC1_TST_SW_SWITCH_POSITION_POS = 0
    DAC1_TST_SW_SWITCH_POSITION_MSK = 0x1

    # DAC1_GAIN - analog gain selection
    DAC1_GAIN_ADDR = 0x00000520
    DAC1_GAIN_GAIN_POS = 0
    DAC1_GAIN_GAIN_MSK = 0x3

    # DAC1_ROUT - output resistance selection
    DAC1_ROUT_ADDR = 0x00000530
    DAC1_ROUT_ROUT_POS = 0
    DAC1_ROUT_ROUT_MSK = 0x7

    # DAC2_CONTROL - Control register
    DAC2_CONTROL_ADDR = 0x00000600
    DAC2_CONTROL_PD_POS = 0
    DAC2_CONTROL_PD_MSK = 0x1

    # DAC2_TST_SW - Switch register
    DAC2_TST_SW_ADDR = 0x00000610
    DAC2_TST_SW_SWITCH_POSITION_POS = 0
    DAC2_TST_SW_SWITCH_POSITION_MSK = 0x1

    # DAC2_GAIN - analog gain selection
    DAC2_GAIN_ADDR = 0x00000620
    DAC2_GAIN_GAIN_POS = 0
    DAC2_GAIN_GAIN_MSK = 0x3

    # DAC2_ROUT - output resistance selection
    DAC2_ROUT_ADDR = 0x00000630
    DAC2_ROUT_ROUT_POS = 0
    DAC2_ROUT_ROUT_MSK = 0x7

    # SINE_LUT_STEP - step size selection
    SINE_LUT_STEP_ADDR = 0x00000710
    SINE_LUT_STEP_STEP_SIZE_POS = 0
    SINE_LUT_STEP_STEP_SIZE_MSK = 0x3ff

    # SINE_LUT_OUT0 - current sine at 0° tap
    SINE_LUT_OUT0_ADDR = 0x00000780
    SINE_LUT_OUT0_OUT0_POS = 0
    SINE_LUT_OUT0_OUT0_MSK = 0x3ff

    # SINE_LUT_OUT90 - current sine at 90° tap
    SINE_LUT_OUT90_ADDR = 0x00000784
    SINE_LUT_OUT90_OUT0_POS = 0
    SINE_LUT_OUT90_OUT0_MSK = 0x3ff

    # LOCKIN_PLACEHOLDER - TBD
    LOCKIN_PLACEHOLDER_ADDR = 0x00000800
    LOCKIN_PLACEHOLDER_TBD_POS = 0
    LOCKIN_PLACEHOLDER_TBD_MSK = 0xff

    def __init__(self, interface):
        self._if = interface

    @property
    def i_bias_control(self):
        """Control register."""
        return self._if.read(self.I_BIAS_CONTROL_ADDR)

    @i_bias_control.setter
    def i_bias_control(self, val):
        self._if.write(self.I_BIAS_CONTROL_ADDR, val)

    @property
    def i_bias_control_bf(self):
        return _RegI_bias_control(self)

    @property
    def i_bias_sw(self):
        """Switch configuration"""
        return self._if.read(self.I_BIAS_SW_ADDR)

    @i_bias_sw.setter
    def i_bias_sw(self, val):
        self._if.write(self.I_BIAS_SW_ADDR, val)

    @property
    def i_bias_sw_bf(self):
        return _RegI_bias_sw(self)

    @property
    def pga1_control(self):
        """Control register."""
        return self._if.read(self.PGA1_CONTROL_ADDR)

    @pga1_control.setter
    def pga1_control(self, val):
        self._if.write(self.PGA1_CONTROL_ADDR, val)

    @property
    def pga1_control_bf(self):
        return _RegPga1_control(self)

    @property
    def pga1_int_sw(self):
        """Switch configuration for internal connectivity"""
        return self._if.read(self.PGA1_INT_SW_ADDR)

    @pga1_int_sw.setter
    def pga1_int_sw(self, val):
        self._if.write(self.PGA1_INT_SW_ADDR, val)

    @property
    def pga1_int_sw_bf(self):
        return _RegPga1_int_sw(self)

    @property
    def pga1_tst_sw(self):
        """Switch configuration for testpad connectivity"""
        return self._if.read(self.PGA1_TST_SW_ADDR)

    @pga1_tst_sw.setter
    def pga1_tst_sw(self, val):
        self._if.write(self.PGA1_TST_SW_ADDR, val)

    @property
    def pga1_tst_sw_bf(self):
        return _RegPga1_tst_sw(self)

    @property
    def pga1_oc1(self):
        """Offset compensation values for OPAMP1"""
        return self._if.read(self.PGA1_OC1_ADDR)

    @pga1_oc1.setter
    def pga1_oc1(self, val):
        self._if.write(self.PGA1_OC1_ADDR, val)

    @property
    def pga1_oc1_bf(self):
        return _RegPga1_oc1(self)

    @property
    def pga1_oc2(self):
        """Offset compensation values for OPAMP2"""
        return self._if.read(self.PGA1_OC2_ADDR)

    @pga1_oc2.setter
    def pga1_oc2(self, val):
        self._if.write(self.PGA1_OC2_ADDR, val)

    @property
    def pga1_oc2_bf(self):
        return _RegPga1_oc2(self)

    @property
    def pga1_gain1(self):
        """Gain for first amplifier stage"""
        return self._if.read(self.PGA1_GAIN1_ADDR)

    @pga1_gain1.setter
    def pga1_gain1(self, val):
        self._if.write(self.PGA1_GAIN1_ADDR, val)

    @property
    def pga1_gain1_bf(self):
        return _RegPga1_gain1(self)

    @property
    def pga1_gain2_1(self):
        """Gain for second amplifier stage, P path"""
        return self._if.read(self.PGA1_GAIN2_1_ADDR)

    @pga1_gain2_1.setter
    def pga1_gain2_1(self, val):
        self._if.write(self.PGA1_GAIN2_1_ADDR, val)

    @property
    def pga1_gain2_1_bf(self):
        return _RegPga1_gain2_1(self)

    @property
    def pga1_gain2_2(self):
        """Gain for second amplifier stage, N path"""
        return self._if.read(self.PGA1_GAIN2_2_ADDR)

    @pga1_gain2_2.setter
    def pga1_gain2_2(self, val):
        self._if.write(self.PGA1_GAIN2_2_ADDR, val)

    @property
    def pga1_gain2_2_bf(self):
        return _RegPga1_gain2_2(self)

    @property
    def pga2_control(self):
        """Control register."""
        return self._if.read(self.PGA2_CONTROL_ADDR)

    @pga2_control.setter
    def pga2_control(self, val):
        self._if.write(self.PGA2_CONTROL_ADDR, val)

    @property
    def pga2_control_bf(self):
        return _RegPga2_control(self)

    @property
    def pga2_int_sw(self):
        """Switch configuration for internal connectivity"""
        return self._if.read(self.PGA2_INT_SW_ADDR)

    @pga2_int_sw.setter
    def pga2_int_sw(self, val):
        self._if.write(self.PGA2_INT_SW_ADDR, val)

    @property
    def pga2_int_sw_bf(self):
        return _RegPga2_int_sw(self)

    @property
    def pga2_tst_sw(self):
        """Switch configuration for testpad connectivity"""
        return self._if.read(self.PGA2_TST_SW_ADDR)

    @pga2_tst_sw.setter
    def pga2_tst_sw(self, val):
        self._if.write(self.PGA2_TST_SW_ADDR, val)

    @property
    def pga2_tst_sw_bf(self):
        return _RegPga2_tst_sw(self)

    @property
    def pga2_oc1(self):
        """Offset compensation values for OPAMP1"""
        return self._if.read(self.PGA2_OC1_ADDR)

    @pga2_oc1.setter
    def pga2_oc1(self, val):
        self._if.write(self.PGA2_OC1_ADDR, val)

    @property
    def pga2_oc1_bf(self):
        return _RegPga2_oc1(self)

    @property
    def pga2_oc2(self):
        """Offset compensation values for OPAMP2"""
        return self._if.read(self.PGA2_OC2_ADDR)

    @pga2_oc2.setter
    def pga2_oc2(self, val):
        self._if.write(self.PGA2_OC2_ADDR, val)

    @property
    def pga2_oc2_bf(self):
        return _RegPga2_oc2(self)

    @property
    def pga2_gain1(self):
        """Gain for first amplifier stage"""
        return self._if.read(self.PGA2_GAIN1_ADDR)

    @pga2_gain1.setter
    def pga2_gain1(self, val):
        self._if.write(self.PGA2_GAIN1_ADDR, val)

    @property
    def pga2_gain1_bf(self):
        return _RegPga2_gain1(self)

    @property
    def pga2_gain2_1(self):
        """Gain for second amplifier stage, P path"""
        return self._if.read(self.PGA2_GAIN2_1_ADDR)

    @pga2_gain2_1.setter
    def pga2_gain2_1(self, val):
        self._if.write(self.PGA2_GAIN2_1_ADDR, val)

    @property
    def pga2_gain2_1_bf(self):
        return _RegPga2_gain2_1(self)

    @property
    def pga2_gain2_2(self):
        """Gain for second amplifier stage, N path"""
        return self._if.read(self.PGA2_GAIN2_2_ADDR)

    @pga2_gain2_2.setter
    def pga2_gain2_2(self, val):
        self._if.write(self.PGA2_GAIN2_2_ADDR, val)

    @property
    def pga2_gain2_2_bf(self):
        return _RegPga2_gain2_2(self)

    @property
    def ti_control(self):
        """Transimpedance control register"""
        return self._if.read(self.TI_CONTROL_ADDR)

    @ti_control.setter
    def ti_control(self, val):
        self._if.write(self.TI_CONTROL_ADDR, val)

    @property
    def ti_control_bf(self):
        return _RegTi_control(self)

    @property
    def ti_gain(self):
        """Transimpedance gain"""
        return self._if.read(self.TI_GAIN_ADDR)

    @ti_gain.setter
    def ti_gain(self, val):
        self._if.write(self.TI_GAIN_ADDR, val)

    @property
    def ti_gain_bf(self):
        return _RegTi_gain(self)

    @property
    def ti_sw(self):
        """Transimpedance switch configuration"""
        return self._if.read(self.TI_SW_ADDR)

    @ti_sw.setter
    def ti_sw(self, val):
        self._if.write(self.TI_SW_ADDR, val)

    @property
    def ti_sw_bf(self):
        return _RegTi_sw(self)

    @property
    def adc1_control(self):
        """Control register"""
        return self._if.read(self.ADC1_CONTROL_ADDR)

    @adc1_control.setter
    def adc1_control(self, val):
        self._if.write(self.ADC1_CONTROL_ADDR, val)

    @property
    def adc1_control_bf(self):
        return _RegAdc1_control(self)

    @property
    def adc1_delay(self):
        """delay settings"""
        return self._if.read(self.ADC1_DELAY_ADDR)

    @adc1_delay.setter
    def adc1_delay(self, val):
        self._if.write(self.ADC1_DELAY_ADDR, val)

    @property
    def adc1_delay_bf(self):
        return _RegAdc1_delay(self)

    @property
    def adc1_out(self):
        """ADC output value"""
        return self._if.read(self.ADC1_OUT_ADDR)

    @property
    def adc1_out_bf(self):
        return _RegAdc1_out(self)

    @property
    def adc2_control(self):
        """Control register"""
        return self._if.read(self.ADC2_CONTROL_ADDR)

    @adc2_control.setter
    def adc2_control(self, val):
        self._if.write(self.ADC2_CONTROL_ADDR, val)

    @property
    def adc2_control_bf(self):
        return _RegAdc2_control(self)

    @property
    def adc2_delay(self):
        """delay settings"""
        return self._if.read(self.ADC2_DELAY_ADDR)

    @adc2_delay.setter
    def adc2_delay(self, val):
        self._if.write(self.ADC2_DELAY_ADDR, val)

    @property
    def adc2_delay_bf(self):
        return _RegAdc2_delay(self)

    @property
    def adc2_out(self):
        """ADC output value"""
        return self._if.read(self.ADC2_OUT_ADDR)

    @property
    def adc2_out_bf(self):
        return _RegAdc2_out(self)

    @property
    def dac1_control(self):
        """Control register"""
        return self._if.read(self.DAC1_CONTROL_ADDR)

    @dac1_control.setter
    def dac1_control(self, val):
        self._if.write(self.DAC1_CONTROL_ADDR, val)

    @property
    def dac1_control_bf(self):
        return _RegDac1_control(self)

    @property
    def dac1_tst_sw(self):
        """Switch register"""
        return self._if.read(self.DAC1_TST_SW_ADDR)

    @dac1_tst_sw.setter
    def dac1_tst_sw(self, val):
        self._if.write(self.DAC1_TST_SW_ADDR, val)

    @property
    def dac1_tst_sw_bf(self):
        return _RegDac1_tst_sw(self)

    @property
    def dac1_gain(self):
        """analog gain selection"""
        return self._if.read(self.DAC1_GAIN_ADDR)

    @dac1_gain.setter
    def dac1_gain(self, val):
        self._if.write(self.DAC1_GAIN_ADDR, val)

    @property
    def dac1_gain_bf(self):
        return _RegDac1_gain(self)

    @property
    def dac1_rout(self):
        """output resistance selection"""
        return self._if.read(self.DAC1_ROUT_ADDR)

    @dac1_rout.setter
    def dac1_rout(self, val):
        self._if.write(self.DAC1_ROUT_ADDR, val)

    @property
    def dac1_rout_bf(self):
        return _RegDac1_rout(self)

    @property
    def dac2_control(self):
        """Control register"""
        return self._if.read(self.DAC2_CONTROL_ADDR)

    @dac2_control.setter
    def dac2_control(self, val):
        self._if.write(self.DAC2_CONTROL_ADDR, val)

    @property
    def dac2_control_bf(self):
        return _RegDac2_control(self)

    @property
    def dac2_tst_sw(self):
        """Switch register"""
        return self._if.read(self.DAC2_TST_SW_ADDR)

    @dac2_tst_sw.setter
    def dac2_tst_sw(self, val):
        self._if.write(self.DAC2_TST_SW_ADDR, val)

    @property
    def dac2_tst_sw_bf(self):
        return _RegDac2_tst_sw(self)

    @property
    def dac2_gain(self):
        """analog gain selection"""
        return self._if.read(self.DAC2_GAIN_ADDR)

    @dac2_gain.setter
    def dac2_gain(self, val):
        self._if.write(self.DAC2_GAIN_ADDR, val)

    @property
    def dac2_gain_bf(self):
        return _RegDac2_gain(self)

    @property
    def dac2_rout(self):
        """output resistance selection"""
        return self._if.read(self.DAC2_ROUT_ADDR)

    @dac2_rout.setter
    def dac2_rout(self, val):
        self._if.write(self.DAC2_ROUT_ADDR, val)

    @property
    def dac2_rout_bf(self):
        return _RegDac2_rout(self)

    @property
    def sine_lut_step(self):
        """step size selection"""
        return self._if.read(self.SINE_LUT_STEP_ADDR)

    @sine_lut_step.setter
    def sine_lut_step(self, val):
        self._if.write(self.SINE_LUT_STEP_ADDR, val)

    @property
    def sine_lut_step_bf(self):
        return _RegSine_lut_step(self)

    @property
    def sine_lut_out0(self):
        """current sine at 0° tap"""
        return self._if.read(self.SINE_LUT_OUT0_ADDR)

    @property
    def sine_lut_out0_bf(self):
        return _RegSine_lut_out0(self)

    @property
    def sine_lut_out90(self):
        """current sine at 90° tap"""
        return self._if.read(self.SINE_LUT_OUT90_ADDR)

    @property
    def sine_lut_out90_bf(self):
        return _RegSine_lut_out90(self)

    @property
    def lockin_placeholder(self):
        """TBD"""
        return self._if.read(self.LOCKIN_PLACEHOLDER_ADDR)

    @lockin_placeholder.setter
    def lockin_placeholder(self, val):
        self._if.write(self.LOCKIN_PLACEHOLDER_ADDR, val)

    @property
    def lockin_placeholder_bf(self):
        return _RegLockin_placeholder(self)
