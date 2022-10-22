module top;
    bit clk;
    always #5 clk = ~clk;
    sort_if sortif(clk);
    sort4 sort(sortif);
    sort_tb sorttb(sortif);
endmodule
