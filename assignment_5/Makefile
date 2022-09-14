a.out: binary_cnt_tb.v b.out
	iverilog binary_cnt_tb.v binary_cnt.v -o a.out

b.out: binary_cnt_struct_tb.v
	iverilog binary_cnt_struct_tb.v binary_cnt_struct.v dff_struct.v add_by_one.v -o b.out

clean:
	rm -f a.out b.out
