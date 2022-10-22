interface sort_if ;
    parameter  DATA_N  = 4 ;
    parameter  DATA_W  = 4 ;

    logic[DATA_W-1:0]        data_in[0:DATA_N-1] ;
    logic                    start_sort          ;
    logic                    out_vld             ;
    logic[DATA_W-1:0]        data_out            ;
    

    modport master(
        input      data_in,start_sort, 
        output     out_vld,data_out  
    );

endinterface
