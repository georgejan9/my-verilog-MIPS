module debouncer (
	input wire clk,
	input wire rst,
	input wire i_button,
	output reg o_button
);
	reg [18:0]counter ;
	reg button_state;
	reg button_sync1,button_sync2;
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
			begin
				button_sync1<=1'b0;
				button_sync2<=1'b0;
			end
		else
		begin
			button_sync1<=i_button;
			button_sync2<=button_sync1;
		end
	end
	always @ (posedge clk or posedge rst)
	begin
		if (rst)
		begin
		counter <=19'b0;
		button_state<=1'b0;
		o_button<=1'b0;
		end
		else
		begin
			if (button_sync2 != button_state)
			begin
			counter<=counter+1'b1;
				if (counter==500_000)
				begin
				button_state<=button_sync2;
				o_button<=button_sync2;
				counter<=19'b0;
				end
				end
				else
				begin
				counter <= 19'b0;
		end
		end
	
	end
endmodule