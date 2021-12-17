`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2021 07:08:36 PM
// Design Name: 
// Module Name: clock
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


module clock#(parameter div_value = 1)(
input wire clk, // 100Mhz
output reg divided_clk = 0 //25
);
integer counter_value = 0;
always@ (posedge clk)
begin
    // counting to div_value
    if (counter_value == div_value)
        counter_value <= 0;
    else 
        counter_value <= counter_value+1;
    end
// divide clock
always@ (posedge clk)
begin
    if(counter_value == div_value)
        divided_clk <= ~divided_clk;
end
endmodule
