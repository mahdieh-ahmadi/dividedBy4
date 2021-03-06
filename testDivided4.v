`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:17:55 12/01/2020
// Design Name:   Divided4
// Module Name:   E:/university/3991/fpga/homeworks/dividedBy4/testDivided4.v
// Project Name:  divided4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Divided4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testDivided4;

	// Inputs
	reg [7:0] data_in;
	reg data_valid;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] data_out;
	wire data_valid_out;

	// Instantiate the Unit Under Test (UUT)
	Divided4 uut (
		.data_in(data_in), 
		.data_valid(data_valid), 
		.clk(clk), 
		.reset(reset), 
		.data_out(data_out), 
		.data_valid_out(data_valid_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		data_valid = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		@(negedge clk250);
		data_valid <= 1;
		data_in <= 8'b01110101;
		@(negedge clk250)	data_in <= 8'b01110101;
      @(negedge clk250) data_valid <= 0;
		#100;
      @(negedge clk250);
		data_valid <= 1;
		data_in <= 8'b10000001;
		@(negedge clk250)	data_in <= 8'b01110101;
		@(negedge clk250);	
      data_valid <= 0;
		#100;
      @(negedge clk250);
		data_valid <= 1;
		data_in <= 8'b01110101;
		@(negedge clk250)	data_in <= 8'b01110101;
      @(negedge clk250) data_valid <= 0;
		#100;
      @(negedge clk250);
		data_valid <= 1;
		data_in <= 8'b01000001;
		@(negedge clk250)	data_in <= 8'b00110101;
		@(negedge clk250);	
      data_valid <= 0;	
		

	end
	
	always #10 in_clk <= ~in_clk;
      
endmodule

