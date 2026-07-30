`timescale 1ns/1ps

module testbench;
reg clk,rst,button_0,button_1,button_2,button_3;

topmodule DUT(.clk(clk),.rst(rst),.button_0(button_0),.button_1(button_1),.button_2(button_2),.button_3(button_3));

always #5 clk = ~ clk;

initial 
begin
$dumpfile("topmodule.vcd");
$dumpvars(0, DUT);
end 

initial
 begin
 button_0=0;
 button_1=0;
 button_2=0;
 button_3=0;
 clk=0;
 rst=1;

 #20 rst = 0 ;
 
 #10 
 button_1=1;
 #10
 button_1=0;

 #200 // The time was chosen to be much larger than the time the elevator needs to move between floors which is nearly 50 ns 
 #10 button_3=1;
 #10 button_3=0;

 #200 // The time was chosen to be much larger than the time the elevator needs to move between floors which is nearly 50 ns  

 #10 button_2=1;
 #10 button_2=0;

 #200 // The time was chosen to be much larger than the time the elevator needs to move between floors which is nearly 50 ns
 #10 button_1=1;
 #10 button_1=0;
 
 # 2000 ;
 $finish;
 end
 endmodule 



 
