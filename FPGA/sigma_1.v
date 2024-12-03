module sigma_1 #
(
    parameter DATA_WIDTH = 32
)

(
    input   wire    [DATA_WIDTH - 1:0]  x           ,

    output  wire    [DATA_WIDTH - 1:0]  sigma_1_out
);

wire    [DATA_WIDTH-1:0]    S_6     ;
wire    [DATA_WIDTH-1:0]    S_11    ;
wire    [DATA_WIDTH-1:0]    S_25    ;

assign sigma0_out = S_6 ^ S_11 ^ S_25;

S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (6         )
)
S6
(
    .x      (x          ),
    .xout   (S_6        )
);


S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (11        )
)
S11
(
    .x      (x          ),
    .xout   (S_11       )
);

S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (25        )
)
S25
(
    .x      (x          ),
    .xout   (S_25       )
);
endmodule