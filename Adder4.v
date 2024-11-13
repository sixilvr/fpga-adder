// 4-bit full adder

module Adder4 (
	input wire  [3:0] a,
	input wire  [3:0] b,
	input wire  carry_in,
	output wire [3:0] sum,
	output wire carry_out,
	output wire overflow
);

	wire carry_0, carry_1, carry_2; // internal wires for carries
	
	// instantiate 4 adders
	Adder1 add0 ( a[0], b[0], carry_in, sum[0], carry_0 );
	Adder1 add1 ( a[1], b[1], carry_0,  sum[1], carry_1 );
	Adder1 add2 ( a[2], b[2], carry_1,  sum[2], carry_2 );
	Adder1 add3 ( a[3], b[3], carry_2,  sum[3], carry_out );
	
	// overflow if addends have the same sign
	// and sign is different from result
	assign overflow = ~(a[3] ^ b[3]) & (a[3] ^ sum[3]);
	
endmodule