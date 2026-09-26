module ram_tb;
reg clk,rst,we,re;
reg [7:0]din;
reg [3:0]addr;
wire [7:0]dout;

ram DUT(.clk(clk),.rst(rst),.we(we),.re(re),.din(din),.addr(addr),.dout(dout));

initial
clk=1'b0;
always #10 clk=~clk;

task initialize;
begin
 rst=1'b1;
 we=1'b0;
 re=1'b0;
 din=8'd0;
 addr=4'd0;
 
end
endtask

task rst_kar;
begin
  @(negedge clk);
  rst=1'b0;
  @(negedge clk);
  rst=1'b1;
end
endtask

task we_kar(input [7:0]din_c,input [3:0]addr_cw);
begin
    @(posedge clk);
    we=1'b1;
    din=din_c;
    addr=addr_cw;
#5;
end
endtask

task re_kar(input [3:0]addr_cr);
begin
    @(posedge clk);
    re=1'b1;
    we=1'b0;
    addr=#20 addr_cr;
#5;
end
endtask

initial
begin
  initialize;
  rst_kar;
  we_kar(4'd8,3'd4);
  we_kar(4'd10,3'd5);
  we_kar(4'd12,3'd0);
  we_kar(4'd15,3'd14);

 re_kar(3'd5);
 re_kar(3'd4);
 re_kar(3'd3);

end

endmodule
