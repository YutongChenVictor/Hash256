module sigma1 #
(
    parameter DATA_WIDTH = 32
)

(
    input   wire    [DATA_WIDTH - 1:0]  x           ,

    output  wire    [DATA_WIDTH - 1:0]  sigma0_out
);

wire    [DATA_WIDTH-1:0]    S_17    ;
wire    [DATA_WIDTH-1:0]    S_19    ;
wire    [DATA_WIDTH-1:0]    R_10    ;

assign sigma0_out = S_17 ^ S_19 ^ R_10;

S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (17        )
)
S17
(
    .x      (x          ),
    .xout   (S_17       )
);


S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (19        )
)
S18
(
    .x      (x          ),
    .xout   (S_19       )
);

R
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (10        )
)
R10
(
    .x      (x          ),
    .xout   (R_10       )
);
endmodule