module sigma_0 #
(
    parameter DATA_WIDTH = 32
)

(
    input   wire    [DATA_WIDTH - 1:0]  x           ,

    output  wire    [DATA_WIDTH - 1:0]  sigma_0_out
);

wire    [DATA_WIDTH-1:0]    S_2     ;
wire    [DATA_WIDTH-1:0]    S_13    ;
wire    [DATA_WIDTH-1:0]    S_22    ;

assign sigma0_out = S_2 ^ S_13 ^ S_22;

S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (2         )
)
S2
(
    .x      (x          ),
    .xout   (S_2        )
);


S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (13        )
)
S13
(
    .x      (x          ),
    .xout   (S_13       )
);

S
#(
    .DATA_WIDTH (DATA_WIDTH),
    .n          (22        )
)
S22
(
    .x      (x          ),
    .xout   (S_22       )
);
endmodule