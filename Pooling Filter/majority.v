`timescale 1ns/1ns

module majority(
    in1,
    in2,
    in3,
    in4,
    out
    );

input [14:0] in1;
input [14:0] in2;
input [14:0] in3;
input [14:0] in4;

reg [14:0] tmp;
output [14:0] out;

integer i;

always @(in1,in2,in3,in4) begin
    for (i = 0; i < 15; i = i + 1) begin
        tmp[i] = (in1[i] | in2[i] | in3[i]) & (in1[i] | in3[i] | in4[i]) & (in1[i] | in2[i] | in4[i]) & (in2[i] | in3[i] | in4[i]);
    end
end

assign out = tmp;

endmodule
