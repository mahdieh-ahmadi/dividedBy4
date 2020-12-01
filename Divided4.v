`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:02 12/01/2020 
// Design Name: 
// Module Name:    Divided4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Divided4(
    input [7:0] data_in,
    input data_valid,
    input CLKin,
    input reset,
    output reg [7:0] data_out,
    output reg data_valid_out
    );
	
	reg [10:0] sum = 0;
	wire clk250, clk100, Lock;
	wire [7:0] dataOut;
	reg RDEnable =1'b0;
	wire  full1;
	wire emp;
	wire [2:0] rdDataCount;
	reg [3:0] counter = 0;
	reg start = 1'b0;
	
	
	always @(posedge clk100)
	begin
		if((rdDataCount >= 4 && counter == 0) || RDEnable == 1)
		begin
			RDEnable <= 1;

			if(counter <= 3 && RDEnable == 1)
			begin
				sum <= sum+dataOut;
				counter <= counter +1;
			end
			else if(counter > 3)
			begin
				data_out <= sum/4;
				data_valid_out <= 1;
				RDEnable <= 0;
				sum <= 0;
				counter <= 0;
			end
		end
	end
  
	 
	 ClockGeneratore c1
   (// Clock in ports
    .CLK_IN1(CLKin),      // IN
    // Clock out ports
    .CLK_OUT1(clk250),     // OUT
    .CLK_OUT2(clk100),     // OUT
    // Status and control signals
    .RESET(reset),// IN
    .LOCKED(Lock));    
	  
	  FIFO fifoGeneratore (
	  .rst(reset), // input rst 
	  .wr_clk(clk250), // input wr_clk
	  .rd_clk(clk100), // input rd_clk
	  .din(data_in), // input [7 : 0] din
	  .wr_en(data_valid), // input wr_en
	  .rd_en(RDEnable), // input rd_en
	  .dout(dataOut), // output [7 : 0] dout
	  .full(full1), // output full
	  .empty(emp), // output empty
	  .rd_data_count(rdDataCount) // output [2 : 0] rd_data_count
		);


endmodule
