module S #
(
    parameter DATA_WIDTH = 32                       ,
    parameter n          = 2
)
(
    input   wire    [DATA_WIDTH - 1:0]  x           ,

    output  wire    [DATA_WIDTH - 1:0]  xout
);


assign xout = {x[n-1:0], x[DATA_WIDTH - 1 : n]};

endmodule