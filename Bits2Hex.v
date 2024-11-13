// 4 bits to 7-segment (hexa)decimal

module Bits2Hex (
	input wire [3:0] n,
	output wire [7:0] disp // bit 7 is sign
);

	reg [7:0] hex;
	always @(*) begin
		case (n)
			4'b0000: hex = 8'b00111111; // 0
			4'b0001: hex = 8'b00000110; // 1
			4'b0010: hex = 8'b01011011; // 2
			4'b0011: hex = 8'b01001111; // 3
			4'b0100: hex = 8'b01100110; // 4
			4'b0101: hex = 8'b01101101; // 5
			4'b0110: hex = 8'b01111101; // 6
			4'b0111: hex = 8'b00000111; // 7
			4'b1111: hex = 8'b10000110; // -1
			4'b1110: hex = 8'b11011011; // -2
			4'b1101: hex = 8'b11001111; // -3
			4'b1100: hex = 8'b11100110; // -4
			4'b1011: hex = 8'b11101101; // -5
			4'b1010: hex = 8'b11111101; // -6
			4'b1001: hex = 8'b10000111; // -7
			4'b1000: hex = 8'b11111111; // -8
		endcase
	end
	assign disp = ~hex; // invert because 7seg is active-low

endmodule
