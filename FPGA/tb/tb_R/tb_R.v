`timescale 1ns/1ps

module tb_R();

reg [31:0] x;
wire [31:0] x_out;


initial
begin            
    $dumpfile("TB_R.vcd");
    $dumpvars(0, tb_R);   
end

initial begin
    x = 32'h0010;
    #10
    x = 32'habcd;
    #10
    x = 32'hcd10;
    #10;
end

R
#(
    .DATA_WIDTH(32),
    .n(8)
)
R_inst
(
    .x(x),
    .xout(x_out)
);
    
endmodule