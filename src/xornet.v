module xornet (
    input wire [15:0] x1,
    input wire [15:0] x2,
    output wire signed [31:0] out);

`include "weights.vh"

wire signed [31:0] y;
wire signed [31:0] y1;
wire signed [31:0] final_sum;

assign y = $signed({1'b0, x1})*W1 + $signed({1'b0, x2})*W3;

assign y1 = $signed({1'b0, x1})*W2 + $signed({1'b0, x2})*W4;


wire signed [31:0] relu11_out;
wire signed [31:0] relu12_out;
wire signed [31:0] y_scaled;
wire signed [31:0] y1_scaled;

assign y_scaled  = y >>> 8;
assign y1_scaled = y1 >>> 8;

relu relu_hidden1 (
    .din_relu(y_scaled),
    .dout_relu(relu11_out)
);

relu relu_hidden2 (
    .din_relu(y1_scaled),
    .dout_relu(relu12_out)
);

assign final_sum = relu11_out*W5 + relu12_out*W6;

wire signed [31:0] final_scaled;

assign final_scaled = final_sum >>> 8;

relu relu_hidden3 (
    .din_relu(final_scaled),
    .dout_relu(out)
);
endmodule
