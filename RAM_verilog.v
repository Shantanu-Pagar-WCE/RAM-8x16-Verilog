module ram(clk,rst,din,we,re,addr,dout);
input clk,rst,re,we;
input [7:0]din;
input [3:0]addr;
output [7:0]dout;
reg[7:0]mem[15:0];
integer i;
reg [7:0]dout;
always@(posedge clk)
begin
   if(~rst)
      begin
       for(i=0;i<16;i=i+1)
         begin
          mem[i]=8'd0;
         end
      end
   else if(we)
    begin
      mem[addr]=din;
    end
   else if(re)
    begin
      dout=mem[addr];
    end
   else
    begin
      mem[addr]=mem[addr];
    end
end
endmodule
