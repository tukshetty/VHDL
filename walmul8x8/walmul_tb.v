`timescale 1ns / 1ps

module walmult8x8_tb();
	logic clk, rst;
	logic [07:00] a;
	logic [07:00] b;
	logic [15:00] y;
	logic [15:00] yExpected;
	logic [31:0] vectorNum, errors;
	logic [31:0] testVectors [0:1023];
	
	walmult8x8 dut (a,b,y);

always 
begin
	clk = 1;
	#5; clk = 0;
	#5;
end

initial
begin
	$readmemh ("examplemul.tv", testVectors);
	vectorNum = 0;
	errors = 0;
	rst = 1;
	#27; rst = 0;
end

always @(posedge clk)
begin
	#1; 
	{a,b,yExpected} = testVectors [vectorNum];
end

always @(negedge clk)
	if (~rst)
	begin
		if (y !== yExpected)	
		begin
		$display ("Error : inputs = %h", {a,b});
		$display (" outputs = %h (%h expected)", y, yExpected);
		errors = errors +1;
	end
	vectorNum = vectorNum +1;
	if (testVectors[vectorNum] === 32'hx)
	begin
		$display ("%d tests completed with %d errors", vectorNum, errors);
		$finish;
	end
	end
endmodule
