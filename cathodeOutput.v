`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2023 09:26:33 AM
// Design Name: 
// Module Name: cathodeTrack
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


module cathodeTrack(
clk, number, cathodeOutput
    );
    input clk;
    input [3:0] number = 0;
    output [6:0] cathodeOutput;
    
    reg [25:0] cathodeCounter = 0;
    
    always @(posedge clk)
    begin
         if(cathodeCounter >= 50000001)
        begin
            cathodeCounter = 0;
            number <= (currLED+1) % 10;
        end
        else
        begin
            cathodeCounter <= cathodeCounter + 1;
        end
        case(number)
        4'b0000:
            cathodeOutput <= 7'b0000001;
        4'b0001:
            cathodeOutput <= 7'b1001111;
        4'b0010:
            cathodeOutput <= 7'b0010010;
        4'b0011:
            cathodeOutput <= 7'b0000110;
        4'b0100:
            cathodeOutput <= 7'b1001100;
        4'b0101:
            cathodeOutput <= 7'b0100100;
        4'b0110:
            cathodeOutput <= 7'b0100000;
        4'b0111:
            cathodeOutput <= 7'b0001111;
        4'b1000:
            cathodeOutput <= 7'b0000000;
        4'b1001:
            cathodeOutput <= 7'b0000100;
        default:
            cathodeOutput <= 7'b11111111;
        endcase
            