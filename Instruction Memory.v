`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 06:51:42 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
input reset,
input [31:0] A,
output [31:0] RD
    );
    
    reg [31:0] Mem [1023:0];
    
//    assign RD = (reset)? 32'b0 : Mem[A[31:2]];
      assign RD = (reset)? 32'b0 : Mem[A>>2];    
      
    initial begin
        Mem[0] = 32'h03200513;
        Mem[1] = 32'h01E00393;
        Mem[2] = 32'h00A38233;
        Mem[3] = 32'h404502B3;
        Mem[4] = 32'h00702823;
        Mem[5] = 32'h01002883;
        Mem[6] = 32'h03288A13;
        Mem[7] = 32'h0C800493;
    end
    
endmodule
