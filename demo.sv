program class_super;

  class A ;
    integer j;
    function new();
      begin
        j = 10;
      end
    endfunction
    task print();
      begin
        $display("j is %0d",j);
      end
    endtask
  endclass

  class B extends A;
    integer i = 1;
    function new();
      begin
        // call the parent new
        super.new(); // constructor chaining
        $display("Done calling the parent new");
        i = 100;
      end
    endfunction
    // Override the parent class print
    task print();
      begin
        $display("i is %0d",i);
        $display("Call the parent print");
        super.print();
      end
    endtask
  endclass

  initial begin
    B b1;
    b1 = new;
    b1.print();
  end

endprogram
