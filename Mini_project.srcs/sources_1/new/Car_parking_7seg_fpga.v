`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2024 13:52:35
// Design Name: 
// Module Name: Car_parking_7seg_fpga
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Car_parking_7seg_fpga(
    input [7:0] Cars,
    output [7:0] AN, //there is 8 bit display so we need 8 bit an so we choose our 1 display
    output reg [6:0] seg
    );
    reg [3:0] num ;
    always@ (Cars)
    num = Cars[7] + Cars[6] + Cars[5] + Cars[4] + Cars[3] + Cars[2] + Cars[1] + Cars[0];
    
    assign AN = 8'b11111110;
    
    always@ (num)
    begin
    case(num)
    4'b0000: seg = 7'b1000000;
    4'b0001: seg = 7'b1111001;
    4'b0010: seg = 7'b0100100;
    4'b0011: seg = 7'b0110000;
    4'b0100: seg = 7'b0011001;
    4'b0101: seg = 7'b0010010;
    4'b0110: seg = 7'b0000010;
    4'b0111: seg = 7'b1111000;
    4'b1000: seg = 7'b0000000;
    endcase
    end
endmodule
