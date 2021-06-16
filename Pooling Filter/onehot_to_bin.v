`timescale 1ns/1ns

module onehot_to_bin(
    onehot,
    bin
    );

input [15:0] onehot;
output reg [3:0] bin;

integer i;

always @(onehot) begin
    for (i = 0; i < 16; i = i + 1) begin
        if (onehot[i] == 1'b1) begin
            bin = i;
        end else begin
            bin = bin & bin;
        end
    end
end

endmodule
