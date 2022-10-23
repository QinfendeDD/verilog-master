module syn_fifo(clk, rstn, wr_en, rd_en, wr_data, rd_data, fifo_full, fifo_empty);

    //��������
    parameter   width = 8;
    parameter   depth = 8;
    parameter   addr  = 3;

    //�����ź�
    input   clk;    //ʱ���ź�
    input   rstn;   //�½��ظ�λ
    input   wr_en;  //д��ʹ��
    input   rd_en;  //��ȡʹ��

    //�����ź�
    input   [width - 1 : 0] wr_data;    //д����
    output  [width - 1 : 0] rd_data;    //������

    reg [width - 1 : 0] rd_data;

    //�����ж��ź�
    output  fifo_full;
    output  fifo_empty;

    //����һ���������������жϿ���
    reg [$clog2(depth): 0] cnt;

    //�����д��ַ
    reg [depth - 1 : 0] wr_ptr;
    reg [depth - 1 : 0] rd_ptr;

    //����һ�����ΪΪwidth�����Ϊdepth��fifo
    reg [width - 1 : 0] fifo [depth - 1 : 0];

    //д��ַ����
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            wr_ptr <= 0;
        else if(wr_en && !fifo_full)    //дʹ�ܣ���fifoδд��
            wr_ptr <= wr_ptr + 1;
        else
            wr_ptr <= wr_ptr;
    end

    //����ַ����
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            rd_ptr <= 0;
        else if(rd_en && !fifo_empty)   //��ʹ�ܣ���fifo��Ϊ��
            rd_ptr <= rd_ptr + 1;
        else
            rd_ptr <= rd_ptr;
    end

    //д����
    integer i;

    always @ (posedge clk or negedge rstn) begin
        if(!rstn) begin //��λ���fifo
            for(i = 0; i < depth; i = i + 1)
                fifo[i] <= 0;
        end
        else if(wr_en)  //дʹ��ʱ������д��fifo
            fifo[wr_ptr] <= wr_data;
        else    //���򱣳�
            fifo[wr_ptr] <= fifo[wr_ptr];
    end

    //������
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            rd_data <= 0;
        else if (rd_en)
            rd_data <= fifo[rd_ptr];    //��fifo�ж�ȡ����
        else
            rd_data <= rd_data;
    end

    //���������������жϿ���
    always @ (posedge clk or negedge rstn) begin
        if(!rstn)
            cnt <= 0;
        else if (wr_en && !rd_en && !fifo_full) //��Ч��ֻд��
            cnt <= cnt + 1;
        else if (!wr_en && rd_en && !fifo_empty) //��Ч��ֻ��ȡ
            cnt <= cnt - 1;
        else 
            cnt <= cnt;
    end

    //�����ж�
    assign fifo_full = (cnt == depth)? 1 : 0;
    assign fifo_empty = (cnt == 0) ? 1 : 0;
endmodule
