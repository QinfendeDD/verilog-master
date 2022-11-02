`timescale 1ns/1ns
 
module lcm#(
parameter DATA_W = 8)
(
input [DATA_W-1:0] A,
input [DATA_W-1:0] B,
input 			vld_in,
input			rst_n,
input 			clk,
output	wire	[DATA_W*2-1:0] 	lcm_out,
output	wire 	[DATA_W-1:0]	mcd_out,
output	reg					vld_out
);
    reg       [DATA_W-1:0]       A_reg;
    reg       [DATA_W-1:0]       B_reg;
    reg       [DATA_W*2-1:0]	 lcm  ;
    reg       [DATA_W*2-1:0]     lcm_reg;
    reg       [DATA_W-1:0]	     mcd_reg;
    reg       [1:0]        state;
    parameter            IDLE = 2'b00;
    parameter            st_1 = 2'b01;
    parameter            st_2 = 2'b10;
    
    always@(posedge clk or negedge rst_n)
        if(rst_n == 1'b0)
            begin
                vld_out<= 1'b0;
                A_reg <= 'd0;
                B_reg <= 'd0;
                lcm   <= 'd0;
                mcd_reg <= 'd0;
                lcm_reg <= 'd0;
                state <= IDLE;
            end
    else case(state)
        IDLE:
             begin
                  vld_out <= 1'b0;
                  if(vld_in == 1'b1)
                      begin
                          A_reg <= A;
                          B_reg <= B;
                          lcm_reg<= A*B;
                          state <= st_1;
                      end
                  else
                      begin
                          A_reg <= A_reg;
                          B_reg <= B_reg;
                          lcm_reg<= lcm_reg;
                          state <= IDLE;
                      end
             end
        st_1:
            if(A_reg == B_reg)
                state <= st_2;
            else
                begin
                   state <= st_1;
                   if(A_reg > B_reg)
                        A_reg <= A_reg - B_reg;
                   else if(A_reg < B_reg)
                        B_reg <= B_reg - A_reg;
                end
        st_2:
            begin
                vld_out <= 1'b1;
                lcm <= lcm_reg;
                mcd_reg   <= A_reg;
                state <= IDLE;
            end
    endcase
        
    assign         lcm_out = lcm / mcd_reg;
    assign         mcd_out = mcd_reg;
      
endmodule
