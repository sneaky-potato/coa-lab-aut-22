VV := iverilog

SRC := ./src
TEST := ./test

RM := rm -f
EXEC := ./a.out

ADDERLIST :=  $(SRC)/cla_32_lcu.v $(SRC)/cla_16_lcu.v $(SRC)/cla_4_aug.v $(SRC)/lcu_16.v $(SRC)/lcu_4.v
ALULIST := $(SRC)/alu.v $(SRC)/mux21.v $(SRC)/mux21_32b.v $(SRC)/shifter.v $(ADDERLIST)
MUXLIST := $(SRC)/mux31_5b.v $(SRC)/mux31_32b.v
BRANCHLIST := $(SRC)/branch_jmp.v $(SRC)/branch_pc.v
PCLIST := $(SRC)/program_cnt.v $(SRC)/program_cnt_adder.v

DATAPATHLIST := $(SRC)/datapath.v $(SRC)/dff.v $(SRC)/sign_extend.v $(SRC)/ins_decode.v $(SRC)/register.v $(MUXLIST) $(ALULIST) $(BRANCHLIST) $(PCLIST)
CONTROLLIST := $(SRC)/control_unit.v

CPULIST := $(SRC)/main.v $(CONTROLLIST) $(DATAPATHLIST)

adder: $(TEST)/cla_32_tb.v $(ADDERLIST)
	$(VV) $(TEST)/cla_32_tb.v $(ADDERLIST) -o $(EXEC)
	$(EXEC)

alu: $(TEST)/alu_tb.v $(ALULIST)
	$(VV) $(TEST)/alu_tb.v $(ALULIST) -o $(EXEC)
	$(EXEC)

register: $(TEST)/register_tb.v $(SRC)/register.v
	$(VV) $(TEST)/register_tb.v $(SRC)/register.v -o  $(EXEC)
	$(EXEC)

cpu: $(TEST)/test1.v $(CPULIST)
	$(VV) $(TEST)/test1.v $(CPULIST) -o $(EXEC)
	$(EXEC)

clean:
	$(RM) $(EXEC)