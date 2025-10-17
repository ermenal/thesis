from pyradioconfig.parts.ocelot.calculators.calc_modulator import CALC_Modulator_Ocelot
from pycalcmodel.core.variable import ModelVariableFormat, CreateModelVariableEnum
from pyradioconfig.calculator_model_framework.Utils.LogMgr import LogMgr
from pyradioconfig.parts.sol.calculators.calc_demodulator import Calc_Demodulator_Sol
from math import ceil,log2
from enum import Enum

class Calc_Modulator_Sol(CALC_Modulator_Ocelot):

    def buildVariables(self, model):
        super().buildVariables(model)
        self._addModelVariable(model, 'ofdm_rate_hz', float, ModelVariableFormat.DECIMAL,
                               desc='OFDM rate for softmodem')
        self._addModelVariable(model, 'softmodem_tx_interpolation1',int,ModelVariableFormat.DECIMAL,desc='interpolation rate 1 for softmodem TX')
        self._addModelVariable(model, 'softmodem_tx_interpolation2', int, ModelVariableFormat.DECIMAL,
                               desc='interpolation rate 2 for softmodem TX')
        self._addModelVariable(model, 'modulator_select', Enum, ModelVariableFormat.DECIMAL,
                               desc='determines modulator path')
        model.vars.modulator_select.var_enum = CreateModelVariableEnum(
            'ModSelEnum',
            'List of supported modulator paths',
            [['PH_MOD',0,'Phase modulator'],
            ['IQ_MOD',1,'IQ modulator (direct upconversion)']])
        self._addModelVariable(model, 'softmodem_txircal_params', int, ModelVariableFormat.DECIMAL,
                               desc='TX IRCal parameters [kt, int2ratio, int2gain]', is_array=True)
        self._addModelVariable(model, 'softmodem_txircal_freq', int, ModelVariableFormat.DECIMAL,
                               desc='TX IRCal tone freq')
        self._addModelVariable(model, 'hardmodem_txbr_compensation', str, ModelVariableFormat.ASCII,
                               desc='Hard modem tx baudrate compensated value', is_array=True)

    def calc_modulator_select(self, model):

        softmodem_modulation_type = model.vars.softmodem_modulation_type.value

        if (softmodem_modulation_type == model.vars.softmodem_modulation_type.var_enum.SUN_OFDM) or \
            (softmodem_modulation_type == model.vars.softmodem_modulation_type.var_enum.CW):
            modulator_select = model.vars.modulator_select.var_enum.IQ_MOD
        else:
            modulator_select =  model.vars.modulator_select.var_enum.PH_MOD

        #Write the model var
        model.vars.modulator_select.value = modulator_select

    def calc_txmodsel_reg(self, model):

        #Read in model vars
        softmodem_modulation_type = model.vars.softmodem_modulation_type.value
        modulator_select = model.vars.modulator_select.value

        if softmodem_modulation_type != model.vars.softmodem_modulation_type.var_enum.NONE:
            if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD:
                txmodsel = 0
            else:
                txmodsel = 1
        else:
            txmodsel = 0

        #Write the register
        self._reg_write(model.vars.RAC_SOFTMCTRL_TXMODSEL, txmodsel)

    def calc_softmodem_tx_interpolation(self, model):
        #This method calculates the interpolation rates for softmodem PHYs

        #Read in model vars
        softmodem_modulation_type = model.vars.softmodem_modulation_type.value
        ofdm_option = model.vars.ofdm_option.value
        modulator_select = model.vars.modulator_select.value

        #Only need to set interpolation values for OFDM MOD
        if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD:
            if softmodem_modulation_type == model.vars.softmodem_modulation_type.var_enum.SUN_OFDM:
                softmodem_tx_interpolation1 = 7 #Static for now
                if ofdm_option == model.vars.ofdm_option.var_enum.OPT1_OFDM_BW_1p2MHz:
                    softmodem_tx_interpolation2 = 2
                elif ofdm_option == model.vars.ofdm_option.var_enum.OPT2_OFDM_BW_0p8MHz:
                    softmodem_tx_interpolation2 = 4
                elif ofdm_option == model.vars.ofdm_option.var_enum.OPT3_OFDM_BW_0p4MHz:
                    softmodem_tx_interpolation2 = 8
                else:
                    softmodem_tx_interpolation2 = 16
            else:
                softmodem_tx_interpolation1 = 1
                softmodem_tx_interpolation2 = 5
        else:
            softmodem_tx_interpolation1 = 0
            softmodem_tx_interpolation2 = 0

        #Write the model vars
        model.vars.softmodem_tx_interpolation1.value = softmodem_tx_interpolation1
        model.vars.softmodem_tx_interpolation2.value = softmodem_tx_interpolation2


    def calc_int1cfg_reg(self, model):
        #This method calculates the int1cfg register fields

        #Read in model vars
        modulator_select = model.vars.modulator_select.value
        softmodem_tx_interpolation1 = model.vars.softmodem_tx_interpolation1.value

        # Set only when OFDM modulator is used
        if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD:
            ratio = softmodem_tx_interpolation1-1
            gainshift = 12 #Static for now
        else:
            ratio=0
            gainshift=0

        #Write the registers
        self._reg_write(model.vars.TXFRONT_INT1CFG_RATIO,ratio)
        self._reg_write(model.vars.TXFRONT_INT1CFG_GAINSHIFT, gainshift)

    def calc_int2cfg_reg(self, model):
        #This method calculates the int2cfg register fields

        #Read in model vars
        modulator_select = model.vars.modulator_select.value
        softmodem_tx_interpolation2 = model.vars.softmodem_tx_interpolation2.value

        # Set only when OFDM modulator is used
        if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD:
            ratio = softmodem_tx_interpolation2-1
            gainshift = ceil(log2(softmodem_tx_interpolation2**2))
        else:
            ratio = 0
            gainshift = 0

        #Write the registers
        self._reg_write(model.vars.TXFRONT_INT2CFG_RATIO, ratio)
        self._reg_write(model.vars.TXFRONT_INT2CFG_GAINSHIFT, gainshift)

    def calc_softmodem_txircal(self, model):

        #Read in model vars
        divn = model.vars.fpll_divn.value
        divx = model.vars.fpll_divx.value

        #divn: [kt, int2_ratio, int2_gainshift]
        txircal_dict = {
            80:[5,5,5],
            81:[9,9,7],
            85:[5,17,9],
            86:[5,43,11],
            93:[3,31,10],
            97:[2,97,14],
            98:[7,7,6],
            99:[9,11,7],
            100:[5,5,5],
            101:[2,101,14],
            103:[2,103,14],
            111:[3,37,11],
            114:[3,19,9],
            115:[5,23,10],
            116:[5,29,10],
            117:[9,13,8],
            119:[3,59,12]
        }

        try:
            softmodem_txircal_params = txircal_dict[divn]
        except KeyError:
            LogMgr.Error('Invalid RFFPLL divn for softmodem tx calibration')
            softmodem_txircal_params = []
            softmodem_txircal_freq = 0
        else:
            fft_size_log2 = 6
            txircal_dec0 = 4
            softmodem_txircal_freq = ((1 << (17 - fft_size_log2)) * softmodem_txircal_params[0] * divx * softmodem_txircal_params[1]) / txircal_dec0 / divn

        model.vars.softmodem_txircal_params.value = softmodem_txircal_params
        model.vars.softmodem_txircal_freq.value = int(softmodem_txircal_freq)

    def calc_srccfg_ratio_reg(self, model):
        #This method calulates the softmodem SRCCFG RATIO value

        #Read in model vars
        modulator_select = model.vars.modulator_select.value
        softmodem_modulation_type = model.vars.softmodem_modulation_type.value
        dac_freq_actual = model.vars.dac_freq_actual.value
        baudrate = model.vars.baudrate.value
        softmodem_tx_interpolation1 = model.vars.softmodem_tx_interpolation1.value
        softmodem_tx_interpolation2 = model.vars.softmodem_tx_interpolation2.value

        # Set only when OFDM modulator is used
        if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD:
            if softmodem_modulation_type == model.vars.softmodem_modulation_type.var_enum.SUN_OFDM:
                ratio = (2**18) * (2.0*baudrate*softmodem_tx_interpolation1*softmodem_tx_interpolation2)/dac_freq_actual #2^18 * (2*OFDM_RATE*INT1*INT2)/DAC_FREQ
            else:
                ratio = (2**18) #Ratio of 1 for CW
        else:
            ratio = 0

        #Write the reg
        self._reg_write(model.vars.TXFRONT_SRCCFG_RATIO, int(round(ratio)))

    def calc_tx_baud_rate_actual(self, model):

        #Read in model vars
        modulator_select = model.vars.modulator_select.value
        softmodem_modulation_type = model.vars.softmodem_modulation_type.value
        softmodem_tx_interpolation1_actual = model.vars.TXFRONT_INT1CFG_RATIO.value + 1
        softmodem_tx_interpolation2_actual = model.vars.TXFRONT_INT2CFG_RATIO.value + 1
        txfront_srccfg_ratio_actual = model.vars.TXFRONT_SRCCFG_RATIO.value/(2**18)
        dac_freq_actual = model.vars.dac_freq_actual.value

        if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD and\
                softmodem_modulation_type == model.vars.softmodem_modulation_type.var_enum.SUN_OFDM:
            tx_baud_rate_actual = dac_freq_actual/softmodem_tx_interpolation1_actual/softmodem_tx_interpolation2_actual*txfront_srccfg_ratio_actual/2.0
            model.vars.tx_baud_rate_actual.value = tx_baud_rate_actual
        else:
            super().calc_tx_baud_rate_actual(model)

    def calc_txmix_regs(self, model):
        #This method calculates the RAC_TXMIX fields

        modulator_select = model.vars.modulator_select.value
        base_frequency_hz = model.vars.base_frequency_hz.value
        conc_ofdm = (model.vars.conc_ofdm_option.value != model.vars.conc_ofdm_option.var_enum.NONE)

        #Choose regsiter settings based on RF band
        if (modulator_select == model.vars.modulator_select.var_enum.IQ_MOD) or conc_ofdm:

            if base_frequency_hz < 450e6:
                #430M Band
                txselmixctune = 43
                txselmixgmslicei = 9
                txselmixgmsliceq = 9
                txselmixrload = 0
                txselmixband = 0
                txmixcappulldown = 1

            elif base_frequency_hz < 520e6:
                # 470M Band
                txselmixctune = 31
                txselmixgmslicei = 8
                txselmixgmsliceq = 8
                txselmixrload = 0
                txselmixband = 0
                txmixcappulldown = 1

            elif base_frequency_hz < 625e6:
                # 570M Band
                txselmixctune = 13
                txselmixgmslicei = 6
                txselmixgmsliceq = 6
                txselmixrload = 2
                txselmixband = 0
                txmixcappulldown = 1

            elif base_frequency_hz < 730e6:
                # 680M Band
                txselmixctune = 3
                txselmixgmslicei = 6
                txselmixgmsliceq = 6
                txselmixrload = 5
                txselmixband = 0
                txmixcappulldown = 1

            elif base_frequency_hz < 825e6:
                # 780M Band
                txselmixctune = 24
                txselmixgmslicei = 7
                txselmixgmsliceq = 7
                txselmixrload = 1
                txselmixband = 1
                txmixcappulldown = 0

            elif base_frequency_hz < 895e6:
                # 870M Band
                txselmixctune = 14
                txselmixgmslicei = 6
                txselmixgmsliceq = 6
                txselmixrload = 2
                txselmixband = 1
                txmixcappulldown = 0

            elif base_frequency_hz < 940e6:
                # 920M Band (settings from Eric Vapillon)
                txselmixctune = 9
                txselmixgmslicei = 6
                txselmixgmsliceq = 6
                txselmixrload = 4
                txselmixband = 1
                txmixcappulldown = 0

            else:
                # 960M Band
                txselmixctune = 5
                txselmixgmslicei = 6
                txselmixgmsliceq = 6
                txselmixrload = 5
                txselmixband = 1
                txmixcappulldown = 0

        else:
            #Use POR values
            txselmixctune = 0
            txselmixgmslicei = 4
            txselmixgmsliceq = 4
            txselmixrload = 0
            txselmixband = 0
            txmixcappulldown = 0

        #Write the register fields
        self._reg_write(model.vars.RAC_TXMIX_TXSELMIXCTUNE, txselmixctune)
        self._reg_write(model.vars.RAC_TXMIX_TXSELMIXGMSLICEI, txselmixgmslicei)
        self._reg_write(model.vars.RAC_TXMIX_TXSELMIXGMSLICEQ, txselmixgmsliceq)
        self._reg_write(model.vars.RAC_TXMIX_TXSELMIXRLOAD, txselmixrload)
        self._reg_write(model.vars.RAC_TXMIX_TXSELMIXBAND, txselmixband)
        self._reg_write(model.vars.RAC_TXMIX_TXMIXCAPPULLDOWN, txmixcappulldown)

    def calc_txtrim_regs(self, model):
        # This method calculates the RAC_PATRIM6 fields

        modulator_select = model.vars.modulator_select.value
        conc_ofdm = (model.vars.conc_ofdm_option.value != model.vars.conc_ofdm_option.var_enum.NONE)

        if (modulator_select == model.vars.modulator_select.var_enum.IQ_MOD) or conc_ofdm:
            txtrimfilgain = 2
            txtrimfilres = 0
        else:
            # Use POR values
            txtrimfilgain = 1
            txtrimfilres = 0

        # Write the register fields
        self._reg_write(model.vars.RAC_PATRIM6_TXTRIMFILGAIN, txtrimfilgain)
        self._reg_write(model.vars.RAC_PATRIM6_TXTRIMFILRES, txtrimfilres)

    def calc_symbol_rates_actual(self, model):
        modulation_type = model.vars.modulation_type.value

        if modulation_type == model.vars.modulation_type.var_enum.OFDM:
            ofdm_option = model.vars.ofdm_option.value

            if ofdm_option == model.vars.ofdm_option.var_enum.OPT1_OFDM_BW_1p2MHz:
                ofdm_min_bitrate = 100000
            elif ofdm_option == model.vars.ofdm_option.var_enum.OPT2_OFDM_BW_0p8MHz:
                ofdm_min_bitrate = 50000
            elif ofdm_option == model.vars.ofdm_option.var_enum.OPT3_OFDM_BW_0p4MHz:
                ofdm_min_bitrate = 25000
            else:
                ofdm_min_bitrate = 12500

            # Symbol rate is constant for OFDM: 1/120us
            ofdm_tsym = 120e-6
            ofdm_symbol_rate = 1/ofdm_tsym

            # baud per symbol is not used in OFDM
            baud_per_symbol = 1

            # MCS3 is the first one without frequency repetition then it is more convenient to use it
            # as reference for bit_per_symbol. Besides, using MCS0 as reference implies a bit_per_symbol equal to 1.5,
            # and this value cannot be forwarded to RAIL.
            # bits_per_symbol is merely MCS3 bit rate for a given option over the symbol rate
            mcs3_bit_rate = ofdm_min_bitrate * 4
            bits_per_symbol = int(mcs3_bit_rate / ofdm_symbol_rate)

            # Update model variables
            model.vars.ofdm_symbol_rate.value = ofdm_symbol_rate
            model.vars.baud_per_symbol_actual.value = baud_per_symbol
            model.vars.bits_per_symbol_actual.value = bits_per_symbol
        else:
            # Call Ocelot version
            super().calc_symbol_rates_actual(model)

    def calc_txbases_reg(self, model):

        # Read in model variables
        preamble_length = model.vars.preamble_length.value  # This is the TX preamble length
        preamble_pattern_len_actual = model.vars.preamble_pattern_len_actual.value
        softmodem_active = (model.vars.softmodem_modulation_type.value != model.vars.softmodem_modulation_type.var_enum.NONE)

        if softmodem_active:
            #If the softmodem is active, the preamble bits will come from the softmodem so set TXBASES=0
            txbases = 0
        else:
            txbases = preamble_length / preamble_pattern_len_actual
            if (txbases) > 0xffff:
                LogMgr.Error("Calculated TX preamble sequences (TXBASE) value of %s exceeds limit of 65535! Adjust preamble inputs." % txbases)

        # Write the register
        self._reg_write(model.vars.MODEM_PRE_TXBASES, int(txbases))

    def calc_hardmodem_txbr_compensation(self, model):
        """ Generate a table of compensated values covering 100ppm variation """

        # Get model variables
        softmodem_modulation_type = model.vars.softmodem_modulation_type.value
        modulator_select = model.vars.modulator_select.value
        modformat = model.vars.modulation_type.value
        modem_frequency_hz = model.vars.modem_frequency_hz.value * 1.0
        freq_dev_hz = model.vars.deviation.value * 1.0
        synth_res = model.vars.synth_res_actual.value
        shaping_filter_gain = model.vars.shaping_filter_gain_actual.value

        # Initialize variables
        hardmodem_txbr_compensation = []
        min_ppm = -50
        max_ppm = 50
        ppm_precision = 10
        txbr_num_err_tol = 0.00001
        txbr_max_den = 255

        # This compensation is needed for all modulations that use the FSK PA, that is, all but OFDM.
        if modulator_select != model.vars.modulator_select.var_enum.IQ_MOD:
            xtal_frequency_hz = model.vars.xtal_frequency_hz.value
            baudrate = model.vars.baudrate.value

            # SUN OQPSK needs a precision of 5ppm but other modulations are fine with 10ppm
            if softmodem_modulation_type == model.vars.softmodem_modulation_type.var_enum.SUN_OQPSK:
                ppm_precision = 5

            # Case '0' is not counted so actual length is length+1
            length = int(((abs(min_ppm) + max_ppm) / ppm_precision))
            ctr = 0

            # Compute a set of ratios with ppm correction
            # ratio = xtal / (8*baudrate)
            # then ratio_corrected = (xtal - (xtal*ppm)/1e6)/(8*baudrate)
            for ppm in range(min_ppm, max_ppm + ppm_precision, ppm_precision):
                freq_corrected = (xtal_frequency_hz * ppm)/1e6
                ratio_corrected = (xtal_frequency_hz + freq_corrected)/(8 * baudrate)

                num, den = self._get_txbr_reg(ratio_corrected, txbr_num_err_tol, txbr_max_den)

                new_interpolation_gain = Calc_Demodulator_Sol()._get_interpolation_gain(model, num, modformat)
                new_modindex = self._get_modindex(model, modem_frequency_hz, modformat, freq_dev_hz, synth_res, shaping_filter_gain, new_interpolation_gain)
                modindexM, modindexE = self._get_modindex_field(new_modindex)

                # Store the necessary information as 16b triplets into hardmodem_txbr_compensation array
                # 1) ModindexE and modindexM (5b + 5b) and length (6b) indicating the remaining elements in this array
                # 2) den (8b) + ppm (8b)
                # 3) num (16b)
                half_word1 = ((length - ctr) << 10) | (modindexE << 5) | modindexM
                half_word2 = (ppm << 8) | den
                half_word3 = int(round(num))

                hardmodem_txbr_compensation.append(str(hex(half_word1)))
                # Store last half word as int16 in hex and keep sign
                hardmodem_txbr_compensation.append("0x{:04x}".format((int(half_word2) & 0xFFFF), '04x'))
                hardmodem_txbr_compensation.append(str(hex(half_word3)))
                ctr += 1

        # Update model variable
        model.vars.hardmodem_txbr_compensation.value = hardmodem_txbr_compensation

    def calc_tx_delay(self, model):
        """ calculate tx delay in ns """
        # : Get Model Variables
        modulator_select = model.vars.modulator_select.value
        shaping = model.vars.MODEM_CTRL0_SHAPING.value
        shaping_filter_taps = model.vars.shaping_filter_taps.value
        tx_baud_rate_actual = model.vars.tx_baud_rate_actual.value
        softmodem_interp1_ratio = model.vars.softmodem_tx_interpolation1.value
        softmodem_interp2_ratio = model.vars.softmodem_tx_interpolation2.value

        if modulator_select == model.vars.modulator_select.var_enum.IQ_MOD:  # : IQ modulator for OFDM
            # : Sol design book pp. 2769 - IQ_MOD
            # : soft modem delay
            softmodem_filter_taps = 32 # : coproc filter has 32 taps
            softmodem_filter_rate = 2*tx_baud_rate_actual # : softmodem operates at 2xFs
            softmodem_delay = softmodem_filter_taps/2
            softmodem_grp_delay_us = softmodem_delay / softmodem_filter_rate * 1e6

            # : interp1 delay
            interp1_ratio = softmodem_interp1_ratio
            interp1_rate = interp1_ratio * softmodem_filter_rate
            interp1_taps = 5 # : FIR Polyphase filter with 5 taps
            interp1_delay = interp1_taps/2
            interp1_grp_delay_us = interp1_delay / softmodem_filter_rate * 1e6

            # : interp2 delay
            interp2_ratio = softmodem_interp2_ratio
            interp2_rate = interp2_ratio * interp1_rate
            interp2_taps = 3 * interp2_ratio # : 3 additional taps for each interpolation since 3rd order CIC
            interp2_delay = interp2_taps/2
            interp2_grp_delay_us = interp2_delay / interp2_rate * 1e6

            # : calculate total delay
            tx_grp_delay_us = softmodem_grp_delay_us + interp1_grp_delay_us + interp2_grp_delay_us
        else:
            # : Sol design book pp. 2329
            # : FIR filter is operating at 8x baud rate
            if shaping == 1: # : odd symmetric
                shaping_filter_delay = (shaping_filter_taps + 1) / 2
            else: # : assume even
                shaping_filter_delay = shaping_filter_taps/2
            tx_grp_delay_us = shaping_filter_delay / (8 * tx_baud_rate_actual) * 1e6

        model.vars.tx_grp_delay_us.value = tx_grp_delay_us