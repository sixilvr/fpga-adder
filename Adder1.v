// 1-bit full adder

module Adder1 (
	input wire  a,
	input wire  b,
	input wire  carry_in,
	output wire sum,
	output wire carry_out
);

	wire sum_ab = a ^ b;
	assign sum = sum_ab ^ carry_in;
	assign carry_out = (sum_ab & carry_in) | (a & b);

endmodule