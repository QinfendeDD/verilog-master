//`timescale 1ns/100ps
module tb();
parameter DN = 8 ;
parameter DW = 4 ;

logic[DW-1:0]     data_in[DN-1:0];

logic[DW-1:0]     data_out[DN-1:0];

parameter T_HF = 0.5;
parameter T_CLK = 2 * T_HF;
//finish
initial  begin
   #(300*T_CLK)  $finish;
end

//input
initial begin
    repeat (8) begin
    for(int i=0; i<DN;i++) begin
        data_in[i] = $urandom(); 
    end
    #20;
    end
end

bubble_sort #(
                .DATA_W (DW),
                .DATA_N (DN)
            )U_TB(
                    .data_in (data_in),
                    
                    .data_o  (data_out) 
                );
initial begin
$fsdbDumpfile("sim.fsdb");
$fsdbDumpvars(0);
$fsdbDumpMDA();
end

endmodule
