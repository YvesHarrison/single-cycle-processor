/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

module sc_computer (resetn,cpu_clock,pc,inst,aluout,memout,imem_clk,dmem_clk,lcd,plus1,plus2,plus1_high,plus2_high,total_high,plus1_low,plus2_low,total_low);
   
   input resetn,cpu_clock;
   output [31:0] pc,inst,aluout,memout;
   output        imem_clk,dmem_clk;
   wire   [31:0] data;
   wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   reg clock,mem_clk;
	reg cnt1=0;
	reg [1:0]cnt2;	
	input	[4:0] plus1,plus2;
	output [6:0]   plus1_high,plus2_high,total_high,plus1_low,plus2_low,total_low;
	output [9:0] lcd;
	always@(posedge cpu_clock)
		begin
			if(cnt1>=1)
				mem_clk<=~mem_clk;
			else
				cnt1<=cnt1+1;
		end
	
	always@(posedge cpu_clock)
		begin
			if(cnt2>=3)
				clock<=~clock;
			else
				cnt2<=cnt2+1;
		end
	
   sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);          // CPU module.
   sc_instmem  imem (pc,inst,clock,mem_clk,imem_clk);                  // instruction memory.
   sc_datamem  dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk,plus1,plus2,plus1_high,plus2_high,total_high,plus1_low,plus2_low,total_low,lcd ); // data memory.

endmodule



