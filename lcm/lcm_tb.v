`timescale 1ns/1ns
 
module tb_lcm();
 
parameter     DATA_W = 8;
 
reg [DATA_W-1:0] A;
reg [DATA_W-1:0] B;
reg 			 vld_in;
reg			     rst_n;
reg 			 clk;
 
wire	[DATA_W*2-1:0] 	lcm_out;
wire 	[DATA_W-1:0]	mcd_out;
wire					vld_out;
 
initial
    begin
	    A <= 'd0;
		B <= 'd0;
		vld_in <= 1'b0;
		rst_n <= 1'b0;
		clk = 1'b0;
		#10
		rst_n <= 1'b1;
        A <= 'd6;
		B <= 'd7;
		vld_in <= 1'b1;
		#2000
		A <= 'd12;
		B <= 'd8;
		vld_in <= 1'b1;
		#1000
		A <= 'd15;
		B <= 'd20;
		vld_in <= 1'b1;
	end
 
always #10 clk = ~clk;
 
lcm 
#(
 .DATA_W (DATA_W)
 )
 lcm_u
(
    .A       (A      ),
    .B       (B      ),
    .vld_in  (vld_in ),
    .rst_n   (rst_n  ),
    .clk     (clk    ),
	
    .lcm_out (lcm_out),
    .mcd_out (mcd_out),
    .vld_out (vld_out)
);
 
endmodule
