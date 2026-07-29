module floor_counter(current_floor,rst,count_en,direction,clk);
input count_en,clk,rst ;
input [1:0] direction;
output reg [1:0]current_floor;
parameter UP = 2'b11;
parameter DOWN = 2'b01;
always @ (posedge clk or posedge rst)
begin
if(rst==1) begin
current_floor <= 0;
end 

else
begin
  if(count_en==1 && direction==UP)begin
current_floor <= current_floor+1;
end

  else if(count_en==1 && direction==DOWN)begin
current_floor <= current_floor-1;
end 

  else 
  begin
// do nothing
  end 

  end

  end  
 endmodule 
