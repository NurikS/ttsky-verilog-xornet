module relu(
    input signed [31:0] din_relu,
    output signed [31:0] dout_relu
);

    assign dout_relu = din_relu[31] ? 32'sd0 : din_relu;

endmodule