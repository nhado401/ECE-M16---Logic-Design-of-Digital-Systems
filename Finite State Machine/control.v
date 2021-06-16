`timescale 1ns/1ns

module control(
    rst,
    clk,
    start_button,
    timer_elapsed,
    timer_select,
    bell,
    heating_element,
    paddle_motor
    );

input rst;
input clk;
input start_button;
input timer_elapsed;

output reg [1:0] timer_select;
output reg bell;
output reg heating_element;
output reg paddle_motor;

reg[2:0] state, next_state;

localparam STATE_START = 2'b00;
localparam STATE_PADDLE1 = 2'b01;
localparam STATE_PADDLE0 = 2'b10;
localparam STATE_HEATING1 = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state = STATE_START;
    end else begin
        state = next_state;
    end
end

always @(*) begin
    next_state = state;
    timer_select = 2'b00;
    bell = 1'b0;
    heating_element = 1'b0;
    paddle_motor = 1'b0;

    case(state)

        STATE_START: begin
            if(start_button) begin
                next_state = STATE_PADDLE1;
                timer_select = 2'b01;
                paddle_motor = 1'b1;
                heating_element = 1'b0;
                bell = 1'b0;
            end else begin
                next_state = STATE_START;
                paddle_motor = 1'b0;
                heating_element = 1'b0;
                bell = 1'b0;
            end     
        end

        STATE_PADDLE1: begin
            if(timer_elapsed) begin
                next_state = STATE_PADDLE0;
                timer_select = 2'b10;
                paddle_motor = 1'b0;
                heating_element = 1'b0;
                bell = 1'b0;
            end else begin
                next_state = STATE_PADDLE1;
                paddle_motor = 1'b1;
                heating_element = 1'b0;
                bell = 1'b0;
            end     
        end

        STATE_PADDLE0: begin
            if(timer_elapsed) begin
                next_state = STATE_HEATING1;
                timer_select = 2'b11;
                paddle_motor = 1'b0;
                heating_element = 1'b1;
                bell = 1'b0;
            end else begin
                next_state = STATE_PADDLE0;
                paddle_motor = 1'b0;
                heating_element = 1'b0;
                bell = 1'b0;
            end   
        end

        STATE_HEATING1: begin
            if(timer_elapsed) begin
                next_state = STATE_START;
                timer_select = 2'b00;
                paddle_motor = 1'b0;
                heating_element = 1'b0;
                bell = 1'b1;
            end else begin
                next_state = STATE_HEATING1;
                paddle_motor = 1'b0;
                heating_element = 1'b1;
                bell = 1'b0;
            end   
        end

    endcase
end

endmodule
