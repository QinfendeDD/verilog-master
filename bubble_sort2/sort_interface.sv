interface sort_if(input bit clk);

    logic[3:0] a, b, c, d, ra, rb, rc, rd;
          
    modport sort_tb(output a, b, c, d,
                 input ra, rb, rc, rd);
                 
    modport sort(input a, b, c, d,
                output ra, rb, rc, rd);
    
endinterface
