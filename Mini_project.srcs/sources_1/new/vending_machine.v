`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module vending_machine(coin,clk,reset,z,change_give);
    input wire clk,reset;
    input wire [1:0] coin;
    output reg z,change_give;
    reg [3:0] state,next_state;
    parameter sin=4'b0000, s10=4'b0001, s20=4'b0010, s30=4'b0011, s40=4'b0100,s50=4'b0101,s60=4'b0110,s70=4'b0111,s80=4'b1000;
    parameter ten=2'b00,twenty=2'b01,fifty=2'b10;//s0=ten,s01=twenty,s10=fifty
    always@(posedge clk ,posedge reset)
    begin
    if(reset==1)
    state<=sin;
    else
    state<=next_state;
    end
    
    always@(state,coin)
    begin
    case(state)
    
    sin: begin
    if(coin==ten)
    next_state=s10;
    else if (coin == twenty)
    next_state=s20;
    else if (coin == fifty)
    next_state = s50;
    end
    
    s10: begin
    if(coin== ten)
    next_state = s20;
    else if (coin == twenty)
    next_state = s30;
    else if (coin == fifty)
    next_state = s60;
    end
    
    s20: begin
    if(coin== ten)
    next_state = s30;
    else if (coin == twenty)
    next_state = s40;
    else if (coin == fifty)
    next_state = s70;
    end
    
    s30: begin
    if(coin==ten)
    next_state = s40;
    else if (coin == twenty)
    next_state = s50;
    else if (coin == fifty)
    next_state = s80;
    end
    
    s40: next_state=sin;
    s50: next_state=sin;
    s60: next_state=sin;
    s70: next_state=sin;
    s80: next_state=sin;
    default: next_state=sin;
    
    endcase
    end
    
    //for output
    
    always@(state,coin)
    begin
    case(state)
    sin: begin z=0; change_give=0; end
    s10: begin z=0; change_give=0; end
    s20: begin z=0; change_give=0; end
    s30: begin z=0; change_give=0; end
    s40: begin z=1; change_give=0; end
    s50: begin z=1; change_give=1; end
    s60: begin z=1; change_give=1; end
    s70: begin z=1; change_give=1; end
    s80: begin z=1; change_give=1; end
    endcase
    end
    
endmodule
