module input_converter (
    input x1,
    input x2,
    output [15:0] scaled_x1,
    output [15:0] scaled_x2
);

assign scaled_x1 = ~x1 ? 16'd256 : 16'd0;
assign scaled_x2 = ~x2 ? 16'd256 : 16'd0;

endmodule