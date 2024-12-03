module sigma0 #
(
    parameter DATA_WIDTH = 32
)

(
    input   wire    [DATA_WIDTH - 1:0]  x           ,

    output  wire    [DATA_WIDTH - 1:0]  sigma0_out
);

wire    [DATA_WIDTH-1:0]    S_7     ;
wire    [DATA_WIDTH-1:0]    S_18    ;
wire    [DATA_WIDTH-1:0]    R_3     ;

assign sigma0_out = S_7 ^ S_18 ^ R_3;

S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (7         )
)
S7
(
    .x      (x          ),
    .xout   (S_7        )
);


S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (18        )
)
S18
(
    .x      (x          ),
    .xout   (S_18       )
);

R
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (3        )
)
R3
(
    .x      (x          ),
    .xout   (R_18       )
);
endmodule