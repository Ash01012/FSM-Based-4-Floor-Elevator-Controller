module timer(clk,timer_start,rst,timer_done);
input clk,timer_start,rst;
output reg timer_done;
parameter MAX=5;
reg [2:0] count = 3'b000;
always @(posedge clk or posedge rst)begin
if(rst==1) begin
count<=0;
timer_done<=0;
end 

else 
begin

if(timer_start==0)begin
count<=0;
timer_done<=0;
end 


else if(count==MAX-1 && timer_start==1) begin
timer_done<=1;
count <= 0;
end   

else if(timer_start==1 && count < MAX) begin
count<=count+1;
timer_done<=0;
end

end 

end 

endmodule 



