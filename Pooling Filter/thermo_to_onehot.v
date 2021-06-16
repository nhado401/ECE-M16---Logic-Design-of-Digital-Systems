`timescale 1ns/1ns

module thermo_to_onehot(
    thermo,
    onehot
    );

input [14:0] thermo;
output [15:0] onehot;

reg [15:0] tmp;
reg b;

integer i, j, k;

always @(thermo) begin
    if (thermo == 15'b111111111111111) begin
        tmp = 16'b1000000000000000;
    end else if (thermo == 15'b000000000000000) begin
        tmp = 16'b0000000000000001;
    end else begin
        for (i = 0; i < 14; i = i + 1) begin
            b = thermo[i] ^ thermo[i+1];
            if (b == 1'b1) begin
                tmp[i+1] = 1'b1;

                for (j = 0; j < i + 1; j = j + 1) begin
                    tmp[j] = 1'b0;
                end

                for (k = 16; k > i + 1; k = k - 1) begin
                    tmp[k] = 1'b0;
                end
            end else begin
                tmp = tmp & tmp;
            end
        end
    end
end

assign onehot = tmp;

endmodule
