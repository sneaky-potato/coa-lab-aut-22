
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /bram_instr_mem_tb/status
      waveform add -signals /bram_instr_mem_tb/bram_instr_mem_synth_inst/bmg_port/CLKA
      waveform add -signals /bram_instr_mem_tb/bram_instr_mem_synth_inst/bmg_port/ADDRA
      waveform add -signals /bram_instr_mem_tb/bram_instr_mem_synth_inst/bmg_port/ENA
      waveform add -signals /bram_instr_mem_tb/bram_instr_mem_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
