module tt_um_top_xornet (
    input wire x1,
    input wire x2,
    output wire led,
    input wire clk,
    input wire ena,
    input wire rst_n
);

wire [15:0] scaled_x1;
wire [15:0] scaled_x2;
wire signed [15:0] nn_out;

input_converter converter (
    .x1(x1),
    .x2(x2),
    .scaled_x1(scaled_x1),
    .scaled_x2(scaled_x2)
);

xornet neural_network (
    .x1(scaled_x1),
    .x2(scaled_x2),
    .out(nn_out)
);

assign led = ~(nn_out >= 16'd128);
wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
