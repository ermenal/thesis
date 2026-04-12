#!/bin/bash

cd rail_soc_simple_trx/ && make -f rail_soc_simple_trx.Makefile clean && make -f rail_soc_simple_trx.Makefile -j8 all && commander-cli flash --masserase --serialno 440262075 build/debug/rail_soc_simple_trx.s37 && gnome-terminal -- commander-cli vcom connect --serialno 440262075