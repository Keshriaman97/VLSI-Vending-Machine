`timescale 1ns / 1ps


module Traffic_light(reset,clk,north_light,south_light,east_light,west_light);
input reset,clk;    
output reg [2:0] north_light,south_light,east_light,west_light;
reg [3:0] count;
reg [2:0] state;
parameter north_g = 3'b000,north_y = 3'b001, south_g = 3'b010,south_y=3'b011,east_g=3'b100,east_y = 3'b101,west_g=3'b110,west_y=3'b111;
always@(posedge clk,posedge reset)
begin
if(reset == 1 )

begin
state = north_g;
count = 4'b0000;
end

    else
    
begin
case(state)

north_g:begin
if(count == 4'b1111)
begin
state=north_y;
count = 4'b0000;
end
else
begin
state=north_g;
count=count+4'b0001;
end
end

north_y:begin
if(count == 4'b0101)
begin
state=south_g;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=north_y;
end
end

south_g:begin
if(count == 4'b1111)
begin
state=south_y;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=south_g;
end
end

south_y:begin
if(count == 4'b0101)
begin
state=east_g;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=south_y;
end
end

east_g:begin
if(count == 4'b1111)
begin
state=east_y;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=east_g;
end
end

east_y:begin
if(count == 4'b0101)
begin
state=west_g;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=east_y;
end
end

west_g: begin
if(count == 4'b1111)
begin
state=west_y;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=west_g;
end
end

west_y:begin
if(count == 4'b0101)
begin
state=north_g;
count = 4'b0000;
end
else
begin
count=count+4'b0001;
state=west_y;
end
end

endcase
end
end

always@(state)
begin
case(state)
north_g:begin
north_light = 3'b001;//for green light define 001
south_light = 3'b100;//for red light define 100;
east_light = 3'b100;
west_light = 3'b100;
end

north_y: begin
north_light = 3'b010;//for yellow light define 010
south_light = 3'b100;//for red light define 100;
east_light = 3'b100;
west_light = 3'b100;
end

south_g: begin
north_light = 3'b100;//for yellow light define 010
south_light = 3'b001;//for red light define 100;
east_light = 3'b100;
west_light = 3'b100;
end

south_y: begin
north_light = 3'b100;//for yellow light define 010
south_light = 3'b010;//for red light define 100;
east_light = 3'b100;
west_light = 3'b100;
end

east_g: begin
north_light = 3'b100;
south_light = 3'b100;//for red light define 100;
east_light = 3'b001;
west_light = 3'b100;
end

east_y: begin
north_light = 3'b100;//for yellow light define 010
south_light = 3'b100;//for red light define 100;
east_light = 3'b010;
west_light = 3'b100;
end

west_g: begin
north_light = 3'b100;//for yellow light define 010
south_light = 3'b100;//for red light define 100;
east_light = 3'b100;
west_light = 3'b001;
end

west_y: begin
north_light = 3'b100;//for yellow light define 010
south_light = 3'b100;//for red light define 100;
east_light = 3'b100;
west_light = 3'b010;
end

endcase
end

endmodule
