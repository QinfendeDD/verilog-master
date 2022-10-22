module bubble_sort 
#(
    parameter DATA_N = 4 ,
    parameter DATA_W = 4 
)( 
    input logic[DATA_W-1:0]  data_in[DATA_N-1:0] ,


    output logic[DATA_W-1:0] data_o[DATA_N-1:0] 
);

    logic[DATA_W-1:0] tmp[DATA_N-1:0];

    always_comb begin
        for(int k=0; k<DATA_N; k++) begin
            tmp[k]  = 'b0       ;
        end
        data_o  = data_in  ;
        for(int j=0; j<DATA_N-1; j++) begin
            for (int i=0; i<DATA_N-1-j; i++) begin
                if(data_o[i+1] < data_o[i]) begin
                    tmp[i]       = data_o[i]   ;
                    data_o[i]    = data_o[i+1] ;
                    data_o[i+1]  = tmp[i]      ;  
                end
            end
        end
    end


    logic[DATA_W-1:0]  data_o2[DATA_N-1:0] ;
    logic[DATA_W-1:0]  tmp2                ;

    always_comb begin
        tmp2     = 'b0;
        data_o2  = data_in ;
        for (int i=0; i<DATA_N-1; i++) begin
            for(int j=i+1; j<DATA_N; j++) begin
                if(data_o2[j] > data_o2[i]) begin
                    tmp2       = data_o2[i] ;
                    data_o2[i] = data_o2[j] ;
                    data_o2[j] = tmp2       ;
                end
            end
        end
    end
         

endmodule
