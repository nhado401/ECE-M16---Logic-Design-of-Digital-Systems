`timescale 1ns/1ns

module tb_thermo_maj;

reg [14:0] in1;
reg [14:0] in2;
reg [14:0] in3;
reg [14:0] in4;
reg [3:0] out;

wire [3:0] tmp;

thermo_maj device_under_test(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(tmp)
);

initial begin

    //This case will test for 4 different inputs. The output will be "Correct".
    in1 = 15'b000000000000001;
    in2 = 15'b000000000000011;
    in3 = 15'b000000000001111;
    in4 = 15'b000000000000111;
    #1;       // <- wait for 1ns
    if (tmp == 4'b0011) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    // This case will display "Incorrect" because the correct output should be 0111
    in1 = 15'b000000001111111;
    in2 = 15'b000000000000111;
    in3 = 15'b000000011111111;
    in4 = 15'b000000000111111;
    #1;       
    if (tmp == 4'b0110) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //This case will test for 4 different inputs with one of them is edge case. The output will be "Correct".
    in1 = 15'b000000111111111;
    in2 = 15'b000000000000011;
    in3 = 15'b000000000000000;
    in4 = 15'b001111111111111;
    #1;       
    if (tmp == 4'b1001) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //This case will test for 4 inputs with 2 of them are at edge cases (0 and 1) and the other two are identical. 
    //The output will be "Correct".
    in1 = 15'b111111111111111;
    in2 = 15'b011111111111111;
    in3 = 15'b000000000000000;
    in4 = 15'b011111111111111;
    #1;       
    if (tmp == 4'b1110) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //The next 2 cases will test for 4 identical inputs at edge cases (0 and 1). The outputs will be "Correct".
    in1 = 15'b111111111111111;
    in2 = 15'b111111111111111;
    in3 = 15'b111111111111111;
    in4 = 15'b111111111111111;
    #1;       
    if (tmp == 4'b1111) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    in1 = 15'b000000000000000;
    in2 = 15'b000000000000000;
    in3 = 15'b000000000000000;
    in4 = 15'b000000000000000;
    #1;       
    if (tmp == 4'b0000) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //This case will test for 4 inputs but the 3 largest inputs are identical. The output will be correct.
    in1 = 15'b000000011111111;
    in2 = 15'b000000000001111;
    in3 = 15'b000000011111111;
    in4 = 15'b000000011111111;
    #1;       
    if (tmp == 4'b1000) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //This case will test for 4 inputs but the 2 smallest inputs are identical. The output will be "Correct".
    in1 = 15'b000000000000011;
    in2 = 15'b000000000111111;
    in3 = 15'b000000000000011;
    in4 = 15'b000000011111111;
    #1;       
    if (tmp == 4'b0110) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //This case will test for 4 inputs, the first and third are identical, so is the second and the fourth. 
    //The output will be "Correct".
    in1 = 15'b000000011111111;
    in2 = 15'b000000000011111;
    in3 = 15'b000000011111111;
    in4 = 15'b000000000011111;
    #1;       
    if (tmp == 4'b1000) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end

    //This case will test for 4 inputs, 3 smaller inputs are identical. The output will be "Correct".
    in1 = 15'b000000000011111;
    in2 = 15'b000000000000111;
    in3 = 15'b000000000000111;
    in4 = 15'b000000000000111;
    #1;       
    if (tmp == 4'b0011) begin 
        $display("Correct output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end else begin
        $display("Incorrect output for in1=%b, in2=%b, in3=%b, in4=%b", in1, in2, in3, in4); 
    end
end

endmodule


