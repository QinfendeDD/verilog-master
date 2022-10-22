module sort4(sort_if sortif);
 
  logic[3:0] va, vb, vc, vd;
  always @(sortif.a or sortif.b or sortif.c or sortif.d) begin
    {va, vb, vc, vd} = {sortif.a, sortif.b, sortif.c, sortif.d};
    sort2(va, vc);
    sort2(vb, vd);
    sort2(va, vb);
    sort2(vc, vd);
    sort2(vb, vc);
    {sortif.ra, sortif.rb, sortif.rc, sortif.rd} = {va, vb, vc, vd};
  end
  task sort2(inout[3:0] x, y);
    logic[3:0] tmp;
    if (x > y)
      begin
        tmp = x;
        x = y;
        y = tmp;
      end
  endtask
endmodule
