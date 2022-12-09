module moore_1101_tb();
	reg Clk,Rst,Din;
	wire Y;
	moore_1101 dut(Clk,Rst,Din,Y);
	initial
		begin
			Clk = 1'b0;
			forever #10 Clk = ~Clk;
		end
	initial
		begin
			Rst = 1'b1;
			#30;
			Rst = 1'b0;
		end
	task initialize;
		begin
			Din = 1'b0;
		end
	endtask
	task Data(input D);
		begin
			@(negedge Clk)
			Din <= D;
		end
	endtask
	initial
		begin
			initialize;
			Data(0);
			Data(1);
			Data(0);
			Data(1);
			Data(0);
			Data(1);
			Data(1);
			Data(1);
			Data(0);
			Data(1);
			Data(0);
			Data(1);
			Data(0);
			Data(1);
			$finish;
		end
	initial
		begin
			$dumpfile("Moore_1101.vcd");
			$dumpvars(1);
		end
endmodule
