module moore_1101(Clk,Rst,Din,Y);
	input Clk,Rst,Din;
	output reg Y;
	reg [2:0] curr_state;
	reg [2:0] next_state;
	parameter s0 = 3'b000;
	parameter s1 = 3'b001;
	parameter s2 = 3'b010;
	parameter s3 = 3'b011;
	parameter s4 = 3'b100;
	always @(posedge Clk)
		begin
			if(Rst)
				begin
					curr_state <= s0;
					Y <= 1'b0;
				end
			else
				begin
					curr_state <= next_state;
				end
		end
	always @(curr_state,Din)
		begin
			case(curr_state)
			s0 : begin
					if(Din)
						next_state = s1;
					else
						next_state = s0;
				end
			s1 : begin
					if(Din)
						next_state = s2;
					else
						next_state = s0;
				end
			s2 : begin
					if(Din)
						next_state = s2;
					else
						next_state = s3;
				end
			s3 : begin
					if(Din)
						next_state = s4;
					else
						next_state = s0;
				end
			s4 : begin
					if(Din)
						next_state = s1;
					else
						next_state = s0;
				end
			default : begin
						next_state = s0;
					end
			endcase
		end
	always @(curr_state)
		begin
			case(curr_state)
			s0 : Y = 1'b0;
			s1 : Y = 1'b0;
			s2 : Y = 1'b0;
			s3 : Y = 1'b0;
			s4 : Y = 1'b1;
			default : Y = 1'b0;
			endcase
		end
endmodule
