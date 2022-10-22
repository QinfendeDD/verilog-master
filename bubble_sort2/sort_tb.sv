module sort_tb(sort_if sortif);
initial begin
  sortif.a = 5;
  sortif.b = 2;
  sortif.c = 3;
  sortif.d = 7;
  #100 $finish;
end
endmodule
