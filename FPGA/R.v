module R #
(
    parameter DATA_WIDTH = 32   ,
    parameter n          = 2
)
(
    input   wire    [DATA_WIDTH-1:0]    x      ,

    output  wire    [DATA_WIDTH-1:0]    xout
);

assign xout = x >> n;

endmodule