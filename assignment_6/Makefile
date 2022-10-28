VV := iverilog

SRC := ./src
TEST := ./test

RM := rm -f
EXEC := ./a.out

ADDERLIST :=  $(SRC)/cla_32_lcu.v $(SRC)/cla_16_lcu.v $(SRC)/cla_4_aug.v $(SRC)/lcu_16.v $(SRC)/lcu_4.v
ALULIST := $(SRC)/alu.v $(SRC)/mux21.v $(SRC)/mux21_32b.v $(SRC)/shifter.v $(ADDERLIST)

adder: $(TEST)/cla_32_tb.v $(ADDERLIST)
	$(VV) $(TEST)/cla_32_tb.v $(ADDERLIST) -o $(EXEC)
	$(EXEC)

alu: $(TEST)/alu_tb.v $(ALULIST)
	$(VV) $(TEST)/alu_tb.v $(ALULIST) -o $(EXEC)
	$(EXEC)

clean:
	$(RM) $(EXEC)