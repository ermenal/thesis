
# -*- coding: utf-8 -*-

from . static import Base_RM_Register
from . RAC_S_field import *


class RM_Register_RAC_S_IPVERSION(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IPVERSION, self).__init__(rmio, label,
            0xa8020000, 0x000,
            'IPVERSION', 'RAC_S.IPVERSION', 'read-only',
            u"",
            0x00000003, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.IPVERSION = RM_Field_RAC_S_IPVERSION_IPVERSION(self)
        self.zz_fdict['IPVERSION'] = self.IPVERSION
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_EN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_EN, self).__init__(rmio, label,
            0xa8020000, 0x004,
            'EN', 'RAC_S.EN', 'read-write',
            u"",
            0x00000000, 0x00000001,
            0x00001000, 0x00002000,
            0x00003000)

        self.EN = RM_Field_RAC_S_EN_EN(self)
        self.zz_fdict['EN'] = self.EN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RXENSRCEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RXENSRCEN, self).__init__(rmio, label,
            0xa8020000, 0x008,
            'RXENSRCEN', 'RAC_S.RXENSRCEN', 'read-write',
            u"",
            0x00000000, 0x00003FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SWRXEN = RM_Field_RAC_S_RXENSRCEN_SWRXEN(self)
        self.zz_fdict['SWRXEN'] = self.SWRXEN
        self.CHANNELBUSYEN = RM_Field_RAC_S_RXENSRCEN_CHANNELBUSYEN(self)
        self.zz_fdict['CHANNELBUSYEN'] = self.CHANNELBUSYEN
        self.TIMDETEN = RM_Field_RAC_S_RXENSRCEN_TIMDETEN(self)
        self.zz_fdict['TIMDETEN'] = self.TIMDETEN
        self.PREDETEN = RM_Field_RAC_S_RXENSRCEN_PREDETEN(self)
        self.zz_fdict['PREDETEN'] = self.PREDETEN
        self.FRAMEDETEN = RM_Field_RAC_S_RXENSRCEN_FRAMEDETEN(self)
        self.zz_fdict['FRAMEDETEN'] = self.FRAMEDETEN
        self.DEMODRXREQEN = RM_Field_RAC_S_RXENSRCEN_DEMODRXREQEN(self)
        self.zz_fdict['DEMODRXREQEN'] = self.DEMODRXREQEN
        self.PRSRXEN = RM_Field_RAC_S_RXENSRCEN_PRSRXEN(self)
        self.zz_fdict['PRSRXEN'] = self.PRSRXEN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_STATUS(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_STATUS, self).__init__(rmio, label,
            0xa8020000, 0x00C,
            'STATUS', 'RAC_S.STATUS', 'read-only',
            u"",
            0x00000000, 0xFFF8FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.RXMASK = RM_Field_RAC_S_STATUS_RXMASK(self)
        self.zz_fdict['RXMASK'] = self.RXMASK
        self.FORCESTATEACTIVE = RM_Field_RAC_S_STATUS_FORCESTATEACTIVE(self)
        self.zz_fdict['FORCESTATEACTIVE'] = self.FORCESTATEACTIVE
        self.TXAFTERFRAMEPEND = RM_Field_RAC_S_STATUS_TXAFTERFRAMEPEND(self)
        self.zz_fdict['TXAFTERFRAMEPEND'] = self.TXAFTERFRAMEPEND
        self.TXAFTERFRAMEACTIVE = RM_Field_RAC_S_STATUS_TXAFTERFRAMEACTIVE(self)
        self.zz_fdict['TXAFTERFRAMEACTIVE'] = self.TXAFTERFRAMEACTIVE
        self.SEQSLEEPING = RM_Field_RAC_S_STATUS_SEQSLEEPING(self)
        self.zz_fdict['SEQSLEEPING'] = self.SEQSLEEPING
        self.SEQSLEEPDEEP = RM_Field_RAC_S_STATUS_SEQSLEEPDEEP(self)
        self.zz_fdict['SEQSLEEPDEEP'] = self.SEQSLEEPDEEP
        self.STATE = RM_Field_RAC_S_STATUS_STATE(self)
        self.zz_fdict['STATE'] = self.STATE
        self.SEQACTIVE = RM_Field_RAC_S_STATUS_SEQACTIVE(self)
        self.zz_fdict['SEQACTIVE'] = self.SEQACTIVE
        self.DEMODENS = RM_Field_RAC_S_STATUS_DEMODENS(self)
        self.zz_fdict['DEMODENS'] = self.DEMODENS
        self.TXENS = RM_Field_RAC_S_STATUS_TXENS(self)
        self.zz_fdict['TXENS'] = self.TXENS
        self.RXENS = RM_Field_RAC_S_STATUS_RXENS(self)
        self.zz_fdict['RXENS'] = self.RXENS
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CMD(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CMD, self).__init__(rmio, label,
            0xa8020000, 0x010,
            'CMD', 'RAC_S.CMD', 'write-only',
            u"",
            0x00000000, 0xC000FDFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.TXEN = RM_Field_RAC_S_CMD_TXEN(self)
        self.zz_fdict['TXEN'] = self.TXEN
        self.FORCETX = RM_Field_RAC_S_CMD_FORCETX(self)
        self.zz_fdict['FORCETX'] = self.FORCETX
        self.TXONCCA = RM_Field_RAC_S_CMD_TXONCCA(self)
        self.zz_fdict['TXONCCA'] = self.TXONCCA
        self.CLEARTXEN = RM_Field_RAC_S_CMD_CLEARTXEN(self)
        self.zz_fdict['CLEARTXEN'] = self.CLEARTXEN
        self.TXAFTERFRAME = RM_Field_RAC_S_CMD_TXAFTERFRAME(self)
        self.zz_fdict['TXAFTERFRAME'] = self.TXAFTERFRAME
        self.TXDIS = RM_Field_RAC_S_CMD_TXDIS(self)
        self.zz_fdict['TXDIS'] = self.TXDIS
        self.CLEARRXOVERFLOW = RM_Field_RAC_S_CMD_CLEARRXOVERFLOW(self)
        self.zz_fdict['CLEARRXOVERFLOW'] = self.CLEARRXOVERFLOW
        self.RXCAL = RM_Field_RAC_S_CMD_RXCAL(self)
        self.zz_fdict['RXCAL'] = self.RXCAL
        self.RXDIS = RM_Field_RAC_S_CMD_RXDIS(self)
        self.zz_fdict['RXDIS'] = self.RXDIS
        self.FRCWR = RM_Field_RAC_S_CMD_FRCWR(self)
        self.zz_fdict['FRCWR'] = self.FRCWR
        self.FRCRD = RM_Field_RAC_S_CMD_FRCRD(self)
        self.zz_fdict['FRCRD'] = self.FRCRD
        self.PAENSET = RM_Field_RAC_S_CMD_PAENSET(self)
        self.zz_fdict['PAENSET'] = self.PAENSET
        self.PAENCLEAR = RM_Field_RAC_S_CMD_PAENCLEAR(self)
        self.zz_fdict['PAENCLEAR'] = self.PAENCLEAR
        self.LNAENSET = RM_Field_RAC_S_CMD_LNAENSET(self)
        self.zz_fdict['LNAENSET'] = self.LNAENSET
        self.LNAENCLEAR = RM_Field_RAC_S_CMD_LNAENCLEAR(self)
        self.zz_fdict['LNAENCLEAR'] = self.LNAENCLEAR
        self.DEMODENSET = RM_Field_RAC_S_CMD_DEMODENSET(self)
        self.zz_fdict['DEMODENSET'] = self.DEMODENSET
        self.DEMODENCLEAR = RM_Field_RAC_S_CMD_DEMODENCLEAR(self)
        self.zz_fdict['DEMODENCLEAR'] = self.DEMODENCLEAR
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CTRL, self).__init__(rmio, label,
            0xa8020000, 0x014,
            'CTRL', 'RAC_S.CTRL', 'read-write',
            u"",
            0x00000000, 0x1F0107EF,
            0x00001000, 0x00002000,
            0x00003000)

        self.FORCEDISABLE = RM_Field_RAC_S_CTRL_FORCEDISABLE(self)
        self.zz_fdict['FORCEDISABLE'] = self.FORCEDISABLE
        self.PRSTXEN = RM_Field_RAC_S_CTRL_PRSTXEN(self)
        self.zz_fdict['PRSTXEN'] = self.PRSTXEN
        self.TXAFTERRX = RM_Field_RAC_S_CTRL_TXAFTERRX(self)
        self.zz_fdict['TXAFTERRX'] = self.TXAFTERRX
        self.PRSMODE = RM_Field_RAC_S_CTRL_PRSMODE(self)
        self.zz_fdict['PRSMODE'] = self.PRSMODE
        self.PRSCLR = RM_Field_RAC_S_CTRL_PRSCLR(self)
        self.zz_fdict['PRSCLR'] = self.PRSCLR
        self.TXPOSTPONE = RM_Field_RAC_S_CTRL_TXPOSTPONE(self)
        self.zz_fdict['TXPOSTPONE'] = self.TXPOSTPONE
        self.ACTIVEPOL = RM_Field_RAC_S_CTRL_ACTIVEPOL(self)
        self.zz_fdict['ACTIVEPOL'] = self.ACTIVEPOL
        self.PAENPOL = RM_Field_RAC_S_CTRL_PAENPOL(self)
        self.zz_fdict['PAENPOL'] = self.PAENPOL
        self.LNAENPOL = RM_Field_RAC_S_CTRL_LNAENPOL(self)
        self.zz_fdict['LNAENPOL'] = self.LNAENPOL
        self.PRSRXDIS = RM_Field_RAC_S_CTRL_PRSRXDIS(self)
        self.zz_fdict['PRSRXDIS'] = self.PRSRXDIS
        self.PRSFORCETX = RM_Field_RAC_S_CTRL_PRSFORCETX(self)
        self.zz_fdict['PRSFORCETX'] = self.PRSFORCETX
        self.SEQRESET = RM_Field_RAC_S_CTRL_SEQRESET(self)
        self.zz_fdict['SEQRESET'] = self.SEQRESET
        self.EXITSHUTDOWNDIS = RM_Field_RAC_S_CTRL_EXITSHUTDOWNDIS(self)
        self.zz_fdict['EXITSHUTDOWNDIS'] = self.EXITSHUTDOWNDIS
        self.CPUWAITDIS = RM_Field_RAC_S_CTRL_CPUWAITDIS(self)
        self.zz_fdict['CPUWAITDIS'] = self.CPUWAITDIS
        self.SEQCLKDIS = RM_Field_RAC_S_CTRL_SEQCLKDIS(self)
        self.zz_fdict['SEQCLKDIS'] = self.SEQCLKDIS
        self.RXOFDIS = RM_Field_RAC_S_CTRL_RXOFDIS(self)
        self.zz_fdict['RXOFDIS'] = self.RXOFDIS
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_FORCESTATE(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_FORCESTATE, self).__init__(rmio, label,
            0xa8020000, 0x018,
            'FORCESTATE', 'RAC_S.FORCESTATE', 'read-write',
            u"",
            0x00000000, 0x0000000F,
            0x00001000, 0x00002000,
            0x00003000)

        self.FORCESTATE = RM_Field_RAC_S_FORCESTATE_FORCESTATE(self)
        self.zz_fdict['FORCESTATE'] = self.FORCESTATE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IF(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IF, self).__init__(rmio, label,
            0xa8020000, 0x01C,
            'IF', 'RAC_S.IF', 'read-write',
            u"",
            0x00000000, 0x00FF000F,
            0x00001000, 0x00002000,
            0x00003000)

        self.STATECHANGE = RM_Field_RAC_S_IF_STATECHANGE(self)
        self.zz_fdict['STATECHANGE'] = self.STATECHANGE
        self.STIMCMPEV = RM_Field_RAC_S_IF_STIMCMPEV(self)
        self.zz_fdict['STIMCMPEV'] = self.STIMCMPEV
        self.SEQLOCKUP = RM_Field_RAC_S_IF_SEQLOCKUP(self)
        self.zz_fdict['SEQLOCKUP'] = self.SEQLOCKUP
        self.SEQRESETREQ = RM_Field_RAC_S_IF_SEQRESETREQ(self)
        self.zz_fdict['SEQRESETREQ'] = self.SEQRESETREQ
        self.SEQ = RM_Field_RAC_S_IF_SEQ(self)
        self.zz_fdict['SEQ'] = self.SEQ
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IEN, self).__init__(rmio, label,
            0xa8020000, 0x020,
            'IEN', 'RAC_S.IEN', 'read-write',
            u"",
            0x00000000, 0x00FF000F,
            0x00001000, 0x00002000,
            0x00003000)

        self.STATECHANGE = RM_Field_RAC_S_IEN_STATECHANGE(self)
        self.zz_fdict['STATECHANGE'] = self.STATECHANGE
        self.STIMCMPEV = RM_Field_RAC_S_IEN_STIMCMPEV(self)
        self.zz_fdict['STIMCMPEV'] = self.STIMCMPEV
        self.SEQLOCKUP = RM_Field_RAC_S_IEN_SEQLOCKUP(self)
        self.zz_fdict['SEQLOCKUP'] = self.SEQLOCKUP
        self.SEQRESETREQ = RM_Field_RAC_S_IEN_SEQRESETREQ(self)
        self.zz_fdict['SEQRESETREQ'] = self.SEQRESETREQ
        self.SEQ = RM_Field_RAC_S_IEN_SEQ(self)
        self.zz_fdict['SEQ'] = self.SEQ
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_TESTCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_TESTCTRL, self).__init__(rmio, label,
            0xa8020000, 0x024,
            'TESTCTRL', 'RAC_S.TESTCTRL', 'read-write',
            u"",
            0x00000000, 0x00000003,
            0x00001000, 0x00002000,
            0x00003000)

        self.MODEN = RM_Field_RAC_S_TESTCTRL_MODEN(self)
        self.zz_fdict['MODEN'] = self.MODEN
        self.DEMODEN = RM_Field_RAC_S_TESTCTRL_DEMODEN(self)
        self.zz_fdict['DEMODEN'] = self.DEMODEN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SEQIF(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SEQIF, self).__init__(rmio, label,
            0xa8020000, 0x028,
            'SEQIF', 'RAC_S.SEQIF', 'read-write',
            u"",
            0x00000000, 0x3FFF000F,
            0x00001000, 0x00002000,
            0x00003000)

        self.STATECHANGESEQ = RM_Field_RAC_S_SEQIF_STATECHANGESEQ(self)
        self.zz_fdict['STATECHANGESEQ'] = self.STATECHANGESEQ
        self.STIMCMPEVSEQ = RM_Field_RAC_S_SEQIF_STIMCMPEVSEQ(self)
        self.zz_fdict['STIMCMPEVSEQ'] = self.STIMCMPEVSEQ
        self.DEMODRXREQCLRSEQ = RM_Field_RAC_S_SEQIF_DEMODRXREQCLRSEQ(self)
        self.zz_fdict['DEMODRXREQCLRSEQ'] = self.DEMODRXREQCLRSEQ
        self.PRSEVENTSEQ = RM_Field_RAC_S_SEQIF_PRSEVENTSEQ(self)
        self.zz_fdict['PRSEVENTSEQ'] = self.PRSEVENTSEQ
        self.STATEOFF = RM_Field_RAC_S_SEQIF_STATEOFF(self)
        self.zz_fdict['STATEOFF'] = self.STATEOFF
        self.STATERXWARM = RM_Field_RAC_S_SEQIF_STATERXWARM(self)
        self.zz_fdict['STATERXWARM'] = self.STATERXWARM
        self.STATERXSEARCH = RM_Field_RAC_S_SEQIF_STATERXSEARCH(self)
        self.zz_fdict['STATERXSEARCH'] = self.STATERXSEARCH
        self.STATERXFRAME = RM_Field_RAC_S_SEQIF_STATERXFRAME(self)
        self.zz_fdict['STATERXFRAME'] = self.STATERXFRAME
        self.STATERXPD = RM_Field_RAC_S_SEQIF_STATERXPD(self)
        self.zz_fdict['STATERXPD'] = self.STATERXPD
        self.STATERX2RX = RM_Field_RAC_S_SEQIF_STATERX2RX(self)
        self.zz_fdict['STATERX2RX'] = self.STATERX2RX
        self.STATERXOVERFLOW = RM_Field_RAC_S_SEQIF_STATERXOVERFLOW(self)
        self.zz_fdict['STATERXOVERFLOW'] = self.STATERXOVERFLOW
        self.STATERX2TX = RM_Field_RAC_S_SEQIF_STATERX2TX(self)
        self.zz_fdict['STATERX2TX'] = self.STATERX2TX
        self.STATETXWARM = RM_Field_RAC_S_SEQIF_STATETXWARM(self)
        self.zz_fdict['STATETXWARM'] = self.STATETXWARM
        self.STATETX = RM_Field_RAC_S_SEQIF_STATETX(self)
        self.zz_fdict['STATETX'] = self.STATETX
        self.STATETXPD = RM_Field_RAC_S_SEQIF_STATETXPD(self)
        self.zz_fdict['STATETXPD'] = self.STATETXPD
        self.STATETX2RX = RM_Field_RAC_S_SEQIF_STATETX2RX(self)
        self.zz_fdict['STATETX2RX'] = self.STATETX2RX
        self.STATETX2TX = RM_Field_RAC_S_SEQIF_STATETX2TX(self)
        self.zz_fdict['STATETX2TX'] = self.STATETX2TX
        self.STATESHUTDOWN = RM_Field_RAC_S_SEQIF_STATESHUTDOWN(self)
        self.zz_fdict['STATESHUTDOWN'] = self.STATESHUTDOWN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SEQIEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SEQIEN, self).__init__(rmio, label,
            0xa8020000, 0x02C,
            'SEQIEN', 'RAC_S.SEQIEN', 'read-write',
            u"",
            0x00000000, 0x3FFF000F,
            0x00001000, 0x00002000,
            0x00003000)

        self.STATECHANGESEQ = RM_Field_RAC_S_SEQIEN_STATECHANGESEQ(self)
        self.zz_fdict['STATECHANGESEQ'] = self.STATECHANGESEQ
        self.STIMCMPEVSEQ = RM_Field_RAC_S_SEQIEN_STIMCMPEVSEQ(self)
        self.zz_fdict['STIMCMPEVSEQ'] = self.STIMCMPEVSEQ
        self.DEMODRXREQCLRSEQ = RM_Field_RAC_S_SEQIEN_DEMODRXREQCLRSEQ(self)
        self.zz_fdict['DEMODRXREQCLRSEQ'] = self.DEMODRXREQCLRSEQ
        self.PRSEVENTSEQ = RM_Field_RAC_S_SEQIEN_PRSEVENTSEQ(self)
        self.zz_fdict['PRSEVENTSEQ'] = self.PRSEVENTSEQ
        self.STATEOFF = RM_Field_RAC_S_SEQIEN_STATEOFF(self)
        self.zz_fdict['STATEOFF'] = self.STATEOFF
        self.STATERXWARM = RM_Field_RAC_S_SEQIEN_STATERXWARM(self)
        self.zz_fdict['STATERXWARM'] = self.STATERXWARM
        self.STATERXSEARCH = RM_Field_RAC_S_SEQIEN_STATERXSEARCH(self)
        self.zz_fdict['STATERXSEARCH'] = self.STATERXSEARCH
        self.STATERXFRAME = RM_Field_RAC_S_SEQIEN_STATERXFRAME(self)
        self.zz_fdict['STATERXFRAME'] = self.STATERXFRAME
        self.STATERXPD = RM_Field_RAC_S_SEQIEN_STATERXPD(self)
        self.zz_fdict['STATERXPD'] = self.STATERXPD
        self.STATERX2RX = RM_Field_RAC_S_SEQIEN_STATERX2RX(self)
        self.zz_fdict['STATERX2RX'] = self.STATERX2RX
        self.STATERXOVERFLOW = RM_Field_RAC_S_SEQIEN_STATERXOVERFLOW(self)
        self.zz_fdict['STATERXOVERFLOW'] = self.STATERXOVERFLOW
        self.STATERX2TX = RM_Field_RAC_S_SEQIEN_STATERX2TX(self)
        self.zz_fdict['STATERX2TX'] = self.STATERX2TX
        self.STATETXWARM = RM_Field_RAC_S_SEQIEN_STATETXWARM(self)
        self.zz_fdict['STATETXWARM'] = self.STATETXWARM
        self.STATETX = RM_Field_RAC_S_SEQIEN_STATETX(self)
        self.zz_fdict['STATETX'] = self.STATETX
        self.STATETXPD = RM_Field_RAC_S_SEQIEN_STATETXPD(self)
        self.zz_fdict['STATETXPD'] = self.STATETXPD
        self.STATETX2RX = RM_Field_RAC_S_SEQIEN_STATETX2RX(self)
        self.zz_fdict['STATETX2RX'] = self.STATETX2RX
        self.STATETX2TX = RM_Field_RAC_S_SEQIEN_STATETX2TX(self)
        self.zz_fdict['STATETX2TX'] = self.STATETX2TX
        self.STATESHUTDOWN = RM_Field_RAC_S_SEQIEN_STATESHUTDOWN(self)
        self.zz_fdict['STATESHUTDOWN'] = self.STATESHUTDOWN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_STATUS1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_STATUS1, self).__init__(rmio, label,
            0xa8020000, 0x030,
            'STATUS1', 'RAC_S.STATUS1', 'read-only',
            u"",
            0x00000000, 0x000000FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.TXMASK = RM_Field_RAC_S_STATUS1_TXMASK(self)
        self.zz_fdict['TXMASK'] = self.TXMASK
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_STIMER(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_STIMER, self).__init__(rmio, label,
            0xa8020000, 0x034,
            'STIMER', 'RAC_S.STIMER', 'read-only',
            u"",
            0x00000000, 0x0000FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.STIMER = RM_Field_RAC_S_STIMER_STIMER(self)
        self.zz_fdict['STIMER'] = self.STIMER
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_STIMERCOMP(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_STIMERCOMP, self).__init__(rmio, label,
            0xa8020000, 0x038,
            'STIMERCOMP', 'RAC_S.STIMERCOMP', 'read-write',
            u"",
            0x00000000, 0x0000FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.STIMERCOMP = RM_Field_RAC_S_STIMERCOMP_STIMERCOMP(self)
        self.zz_fdict['STIMERCOMP'] = self.STIMERCOMP
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SEQCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SEQCTRL, self).__init__(rmio, label,
            0xa8020000, 0x03C,
            'SEQCTRL', 'RAC_S.SEQCTRL', 'read-write',
            u"",
            0x00000000, 0x0300007F,
            0x00001000, 0x00002000,
            0x00003000)

        self.COMPACT = RM_Field_RAC_S_SEQCTRL_COMPACT(self)
        self.zz_fdict['COMPACT'] = self.COMPACT
        self.COMPINVALMODE = RM_Field_RAC_S_SEQCTRL_COMPINVALMODE(self)
        self.zz_fdict['COMPINVALMODE'] = self.COMPINVALMODE
        self.RELATIVE = RM_Field_RAC_S_SEQCTRL_RELATIVE(self)
        self.zz_fdict['RELATIVE'] = self.RELATIVE
        self.STIMERALWAYSRUN = RM_Field_RAC_S_SEQCTRL_STIMERALWAYSRUN(self)
        self.zz_fdict['STIMERALWAYSRUN'] = self.STIMERALWAYSRUN
        self.STIMERDEBUGRUN = RM_Field_RAC_S_SEQCTRL_STIMERDEBUGRUN(self)
        self.zz_fdict['STIMERDEBUGRUN'] = self.STIMERDEBUGRUN
        self.STATEDEBUGRUN = RM_Field_RAC_S_SEQCTRL_STATEDEBUGRUN(self)
        self.zz_fdict['STATEDEBUGRUN'] = self.STATEDEBUGRUN
        self.SWIRQ = RM_Field_RAC_S_SEQCTRL_SWIRQ(self)
        self.zz_fdict['SWIRQ'] = self.SWIRQ
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PRESC(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PRESC, self).__init__(rmio, label,
            0xa8020000, 0x040,
            'PRESC', 'RAC_S.PRESC', 'read-write',
            u"",
            0x00000007, 0x0000007F,
            0x00001000, 0x00002000,
            0x00003000)

        self.STIMER = RM_Field_RAC_S_PRESC_STIMER(self)
        self.zz_fdict['STIMER'] = self.STIMER
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SR0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SR0, self).__init__(rmio, label,
            0xa8020000, 0x044,
            'SR0', 'RAC_S.SR0', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SR0 = RM_Field_RAC_S_SR0_SR0(self)
        self.zz_fdict['SR0'] = self.SR0
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SR1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SR1, self).__init__(rmio, label,
            0xa8020000, 0x048,
            'SR1', 'RAC_S.SR1', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SR1 = RM_Field_RAC_S_SR1_SR1(self)
        self.zz_fdict['SR1'] = self.SR1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SR2(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SR2, self).__init__(rmio, label,
            0xa8020000, 0x04C,
            'SR2', 'RAC_S.SR2', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SR2 = RM_Field_RAC_S_SR2_SR2(self)
        self.zz_fdict['SR2'] = self.SR2
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SR3(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SR3, self).__init__(rmio, label,
            0xa8020000, 0x050,
            'SR3', 'RAC_S.SR3', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SR3 = RM_Field_RAC_S_SR3_SR3(self)
        self.zz_fdict['SR3'] = self.SR3
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_STCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_STCTRL, self).__init__(rmio, label,
            0xa8020000, 0x054,
            'STCTRL', 'RAC_S.STCTRL', 'read-write',
            u"",
            0x00000000, 0x01FFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.STCAL = RM_Field_RAC_S_STCTRL_STCAL(self)
        self.zz_fdict['STCAL'] = self.STCAL
        self.STSKEW = RM_Field_RAC_S_STCTRL_STSKEW(self)
        self.zz_fdict['STSKEW'] = self.STSKEW
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_FRCTXWORD(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_FRCTXWORD, self).__init__(rmio, label,
            0xa8020000, 0x058,
            'FRCTXWORD', 'RAC_S.FRCTXWORD', 'read-write',
            u"",
            0x00000000, 0x000000FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.WDATA = RM_Field_RAC_S_FRCTXWORD_WDATA(self)
        self.zz_fdict['WDATA'] = self.WDATA
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_FRCRXWORD(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_FRCRXWORD, self).__init__(rmio, label,
            0xa8020000, 0x05C,
            'FRCRXWORD', 'RAC_S.FRCRXWORD', 'read-only',
            u"",
            0x00000000, 0x000000FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.RDATA = RM_Field_RAC_S_FRCRXWORD_RDATA(self)
        self.zz_fdict['RDATA'] = self.RDATA
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_EM1PCSR(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_EM1PCSR, self).__init__(rmio, label,
            0xa8020000, 0x060,
            'EM1PCSR', 'RAC_S.EM1PCSR', 'read-write',
            u"",
            0x00000000, 0x00070033,
            0x00001000, 0x00002000,
            0x00003000)

        self.RADIOEM1PMODE = RM_Field_RAC_S_EM1PCSR_RADIOEM1PMODE(self)
        self.zz_fdict['RADIOEM1PMODE'] = self.RADIOEM1PMODE
        self.RADIOEM1PDISSWREQ = RM_Field_RAC_S_EM1PCSR_RADIOEM1PDISSWREQ(self)
        self.zz_fdict['RADIOEM1PDISSWREQ'] = self.RADIOEM1PDISSWREQ
        self.MCUEM1PMODE = RM_Field_RAC_S_EM1PCSR_MCUEM1PMODE(self)
        self.zz_fdict['MCUEM1PMODE'] = self.MCUEM1PMODE
        self.MCUEM1PDISSWREQ = RM_Field_RAC_S_EM1PCSR_MCUEM1PDISSWREQ(self)
        self.zz_fdict['MCUEM1PDISSWREQ'] = self.MCUEM1PDISSWREQ
        self.RADIOEM1PREQ = RM_Field_RAC_S_EM1PCSR_RADIOEM1PREQ(self)
        self.zz_fdict['RADIOEM1PREQ'] = self.RADIOEM1PREQ
        self.RADIOEM1PACK = RM_Field_RAC_S_EM1PCSR_RADIOEM1PACK(self)
        self.zz_fdict['RADIOEM1PACK'] = self.RADIOEM1PACK
        self.RADIOEM1PHWREQ = RM_Field_RAC_S_EM1PCSR_RADIOEM1PHWREQ(self)
        self.zz_fdict['RADIOEM1PHWREQ'] = self.RADIOEM1PHWREQ
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYNTHENCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYNTHENCTRL, self).__init__(rmio, label,
            0xa8020000, 0x098,
            'SYNTHENCTRL', 'RAC_S.SYNTHENCTRL', 'read-write',
            u"",
            0x00000000, 0x00100682,
            0x00001000, 0x00002000,
            0x00003000)

        self.VCOSTARTUP = RM_Field_RAC_S_SYNTHENCTRL_VCOSTARTUP(self)
        self.zz_fdict['VCOSTARTUP'] = self.VCOSTARTUP
        self.VCBUFEN = RM_Field_RAC_S_SYNTHENCTRL_VCBUFEN(self)
        self.zz_fdict['VCBUFEN'] = self.VCBUFEN
        self.SYNTHSTARTREQ = RM_Field_RAC_S_SYNTHENCTRL_SYNTHSTARTREQ(self)
        self.zz_fdict['SYNTHSTARTREQ'] = self.SYNTHSTARTREQ
        self.MMDPOWERBALANCEDISABLE = RM_Field_RAC_S_SYNTHENCTRL_MMDPOWERBALANCEDISABLE(self)
        self.zz_fdict['MMDPOWERBALANCEDISABLE'] = self.MMDPOWERBALANCEDISABLE
        self.LPFBWSEL = RM_Field_RAC_S_SYNTHENCTRL_LPFBWSEL(self)
        self.zz_fdict['LPFBWSEL'] = self.LPFBWSEL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYNTHREGCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYNTHREGCTRL, self).__init__(rmio, label,
            0xa8020000, 0x09C,
            'SYNTHREGCTRL', 'RAC_S.SYNTHREGCTRL', 'read-write',
            u"",
            0x04000000, 0x07001C00,
            0x00001000, 0x00002000,
            0x00003000)

        self.MMDLDOVREFTRIM = RM_Field_RAC_S_SYNTHREGCTRL_MMDLDOVREFTRIM(self)
        self.zz_fdict['MMDLDOVREFTRIM'] = self.MMDLDOVREFTRIM
        self.CHPLDOVREFTRIM = RM_Field_RAC_S_SYNTHREGCTRL_CHPLDOVREFTRIM(self)
        self.zz_fdict['CHPLDOVREFTRIM'] = self.CHPLDOVREFTRIM
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_VCOCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_VCOCTRL, self).__init__(rmio, label,
            0xa8020000, 0x0A0,
            'VCOCTRL', 'RAC_S.VCOCTRL', 'read-write',
            u"",
            0x0000044C, 0x00000FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.VCOAMPLITUDE = RM_Field_RAC_S_VCOCTRL_VCOAMPLITUDE(self)
        self.zz_fdict['VCOAMPLITUDE'] = self.VCOAMPLITUDE
        self.VCODETAMPLITUDERX = RM_Field_RAC_S_VCOCTRL_VCODETAMPLITUDERX(self)
        self.zz_fdict['VCODETAMPLITUDERX'] = self.VCODETAMPLITUDERX
        self.VCODETAMPLITUDETX = RM_Field_RAC_S_VCOCTRL_VCODETAMPLITUDETX(self)
        self.zz_fdict['VCODETAMPLITUDETX'] = self.VCODETAMPLITUDETX
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CHPCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CHPCTRL, self).__init__(rmio, label,
            0xa8020000, 0x0A4,
            'CHPCTRL', 'RAC_S.CHPCTRL', 'read-write',
            u"",
            0x00000000, 0x00004000,
            0x00001000, 0x00002000,
            0x00003000)

        self.CHPOUTPUTTRISTATEMODE = RM_Field_RAC_S_CHPCTRL_CHPOUTPUTTRISTATEMODE(self)
        self.zz_fdict['CHPOUTPUTTRISTATEMODE'] = self.CHPOUTPUTTRISTATEMODE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFSTATUS(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFSTATUS, self).__init__(rmio, label,
            0xa8020000, 0x0AC,
            'RFSTATUS', 'RAC_S.RFSTATUS', 'read-only',
            u"",
            0x00000000, 0x00000001,
            0x00001000, 0x00002000,
            0x00003000)

        self.MODRAMPUPDONE = RM_Field_RAC_S_RFSTATUS_MODRAMPUPDONE(self)
        self.zz_fdict['MODRAMPUPDONE'] = self.MODRAMPUPDONE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_STATUS2(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_STATUS2, self).__init__(rmio, label,
            0xa8020000, 0x0B0,
            'STATUS2', 'RAC_S.STATUS2', 'read-only',
            u"",
            0x00000000, 0x0000FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.PREVSTATE1 = RM_Field_RAC_S_STATUS2_PREVSTATE1(self)
        self.zz_fdict['PREVSTATE1'] = self.PREVSTATE1
        self.PREVSTATE2 = RM_Field_RAC_S_STATUS2_PREVSTATE2(self)
        self.zz_fdict['PREVSTATE2'] = self.PREVSTATE2
        self.PREVSTATE3 = RM_Field_RAC_S_STATUS2_PREVSTATE3(self)
        self.zz_fdict['PREVSTATE3'] = self.PREVSTATE3
        self.CURRSTATE = RM_Field_RAC_S_STATUS2_CURRSTATE(self)
        self.zz_fdict['CURRSTATE'] = self.CURRSTATE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IFPGACTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IFPGACTRL, self).__init__(rmio, label,
            0xa8020000, 0x0B4,
            'IFPGACTRL', 'RAC_S.IFPGACTRL', 'read-write',
            u"",
            0x00000000, 0x0FF80000,
            0x00001000, 0x00002000,
            0x00003000)

        self.DCCALON = RM_Field_RAC_S_IFPGACTRL_DCCALON(self)
        self.zz_fdict['DCCALON'] = self.DCCALON
        self.DCRSTEN = RM_Field_RAC_S_IFPGACTRL_DCRSTEN(self)
        self.zz_fdict['DCRSTEN'] = self.DCRSTEN
        self.DCESTIEN = RM_Field_RAC_S_IFPGACTRL_DCESTIEN(self)
        self.zz_fdict['DCESTIEN'] = self.DCESTIEN
        self.DCCALDEC0 = RM_Field_RAC_S_IFPGACTRL_DCCALDEC0(self)
        self.zz_fdict['DCCALDEC0'] = self.DCCALDEC0
        self.DCCALDCGEAR = RM_Field_RAC_S_IFPGACTRL_DCCALDCGEAR(self)
        self.zz_fdict['DCCALDCGEAR'] = self.DCCALDCGEAR
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PAENCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PAENCTRL, self).__init__(rmio, label,
            0xa8020000, 0x0B8,
            'PAENCTRL', 'RAC_S.PAENCTRL', 'read-write',
            u"",
            0x00000000, 0x00070100,
            0x00001000, 0x00002000,
            0x00003000)

        self.PARAMP = RM_Field_RAC_S_PAENCTRL_PARAMP(self)
        self.zz_fdict['PARAMP'] = self.PARAMP
        self.INVRAMPCLK = RM_Field_RAC_S_PAENCTRL_INVRAMPCLK(self)
        self.zz_fdict['INVRAMPCLK'] = self.INVRAMPCLK
        self.DIV2RAMPCLK = RM_Field_RAC_S_PAENCTRL_DIV2RAMPCLK(self)
        self.zz_fdict['DIV2RAMPCLK'] = self.DIV2RAMPCLK
        self.RSTDIV2RAMPCLK = RM_Field_RAC_S_PAENCTRL_RSTDIV2RAMPCLK(self)
        self.zz_fdict['RSTDIV2RAMPCLK'] = self.RSTDIV2RAMPCLK
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_APC(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_APC, self).__init__(rmio, label,
            0xa8020000, 0x0BC,
            'APC', 'RAC_S.APC', 'read-write',
            u"",
            0xFF000000, 0xFF000004,
            0x00001000, 0x00002000,
            0x00003000)

        self.ENAPCSW = RM_Field_RAC_S_APC_ENAPCSW(self)
        self.zz_fdict['ENAPCSW'] = self.ENAPCSW
        self.AMPCONTROLLIMITSW = RM_Field_RAC_S_APC_AMPCONTROLLIMITSW(self)
        self.zz_fdict['AMPCONTROLLIMITSW'] = self.AMPCONTROLLIMITSW
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_ANTDIV(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_ANTDIV, self).__init__(rmio, label,
            0xa8020000, 0x0C0,
            'ANTDIV', 'RAC_S.ANTDIV', 'read-write',
            u"",
            0x00000000, 0x00000FBD,
            0x00001000, 0x00002000,
            0x00003000)

        self.INTDIVLNAMIXEN0 = RM_Field_RAC_S_ANTDIV_INTDIVLNAMIXEN0(self)
        self.zz_fdict['INTDIVLNAMIXEN0'] = self.INTDIVLNAMIXEN0
        self.INTDIVLNAMIXRFATTDCEN0 = RM_Field_RAC_S_ANTDIV_INTDIVLNAMIXRFATTDCEN0(self)
        self.zz_fdict['INTDIVLNAMIXRFATTDCEN0'] = self.INTDIVLNAMIXRFATTDCEN0
        self.INTDIVLNAMIXRFPKDENRF0 = RM_Field_RAC_S_ANTDIV_INTDIVLNAMIXRFPKDENRF0(self)
        self.zz_fdict['INTDIVLNAMIXRFPKDENRF0'] = self.INTDIVLNAMIXRFPKDENRF0
        self.INTDIVSYLODIVRLO02G4EN = RM_Field_RAC_S_ANTDIV_INTDIVSYLODIVRLO02G4EN(self)
        self.zz_fdict['INTDIVSYLODIVRLO02G4EN'] = self.INTDIVSYLODIVRLO02G4EN
        self.INTDIVLNAMIXEN1 = RM_Field_RAC_S_ANTDIV_INTDIVLNAMIXEN1(self)
        self.zz_fdict['INTDIVLNAMIXEN1'] = self.INTDIVLNAMIXEN1
        self.INTDIVLNAMIXRFATTDCEN1 = RM_Field_RAC_S_ANTDIV_INTDIVLNAMIXRFATTDCEN1(self)
        self.zz_fdict['INTDIVLNAMIXRFATTDCEN1'] = self.INTDIVLNAMIXRFATTDCEN1
        self.INTDIVLNAMIXRFPKDENRF1 = RM_Field_RAC_S_ANTDIV_INTDIVLNAMIXRFPKDENRF1(self)
        self.zz_fdict['INTDIVLNAMIXRFPKDENRF1'] = self.INTDIVLNAMIXRFPKDENRF1
        self.INTDIVSYLODIVRLO12G4EN = RM_Field_RAC_S_ANTDIV_INTDIVSYLODIVRLO12G4EN(self)
        self.zz_fdict['INTDIVSYLODIVRLO12G4EN'] = self.INTDIVSYLODIVRLO12G4EN
        self.ANTDIVSTATUS = RM_Field_RAC_S_ANTDIV_ANTDIVSTATUS(self)
        self.zz_fdict['ANTDIVSTATUS'] = self.ANTDIVSTATUS
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AUXADCTRIM(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AUXADCTRIM, self).__init__(rmio, label,
            0xa8020000, 0x0C4,
            'AUXADCTRIM', 'RAC_S.AUXADCTRIM', 'read-write',
            u"",
            0x06D55502, 0x1FFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.AUXADCCLKINVERT = RM_Field_RAC_S_AUXADCTRIM_AUXADCCLKINVERT(self)
        self.zz_fdict['AUXADCCLKINVERT'] = self.AUXADCCLKINVERT
        self.AUXADCLDOVREFTRIM = RM_Field_RAC_S_AUXADCTRIM_AUXADCLDOVREFTRIM(self)
        self.zz_fdict['AUXADCLDOVREFTRIM'] = self.AUXADCLDOVREFTRIM
        self.AUXADCOUTPUTINVERT = RM_Field_RAC_S_AUXADCTRIM_AUXADCOUTPUTINVERT(self)
        self.zz_fdict['AUXADCOUTPUTINVERT'] = self.AUXADCOUTPUTINVERT
        self.AUXADCRCTUNE = RM_Field_RAC_S_AUXADCTRIM_AUXADCRCTUNE(self)
        self.zz_fdict['AUXADCRCTUNE'] = self.AUXADCRCTUNE
        self.AUXADCTRIMADCINPUTRES = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMADCINPUTRES(self)
        self.zz_fdict['AUXADCTRIMADCINPUTRES'] = self.AUXADCTRIMADCINPUTRES
        self.AUXADCTRIMCURRINPUTBUF = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMCURRINPUTBUF(self)
        self.zz_fdict['AUXADCTRIMCURRINPUTBUF'] = self.AUXADCTRIMCURRINPUTBUF
        self.AUXADCTRIMCURROPA1 = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMCURROPA1(self)
        self.zz_fdict['AUXADCTRIMCURROPA1'] = self.AUXADCTRIMCURROPA1
        self.AUXADCTRIMCURROPA2 = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMCURROPA2(self)
        self.zz_fdict['AUXADCTRIMCURROPA2'] = self.AUXADCTRIMCURROPA2
        self.AUXADCTRIMCURRREFBUF = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMCURRREFBUF(self)
        self.zz_fdict['AUXADCTRIMCURRREFBUF'] = self.AUXADCTRIMCURRREFBUF
        self.AUXADCTRIMCURRTSENSE = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMCURRTSENSE(self)
        self.zz_fdict['AUXADCTRIMCURRTSENSE'] = self.AUXADCTRIMCURRTSENSE
        self.AUXADCTRIMCURRVCMBUF = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMCURRVCMBUF(self)
        self.zz_fdict['AUXADCTRIMCURRVCMBUF'] = self.AUXADCTRIMCURRVCMBUF
        self.AUXADCTRIMLDOHIGHCURRENT = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMLDOHIGHCURRENT(self)
        self.zz_fdict['AUXADCTRIMLDOHIGHCURRENT'] = self.AUXADCTRIMLDOHIGHCURRENT
        self.AUXADCTRIMREFP = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMREFP(self)
        self.zz_fdict['AUXADCTRIMREFP'] = self.AUXADCTRIMREFP
        self.AUXADCTRIMVREFVCM = RM_Field_RAC_S_AUXADCTRIM_AUXADCTRIMVREFVCM(self)
        self.zz_fdict['AUXADCTRIMVREFVCM'] = self.AUXADCTRIMVREFVCM
        self.AUXADCTSENSETRIMVBE2 = RM_Field_RAC_S_AUXADCTRIM_AUXADCTSENSETRIMVBE2(self)
        self.zz_fdict['AUXADCTSENSETRIMVBE2'] = self.AUXADCTSENSETRIMVBE2
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AUXADCEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AUXADCEN, self).__init__(rmio, label,
            0xa8020000, 0x0C8,
            'AUXADCEN', 'RAC_S.AUXADCEN', 'read-write',
            u"",
            0x00000000, 0x000003FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.AUXADCENAUXADC = RM_Field_RAC_S_AUXADCEN_AUXADCENAUXADC(self)
        self.zz_fdict['AUXADCENAUXADC'] = self.AUXADCENAUXADC
        self.AUXADCENINPUTBUFFER = RM_Field_RAC_S_AUXADCEN_AUXADCENINPUTBUFFER(self)
        self.zz_fdict['AUXADCENINPUTBUFFER'] = self.AUXADCENINPUTBUFFER
        self.AUXADCENLDO = RM_Field_RAC_S_AUXADCEN_AUXADCENLDO(self)
        self.zz_fdict['AUXADCENLDO'] = self.AUXADCENLDO
        self.AUXADCENOUTPUTDRV = RM_Field_RAC_S_AUXADCEN_AUXADCENOUTPUTDRV(self)
        self.zz_fdict['AUXADCENOUTPUTDRV'] = self.AUXADCENOUTPUTDRV
        self.AUXADCENPMON = RM_Field_RAC_S_AUXADCEN_AUXADCENPMON(self)
        self.zz_fdict['AUXADCENPMON'] = self.AUXADCENPMON
        self.AUXADCENRESONDIAGA = RM_Field_RAC_S_AUXADCEN_AUXADCENRESONDIAGA(self)
        self.zz_fdict['AUXADCENRESONDIAGA'] = self.AUXADCENRESONDIAGA
        self.AUXADCENTSENSE = RM_Field_RAC_S_AUXADCEN_AUXADCENTSENSE(self)
        self.zz_fdict['AUXADCENTSENSE'] = self.AUXADCENTSENSE
        self.AUXADCENTSENSECAL = RM_Field_RAC_S_AUXADCEN_AUXADCENTSENSECAL(self)
        self.zz_fdict['AUXADCENTSENSECAL'] = self.AUXADCENTSENSECAL
        self.AUXADCINPUTBUFFERBYPASS = RM_Field_RAC_S_AUXADCEN_AUXADCINPUTBUFFERBYPASS(self)
        self.zz_fdict['AUXADCINPUTBUFFERBYPASS'] = self.AUXADCINPUTBUFFERBYPASS
        self.AUXADCENMEASTHERMISTOR = RM_Field_RAC_S_AUXADCEN_AUXADCENMEASTHERMISTOR(self)
        self.zz_fdict['AUXADCENMEASTHERMISTOR'] = self.AUXADCENMEASTHERMISTOR
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AUXADCCTRL0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AUXADCCTRL0, self).__init__(rmio, label,
            0xa8020000, 0x0CC,
            'AUXADCCTRL0', 'RAC_S.AUXADCCTRL0', 'read-write',
            u"",
            0x00000100, 0x00003FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.CYCLES = RM_Field_RAC_S_AUXADCCTRL0_CYCLES(self)
        self.zz_fdict['CYCLES'] = self.CYCLES
        self.MUXSEL = RM_Field_RAC_S_AUXADCCTRL0_MUXSEL(self)
        self.zz_fdict['MUXSEL'] = self.MUXSEL
        self.CLRCOUNTER = RM_Field_RAC_S_AUXADCCTRL0_CLRCOUNTER(self)
        self.zz_fdict['CLRCOUNTER'] = self.CLRCOUNTER
        self.CLRFILTER = RM_Field_RAC_S_AUXADCCTRL0_CLRFILTER(self)
        self.zz_fdict['CLRFILTER'] = self.CLRFILTER
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AUXADCCTRL1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AUXADCCTRL1, self).__init__(rmio, label,
            0xa8020000, 0x0D0,
            'AUXADCCTRL1', 'RAC_S.AUXADCCTRL1', 'read-write',
            u"",
            0x00000000, 0xF31F0FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.AUXADCINPUTRESSEL = RM_Field_RAC_S_AUXADCCTRL1_AUXADCINPUTRESSEL(self)
        self.zz_fdict['AUXADCINPUTRESSEL'] = self.AUXADCINPUTRESSEL
        self.AUXADCINPUTSELECT = RM_Field_RAC_S_AUXADCCTRL1_AUXADCINPUTSELECT(self)
        self.zz_fdict['AUXADCINPUTSELECT'] = self.AUXADCINPUTSELECT
        self.AUXADCPMONSELECT = RM_Field_RAC_S_AUXADCCTRL1_AUXADCPMONSELECT(self)
        self.zz_fdict['AUXADCPMONSELECT'] = self.AUXADCPMONSELECT
        self.AUXADCTSENSESELCURR = RM_Field_RAC_S_AUXADCCTRL1_AUXADCTSENSESELCURR(self)
        self.zz_fdict['AUXADCTSENSESELCURR'] = self.AUXADCTSENSESELCURR
        self.AUXADCRESET = RM_Field_RAC_S_AUXADCCTRL1_AUXADCRESET(self)
        self.zz_fdict['AUXADCRESET'] = self.AUXADCRESET
        self.AUXADCTSENSESELVBE = RM_Field_RAC_S_AUXADCCTRL1_AUXADCTSENSESELVBE(self)
        self.zz_fdict['AUXADCTSENSESELVBE'] = self.AUXADCTSENSESELVBE
        self.AUXADCTHERMISTORFREQSEL = RM_Field_RAC_S_AUXADCCTRL1_AUXADCTHERMISTORFREQSEL(self)
        self.zz_fdict['AUXADCTHERMISTORFREQSEL'] = self.AUXADCTHERMISTORFREQSEL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AUXADCOUT(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AUXADCOUT, self).__init__(rmio, label,
            0xa8020000, 0x0D4,
            'AUXADCOUT', 'RAC_S.AUXADCOUT', 'read-only',
            u"",
            0x00000000, 0x0FFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.AUXADCOUT = RM_Field_RAC_S_AUXADCOUT_AUXADCOUT(self)
        self.zz_fdict['AUXADCOUT'] = self.AUXADCOUT
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CLKMULTEN0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CLKMULTEN0, self).__init__(rmio, label,
            0xa8020000, 0x0D8,
            'CLKMULTEN0', 'RAC_S.CLKMULTEN0', 'read-write',
            u"",
            0xAA400005, 0xFFDFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.CLKMULTBWCAL = RM_Field_RAC_S_CLKMULTEN0_CLKMULTBWCAL(self)
        self.zz_fdict['CLKMULTBWCAL'] = self.CLKMULTBWCAL
        self.CLKMULTDISICO = RM_Field_RAC_S_CLKMULTEN0_CLKMULTDISICO(self)
        self.zz_fdict['CLKMULTDISICO'] = self.CLKMULTDISICO
        self.CLKMULTENBBDET = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENBBDET(self)
        self.zz_fdict['CLKMULTENBBDET'] = self.CLKMULTENBBDET
        self.CLKMULTENBBXLDET = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENBBXLDET(self)
        self.zz_fdict['CLKMULTENBBXLDET'] = self.CLKMULTENBBXLDET
        self.CLKMULTENBBXMDET = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENBBXMDET(self)
        self.zz_fdict['CLKMULTENBBXMDET'] = self.CLKMULTENBBXMDET
        self.CLKMULTENCFDET = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENCFDET(self)
        self.zz_fdict['CLKMULTENCFDET'] = self.CLKMULTENCFDET
        self.CLKMULTENDITHER = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDITHER(self)
        self.zz_fdict['CLKMULTENDITHER'] = self.CLKMULTENDITHER
        self.CLKMULTENDRVADC = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDRVADC(self)
        self.zz_fdict['CLKMULTENDRVADC'] = self.CLKMULTENDRVADC
        self.CLKMULTENDRVN = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDRVN(self)
        self.zz_fdict['CLKMULTENDRVN'] = self.CLKMULTENDRVN
        self.CLKMULTENDRVP = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDRVP(self)
        self.zz_fdict['CLKMULTENDRVP'] = self.CLKMULTENDRVP
        self.CLKMULTENDRVRX2P4G = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDRVRX2P4G(self)
        self.zz_fdict['CLKMULTENDRVRX2P4G'] = self.CLKMULTENDRVRX2P4G
        self.CLKMULTENDRVRXSUBG = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDRVRXSUBG(self)
        self.zz_fdict['CLKMULTENDRVRXSUBG'] = self.CLKMULTENDRVRXSUBG
        self.CLKMULTENDRVTXDUALB = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENDRVTXDUALB(self)
        self.zz_fdict['CLKMULTENDRVTXDUALB'] = self.CLKMULTENDRVTXDUALB
        self.CLKMULTENFBDIV = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENFBDIV(self)
        self.zz_fdict['CLKMULTENFBDIV'] = self.CLKMULTENFBDIV
        self.CLKMULTENREFDIV = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENREFDIV(self)
        self.zz_fdict['CLKMULTENREFDIV'] = self.CLKMULTENREFDIV
        self.CLKMULTENREG1 = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENREG1(self)
        self.zz_fdict['CLKMULTENREG1'] = self.CLKMULTENREG1
        self.CLKMULTENREG2 = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENREG2(self)
        self.zz_fdict['CLKMULTENREG2'] = self.CLKMULTENREG2
        self.CLKMULTENREG3 = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENREG3(self)
        self.zz_fdict['CLKMULTENREG3'] = self.CLKMULTENREG3
        self.CLKMULTENROTDET = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENROTDET(self)
        self.zz_fdict['CLKMULTENROTDET'] = self.CLKMULTENROTDET
        self.CLKMULTENBYPASS40MHZ = RM_Field_RAC_S_CLKMULTEN0_CLKMULTENBYPASS40MHZ(self)
        self.zz_fdict['CLKMULTENBYPASS40MHZ'] = self.CLKMULTENBYPASS40MHZ
        self.CLKMULTFREQCAL = RM_Field_RAC_S_CLKMULTEN0_CLKMULTFREQCAL(self)
        self.zz_fdict['CLKMULTFREQCAL'] = self.CLKMULTFREQCAL
        self.CLKMULTREG2ADJI = RM_Field_RAC_S_CLKMULTEN0_CLKMULTREG2ADJI(self)
        self.zz_fdict['CLKMULTREG2ADJI'] = self.CLKMULTREG2ADJI
        self.CLKMULTREG1ADJV = RM_Field_RAC_S_CLKMULTEN0_CLKMULTREG1ADJV(self)
        self.zz_fdict['CLKMULTREG1ADJV'] = self.CLKMULTREG1ADJV
        self.CLKMULTREG2ADJV = RM_Field_RAC_S_CLKMULTEN0_CLKMULTREG2ADJV(self)
        self.zz_fdict['CLKMULTREG2ADJV'] = self.CLKMULTREG2ADJV
        self.CLKMULTREG3ADJV = RM_Field_RAC_S_CLKMULTEN0_CLKMULTREG3ADJV(self)
        self.zz_fdict['CLKMULTREG3ADJV'] = self.CLKMULTREG3ADJV
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CLKMULTEN1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CLKMULTEN1, self).__init__(rmio, label,
            0xa8020000, 0x0DC,
            'CLKMULTEN1', 'RAC_S.CLKMULTEN1', 'read-write',
            u"",
            0x00000188, 0x0001FDEF,
            0x00001000, 0x00002000,
            0x00003000)

        self.CLKMULTINNIBBLE = RM_Field_RAC_S_CLKMULTEN1_CLKMULTINNIBBLE(self)
        self.zz_fdict['CLKMULTINNIBBLE'] = self.CLKMULTINNIBBLE
        self.CLKMULTLDFNIB = RM_Field_RAC_S_CLKMULTEN1_CLKMULTLDFNIB(self)
        self.zz_fdict['CLKMULTLDFNIB'] = self.CLKMULTLDFNIB
        self.CLKMULTLDMNIB = RM_Field_RAC_S_CLKMULTEN1_CLKMULTLDMNIB(self)
        self.zz_fdict['CLKMULTLDMNIB'] = self.CLKMULTLDMNIB
        self.CLKMULTRDNIBBLE = RM_Field_RAC_S_CLKMULTEN1_CLKMULTRDNIBBLE(self)
        self.zz_fdict['CLKMULTRDNIBBLE'] = self.CLKMULTRDNIBBLE
        self.CLKMULTLDCNIB = RM_Field_RAC_S_CLKMULTEN1_CLKMULTLDCNIB(self)
        self.zz_fdict['CLKMULTLDCNIB'] = self.CLKMULTLDCNIB
        self.CLKMULTDRVAMPSEL = RM_Field_RAC_S_CLKMULTEN1_CLKMULTDRVAMPSEL(self)
        self.zz_fdict['CLKMULTDRVAMPSEL'] = self.CLKMULTDRVAMPSEL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CLKMULTCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CLKMULTCTRL, self).__init__(rmio, label,
            0xa8020000, 0x0E0,
            'CLKMULTCTRL', 'RAC_S.CLKMULTCTRL', 'read-write',
            u"",
            0x000000C0, 0x00007FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.CLKMULTDIVN = RM_Field_RAC_S_CLKMULTCTRL_CLKMULTDIVN(self)
        self.zz_fdict['CLKMULTDIVN'] = self.CLKMULTDIVN
        self.CLKMULTDIVR = RM_Field_RAC_S_CLKMULTCTRL_CLKMULTDIVR(self)
        self.zz_fdict['CLKMULTDIVR'] = self.CLKMULTDIVR
        self.CLKMULTDIVX = RM_Field_RAC_S_CLKMULTCTRL_CLKMULTDIVX(self)
        self.zz_fdict['CLKMULTDIVX'] = self.CLKMULTDIVX
        self.CLKMULTENRESYNC = RM_Field_RAC_S_CLKMULTCTRL_CLKMULTENRESYNC(self)
        self.zz_fdict['CLKMULTENRESYNC'] = self.CLKMULTENRESYNC
        self.CLKMULTVALID = RM_Field_RAC_S_CLKMULTCTRL_CLKMULTVALID(self)
        self.zz_fdict['CLKMULTVALID'] = self.CLKMULTVALID
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_CLKMULTSTATUS(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_CLKMULTSTATUS, self).__init__(rmio, label,
            0xa8020000, 0x0E4,
            'CLKMULTSTATUS', 'RAC_S.CLKMULTSTATUS', 'read-only',
            u"",
            0x00000000, 0x0000001F,
            0x00001000, 0x00002000,
            0x00003000)

        self.CLKMULTOUTNIBBLE = RM_Field_RAC_S_CLKMULTSTATUS_CLKMULTOUTNIBBLE(self)
        self.zz_fdict['CLKMULTOUTNIBBLE'] = self.CLKMULTOUTNIBBLE
        self.CLKMULTACKVALID = RM_Field_RAC_S_CLKMULTSTATUS_CLKMULTACKVALID(self)
        self.zz_fdict['CLKMULTACKVALID'] = self.CLKMULTACKVALID
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IFADCDBG(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IFADCDBG, self).__init__(rmio, label,
            0xa8020000, 0x0E8,
            'IFADCDBG', 'RAC_S.IFADCDBG', 'read-write',
            u"",
            0x0000000E, 0x0000007F,
            0x00001000, 0x00002000,
            0x00003000)

        self.IFADCENADC = RM_Field_RAC_S_IFADCDBG_IFADCENADC(self)
        self.zz_fdict['IFADCENADC'] = self.IFADCENADC
        self.IFADCENCLK = RM_Field_RAC_S_IFADCDBG_IFADCENCLK(self)
        self.zz_fdict['IFADCENCLK'] = self.IFADCENCLK
        self.IFADCENREFBUF = RM_Field_RAC_S_IFADCDBG_IFADCENREFBUF(self)
        self.zz_fdict['IFADCENREFBUF'] = self.IFADCENREFBUF
        self.IFADCENSIDETONE = RM_Field_RAC_S_IFADCDBG_IFADCENSIDETONE(self)
        self.zz_fdict['IFADCENSIDETONE'] = self.IFADCENSIDETONE
        self.IFADCINVERTCLK = RM_Field_RAC_S_IFADCDBG_IFADCINVERTCLK(self)
        self.zz_fdict['IFADCINVERTCLK'] = self.IFADCINVERTCLK
        self.IFADCSHORTINPUT = RM_Field_RAC_S_IFADCDBG_IFADCSHORTINPUT(self)
        self.zz_fdict['IFADCSHORTINPUT'] = self.IFADCSHORTINPUT
        self.IFADCDISABLECLK = RM_Field_RAC_S_IFADCDBG_IFADCDISABLECLK(self)
        self.zz_fdict['IFADCDISABLECLK'] = self.IFADCDISABLECLK
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IFADCTRIM0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IFADCTRIM0, self).__init__(rmio, label,
            0xa8020000, 0x0EC,
            'IFADCTRIM0', 'RAC_S.IFADCTRIM0', 'read-write',
            u"",
            0x11512C6C, 0x7FFFFFFD,
            0x00001000, 0x00002000,
            0x00003000)

        self.IFADCCLKSEL = RM_Field_RAC_S_IFADCTRIM0_IFADCCLKSEL(self)
        self.zz_fdict['IFADCCLKSEL'] = self.IFADCCLKSEL
        self.IFADCLDOSERIESAMPLVL = RM_Field_RAC_S_IFADCTRIM0_IFADCLDOSERIESAMPLVL(self)
        self.zz_fdict['IFADCLDOSERIESAMPLVL'] = self.IFADCLDOSERIESAMPLVL
        self.IFADCLDOSHUNTAMPLVL1 = RM_Field_RAC_S_IFADCTRIM0_IFADCLDOSHUNTAMPLVL1(self)
        self.zz_fdict['IFADCLDOSHUNTAMPLVL1'] = self.IFADCLDOSHUNTAMPLVL1
        self.IFADCLDOSHUNTAMPLVL2 = RM_Field_RAC_S_IFADCTRIM0_IFADCLDOSHUNTAMPLVL2(self)
        self.zz_fdict['IFADCLDOSHUNTAMPLVL2'] = self.IFADCLDOSHUNTAMPLVL2
        self.IFADCLDOSHUNTCURLVL1 = RM_Field_RAC_S_IFADCTRIM0_IFADCLDOSHUNTCURLVL1(self)
        self.zz_fdict['IFADCLDOSHUNTCURLVL1'] = self.IFADCLDOSHUNTCURLVL1
        self.IFADCLDOSHUNTCURLVL2 = RM_Field_RAC_S_IFADCTRIM0_IFADCLDOSHUNTCURLVL2(self)
        self.zz_fdict['IFADCLDOSHUNTCURLVL2'] = self.IFADCLDOSHUNTCURLVL2
        self.IFADCOTACURRENT = RM_Field_RAC_S_IFADCTRIM0_IFADCOTACURRENT(self)
        self.zz_fdict['IFADCOTACURRENT'] = self.IFADCOTACURRENT
        self.IFADCREFBUFAMPLVL = RM_Field_RAC_S_IFADCTRIM0_IFADCREFBUFAMPLVL(self)
        self.zz_fdict['IFADCREFBUFAMPLVL'] = self.IFADCREFBUFAMPLVL
        self.IFADCREFBUFCURLVL = RM_Field_RAC_S_IFADCTRIM0_IFADCREFBUFCURLVL(self)
        self.zz_fdict['IFADCREFBUFCURLVL'] = self.IFADCREFBUFCURLVL
        self.IFADCSIDETONEAMP = RM_Field_RAC_S_IFADCTRIM0_IFADCSIDETONEAMP(self)
        self.zz_fdict['IFADCSIDETONEAMP'] = self.IFADCSIDETONEAMP
        self.IFADCSIDETONEFREQ = RM_Field_RAC_S_IFADCTRIM0_IFADCSIDETONEFREQ(self)
        self.zz_fdict['IFADCSIDETONEFREQ'] = self.IFADCSIDETONEFREQ
        self.IFADCENHALFMODE = RM_Field_RAC_S_IFADCTRIM0_IFADCENHALFMODE(self)
        self.zz_fdict['IFADCENHALFMODE'] = self.IFADCENHALFMODE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IFADCTRIM1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IFADCTRIM1, self).__init__(rmio, label,
            0xa8020000, 0x0F0,
            'IFADCTRIM1', 'RAC_S.IFADCTRIM1', 'read-write',
            u"",
            0x00000123, 0x000001FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.IFADCVCMLVL = RM_Field_RAC_S_IFADCTRIM1_IFADCVCMLVL(self)
        self.zz_fdict['IFADCVCMLVL'] = self.IFADCVCMLVL
        self.IFADCENNEGRES = RM_Field_RAC_S_IFADCTRIM1_IFADCENNEGRES(self)
        self.zz_fdict['IFADCENNEGRES'] = self.IFADCENNEGRES
        self.IFADCNEGRESCURRENT = RM_Field_RAC_S_IFADCTRIM1_IFADCNEGRESCURRENT(self)
        self.zz_fdict['IFADCNEGRESCURRENT'] = self.IFADCNEGRESCURRENT
        self.IFADCNEGRESVCM = RM_Field_RAC_S_IFADCTRIM1_IFADCNEGRESVCM(self)
        self.zz_fdict['IFADCNEGRESVCM'] = self.IFADCNEGRESVCM
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IFADCCAL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IFADCCAL, self).__init__(rmio, label,
            0xa8020000, 0x0F4,
            'IFADCCAL', 'RAC_S.IFADCCAL', 'read-write',
            u"",
            0x00000C00, 0x00FF1F03,
            0x00001000, 0x00002000,
            0x00003000)

        self.IFADCENRCCAL = RM_Field_RAC_S_IFADCCAL_IFADCENRCCAL(self)
        self.zz_fdict['IFADCENRCCAL'] = self.IFADCENRCCAL
        self.IFADCTUNERCCALMODE = RM_Field_RAC_S_IFADCCAL_IFADCTUNERCCALMODE(self)
        self.zz_fdict['IFADCTUNERCCALMODE'] = self.IFADCTUNERCCALMODE
        self.IFADCTUNERC = RM_Field_RAC_S_IFADCCAL_IFADCTUNERC(self)
        self.zz_fdict['IFADCTUNERC'] = self.IFADCTUNERC
        self.IFADCRCCALCOUNTERSTARTVAL = RM_Field_RAC_S_IFADCCAL_IFADCRCCALCOUNTERSTARTVAL(self)
        self.zz_fdict['IFADCRCCALCOUNTERSTARTVAL'] = self.IFADCRCCALCOUNTERSTARTVAL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_IFADCSTATUS(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_IFADCSTATUS, self).__init__(rmio, label,
            0xa8020000, 0x0F8,
            'IFADCSTATUS', 'RAC_S.IFADCSTATUS', 'read-only',
            u"",
            0x00000000, 0x00000001,
            0x00001000, 0x00002000,
            0x00003000)

        self.IFADCRCCALOUT = RM_Field_RAC_S_IFADCSTATUS_IFADCRCCALOUT(self)
        self.zz_fdict['IFADCRCCALOUT'] = self.IFADCRCCALOUT
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXDEBUG(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXDEBUG, self).__init__(rmio, label,
            0xa8020000, 0x0FC,
            'LNAMIXDEBUG', 'RAC_S.LNAMIXDEBUG', 'read-write',
            u"",
            0x00000000, 0x00000003,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXDISMXR0 = RM_Field_RAC_S_LNAMIXDEBUG_LNAMIXDISMXR0(self)
        self.zz_fdict['LNAMIXDISMXR0'] = self.LNAMIXDISMXR0
        self.LNAMIXDISMXR1 = RM_Field_RAC_S_LNAMIXDEBUG_LNAMIXDISMXR1(self)
        self.zz_fdict['LNAMIXDISMXR1'] = self.LNAMIXDISMXR1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXTRIM0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXTRIM0, self).__init__(rmio, label,
            0xa8020000, 0x100,
            'LNAMIXTRIM0', 'RAC_S.LNAMIXTRIM0', 'read-write',
            u"",
            0x00000110, 0x000001FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXCAPSEL0 = RM_Field_RAC_S_LNAMIXTRIM0_LNAMIXCAPSEL0(self)
        self.zz_fdict['LNAMIXCAPSEL0'] = self.LNAMIXCAPSEL0
        self.LNAMIXMXRBIAS0 = RM_Field_RAC_S_LNAMIXTRIM0_LNAMIXMXRBIAS0(self)
        self.zz_fdict['LNAMIXMXRBIAS0'] = self.LNAMIXMXRBIAS0
        self.LNAMIXVOUTADJ0 = RM_Field_RAC_S_LNAMIXTRIM0_LNAMIXVOUTADJ0(self)
        self.zz_fdict['LNAMIXVOUTADJ0'] = self.LNAMIXVOUTADJ0
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXTRIM1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXTRIM1, self).__init__(rmio, label,
            0xa8020000, 0x104,
            'LNAMIXTRIM1', 'RAC_S.LNAMIXTRIM1', 'read-write',
            u"",
            0x00000110, 0x000001FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXCAPSEL1 = RM_Field_RAC_S_LNAMIXTRIM1_LNAMIXCAPSEL1(self)
        self.zz_fdict['LNAMIXCAPSEL1'] = self.LNAMIXCAPSEL1
        self.LNAMIXMXRBIAS1 = RM_Field_RAC_S_LNAMIXTRIM1_LNAMIXMXRBIAS1(self)
        self.zz_fdict['LNAMIXMXRBIAS1'] = self.LNAMIXMXRBIAS1
        self.LNAMIXVOUTADJ1 = RM_Field_RAC_S_LNAMIXTRIM1_LNAMIXVOUTADJ1(self)
        self.zz_fdict['LNAMIXVOUTADJ1'] = self.LNAMIXVOUTADJ1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXTRIM2(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXTRIM2, self).__init__(rmio, label,
            0xa8020000, 0x108,
            'LNAMIXTRIM2', 'RAC_S.LNAMIXTRIM2', 'read-write',
            u"",
            0x545033D0, 0x7FF8FFF0,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXCURCTRL = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXCURCTRL(self)
        self.zz_fdict['LNAMIXCURCTRL'] = self.LNAMIXCURCTRL
        self.LNAMIXHIGHCUR = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXHIGHCUR(self)
        self.zz_fdict['LNAMIXHIGHCUR'] = self.LNAMIXHIGHCUR
        self.LNAMIXLOWCUR = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXLOWCUR(self)
        self.zz_fdict['LNAMIXLOWCUR'] = self.LNAMIXLOWCUR
        self.LNAMIXNCASADJ0 = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXNCASADJ0(self)
        self.zz_fdict['LNAMIXNCASADJ0'] = self.LNAMIXNCASADJ0
        self.LNAMIXPCASADJ0 = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXPCASADJ0(self)
        self.zz_fdict['LNAMIXPCASADJ0'] = self.LNAMIXPCASADJ0
        self.LNAMIXTRIMVREG = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXTRIMVREG(self)
        self.zz_fdict['LNAMIXTRIMVREG'] = self.LNAMIXTRIMVREG
        self.LNAMIXNCASADJ1 = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXNCASADJ1(self)
        self.zz_fdict['LNAMIXNCASADJ1'] = self.LNAMIXNCASADJ1
        self.LNAMIXPCASADJ1 = RM_Field_RAC_S_LNAMIXTRIM2_LNAMIXPCASADJ1(self)
        self.zz_fdict['LNAMIXPCASADJ1'] = self.LNAMIXPCASADJ1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXTRIM3(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXTRIM3, self).__init__(rmio, label,
            0xa8020000, 0x10C,
            'LNAMIXTRIM3', 'RAC_S.LNAMIXTRIM3', 'read-write',
            u"",
            0x00000208, 0x00000FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXIBIASADJ0 = RM_Field_RAC_S_LNAMIXTRIM3_LNAMIXIBIASADJ0(self)
        self.zz_fdict['LNAMIXIBIASADJ0'] = self.LNAMIXIBIASADJ0
        self.LNAMIXIBIASADJ1 = RM_Field_RAC_S_LNAMIXTRIM3_LNAMIXIBIASADJ1(self)
        self.zz_fdict['LNAMIXIBIASADJ1'] = self.LNAMIXIBIASADJ1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXTRIM4(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXTRIM4, self).__init__(rmio, label,
            0xa8020000, 0x110,
            'LNAMIXTRIM4', 'RAC_S.LNAMIXTRIM4', 'read-write',
            u"",
            0x88082002, 0xFF0FFF03,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXRFPKDBWSEL = RM_Field_RAC_S_LNAMIXTRIM4_LNAMIXRFPKDBWSEL(self)
        self.zz_fdict['LNAMIXRFPKDBWSEL'] = self.LNAMIXRFPKDBWSEL
        self.LNAMIXRFPKDCALCMLO = RM_Field_RAC_S_LNAMIXTRIM4_LNAMIXRFPKDCALCMLO(self)
        self.zz_fdict['LNAMIXRFPKDCALCMLO'] = self.LNAMIXRFPKDCALCMLO
        self.LNAMIXRFPKDCALCMHI = RM_Field_RAC_S_LNAMIXTRIM4_LNAMIXRFPKDCALCMHI(self)
        self.zz_fdict['LNAMIXRFPKDCALCMHI'] = self.LNAMIXRFPKDCALCMHI
        self.LNAMIXRFPKDTHRESHSELLO = RM_Field_RAC_S_LNAMIXTRIM4_LNAMIXRFPKDTHRESHSELLO(self)
        self.zz_fdict['LNAMIXRFPKDTHRESHSELLO'] = self.LNAMIXRFPKDTHRESHSELLO
        self.LNAMIXRFPKDTHRESHSELHI = RM_Field_RAC_S_LNAMIXTRIM4_LNAMIXRFPKDTHRESHSELHI(self)
        self.zz_fdict['LNAMIXRFPKDTHRESHSELHI'] = self.LNAMIXRFPKDTHRESHSELHI
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXCAL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXCAL, self).__init__(rmio, label,
            0xa8020000, 0x114,
            'LNAMIXCAL', 'RAC_S.LNAMIXCAL', 'read-write',
            u"",
            0x000007E0, 0x000007FD,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXCALEN = RM_Field_RAC_S_LNAMIXCAL_LNAMIXCALEN(self)
        self.zz_fdict['LNAMIXCALEN'] = self.LNAMIXCALEN
        self.LNAMIXCALVMODE = RM_Field_RAC_S_LNAMIXCAL_LNAMIXCALVMODE(self)
        self.zz_fdict['LNAMIXCALVMODE'] = self.LNAMIXCALVMODE
        self.LNAMIXENIRCAL0 = RM_Field_RAC_S_LNAMIXCAL_LNAMIXENIRCAL0(self)
        self.zz_fdict['LNAMIXENIRCAL0'] = self.LNAMIXENIRCAL0
        self.LNAMIXENIRCAL1 = RM_Field_RAC_S_LNAMIXCAL_LNAMIXENIRCAL1(self)
        self.zz_fdict['LNAMIXENIRCAL1'] = self.LNAMIXENIRCAL1
        self.LNAMIXIRCALAMP0 = RM_Field_RAC_S_LNAMIXCAL_LNAMIXIRCALAMP0(self)
        self.zz_fdict['LNAMIXIRCALAMP0'] = self.LNAMIXIRCALAMP0
        self.LNAMIXIRCALAMP1 = RM_Field_RAC_S_LNAMIXCAL_LNAMIXIRCALAMP1(self)
        self.zz_fdict['LNAMIXIRCALAMP1'] = self.LNAMIXIRCALAMP1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_LNAMIXEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_LNAMIXEN, self).__init__(rmio, label,
            0xa8020000, 0x118,
            'LNAMIXEN', 'RAC_S.LNAMIXEN', 'read-write',
            u"",
            0x00000000, 0x00000008,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXENLDO = RM_Field_RAC_S_LNAMIXEN_LNAMIXENLDO(self)
        self.zz_fdict['LNAMIXENLDO'] = self.LNAMIXENLDO
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PRECTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PRECTRL, self).__init__(rmio, label,
            0xa8020000, 0x11C,
            'PRECTRL', 'RAC_S.PRECTRL', 'read-write',
            u"",
            0x00000026, 0x0000003F,
            0x00001000, 0x00002000,
            0x00003000)

        self.PREBYPFORCE = RM_Field_RAC_S_PRECTRL_PREBYPFORCE(self)
        self.zz_fdict['PREBYPFORCE'] = self.PREBYPFORCE
        self.PREREGTRIM = RM_Field_RAC_S_PRECTRL_PREREGTRIM(self)
        self.zz_fdict['PREREGTRIM'] = self.PREREGTRIM
        self.PREVREFTRIM = RM_Field_RAC_S_PRECTRL_PREVREFTRIM(self)
        self.zz_fdict['PREVREFTRIM'] = self.PREVREFTRIM
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PATRIM0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PATRIM0, self).__init__(rmio, label,
            0xa8020000, 0x120,
            'PATRIM0', 'RAC_S.PATRIM0', 'read-write',
            u"",
            0x00000077, 0x0101FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.TX0DBMTRIMBIASN = RM_Field_RAC_S_PATRIM0_TX0DBMTRIMBIASN(self)
        self.zz_fdict['TX0DBMTRIMBIASN'] = self.TX0DBMTRIMBIASN
        self.TX0DBMTRIMBIASP = RM_Field_RAC_S_PATRIM0_TX0DBMTRIMBIASP(self)
        self.zz_fdict['TX0DBMTRIMBIASP'] = self.TX0DBMTRIMBIASP
        self.TXPAAMPCTRL = RM_Field_RAC_S_PATRIM0_TXPAAMPCTRL(self)
        self.zz_fdict['TXPAAMPCTRL'] = self.TXPAAMPCTRL
        self.TXPABYPASSREG = RM_Field_RAC_S_PATRIM0_TXPABYPASSREG(self)
        self.zz_fdict['TXPABYPASSREG'] = self.TXPABYPASSREG
        self.ENAMPCTRLREG = RM_Field_RAC_S_PATRIM0_ENAMPCTRLREG(self)
        self.zz_fdict['ENAMPCTRLREG'] = self.ENAMPCTRLREG
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PATRIM1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PATRIM1, self).__init__(rmio, label,
            0xa8020000, 0x124,
            'PATRIM1', 'RAC_S.PATRIM1', 'read-write',
            u"",
            0x03034373, 0x0777F3F7,
            0x00001000, 0x00002000,
            0x00003000)

        self.TX0DBMTRIMPREDRVREGIBCORE = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMPREDRVREGIBCORE(self)
        self.zz_fdict['TX0DBMTRIMPREDRVREGIBCORE'] = self.TX0DBMTRIMPREDRVREGIBCORE
        self.TX0DBMTRIMPREDRVREGPSR = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMPREDRVREGPSR(self)
        self.zz_fdict['TX0DBMTRIMPREDRVREGPSR'] = self.TX0DBMTRIMPREDRVREGPSR
        self.TX0DBMTRIMPREDRVREGIBNDIO = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMPREDRVREGIBNDIO(self)
        self.zz_fdict['TX0DBMTRIMPREDRVREGIBNDIO'] = self.TX0DBMTRIMPREDRVREGIBNDIO
        self.TX0DBMTRIMPREDRVSLOPE = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMPREDRVSLOPE(self)
        self.zz_fdict['TX0DBMTRIMPREDRVSLOPE'] = self.TX0DBMTRIMPREDRVSLOPE
        self.TX0DBMTRIMREGFB = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMREGFB(self)
        self.zz_fdict['TX0DBMTRIMREGFB'] = self.TX0DBMTRIMREGFB
        self.TX0DBMTRIMREGVREF = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMREGVREF(self)
        self.zz_fdict['TX0DBMTRIMREGVREF'] = self.TX0DBMTRIMREGVREF
        self.TX0DBMTRIMTAPCAP100F = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMTAPCAP100F(self)
        self.zz_fdict['TX0DBMTRIMTAPCAP100F'] = self.TX0DBMTRIMTAPCAP100F
        self.TX0DBMTRIMTAPCAP200F = RM_Field_RAC_S_PATRIM1_TX0DBMTRIMTAPCAP200F(self)
        self.zz_fdict['TX0DBMTRIMTAPCAP200F'] = self.TX0DBMTRIMTAPCAP200F
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PATRIM2(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PATRIM2, self).__init__(rmio, label,
            0xa8020000, 0x128,
            'PATRIM2', 'RAC_S.PATRIM2', 'read-write',
            u"",
            0x00000000, 0x00007777,
            0x00001000, 0x00002000,
            0x00003000)

        self.TX0DBMTRIMDUTYCYN = RM_Field_RAC_S_PATRIM2_TX0DBMTRIMDUTYCYN(self)
        self.zz_fdict['TX0DBMTRIMDUTYCYN'] = self.TX0DBMTRIMDUTYCYN
        self.TX0DBMTRIMDUTYCYP = RM_Field_RAC_S_PATRIM2_TX0DBMTRIMDUTYCYP(self)
        self.zz_fdict['TX0DBMTRIMDUTYCYP'] = self.TX0DBMTRIMDUTYCYP
        self.TXPATRIM10DBMDUTYCYN = RM_Field_RAC_S_PATRIM2_TXPATRIM10DBMDUTYCYN(self)
        self.zz_fdict['TXPATRIM10DBMDUTYCYN'] = self.TXPATRIM10DBMDUTYCYN
        self.TXPATRIM10DBMDUTYCYP = RM_Field_RAC_S_PATRIM2_TXPATRIM10DBMDUTYCYP(self)
        self.zz_fdict['TXPATRIM10DBMDUTYCYP'] = self.TXPATRIM10DBMDUTYCYP
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PATRIM3(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PATRIM3, self).__init__(rmio, label,
            0xa8020000, 0x12C,
            'PATRIM3', 'RAC_S.PATRIM3', 'read-write',
            u"",
            0x008D33AA, 0x00FF73FE,
            0x00001000, 0x00002000,
            0x00003000)

        self.TXPATRIMBLEEDAUTOREG = RM_Field_RAC_S_PATRIM3_TXPATRIMBLEEDAUTOREG(self)
        self.zz_fdict['TXPATRIMBLEEDAUTOREG'] = self.TXPATRIMBLEEDAUTOREG
        self.TXPATRIMIBIASMASTER = RM_Field_RAC_S_PATRIM3_TXPATRIMIBIASMASTER(self)
        self.zz_fdict['TXPATRIMIBIASMASTER'] = self.TXPATRIMIBIASMASTER
        self.TXPATRIMPREDRVREGFB = RM_Field_RAC_S_PATRIM3_TXPATRIMPREDRVREGFB(self)
        self.zz_fdict['TXPATRIMPREDRVREGFB'] = self.TXPATRIMPREDRVREGFB
        self.TXPATRIMPREDRVREGFBKATT = RM_Field_RAC_S_PATRIM3_TXPATRIMPREDRVREGFBKATT(self)
        self.zz_fdict['TXPATRIMPREDRVREGFBKATT'] = self.TXPATRIMPREDRVREGFBKATT
        self.TXPATRIMPREDRVREGPSR = RM_Field_RAC_S_PATRIM3_TXPATRIMPREDRVREGPSR(self)
        self.zz_fdict['TXPATRIMPREDRVREGPSR'] = self.TXPATRIMPREDRVREGPSR
        self.TXPATRIMPREDRVREGSLICES = RM_Field_RAC_S_PATRIM3_TXPATRIMPREDRVREGSLICES(self)
        self.zz_fdict['TXPATRIMPREDRVREGSLICES'] = self.TXPATRIMPREDRVREGSLICES
        self.TXPATRIMPREDRVREGVREF = RM_Field_RAC_S_PATRIM3_TXPATRIMPREDRVREGVREF(self)
        self.zz_fdict['TXPATRIMPREDRVREGVREF'] = self.TXPATRIMPREDRVREGVREF
        self.TXPATRIMREGFB = RM_Field_RAC_S_PATRIM3_TXPATRIMREGFB(self)
        self.zz_fdict['TXPATRIMREGFB'] = self.TXPATRIMREGFB
        self.TXPATRIMREGPSR = RM_Field_RAC_S_PATRIM3_TXPATRIMREGPSR(self)
        self.zz_fdict['TXPATRIMREGPSR'] = self.TXPATRIMREGPSR
        self.TXPATRIMREGVREF = RM_Field_RAC_S_PATRIM3_TXPATRIMREGVREF(self)
        self.zz_fdict['TXPATRIMREGVREF'] = self.TXPATRIMREGVREF
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PATRIM4(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PATRIM4, self).__init__(rmio, label,
            0xa8020000, 0x130,
            'PATRIM4', 'RAC_S.PATRIM4', 'read-write',
            u"",
            0x00006000, 0x03FFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.TXPATRIM10DBMCTAP = RM_Field_RAC_S_PATRIM4_TXPATRIM10DBMCTAP(self)
        self.zz_fdict['TXPATRIM10DBMCTAP'] = self.TXPATRIM10DBMCTAP
        self.TXPATRIM10DBMPREDRVCAP = RM_Field_RAC_S_PATRIM4_TXPATRIM10DBMPREDRVCAP(self)
        self.zz_fdict['TXPATRIM10DBMPREDRVCAP'] = self.TXPATRIM10DBMPREDRVCAP
        self.TXPATRIM10DBMPREDRVSLC = RM_Field_RAC_S_PATRIM4_TXPATRIM10DBMPREDRVSLC(self)
        self.zz_fdict['TXPATRIM10DBMPREDRVSLC'] = self.TXPATRIM10DBMPREDRVSLC
        self.TXPATRIM20DBMCTAP = RM_Field_RAC_S_PATRIM4_TXPATRIM20DBMCTAP(self)
        self.zz_fdict['TXPATRIM20DBMCTAP'] = self.TXPATRIM20DBMCTAP
        self.TXPATRIM20DBMPREDRV = RM_Field_RAC_S_PATRIM4_TXPATRIM20DBMPREDRV(self)
        self.zz_fdict['TXPATRIM20DBMPREDRV'] = self.TXPATRIM20DBMPREDRV
        self.TXPATRIMCAPPAOUTM = RM_Field_RAC_S_PATRIM4_TXPATRIMCAPPAOUTM(self)
        self.zz_fdict['TXPATRIMCAPPAOUTM'] = self.TXPATRIMCAPPAOUTM
        self.TXPATRIMCAPPAOUTP = RM_Field_RAC_S_PATRIM4_TXPATRIMCAPPAOUTP(self)
        self.zz_fdict['TXPATRIMCAPPAOUTP'] = self.TXPATRIMCAPPAOUTP
        self.TXPATRIMCMGAIN = RM_Field_RAC_S_PATRIM4_TXPATRIMCMGAIN(self)
        self.zz_fdict['TXPATRIMCMGAIN'] = self.TXPATRIMCMGAIN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PATRIM5(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PATRIM5, self).__init__(rmio, label,
            0xa8020000, 0x134,
            'PATRIM5', 'RAC_S.PATRIM5', 'read-write',
            u"",
            0x00181800, 0x033F3F7F,
            0x00001000, 0x00002000,
            0x00003000)

        self.TXPATRIMDACGLITCH = RM_Field_RAC_S_PATRIM5_TXPATRIMDACGLITCH(self)
        self.zz_fdict['TXPATRIMDACGLITCH'] = self.TXPATRIMDACGLITCH
        self.TXPATRIMDLY0 = RM_Field_RAC_S_PATRIM5_TXPATRIMDLY0(self)
        self.zz_fdict['TXPATRIMDLY0'] = self.TXPATRIMDLY0
        self.TXPATRIMDLY1 = RM_Field_RAC_S_PATRIM5_TXPATRIMDLY1(self)
        self.zz_fdict['TXPATRIMDLY1'] = self.TXPATRIMDLY1
        self.TXPATRIMNBIAS = RM_Field_RAC_S_PATRIM5_TXPATRIMNBIAS(self)
        self.zz_fdict['TXPATRIMNBIAS'] = self.TXPATRIMNBIAS
        self.TXPATRIMNCASC = RM_Field_RAC_S_PATRIM5_TXPATRIMNCASC(self)
        self.zz_fdict['TXPATRIMNCASC'] = self.TXPATRIMNCASC
        self.TXPATRIMPBIAS = RM_Field_RAC_S_PATRIM5_TXPATRIMPBIAS(self)
        self.zz_fdict['TXPATRIMPBIAS'] = self.TXPATRIMPBIAS
        self.TXPATRIMPCASC = RM_Field_RAC_S_PATRIM5_TXPATRIMPCASC(self)
        self.zz_fdict['TXPATRIMPCASC'] = self.TXPATRIMPCASC
        self.TXPATRIMREGSLICES = RM_Field_RAC_S_PATRIM5_TXPATRIMREGSLICES(self)
        self.zz_fdict['TXPATRIMREGSLICES'] = self.TXPATRIMREGSLICES
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_TXPOWER(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_TXPOWER, self).__init__(rmio, label,
            0xa8020000, 0x13C,
            'TXPOWER', 'RAC_S.TXPOWER', 'read-write',
            u"",
            0x00000010, 0x0000003F,
            0x00001000, 0x00002000,
            0x00003000)

        self.TX0DBMPOWER = RM_Field_RAC_S_TXPOWER_TX0DBMPOWER(self)
        self.zz_fdict['TX0DBMPOWER'] = self.TX0DBMPOWER
        self.TX0DBMSELSLICE = RM_Field_RAC_S_TXPOWER_TX0DBMSELSLICE(self)
        self.zz_fdict['TX0DBMSELSLICE'] = self.TX0DBMSELSLICE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_TXRAMP(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_TXRAMP, self).__init__(rmio, label,
            0xa8020000, 0x140,
            'TXRAMP', 'RAC_S.TXRAMP', 'read-write',
            u"",
            0x00000000, 0x00000001,
            0x00001000, 0x00002000,
            0x00003000)

        self.PARAMPMODE = RM_Field_RAC_S_TXRAMP_PARAMPMODE(self)
        self.zz_fdict['PARAMPMODE'] = self.PARAMPMODE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PGATRIM(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PGATRIM, self).__init__(rmio, label,
            0xa8020000, 0x148,
            'PGATRIM', 'RAC_S.PGATRIM', 'read-write',
            u"",
            0x00000B15, 0x00000FDF,
            0x00001000, 0x00002000,
            0x00003000)

        self.PGACTUNE = RM_Field_RAC_S_PGATRIM_PGACTUNE(self)
        self.zz_fdict['PGACTUNE'] = self.PGACTUNE
        self.PGAVCMOUTTRIM = RM_Field_RAC_S_PGATRIM_PGAVCMOUTTRIM(self)
        self.zz_fdict['PGAVCMOUTTRIM'] = self.PGAVCMOUTTRIM
        self.PGAVLDOTRIM = RM_Field_RAC_S_PGATRIM_PGAVLDOTRIM(self)
        self.zz_fdict['PGAVLDOTRIM'] = self.PGAVLDOTRIM
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PGACAL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PGACAL, self).__init__(rmio, label,
            0xa8020000, 0x14C,
            'PGACAL', 'RAC_S.PGACAL', 'read-write',
            u"",
            0x00002020, 0x00003F3F,
            0x00001000, 0x00002000,
            0x00003000)

        self.PGAOFFCALI = RM_Field_RAC_S_PGACAL_PGAOFFCALI(self)
        self.zz_fdict['PGAOFFCALI'] = self.PGAOFFCALI
        self.PGAOFFCALQ = RM_Field_RAC_S_PGACAL_PGAOFFCALQ(self)
        self.zz_fdict['PGAOFFCALQ'] = self.PGAOFFCALQ
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PGACTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PGACTRL, self).__init__(rmio, label,
            0xa8020000, 0x150,
            'PGACTRL', 'RAC_S.PGACTRL', 'read-write',
            u"",
            0x00008001, 0x01FFEFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.PGABWMODE = RM_Field_RAC_S_PGACTRL_PGABWMODE(self)
        self.zz_fdict['PGABWMODE'] = self.PGABWMODE
        self.PGAENGHZ = RM_Field_RAC_S_PGACTRL_PGAENGHZ(self)
        self.zz_fdict['PGAENGHZ'] = self.PGAENGHZ
        self.PGAENBIAS = RM_Field_RAC_S_PGACTRL_PGAENBIAS(self)
        self.zz_fdict['PGAENBIAS'] = self.PGAENBIAS
        self.PGAENLATCHI = RM_Field_RAC_S_PGACTRL_PGAENLATCHI(self)
        self.zz_fdict['PGAENLATCHI'] = self.PGAENLATCHI
        self.PGAENLATCHQ = RM_Field_RAC_S_PGACTRL_PGAENLATCHQ(self)
        self.zz_fdict['PGAENLATCHQ'] = self.PGAENLATCHQ
        self.PGAENLDOLOAD = RM_Field_RAC_S_PGACTRL_PGAENLDOLOAD(self)
        self.zz_fdict['PGAENLDOLOAD'] = self.PGAENLDOLOAD
        self.PGAENPGAI = RM_Field_RAC_S_PGACTRL_PGAENPGAI(self)
        self.zz_fdict['PGAENPGAI'] = self.PGAENPGAI
        self.PGAENPGAQ = RM_Field_RAC_S_PGACTRL_PGAENPGAQ(self)
        self.zz_fdict['PGAENPGAQ'] = self.PGAENPGAQ
        self.PGAENPKD = RM_Field_RAC_S_PGACTRL_PGAENPKD(self)
        self.zz_fdict['PGAENPKD'] = self.PGAENPKD
        self.PGAENSUBG = RM_Field_RAC_S_PGACTRL_PGAENSUBG(self)
        self.zz_fdict['PGAENSUBG'] = self.PGAENSUBG
        self.PGAPOWERMODE = RM_Field_RAC_S_PGACTRL_PGAPOWERMODE(self)
        self.zz_fdict['PGAPOWERMODE'] = self.PGAPOWERMODE
        self.PGATHRPKDLOSEL = RM_Field_RAC_S_PGACTRL_PGATHRPKDLOSEL(self)
        self.zz_fdict['PGATHRPKDLOSEL'] = self.PGATHRPKDLOSEL
        self.PGATHRPKDHISEL = RM_Field_RAC_S_PGACTRL_PGATHRPKDHISEL(self)
        self.zz_fdict['PGATHRPKDHISEL'] = self.PGATHRPKDHISEL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFBIASCAL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFBIASCAL, self).__init__(rmio, label,
            0xa8020000, 0x154,
            'RFBIASCAL', 'RAC_S.RFBIASCAL', 'read-write',
            u"",
            0x30201A20, 0x3F3F3F3F,
            0x00001000, 0x00002000,
            0x00003000)

        self.RFBIASCALBIAS = RM_Field_RAC_S_RFBIASCAL_RFBIASCALBIAS(self)
        self.zz_fdict['RFBIASCALBIAS'] = self.RFBIASCALBIAS
        self.RFBIASCALTC = RM_Field_RAC_S_RFBIASCAL_RFBIASCALTC(self)
        self.zz_fdict['RFBIASCALTC'] = self.RFBIASCALTC
        self.RFBIASCALVREF = RM_Field_RAC_S_RFBIASCAL_RFBIASCALVREF(self)
        self.zz_fdict['RFBIASCALVREF'] = self.RFBIASCALVREF
        self.RFBIASCALVREFSTARTUP = RM_Field_RAC_S_RFBIASCAL_RFBIASCALVREFSTARTUP(self)
        self.zz_fdict['RFBIASCALVREFSTARTUP'] = self.RFBIASCALVREFSTARTUP
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFBIASCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFBIASCTRL, self).__init__(rmio, label,
            0xa8020000, 0x158,
            'RFBIASCTRL', 'RAC_S.RFBIASCTRL', 'read-write',
            u"",
            0x00040000, 0x000F001F,
            0x00001000, 0x00002000,
            0x00003000)

        self.RFBIASDISABLEBOOTSTRAP = RM_Field_RAC_S_RFBIASCTRL_RFBIASDISABLEBOOTSTRAP(self)
        self.zz_fdict['RFBIASDISABLEBOOTSTRAP'] = self.RFBIASDISABLEBOOTSTRAP
        self.RFBIASLDOHIGHCURRENT = RM_Field_RAC_S_RFBIASCTRL_RFBIASLDOHIGHCURRENT(self)
        self.zz_fdict['RFBIASLDOHIGHCURRENT'] = self.RFBIASLDOHIGHCURRENT
        self.RFBIASNONFLASHMODE = RM_Field_RAC_S_RFBIASCTRL_RFBIASNONFLASHMODE(self)
        self.zz_fdict['RFBIASNONFLASHMODE'] = self.RFBIASNONFLASHMODE
        self.RFBIASSTARTUPCORE = RM_Field_RAC_S_RFBIASCTRL_RFBIASSTARTUPCORE(self)
        self.zz_fdict['RFBIASSTARTUPCORE'] = self.RFBIASSTARTUPCORE
        self.RFBIASSTARTUPSUPPLY = RM_Field_RAC_S_RFBIASCTRL_RFBIASSTARTUPSUPPLY(self)
        self.zz_fdict['RFBIASSTARTUPSUPPLY'] = self.RFBIASSTARTUPSUPPLY
        self.RFBIASLDOVREFTRIM = RM_Field_RAC_S_RFBIASCTRL_RFBIASLDOVREFTRIM(self)
        self.zz_fdict['RFBIASLDOVREFTRIM'] = self.RFBIASLDOVREFTRIM
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RADIOEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RADIOEN, self).__init__(rmio, label,
            0xa8020000, 0x15C,
            'RADIOEN', 'RAC_S.RADIOEN', 'read-write',
            u"",
            0x00000000, 0x00000007,
            0x00001000, 0x00002000,
            0x00003000)

        self.PREEN = RM_Field_RAC_S_RADIOEN_PREEN(self)
        self.zz_fdict['PREEN'] = self.PREEN
        self.PRESTB100UDIS = RM_Field_RAC_S_RADIOEN_PRESTB100UDIS(self)
        self.zz_fdict['PRESTB100UDIS'] = self.PRESTB100UDIS
        self.RFBIASEN = RM_Field_RAC_S_RADIOEN_RFBIASEN(self)
        self.zz_fdict['RFBIASEN'] = self.RFBIASEN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFPATHEN0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFPATHEN0, self).__init__(rmio, label,
            0xa8020000, 0x160,
            'RFPATHEN0', 'RAC_S.RFPATHEN0', 'read-write',
            u"",
            0x00000002, 0x0000004F,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXEN0 = RM_Field_RAC_S_RFPATHEN0_LNAMIXEN0(self)
        self.zz_fdict['LNAMIXEN0'] = self.LNAMIXEN0
        self.LNAMIXRFATTDCEN0 = RM_Field_RAC_S_RFPATHEN0_LNAMIXRFATTDCEN0(self)
        self.zz_fdict['LNAMIXRFATTDCEN0'] = self.LNAMIXRFATTDCEN0
        self.LNAMIXRFPKDENRF0 = RM_Field_RAC_S_RFPATHEN0_LNAMIXRFPKDENRF0(self)
        self.zz_fdict['LNAMIXRFPKDENRF0'] = self.LNAMIXRFPKDENRF0
        self.SYLODIVRLO02G4EN = RM_Field_RAC_S_RFPATHEN0_SYLODIVRLO02G4EN(self)
        self.zz_fdict['SYLODIVRLO02G4EN'] = self.SYLODIVRLO02G4EN
        self.LNAMIXTRSW0 = RM_Field_RAC_S_RFPATHEN0_LNAMIXTRSW0(self)
        self.zz_fdict['LNAMIXTRSW0'] = self.LNAMIXTRSW0
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFPATHEN1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFPATHEN1, self).__init__(rmio, label,
            0xa8020000, 0x164,
            'RFPATHEN1', 'RAC_S.RFPATHEN1', 'read-write',
            u"",
            0x00000002, 0x0000004F,
            0x00001000, 0x00002000,
            0x00003000)

        self.LNAMIXEN1 = RM_Field_RAC_S_RFPATHEN1_LNAMIXEN1(self)
        self.zz_fdict['LNAMIXEN1'] = self.LNAMIXEN1
        self.LNAMIXRFATTDCEN1 = RM_Field_RAC_S_RFPATHEN1_LNAMIXRFATTDCEN1(self)
        self.zz_fdict['LNAMIXRFATTDCEN1'] = self.LNAMIXRFATTDCEN1
        self.LNAMIXRFPKDENRF1 = RM_Field_RAC_S_RFPATHEN1_LNAMIXRFPKDENRF1(self)
        self.zz_fdict['LNAMIXRFPKDENRF1'] = self.LNAMIXRFPKDENRF1
        self.SYLODIVRLO12G4EN = RM_Field_RAC_S_RFPATHEN1_SYLODIVRLO12G4EN(self)
        self.zz_fdict['SYLODIVRLO12G4EN'] = self.SYLODIVRLO12G4EN
        self.LNAMIXTRSW1 = RM_Field_RAC_S_RFPATHEN1_LNAMIXTRSW1(self)
        self.zz_fdict['LNAMIXTRSW1'] = self.LNAMIXTRSW1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RX(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RX, self).__init__(rmio, label,
            0xa8020000, 0x168,
            'RX', 'RAC_S.RX', 'read-write',
            u"",
            0x00000020, 0x000703BF,
            0x00001000, 0x00002000,
            0x00003000)

        self.IFADCCAPRESET = RM_Field_RAC_S_RX_IFADCCAPRESET(self)
        self.zz_fdict['IFADCCAPRESET'] = self.IFADCCAPRESET
        self.IFADCENLDOSERIES = RM_Field_RAC_S_RX_IFADCENLDOSERIES(self)
        self.zz_fdict['IFADCENLDOSERIES'] = self.IFADCENLDOSERIES
        self.IFADCENLDOSHUNT = RM_Field_RAC_S_RX_IFADCENLDOSHUNT(self)
        self.zz_fdict['IFADCENLDOSHUNT'] = self.IFADCENLDOSHUNT
        self.LNAMIXENRFPKD = RM_Field_RAC_S_RX_LNAMIXENRFPKD(self)
        self.zz_fdict['LNAMIXENRFPKD'] = self.LNAMIXENRFPKD
        self.LNAMIXENRFPKDLOTHRESH = RM_Field_RAC_S_RX_LNAMIXENRFPKDLOTHRESH(self)
        self.zz_fdict['LNAMIXENRFPKDLOTHRESH'] = self.LNAMIXENRFPKDLOTHRESH
        self.LNAMIXLDOLOWCUR = RM_Field_RAC_S_RX_LNAMIXLDOLOWCUR(self)
        self.zz_fdict['LNAMIXLDOLOWCUR'] = self.LNAMIXLDOLOWCUR
        self.LNAMIXREGLOADEN = RM_Field_RAC_S_RX_LNAMIXREGLOADEN(self)
        self.zz_fdict['LNAMIXREGLOADEN'] = self.LNAMIXREGLOADEN
        self.PGAENLDO = RM_Field_RAC_S_RX_PGAENLDO(self)
        self.zz_fdict['PGAENLDO'] = self.PGAENLDO
        self.SYCHPQNC3EN = RM_Field_RAC_S_RX_SYCHPQNC3EN(self)
        self.zz_fdict['SYCHPQNC3EN'] = self.SYCHPQNC3EN
        self.SYCHPBIASTRIMBUFRX = RM_Field_RAC_S_RX_SYCHPBIASTRIMBUFRX(self)
        self.zz_fdict['SYCHPBIASTRIMBUFRX'] = self.SYCHPBIASTRIMBUFRX
        self.SYPFDCHPLPENRX = RM_Field_RAC_S_RX_SYPFDCHPLPENRX(self)
        self.zz_fdict['SYPFDCHPLPENRX'] = self.SYPFDCHPLPENRX
        self.SYPFDFPWENRX = RM_Field_RAC_S_RX_SYPFDFPWENRX(self)
        self.zz_fdict['SYPFDFPWENRX'] = self.SYPFDFPWENRX
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_TX(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_TX, self).__init__(rmio, label,
            0xa8020000, 0x16C,
            'TX', 'RAC_S.TX', 'read-write',
            u"",
            0x00000000, 0xFFFFF7EF,
            0x00001000, 0x00002000,
            0x00003000)

        self.TXPAENREG = RM_Field_RAC_S_TX_TXPAENREG(self)
        self.zz_fdict['TXPAENREG'] = self.TXPAENREG
        self.TXPAENRAMPCLK = RM_Field_RAC_S_TX_TXPAENRAMPCLK(self)
        self.zz_fdict['TXPAENRAMPCLK'] = self.TXPAENRAMPCLK
        self.TX0DBMENBLEEDREG = RM_Field_RAC_S_TX_TX0DBMENBLEEDREG(self)
        self.zz_fdict['TX0DBMENBLEEDREG'] = self.TX0DBMENBLEEDREG
        self.TX0DBMENREG = RM_Field_RAC_S_TX_TX0DBMENREG(self)
        self.zz_fdict['TX0DBMENREG'] = self.TX0DBMENREG
        self.TX0DBMENBIAS = RM_Field_RAC_S_TX_TX0DBMENBIAS(self)
        self.zz_fdict['TX0DBMENBIAS'] = self.TX0DBMENBIAS
        self.TX0DBMENPREDRV = RM_Field_RAC_S_TX_TX0DBMENPREDRV(self)
        self.zz_fdict['TX0DBMENPREDRV'] = self.TX0DBMENPREDRV
        self.TX0DBMENPREDRVREG = RM_Field_RAC_S_TX_TX0DBMENPREDRVREG(self)
        self.zz_fdict['TX0DBMENPREDRVREG'] = self.TX0DBMENPREDRVREG
        self.TX0DBMENPREDRVREGBIAS = RM_Field_RAC_S_TX_TX0DBMENPREDRVREGBIAS(self)
        self.zz_fdict['TX0DBMENPREDRVREGBIAS'] = self.TX0DBMENPREDRVREGBIAS
        self.TX0DBMENRAMPCLK = RM_Field_RAC_S_TX_TX0DBMENRAMPCLK(self)
        self.zz_fdict['TX0DBMENRAMPCLK'] = self.TX0DBMENRAMPCLK
        self.TX0DBMENBLEEDPREDRVREG = RM_Field_RAC_S_TX_TX0DBMENBLEEDPREDRVREG(self)
        self.zz_fdict['TX0DBMENBLEEDPREDRVREG'] = self.TX0DBMENBLEEDPREDRVREG
        self.TXPAENBLEEDPREDRVREG = RM_Field_RAC_S_TX_TXPAENBLEEDPREDRVREG(self)
        self.zz_fdict['TXPAENBLEEDPREDRVREG'] = self.TXPAENBLEEDPREDRVREG
        self.TXPAENBLEEDREG = RM_Field_RAC_S_TX_TXPAENBLEEDREG(self)
        self.zz_fdict['TXPAENBLEEDREG'] = self.TXPAENBLEEDREG
        self.TXPAENPAOUT = RM_Field_RAC_S_TX_TXPAENPAOUT(self)
        self.zz_fdict['TXPAENPAOUT'] = self.TXPAENPAOUT
        self.TXPAENPREDRVREG = RM_Field_RAC_S_TX_TXPAENPREDRVREG(self)
        self.zz_fdict['TXPAENPREDRVREG'] = self.TXPAENPREDRVREG
        self.SYCHPBIASTRIMBUFTX = RM_Field_RAC_S_TX_SYCHPBIASTRIMBUFTX(self)
        self.zz_fdict['SYCHPBIASTRIMBUFTX'] = self.SYCHPBIASTRIMBUFTX
        self.SYPFDCHPLPENTX = RM_Field_RAC_S_TX_SYPFDCHPLPENTX(self)
        self.zz_fdict['SYPFDCHPLPENTX'] = self.SYPFDCHPLPENTX
        self.SYPFDFPWENTX = RM_Field_RAC_S_TX_SYPFDFPWENTX(self)
        self.zz_fdict['SYPFDFPWENTX'] = self.SYPFDFPWENTX
        self.TXPAEN10DBM = RM_Field_RAC_S_TX_TXPAEN10DBM(self)
        self.zz_fdict['TXPAEN10DBM'] = self.TXPAEN10DBM
        self.TXPAEN10DBMMAINCTAP = RM_Field_RAC_S_TX_TXPAEN10DBMMAINCTAP(self)
        self.zz_fdict['TXPAEN10DBMMAINCTAP'] = self.TXPAEN10DBMMAINCTAP
        self.TXPAEN10DBMPREDRV = RM_Field_RAC_S_TX_TXPAEN10DBMPREDRV(self)
        self.zz_fdict['TXPAEN10DBMPREDRV'] = self.TXPAEN10DBMPREDRV
        self.TXPAEN10DBMVMID = RM_Field_RAC_S_TX_TXPAEN10DBMVMID(self)
        self.zz_fdict['TXPAEN10DBMVMID'] = self.TXPAEN10DBMVMID
        self.TXPAEN20DBM = RM_Field_RAC_S_TX_TXPAEN20DBM(self)
        self.zz_fdict['TXPAEN20DBM'] = self.TXPAEN20DBM
        self.TXPAEN20DBMMAINCTAP = RM_Field_RAC_S_TX_TXPAEN20DBMMAINCTAP(self)
        self.zz_fdict['TXPAEN20DBMMAINCTAP'] = self.TXPAEN20DBMMAINCTAP
        self.TXPAEN20DBMPREDRV = RM_Field_RAC_S_TX_TXPAEN20DBMPREDRV(self)
        self.zz_fdict['TXPAEN20DBMPREDRV'] = self.TXPAEN20DBMPREDRV
        self.TXPAEN20DBMVMID = RM_Field_RAC_S_TX_TXPAEN20DBMVMID(self)
        self.zz_fdict['TXPAEN20DBMVMID'] = self.TXPAEN20DBMVMID
        self.TXPAEN20DBMVBIASHF = RM_Field_RAC_S_TX_TXPAEN20DBMVBIASHF(self)
        self.zz_fdict['TXPAEN20DBMVBIASHF'] = self.TXPAEN20DBMVBIASHF
        self.TXPATRIM20DBMVBIASHF = RM_Field_RAC_S_TX_TXPATRIM20DBMVBIASHF(self)
        self.zz_fdict['TXPATRIM20DBMVBIASHF'] = self.TXPATRIM20DBMVBIASHF
        self.ENPAPOWER = RM_Field_RAC_S_TX_ENPAPOWER(self)
        self.zz_fdict['ENPAPOWER'] = self.ENPAPOWER
        self.ENPASELSLICE = RM_Field_RAC_S_TX_ENPASELSLICE(self)
        self.zz_fdict['ENPASELSLICE'] = self.ENPASELSLICE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYDEBUG(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYDEBUG, self).__init__(rmio, label,
            0xa8020000, 0x170,
            'SYDEBUG', 'RAC_S.SYDEBUG', 'read-write',
            u"",
            0x00000020, 0x00000177,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYCHPSWITCHEDBIASEN = RM_Field_RAC_S_SYDEBUG_SYCHPSWITCHEDBIASEN(self)
        self.zz_fdict['SYCHPSWITCHEDBIASEN'] = self.SYCHPSWITCHEDBIASEN
        self.SYENMMDDREGBIASSTB = RM_Field_RAC_S_SYDEBUG_SYENMMDDREGBIASSTB(self)
        self.zz_fdict['SYENMMDDREGBIASSTB'] = self.SYENMMDDREGBIASSTB
        self.SYLODIVAUXLODIS = RM_Field_RAC_S_SYDEBUG_SYLODIVAUXLODIS(self)
        self.zz_fdict['SYLODIVAUXLODIS'] = self.SYLODIVAUXLODIS
        self.SYLODIVLDOPSRTRIM = RM_Field_RAC_S_SYDEBUG_SYLODIVLDOPSRTRIM(self)
        self.zz_fdict['SYLODIVLDOPSRTRIM'] = self.SYLODIVLDOPSRTRIM
        self.SYPFDLOCKWINDOWN = RM_Field_RAC_S_SYDEBUG_SYPFDLOCKWINDOWN(self)
        self.zz_fdict['SYPFDLOCKWINDOWN'] = self.SYPFDLOCKWINDOWN
        self.SYPFDTRADMODEEN = RM_Field_RAC_S_SYDEBUG_SYPFDTRADMODEEN(self)
        self.zz_fdict['SYPFDTRADMODEEN'] = self.SYPFDTRADMODEEN
        self.SYVCOREGBYPASS = RM_Field_RAC_S_SYDEBUG_SYVCOREGBYPASS(self)
        self.zz_fdict['SYVCOREGBYPASS'] = self.SYVCOREGBYPASS
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYTRIM0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYTRIM0, self).__init__(rmio, label,
            0xa8020000, 0x174,
            'SYTRIM0', 'RAC_S.SYTRIM0', 'read-write',
            u"",
            0x018FF169, 0x0FFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYCHPBIAS = RM_Field_RAC_S_SYTRIM0_SYCHPBIAS(self)
        self.zz_fdict['SYCHPBIAS'] = self.SYCHPBIAS
        self.SYCHPCURRRX = RM_Field_RAC_S_SYTRIM0_SYCHPCURRRX(self)
        self.zz_fdict['SYCHPCURRRX'] = self.SYCHPCURRRX
        self.SYCHPCURRTX = RM_Field_RAC_S_SYTRIM0_SYCHPCURRTX(self)
        self.zz_fdict['SYCHPCURRTX'] = self.SYCHPCURRTX
        self.SYCHPLEVNSRC = RM_Field_RAC_S_SYTRIM0_SYCHPLEVNSRC(self)
        self.zz_fdict['SYCHPLEVNSRC'] = self.SYCHPLEVNSRC
        self.SYCHPLEVPSRCRX = RM_Field_RAC_S_SYTRIM0_SYCHPLEVPSRCRX(self)
        self.zz_fdict['SYCHPLEVPSRCRX'] = self.SYCHPLEVPSRCRX
        self.SYCHPLEVPSRCTX = RM_Field_RAC_S_SYTRIM0_SYCHPLEVPSRCTX(self)
        self.zz_fdict['SYCHPLEVPSRCTX'] = self.SYCHPLEVPSRCTX
        self.SYCHPSRCENRX = RM_Field_RAC_S_SYTRIM0_SYCHPSRCENRX(self)
        self.zz_fdict['SYCHPSRCENRX'] = self.SYCHPSRCENRX
        self.SYCHPSRCENTX = RM_Field_RAC_S_SYTRIM0_SYCHPSRCENTX(self)
        self.zz_fdict['SYCHPSRCENTX'] = self.SYCHPSRCENTX
        self.SYCHPREPLICACURRADJ = RM_Field_RAC_S_SYTRIM0_SYCHPREPLICACURRADJ(self)
        self.zz_fdict['SYCHPREPLICACURRADJ'] = self.SYCHPREPLICACURRADJ
        self.SYTRIMCHPREGAMPBIAS = RM_Field_RAC_S_SYTRIM0_SYTRIMCHPREGAMPBIAS(self)
        self.zz_fdict['SYTRIMCHPREGAMPBIAS'] = self.SYTRIMCHPREGAMPBIAS
        self.SYTRIMCHPREGAMPBW = RM_Field_RAC_S_SYTRIM0_SYTRIMCHPREGAMPBW(self)
        self.zz_fdict['SYTRIMCHPREGAMPBW'] = self.SYTRIMCHPREGAMPBW
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYTRIM1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYTRIM1, self).__init__(rmio, label,
            0xa8020000, 0x178,
            'SYTRIM1', 'RAC_S.SYTRIM1', 'read-write',
            u"",
            0x1FE00410, 0xFFFC0FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYLODIVLDOTRIMCORERX = RM_Field_RAC_S_SYTRIM1_SYLODIVLDOTRIMCORERX(self)
        self.zz_fdict['SYLODIVLDOTRIMCORERX'] = self.SYLODIVLDOTRIMCORERX
        self.SYLODIVLDOTRIMCORETX = RM_Field_RAC_S_SYTRIM1_SYLODIVLDOTRIMCORETX(self)
        self.zz_fdict['SYLODIVLDOTRIMCORETX'] = self.SYLODIVLDOTRIMCORETX
        self.SYLODIVLDOTRIMNDIORX = RM_Field_RAC_S_SYTRIM1_SYLODIVLDOTRIMNDIORX(self)
        self.zz_fdict['SYLODIVLDOTRIMNDIORX'] = self.SYLODIVLDOTRIMNDIORX
        self.SYLODIVLDOTRIMNDIOTX = RM_Field_RAC_S_SYTRIM1_SYLODIVLDOTRIMNDIOTX(self)
        self.zz_fdict['SYLODIVLDOTRIMNDIOTX'] = self.SYLODIVLDOTRIMNDIOTX
        self.SYLODIVTLO20DBM2G4DELAY = RM_Field_RAC_S_SYTRIM1_SYLODIVTLO20DBM2G4DELAY(self)
        self.zz_fdict['SYLODIVTLO20DBM2G4DELAY'] = self.SYLODIVTLO20DBM2G4DELAY
        self.SYMMDREPLICA1CURRADJ = RM_Field_RAC_S_SYTRIM1_SYMMDREPLICA1CURRADJ(self)
        self.zz_fdict['SYMMDREPLICA1CURRADJ'] = self.SYMMDREPLICA1CURRADJ
        self.SYMMDREPLICA2CURRADJ = RM_Field_RAC_S_SYTRIM1_SYMMDREPLICA2CURRADJ(self)
        self.zz_fdict['SYMMDREPLICA2CURRADJ'] = self.SYMMDREPLICA2CURRADJ
        self.SYTRIMMMDREGAMPBIAS = RM_Field_RAC_S_SYTRIM1_SYTRIMMMDREGAMPBIAS(self)
        self.zz_fdict['SYTRIMMMDREGAMPBIAS'] = self.SYTRIMMMDREGAMPBIAS
        self.SYTRIMMMDREGAMPBW = RM_Field_RAC_S_SYTRIM1_SYTRIMMMDREGAMPBW(self)
        self.zz_fdict['SYTRIMMMDREGAMPBW'] = self.SYTRIMMMDREGAMPBW
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYCAL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYCAL, self).__init__(rmio, label,
            0xa8020000, 0x17C,
            'SYCAL', 'RAC_S.SYCAL', 'read-write',
            u"",
            0x01008100, 0x03018700,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYVCOMODEPKD = RM_Field_RAC_S_SYCAL_SYVCOMODEPKD(self)
        self.zz_fdict['SYVCOMODEPKD'] = self.SYVCOMODEPKD
        self.SYVCOMORECURRENT = RM_Field_RAC_S_SYCAL_SYVCOMORECURRENT(self)
        self.zz_fdict['SYVCOMORECURRENT'] = self.SYVCOMORECURRENT
        self.SYVCOSLOWNOISEFILTER = RM_Field_RAC_S_SYCAL_SYVCOSLOWNOISEFILTER(self)
        self.zz_fdict['SYVCOSLOWNOISEFILTER'] = self.SYVCOSLOWNOISEFILTER
        self.SYVCOVCAPVCM = RM_Field_RAC_S_SYCAL_SYVCOVCAPVCM(self)
        self.zz_fdict['SYVCOVCAPVCM'] = self.SYVCOVCAPVCM
        self.SYHILOADCHPREG = RM_Field_RAC_S_SYCAL_SYHILOADCHPREG(self)
        self.zz_fdict['SYHILOADCHPREG'] = self.SYHILOADCHPREG
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYEN, self).__init__(rmio, label,
            0xa8020000, 0x180,
            'SYEN', 'RAC_S.SYEN', 'read-write',
            u"",
            0x00000000, 0x000067FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYCHPEN = RM_Field_RAC_S_SYEN_SYCHPEN(self)
        self.zz_fdict['SYCHPEN'] = self.SYCHPEN
        self.SYCHPLPENRX = RM_Field_RAC_S_SYEN_SYCHPLPENRX(self)
        self.zz_fdict['SYCHPLPENRX'] = self.SYCHPLPENRX
        self.SYCHPLPENTX = RM_Field_RAC_S_SYEN_SYCHPLPENTX(self)
        self.zz_fdict['SYCHPLPENTX'] = self.SYCHPLPENTX
        self.SYENCHPREG = RM_Field_RAC_S_SYEN_SYENCHPREG(self)
        self.zz_fdict['SYENCHPREG'] = self.SYENCHPREG
        self.SYENCHPREPLICA = RM_Field_RAC_S_SYEN_SYENCHPREPLICA(self)
        self.zz_fdict['SYENCHPREPLICA'] = self.SYENCHPREPLICA
        self.SYENMMDREG = RM_Field_RAC_S_SYEN_SYENMMDREG(self)
        self.zz_fdict['SYENMMDREG'] = self.SYENMMDREG
        self.SYENMMDREPLICA1 = RM_Field_RAC_S_SYEN_SYENMMDREPLICA1(self)
        self.zz_fdict['SYENMMDREPLICA1'] = self.SYENMMDREPLICA1
        self.SYENMMDREPLICA2 = RM_Field_RAC_S_SYEN_SYENMMDREPLICA2(self)
        self.zz_fdict['SYENMMDREPLICA2'] = self.SYENMMDREPLICA2
        self.SYENVCOBIAS = RM_Field_RAC_S_SYEN_SYENVCOBIAS(self)
        self.zz_fdict['SYENVCOBIAS'] = self.SYENVCOBIAS
        self.SYENVCOPFET = RM_Field_RAC_S_SYEN_SYENVCOPFET(self)
        self.zz_fdict['SYENVCOPFET'] = self.SYENVCOPFET
        self.SYENVCOREG = RM_Field_RAC_S_SYEN_SYENVCOREG(self)
        self.zz_fdict['SYENVCOREG'] = self.SYENVCOREG
        self.SYSTARTCHPREG = RM_Field_RAC_S_SYEN_SYSTARTCHPREG(self)
        self.zz_fdict['SYSTARTCHPREG'] = self.SYSTARTCHPREG
        self.SYSTARTMMDREG = RM_Field_RAC_S_SYEN_SYSTARTMMDREG(self)
        self.zz_fdict['SYSTARTMMDREG'] = self.SYSTARTMMDREG
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYLOEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYLOEN, self).__init__(rmio, label,
            0xa8020000, 0x184,
            'SYLOEN', 'RAC_S.SYLOEN', 'read-write',
            u"",
            0x00000000, 0x00001F1E,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYLODIVEN = RM_Field_RAC_S_SYLOEN_SYLODIVEN(self)
        self.zz_fdict['SYLODIVEN'] = self.SYLODIVEN
        self.SYLODIVLDOBIASEN = RM_Field_RAC_S_SYLOEN_SYLODIVLDOBIASEN(self)
        self.zz_fdict['SYLODIVLDOBIASEN'] = self.SYLODIVLDOBIASEN
        self.SYLODIVLDOEN = RM_Field_RAC_S_SYLOEN_SYLODIVLDOEN(self)
        self.zz_fdict['SYLODIVLDOEN'] = self.SYLODIVLDOEN
        self.SYLODIVRLOADCCLK2G4EN = RM_Field_RAC_S_SYLOEN_SYLODIVRLOADCCLK2G4EN(self)
        self.zz_fdict['SYLODIVRLOADCCLK2G4EN'] = self.SYLODIVRLOADCCLK2G4EN
        self.SYLODIVTLO0DBM2G4AUXEN = RM_Field_RAC_S_SYLOEN_SYLODIVTLO0DBM2G4AUXEN(self)
        self.zz_fdict['SYLODIVTLO0DBM2G4AUXEN'] = self.SYLODIVTLO0DBM2G4AUXEN
        self.SYLODIVTLO0DBM2G4EN = RM_Field_RAC_S_SYLOEN_SYLODIVTLO0DBM2G4EN(self)
        self.zz_fdict['SYLODIVTLO0DBM2G4EN'] = self.SYLODIVTLO0DBM2G4EN
        self.SYLODIVTLO20DBM2G4AUXEN = RM_Field_RAC_S_SYLOEN_SYLODIVTLO20DBM2G4AUXEN(self)
        self.zz_fdict['SYLODIVTLO20DBM2G4AUXEN'] = self.SYLODIVTLO20DBM2G4AUXEN
        self.SYLODIVTLO20DBM2G4EN = RM_Field_RAC_S_SYLOEN_SYLODIVTLO20DBM2G4EN(self)
        self.zz_fdict['SYLODIVTLO20DBM2G4EN'] = self.SYLODIVTLO20DBM2G4EN
        self.SYLODIVRLOADCCLKSEL = RM_Field_RAC_S_SYLOEN_SYLODIVRLOADCCLKSEL(self)
        self.zz_fdict['SYLODIVRLOADCCLKSEL'] = self.SYLODIVRLOADCCLKSEL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SYMMDCTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SYMMDCTRL, self).__init__(rmio, label,
            0xa8020000, 0x188,
            'SYMMDCTRL', 'RAC_S.SYMMDCTRL', 'read-write',
            u"",
            0x00000048, 0x000001FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYMMDDIVRSDIG = RM_Field_RAC_S_SYMMDCTRL_SYMMDDIVRSDIG(self)
        self.zz_fdict['SYMMDDIVRSDIG'] = self.SYMMDDIVRSDIG
        self.SYMMDMODERX = RM_Field_RAC_S_SYMMDCTRL_SYMMDMODERX(self)
        self.zz_fdict['SYMMDMODERX'] = self.SYMMDMODERX
        self.SYMMDMODETX = RM_Field_RAC_S_SYMMDCTRL_SYMMDMODETX(self)
        self.zz_fdict['SYMMDMODETX'] = self.SYMMDMODETX
        self.SYMMDENRSDIG = RM_Field_RAC_S_SYMMDCTRL_SYMMDENRSDIG(self)
        self.zz_fdict['SYMMDENRSDIG'] = self.SYMMDENRSDIG
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_DIGCLKRETIMECTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_DIGCLKRETIMECTRL, self).__init__(rmio, label,
            0xa8020000, 0x190,
            'DIGCLKRETIMECTRL', 'RAC_S.DIGCLKRETIMECTRL', 'read-write',
            u"",
            0x00000000, 0x00000777,
            0x00001000, 0x00002000,
            0x00003000)

        self.DIGCLKRETIMEENRETIME = RM_Field_RAC_S_DIGCLKRETIMECTRL_DIGCLKRETIMEENRETIME(self)
        self.zz_fdict['DIGCLKRETIMEENRETIME'] = self.DIGCLKRETIMEENRETIME
        self.DIGCLKRETIMEDISRETIME = RM_Field_RAC_S_DIGCLKRETIMECTRL_DIGCLKRETIMEDISRETIME(self)
        self.zz_fdict['DIGCLKRETIMEDISRETIME'] = self.DIGCLKRETIMEDISRETIME
        self.DIGCLKRETIMERESETN = RM_Field_RAC_S_DIGCLKRETIMECTRL_DIGCLKRETIMERESETN(self)
        self.zz_fdict['DIGCLKRETIMERESETN'] = self.DIGCLKRETIMERESETN
        self.DIGCLKRETIMELIMITH = RM_Field_RAC_S_DIGCLKRETIMECTRL_DIGCLKRETIMELIMITH(self)
        self.zz_fdict['DIGCLKRETIMELIMITH'] = self.DIGCLKRETIMELIMITH
        self.DIGCLKRETIMELIMITL = RM_Field_RAC_S_DIGCLKRETIMECTRL_DIGCLKRETIMELIMITL(self)
        self.zz_fdict['DIGCLKRETIMELIMITL'] = self.DIGCLKRETIMELIMITL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_DIGCLKRETIMESTATUS(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_DIGCLKRETIMESTATUS, self).__init__(rmio, label,
            0xa8020000, 0x194,
            'DIGCLKRETIMESTATUS', 'RAC_S.DIGCLKRETIMESTATUS', 'read-only',
            u"",
            0x00000000, 0x00000003,
            0x00001000, 0x00002000,
            0x00003000)

        self.DIGCLKRETIMECLKSEL = RM_Field_RAC_S_DIGCLKRETIMESTATUS_DIGCLKRETIMECLKSEL(self)
        self.zz_fdict['DIGCLKRETIMECLKSEL'] = self.DIGCLKRETIMECLKSEL
        self.DIGCLKRETIMERESETNLO = RM_Field_RAC_S_DIGCLKRETIMESTATUS_DIGCLKRETIMERESETNLO(self)
        self.zz_fdict['DIGCLKRETIMERESETNLO'] = self.DIGCLKRETIMERESETNLO
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_XORETIMECTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_XORETIMECTRL, self).__init__(rmio, label,
            0xa8020000, 0x198,
            'XORETIMECTRL', 'RAC_S.XORETIMECTRL', 'read-write',
            u"",
            0x00000000, 0x00000777,
            0x00001000, 0x00002000,
            0x00003000)

        self.XORETIMEENRETIME = RM_Field_RAC_S_XORETIMECTRL_XORETIMEENRETIME(self)
        self.zz_fdict['XORETIMEENRETIME'] = self.XORETIMEENRETIME
        self.XORETIMEDISRETIME = RM_Field_RAC_S_XORETIMECTRL_XORETIMEDISRETIME(self)
        self.zz_fdict['XORETIMEDISRETIME'] = self.XORETIMEDISRETIME
        self.XORETIMERESETN = RM_Field_RAC_S_XORETIMECTRL_XORETIMERESETN(self)
        self.zz_fdict['XORETIMERESETN'] = self.XORETIMERESETN
        self.XORETIMELIMITH = RM_Field_RAC_S_XORETIMECTRL_XORETIMELIMITH(self)
        self.zz_fdict['XORETIMELIMITH'] = self.XORETIMELIMITH
        self.XORETIMELIMITL = RM_Field_RAC_S_XORETIMECTRL_XORETIMELIMITL(self)
        self.zz_fdict['XORETIMELIMITL'] = self.XORETIMELIMITL
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_XORETIMESTATUS(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_XORETIMESTATUS, self).__init__(rmio, label,
            0xa8020000, 0x19C,
            'XORETIMESTATUS', 'RAC_S.XORETIMESTATUS', 'read-only',
            u"",
            0x00000000, 0x00000003,
            0x00001000, 0x00002000,
            0x00003000)

        self.XORETIMECLKSEL = RM_Field_RAC_S_XORETIMESTATUS_XORETIMECLKSEL(self)
        self.zz_fdict['XORETIMECLKSEL'] = self.XORETIMECLKSEL
        self.XORETIMERESETNLO = RM_Field_RAC_S_XORETIMESTATUS_XORETIMERESETNLO(self)
        self.zz_fdict['XORETIMERESETNLO'] = self.XORETIMERESETNLO
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AGCOVERWRITE0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AGCOVERWRITE0, self).__init__(rmio, label,
            0xa8020000, 0x1A0,
            'AGCOVERWRITE0', 'RAC_S.AGCOVERWRITE0', 'read-write',
            u"",
            0x00000000, 0x03F0FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.ENMANLNAMIXRFATT = RM_Field_RAC_S_AGCOVERWRITE0_ENMANLNAMIXRFATT(self)
        self.zz_fdict['ENMANLNAMIXRFATT'] = self.ENMANLNAMIXRFATT
        self.ENMANLNAMIXSLICE = RM_Field_RAC_S_AGCOVERWRITE0_ENMANLNAMIXSLICE(self)
        self.zz_fdict['ENMANLNAMIXSLICE'] = self.ENMANLNAMIXSLICE
        self.ENMANPGAGAIN = RM_Field_RAC_S_AGCOVERWRITE0_ENMANPGAGAIN(self)
        self.zz_fdict['ENMANPGAGAIN'] = self.ENMANPGAGAIN
        self.ENMANIFADCSCALE = RM_Field_RAC_S_AGCOVERWRITE0_ENMANIFADCSCALE(self)
        self.zz_fdict['ENMANIFADCSCALE'] = self.ENMANIFADCSCALE
        self.MANLNAMIXSLICE0 = RM_Field_RAC_S_AGCOVERWRITE0_MANLNAMIXSLICE0(self)
        self.zz_fdict['MANLNAMIXSLICE0'] = self.MANLNAMIXSLICE0
        self.MANLNAMIXSLICE1 = RM_Field_RAC_S_AGCOVERWRITE0_MANLNAMIXSLICE1(self)
        self.zz_fdict['MANLNAMIXSLICE1'] = self.MANLNAMIXSLICE1
        self.MANPGAGAIN = RM_Field_RAC_S_AGCOVERWRITE0_MANPGAGAIN(self)
        self.zz_fdict['MANPGAGAIN'] = self.MANPGAGAIN
        self.MANIFADCSCALE = RM_Field_RAC_S_AGCOVERWRITE0_MANIFADCSCALE(self)
        self.zz_fdict['MANIFADCSCALE'] = self.MANIFADCSCALE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AGCOVERWRITE1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AGCOVERWRITE1, self).__init__(rmio, label,
            0xa8020000, 0x1A4,
            'AGCOVERWRITE1', 'RAC_S.AGCOVERWRITE1', 'read-write',
            u"",
            0x00000000, 0x3FFF3FFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.MANLNAMIXRFATT0 = RM_Field_RAC_S_AGCOVERWRITE1_MANLNAMIXRFATT0(self)
        self.zz_fdict['MANLNAMIXRFATT0'] = self.MANLNAMIXRFATT0
        self.MANLNAMIXRFATT1 = RM_Field_RAC_S_AGCOVERWRITE1_MANLNAMIXRFATT1(self)
        self.zz_fdict['MANLNAMIXRFATT1'] = self.MANLNAMIXRFATT1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_AGCOVERWRITE2(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_AGCOVERWRITE2, self).__init__(rmio, label,
            0xa8020000, 0x1A8,
            'AGCOVERWRITE2', 'RAC_S.AGCOVERWRITE2', 'read-write',
            u"",
            0x00000000, 0x0000FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.ENMANFENOTCH = RM_Field_RAC_S_AGCOVERWRITE2_ENMANFENOTCH(self)
        self.zz_fdict['ENMANFENOTCH'] = self.ENMANFENOTCH
        self.MANFENOTCHEN = RM_Field_RAC_S_AGCOVERWRITE2_MANFENOTCHEN(self)
        self.zz_fdict['MANFENOTCHEN'] = self.MANFENOTCHEN
        self.MANFENOTCHATTNSEL = RM_Field_RAC_S_AGCOVERWRITE2_MANFENOTCHATTNSEL(self)
        self.zz_fdict['MANFENOTCHATTNSEL'] = self.MANFENOTCHATTNSEL
        self.MANFENOTCHRATTNENRF0 = RM_Field_RAC_S_AGCOVERWRITE2_MANFENOTCHRATTNENRF0(self)
        self.zz_fdict['MANFENOTCHRATTNENRF0'] = self.MANFENOTCHRATTNENRF0
        self.MANFENOTCHRATTNENRF1 = RM_Field_RAC_S_AGCOVERWRITE2_MANFENOTCHRATTNENRF1(self)
        self.zz_fdict['MANFENOTCHRATTNENRF1'] = self.MANFENOTCHRATTNENRF1
        self.MANFENOTCHCAPCRSE = RM_Field_RAC_S_AGCOVERWRITE2_MANFENOTCHCAPCRSE(self)
        self.zz_fdict['MANFENOTCHCAPCRSE'] = self.MANFENOTCHCAPCRSE
        self.MANFENOTCHCAPFINE = RM_Field_RAC_S_AGCOVERWRITE2_MANFENOTCHCAPFINE(self)
        self.zz_fdict['MANFENOTCHCAPFINE'] = self.MANFENOTCHCAPFINE
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SPARE(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SPARE, self).__init__(rmio, label,
            0xa8020000, 0x1C4,
            'SPARE', 'RAC_S.SPARE', 'read-write',
            u"",
            0x00000000, 0xFFFFFE3F,
            0x00001000, 0x00002000,
            0x00003000)

        self.AUXADCSPARE = RM_Field_RAC_S_SPARE_AUXADCSPARE(self)
        self.zz_fdict['AUXADCSPARE'] = self.AUXADCSPARE
        self.CLKMULTSPARE = RM_Field_RAC_S_SPARE_CLKMULTSPARE(self)
        self.zz_fdict['CLKMULTSPARE'] = self.CLKMULTSPARE
        self.TX0DBMSPARE = RM_Field_RAC_S_SPARE_TX0DBMSPARE(self)
        self.zz_fdict['TX0DBMSPARE'] = self.TX0DBMSPARE
        self.SYSPARE = RM_Field_RAC_S_SPARE_SYSPARE(self)
        self.zz_fdict['SYSPARE'] = self.SYSPARE
        self.FENOTCHSPARE = RM_Field_RAC_S_SPARE_FENOTCHSPARE(self)
        self.zz_fdict['FENOTCHSPARE'] = self.FENOTCHSPARE
        self.LNAMIXSPARE = RM_Field_RAC_S_SPARE_LNAMIXSPARE(self)
        self.zz_fdict['LNAMIXSPARE'] = self.LNAMIXSPARE
        self.IFADCCTRLRESERVED = RM_Field_RAC_S_SPARE_IFADCCTRLRESERVED(self)
        self.zz_fdict['IFADCCTRLRESERVED'] = self.IFADCCTRLRESERVED
        self.IFADCCTRLRESERVEDLV = RM_Field_RAC_S_SPARE_IFADCCTRLRESERVEDLV(self)
        self.zz_fdict['IFADCCTRLRESERVEDLV'] = self.IFADCCTRLRESERVEDLV
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_PACTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_PACTRL, self).__init__(rmio, label,
            0xa8020000, 0x1C8,
            'PACTRL', 'RAC_S.PACTRL', 'read-write',
            u"",
            0x00000000, 0x0001FFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.TX0DBMLATCHBYPASS = RM_Field_RAC_S_PACTRL_TX0DBMLATCHBYPASS(self)
        self.zz_fdict['TX0DBMLATCHBYPASS'] = self.TX0DBMLATCHBYPASS
        self.TX0DBMSLICERESET = RM_Field_RAC_S_PACTRL_TX0DBMSLICERESET(self)
        self.zz_fdict['TX0DBMSLICERESET'] = self.TX0DBMSLICERESET
        self.TXPABYPASSPREDRVREG = RM_Field_RAC_S_PACTRL_TXPABYPASSPREDRVREG(self)
        self.zz_fdict['TXPABYPASSPREDRVREG'] = self.TXPABYPASSPREDRVREG
        self.TXPAPULLDOWNVDDPA = RM_Field_RAC_S_PACTRL_TXPAPULLDOWNVDDPA(self)
        self.zz_fdict['TXPAPULLDOWNVDDPA'] = self.TXPAPULLDOWNVDDPA
        self.TXPAPOWER = RM_Field_RAC_S_PACTRL_TXPAPOWER(self)
        self.zz_fdict['TXPAPOWER'] = self.TXPAPOWER
        self.TXPALATCHBYPASS10DBM = RM_Field_RAC_S_PACTRL_TXPALATCHBYPASS10DBM(self)
        self.zz_fdict['TXPALATCHBYPASS10DBM'] = self.TXPALATCHBYPASS10DBM
        self.TXPALATCHBYPASS20DBM = RM_Field_RAC_S_PACTRL_TXPALATCHBYPASS20DBM(self)
        self.zz_fdict['TXPALATCHBYPASS20DBM'] = self.TXPALATCHBYPASS20DBM
        self.TXPASELPREDRVREGVDDPA = RM_Field_RAC_S_PACTRL_TXPASELPREDRVREGVDDPA(self)
        self.zz_fdict['TXPASELPREDRVREGVDDPA'] = self.TXPASELPREDRVREGVDDPA
        self.TXPASELPREDRVREGVDDRF = RM_Field_RAC_S_PACTRL_TXPASELPREDRVREGVDDRF(self)
        self.zz_fdict['TXPASELPREDRVREGVDDRF'] = self.TXPASELPREDRVREGVDDRF
        self.TXPASELSLICE = RM_Field_RAC_S_PACTRL_TXPASELSLICE(self)
        self.zz_fdict['TXPASELSLICE'] = self.TXPASELSLICE
        self.TXPASLICERST = RM_Field_RAC_S_PACTRL_TXPASLICERST(self)
        self.zz_fdict['TXPASLICERST'] = self.TXPASLICERST
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_FENOTCH0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_FENOTCH0, self).__init__(rmio, label,
            0xa8020000, 0x1CC,
            'FENOTCH0', 'RAC_S.FENOTCH0', 'read-write',
            u"",
            0x00004000, 0x00007000,
            0x00001000, 0x00002000,
            0x00003000)

        self.FENOTCHVBIAS = RM_Field_RAC_S_FENOTCH0_FENOTCHVBIAS(self)
        self.zz_fdict['FENOTCHVBIAS'] = self.FENOTCHVBIAS
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_FENOTCH1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_FENOTCH1, self).__init__(rmio, label,
            0xa8020000, 0x1D0,
            'FENOTCH1', 'RAC_S.FENOTCH1', 'read-write',
            u"",
            0x00000000, 0x001FFF05,
            0x00001000, 0x00002000,
            0x00003000)

        self.FENOTCHENVDDSW = RM_Field_RAC_S_FENOTCH1_FENOTCHENVDDSW(self)
        self.zz_fdict['FENOTCHENVDDSW'] = self.FENOTCHENVDDSW
        self.FENOTCHRCCALEN = RM_Field_RAC_S_FENOTCH1_FENOTCHRCCALEN(self)
        self.zz_fdict['FENOTCHRCCALEN'] = self.FENOTCHRCCALEN
        self.FENOTCHRCCALCOUNTER = RM_Field_RAC_S_FENOTCH1_FENOTCHRCCALCOUNTER(self)
        self.zz_fdict['FENOTCHRCCALCOUNTER'] = self.FENOTCHRCCALCOUNTER
        self.FENOTCHRCCALOSC = RM_Field_RAC_S_FENOTCH1_FENOTCHRCCALOSC(self)
        self.zz_fdict['FENOTCHRCCALOSC'] = self.FENOTCHRCCALOSC
        self.FENOTCHRCCALOUT = RM_Field_RAC_S_FENOTCH1_FENOTCHRCCALOUT(self)
        self.zz_fdict['FENOTCHRCCALOUT'] = self.FENOTCHRCCALOUT
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH0, self).__init__(rmio, label,
            0xa8020000, 0x3E0,
            'SCRATCH0', 'RAC_S.SCRATCH0', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH0 = RM_Field_RAC_S_SCRATCH0_SCRATCH0(self)
        self.zz_fdict['SCRATCH0'] = self.SCRATCH0
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH1, self).__init__(rmio, label,
            0xa8020000, 0x3E4,
            'SCRATCH1', 'RAC_S.SCRATCH1', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH1 = RM_Field_RAC_S_SCRATCH1_SCRATCH1(self)
        self.zz_fdict['SCRATCH1'] = self.SCRATCH1
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH2(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH2, self).__init__(rmio, label,
            0xa8020000, 0x3E8,
            'SCRATCH2', 'RAC_S.SCRATCH2', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH2 = RM_Field_RAC_S_SCRATCH2_SCRATCH2(self)
        self.zz_fdict['SCRATCH2'] = self.SCRATCH2
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH3(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH3, self).__init__(rmio, label,
            0xa8020000, 0x3EC,
            'SCRATCH3', 'RAC_S.SCRATCH3', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH3 = RM_Field_RAC_S_SCRATCH3_SCRATCH3(self)
        self.zz_fdict['SCRATCH3'] = self.SCRATCH3
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH4(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH4, self).__init__(rmio, label,
            0xa8020000, 0x3F0,
            'SCRATCH4', 'RAC_S.SCRATCH4', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH4 = RM_Field_RAC_S_SCRATCH4_SCRATCH4(self)
        self.zz_fdict['SCRATCH4'] = self.SCRATCH4
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH5(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH5, self).__init__(rmio, label,
            0xa8020000, 0x3F4,
            'SCRATCH5', 'RAC_S.SCRATCH5', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH5 = RM_Field_RAC_S_SCRATCH5_SCRATCH5(self)
        self.zz_fdict['SCRATCH5'] = self.SCRATCH5
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH6(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH6, self).__init__(rmio, label,
            0xa8020000, 0x3F8,
            'SCRATCH6', 'RAC_S.SCRATCH6', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH6 = RM_Field_RAC_S_SCRATCH6_SCRATCH6(self)
        self.zz_fdict['SCRATCH6'] = self.SCRATCH6
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_SCRATCH7(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_SCRATCH7, self).__init__(rmio, label,
            0xa8020000, 0x3FC,
            'SCRATCH7', 'RAC_S.SCRATCH7', 'read-write',
            u"",
            0x00000000, 0xFFFFFFFF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SCRATCH7 = RM_Field_RAC_S_SCRATCH7_SCRATCH7(self)
        self.zz_fdict['SCRATCH7'] = self.SCRATCH7
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_THMSW(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_THMSW, self).__init__(rmio, label,
            0xa8020000, 0x7E8,
            'THMSW', 'RAC_S.THMSW', 'read-write',
            u"",
            0x00000000, 0x00000003,
            0x00001000, 0x00002000,
            0x00003000)

        self.EN = RM_Field_RAC_S_THMSW_EN(self)
        self.zz_fdict['EN'] = self.EN
        self.HALFSWITCH = RM_Field_RAC_S_THMSW_HALFSWITCH(self)
        self.zz_fdict['HALFSWITCH'] = self.HALFSWITCH
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_DIAGAALTEN(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_DIAGAALTEN, self).__init__(rmio, label,
            0xa8020000, 0x7EC,
            'DIAGAALTEN', 'RAC_S.DIAGAALTEN', 'read-write',
            u"",
            0x00000000, 0x00000002,
            0x00001000, 0x00002000,
            0x00003000)

        self.RFEN = RM_Field_RAC_S_DIAGAALTEN_RFEN(self)
        self.zz_fdict['RFEN'] = self.RFEN
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_DIAGAALTSEL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_DIAGAALTSEL, self).__init__(rmio, label,
            0xa8020000, 0x7F0,
            'DIAGAALTSEL', 'RAC_S.DIAGAALTSEL', 'read-write',
            u"",
            0x00000000, 0x00007F3F,
            0x00001000, 0x00002000,
            0x00003000)

        self.TP = RM_Field_RAC_S_DIAGAALTSEL_TP(self)
        self.zz_fdict['TP'] = self.TP
        self.BLK = RM_Field_RAC_S_DIAGAALTSEL_BLK(self)
        self.zz_fdict['BLK'] = self.BLK
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_DIAGAALTBRIDGECTRL(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_DIAGAALTBRIDGECTRL, self).__init__(rmio, label,
            0xa8020000, 0x7F4,
            'DIAGAALTBRIDGECTRL', 'RAC_S.DIAGAALTBRIDGECTRL', 'read-write',
            u"",
            0x00000000, 0x00000020,
            0x00001000, 0x00002000,
            0x00003000)

        self.RFSHORTDIS = RM_Field_RAC_S_DIAGAALTBRIDGECTRL_RFSHORTDIS(self)
        self.zz_fdict['RFSHORTDIS'] = self.RFSHORTDIS
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFLOCK0(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFLOCK0, self).__init__(rmio, label,
            0xa8020000, 0x7F8,
            'RFLOCK0', 'RAC_S.RFLOCK0', 'read-write',
            u"",
            0x80000000, 0xFFEF03FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.SYNTHLODIVFREQCTRL = RM_Field_RAC_S_RFLOCK0_SYNTHLODIVFREQCTRL(self)
        self.zz_fdict['SYNTHLODIVFREQCTRL'] = self.SYNTHLODIVFREQCTRL
        self.RACIFPGAEN = RM_Field_RAC_S_RFLOCK0_RACIFPGAEN(self)
        self.zz_fdict['RACIFPGAEN'] = self.RACIFPGAEN
        self.RACTX0DBM = RM_Field_RAC_S_RFLOCK0_RACTX0DBM(self)
        self.zz_fdict['RACTX0DBM'] = self.RACTX0DBM
        self.RACTX10DBM = RM_Field_RAC_S_RFLOCK0_RACTX10DBM(self)
        self.zz_fdict['RACTX10DBM'] = self.RACTX10DBM
        self.RACTX20DBM = RM_Field_RAC_S_RFLOCK0_RACTX20DBM(self)
        self.zz_fdict['RACTX20DBM'] = self.RACTX20DBM
        self.MODEMHADM = RM_Field_RAC_S_RFLOCK0_MODEMHADM(self)
        self.zz_fdict['MODEMHADM'] = self.MODEMHADM
        self.FRCCONVMODE = RM_Field_RAC_S_RFLOCK0_FRCCONVMODE(self)
        self.zz_fdict['FRCCONVMODE'] = self.FRCCONVMODE
        self.FRCPAUSING = RM_Field_RAC_S_RFLOCK0_FRCPAUSING(self)
        self.zz_fdict['FRCPAUSING'] = self.FRCPAUSING
        self.MODEMANTSWENABLE = RM_Field_RAC_S_RFLOCK0_MODEMANTSWENABLE(self)
        self.zz_fdict['MODEMANTSWENABLE'] = self.MODEMANTSWENABLE
        self.MODEMLRBLE = RM_Field_RAC_S_RFLOCK0_MODEMLRBLE(self)
        self.zz_fdict['MODEMLRBLE'] = self.MODEMLRBLE
        self.MODEMDSSS = RM_Field_RAC_S_RFLOCK0_MODEMDSSS(self)
        self.zz_fdict['MODEMDSSS'] = self.MODEMDSSS
        self.MODEMDEC1 = RM_Field_RAC_S_RFLOCK0_MODEMDEC1(self)
        self.zz_fdict['MODEMDEC1'] = self.MODEMDEC1
        self.MODEMMODFORMAT = RM_Field_RAC_S_RFLOCK0_MODEMMODFORMAT(self)
        self.zz_fdict['MODEMMODFORMAT'] = self.MODEMMODFORMAT
        self.MODEMDUALSYNC = RM_Field_RAC_S_RFLOCK0_MODEMDUALSYNC(self)
        self.zz_fdict['MODEMDUALSYNC'] = self.MODEMDUALSYNC
        self.MODEMANTDIVMODE = RM_Field_RAC_S_RFLOCK0_MODEMANTDIVMODE(self)
        self.zz_fdict['MODEMANTDIVMODE'] = self.MODEMANTDIVMODE
        self.UNLOCKED = RM_Field_RAC_S_RFLOCK0_UNLOCKED(self)
        self.zz_fdict['UNLOCKED'] = self.UNLOCKED
        self.__dict__['zz_frozen'] = True


class RM_Register_RAC_S_RFLOCK1(Base_RM_Register):
    def __init__(self, rmio, label):
        self.__dict__['zz_frozen'] = False
        super(RM_Register_RAC_S_RFLOCK1, self).__init__(rmio, label,
            0xa8020000, 0x7FC,
            'RFLOCK1', 'RAC_S.RFLOCK1', 'read-write',
            u"",
            0x000000FF, 0x000000FF,
            0x00001000, 0x00002000,
            0x00003000)

        self.RACPASTRIPE = RM_Field_RAC_S_RFLOCK1_RACPASTRIPE(self)
        self.zz_fdict['RACPASTRIPE'] = self.RACPASTRIPE
        self.RACPASLICE = RM_Field_RAC_S_RFLOCK1_RACPASLICE(self)
        self.zz_fdict['RACPASLICE'] = self.RACPASLICE
        self.__dict__['zz_frozen'] = True


