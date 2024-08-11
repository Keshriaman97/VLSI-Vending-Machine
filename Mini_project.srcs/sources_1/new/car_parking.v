`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
////////////////////////////////////////////////////


module car_parking(
input [7:0] cars,//8 cases and additional is everything empty means 1-8 cars and 0 cars total 9 possibilities 
output [3:0] num,awail//thats why we need 9 outputs so thats why we need 4 bits
    );
    reg [3:0] num,awail;
    always@(cars)
    begin
    num = cars[7] + cars[6] + cars[5] + cars[4] + cars[3] + cars[2] + cars[1] + cars[0] ;
    awail = 8 - num;
    end
endmodule
