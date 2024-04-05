`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 20:33:44
// Design Name: 
// Module Name: GP_block
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
module GP_block(input logic g1,g2,p1,p2,output logic g1_2,p1_2);
    assign g1_2= g1| (p1&g2);
    assign p1_2=p1&p2;
endmodule


