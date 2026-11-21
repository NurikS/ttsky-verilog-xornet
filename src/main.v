module tt_um_top_xornet (
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe, 
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
assign uio_out = 0;
assign uio_oe  = 0;
wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
