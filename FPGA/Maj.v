module Maj #
(
    parameter DATA_WIDTH = 32
)

(
    input   wire    [DATA_WIDTH - 1:0]  x       ,
    input   wire    [DATA_WIDTH - 1:0]  y       ,
    input   wire    [DATA_WIDTH - 1:0]  z       ,

    output  wire    [DATA_WIDTH - 1:0]  Majout
);

wire [DATA_WIDTH - 1:0] xy  ;
wire [DATA_WIDTH - 1:0] yz  ;
wire [DATA_WIDTH - 1:0] xz  ;

assign xy = x & y;
assign yz = z & y;
assign xz = x & z;
assign Majout = xy ^ xz ^ yz;

endmodule