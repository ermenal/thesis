from pyradioconfig.parts.bobcat.calculators.calc_synth import Calc_Synth_Bobcat


class Calc_Synth_Caracal(Calc_Synth_Bobcat):

    def calc_rx_mode_reg(self, model):

        rx_mode = model.vars.synth_rx_mode.value
        ind = rx_mode.value

        # Synth settings https://jira.silabs.com/browse/MCUW_RADIO_CFG-1529
        # Settings copied over from Lynx Assert
        # {workspace}\shared_files\lynx\radio_validation\ASSERTS
        # BLK_SYNTH_RX_LP_BW_200KHZ.csv (BLE_LR mode)
        # BLK_SYNTH_RX_LP_BW_250KHZ.csv (NORMAL mode)

        rx_mode_settings = {
            'SYNTH.LPFCTRL2RX.CASELRX':         [1,   1],
            'SYNTH.LPFCTRL2RX.CAVALRX':         [22,  16],
            'SYNTH.LPFCTRL2RX.CZSELRX':         [1,   1],
            'SYNTH.LPFCTRL2RX.CZVALRX':         [254, 229],
            'SYNTH.LPFCTRL2RX.CFBSELRX':        [0,   0],
            'SYNTH.LPFCTRL2RX.LPFGNDSWENRX':    [0,   0],
            'SYNTH.LPFCTRL2RX.MODESELRX':       [0,   0],
            'SYNTH.LPFCTRL1RX.OP1BWRX':         [0,   0],
            'SYNTH.LPFCTRL1RX.OP1COMPRX':       [7,   7],
            'SYNTH.LPFCTRL1RX.RFBVALRX':        [0,   0],
            'SYNTH.LPFCTRL1RX.RPVALRX':         [7,   7],
            'SYNTH.LPFCTRL1RX.RZVALRX':         [12,  13],
            'SYNTH.LPFCTRL2RX.LPFSWENRX':       [1,   1],
            'SYNTH.LPFCTRL2RX.LPFINCAPRX':      [2,   2],
            'SYNTH.DSMCTRLRX.MASHORDERRX':      [1,   1],
            'SYNTH.DSMCTRLRX.LSBFORCERX':       [1,   1],
            'SYNTH.DSMCTRLRX.DSMMODERX':        [1,   1],
            'SYNTH.DSMCTRLRX.DITHERDACRX':      [0,   0],
            'SYNTH.DSMCTRLRX.DITHERDSMOUTPUTRX':[0,   0],
            'SYNTH.DSMCTRLRX.DITHERDSMINPUTRX': [0,   0],
            'RAC.SYMMDCTRL.SYMMDMODERX':        [4,   4],
            'RAC.SYTRIM1.SYLODIVLDOTRIMNDIORX': [1,   1],
            'RAC.SYEN.SYCHPLPENRX':             [1,   1],
            'RAC.SYTRIM0.SYCHPREPLICACURRADJ':  [1,   1],
            'RAC.SYTRIM0.SYCHPSRCENRX':         [0,   0]
        }

        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_CASELRX,          rx_mode_settings['SYNTH.LPFCTRL2RX.CASELRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_CAVALRX,          rx_mode_settings['SYNTH.LPFCTRL2RX.CAVALRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_CZSELRX,          rx_mode_settings['SYNTH.LPFCTRL2RX.CZSELRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_CZVALRX,          rx_mode_settings['SYNTH.LPFCTRL2RX.CZVALRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_CFBSELRX,         rx_mode_settings['SYNTH.LPFCTRL2RX.CFBSELRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_LPFGNDSWENRX,     rx_mode_settings['SYNTH.LPFCTRL2RX.LPFGNDSWENRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_MODESELRX,        rx_mode_settings['SYNTH.LPFCTRL2RX.MODESELRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL1RX_OP1BWRX,          rx_mode_settings['SYNTH.LPFCTRL1RX.OP1BWRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL1RX_OP1COMPRX,        rx_mode_settings['SYNTH.LPFCTRL1RX.OP1COMPRX'][ind] )
        self._reg_write(model.vars.SYNTH_LPFCTRL1RX_RFBVALRX,         rx_mode_settings['SYNTH.LPFCTRL1RX.RFBVALRX'][ind])
        self._reg_write(model.vars.SYNTH_LPFCTRL1RX_RPVALRX,          rx_mode_settings['SYNTH.LPFCTRL1RX.RPVALRX'][ind])
        self._reg_write(model.vars.SYNTH_LPFCTRL1RX_RZVALRX,          rx_mode_settings['SYNTH.LPFCTRL1RX.RZVALRX'][ind])
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_LPFSWENRX,        rx_mode_settings['SYNTH.LPFCTRL2RX.LPFSWENRX'][ind])
        self._reg_write(model.vars.SYNTH_LPFCTRL2RX_LPFINCAPRX,       rx_mode_settings['SYNTH.LPFCTRL2RX.LPFINCAPRX'][ind])

        # : Following registers are PTE Set & Forget but needs to be set by RC since they are different from reset value
        # : See https://jira.silabs.com/browse/MCUW_RADIO_CFG-1610
        self._reg_write(model.vars.SYNTH_DSMCTRLRX_MASHORDERRX,       rx_mode_settings['SYNTH.DSMCTRLRX.MASHORDERRX'][ind])
        self._reg_write(model.vars.SYNTH_DSMCTRLRX_LSBFORCERX,        rx_mode_settings['SYNTH.DSMCTRLRX.LSBFORCERX'][ind])
        self._reg_write(model.vars.SYNTH_DSMCTRLRX_DSMMODERX,         rx_mode_settings['SYNTH.DSMCTRLRX.DSMMODERX'][ind])
        self._reg_write(model.vars.SYNTH_DSMCTRLRX_DITHERDACRX,       rx_mode_settings['SYNTH.DSMCTRLRX.DITHERDACRX'][ind])
        self._reg_write(model.vars.SYNTH_DSMCTRLRX_DITHERDSMOUTPUTRX, rx_mode_settings['SYNTH.DSMCTRLRX.DITHERDSMOUTPUTRX'][ind])
        self._reg_write(model.vars.SYNTH_DSMCTRLRX_DITHERDSMINPUTRX,  rx_mode_settings['SYNTH.DSMCTRLRX.DITHERDSMINPUTRX'][ind])
        self._reg_write(model.vars.RAC_SYMMDCTRL_SYMMDMODERX,         rx_mode_settings['RAC.SYMMDCTRL.SYMMDMODERX'][ind])
        self._reg_write(model.vars.RAC_SYTRIM1_SYLODIVLDOTRIMNDIORX,  rx_mode_settings['RAC.SYTRIM1.SYLODIVLDOTRIMNDIORX'][ind])
        self._reg_write(model.vars.RAC_SYEN_SYCHPLPENRX,              rx_mode_settings['RAC.SYEN.SYCHPLPENRX'][ind])
        self._reg_write(model.vars.RAC_SYTRIM0_SYCHPREPLICACURRADJ,   rx_mode_settings['RAC.SYTRIM0.SYCHPREPLICACURRADJ'][ind])
        self._reg_write(model.vars.RAC_SYTRIM0_SYCHPSRCENRX,          rx_mode_settings['RAC.SYTRIM0.SYCHPSRCENRX'][ind])
