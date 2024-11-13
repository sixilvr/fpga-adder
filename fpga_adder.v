//module fpga_adder (
//	// addend - 2, 5 bits
//	input wire [4:0] a,
//	input wire [4:0] b,
//	// 7-seg digits - 5, 6 bits (not counting DP)
//	output wire [6:0] d0,
//	output wire [6:0] d1,
//	output wire [6:0] d2,
//	output wire [6:0] d3,
//	output wire [6:0] d4,
//	// 7-seg - negative sign
//	output wire [6:0] neg
//);
//
//	wire [7:0] add_result; // stores addition result
//	Add5 add_5 ( .a(a), .b(b), .res(add_result) ); // calculate addition
//	Bin2Dec bin_2_dec ( add_result, d0, d1, d2, d3, d4, neg ); // display value
//
//endmodule

module fpga_adder (
	input wire [3:0] a,
	input wire [3:0] b,
	input wire op_code, // 0 = add, 1 = subtract
	output wire op_light,
	output wire overflow,
	output wire [7:0] disp0,
	output wire [7:0] disp1,
	output wire [7:0] disp2,
	output wire [4:0] raw_bits
);

	// display operation
	assign op_light = op_code;

	// calculate sum
	wire [3:0] sum;
	wire [3:0] b_adjusted = b ^ {4{op_code}}; // negate b if subtract
	wire carry;
	Adder4 adder ( a, b_adjusted, op_code, sum, carry, overflow );

	// display values
	Bits2Hex disp_a ( a, disp0 );
	Bits2Hex disp_b ( b, disp1 );
	Bits2Hex disp_sum ( sum, disp2 );
	
	assign raw_bits = { carry, sum };

endmodule