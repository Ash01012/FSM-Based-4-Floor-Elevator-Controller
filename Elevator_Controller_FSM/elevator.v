module elevator(count_en,direction,timer_start,clk,rst,current_floor,target_floor,timer_done);

input clk,rst,timer_done;
input [1:0] current_floor,target_floor;
output reg timer_start;
output reg count_en;
output reg[1:0] direction;
reg[1:0] current_state;
reg[1:0] next_state;
parameter IDLE = 2'b00;
parameter DOWN = 2'b01;
parameter UP = 2'b11;

always @ (posedge clk or posedge rst)
begin
if(rst==1)
  begin
  current_state <= IDLE;
end 

else
  begin
  current_state <= next_state;
  end
end

always @(*) 
begin
next_state=current_state;
count_en=0;
direction=IDLE;
timer_start=0;

if(current_state==IDLE)
begin
  if(current_floor==target_floor)
  begin
  next_state=IDLE;
  end

  else if(current_floor<target_floor)
  begin
  next_state=UP;
  direction = UP;
  timer_start=1;
  end

  else if(current_floor>target_floor)
  begin
  next_state=DOWN;
  direction = DOWN;
  timer_start=1;
  end 
  end

if(current_state==UP)
begin
direction=UP;
  if(timer_done==0)
  begin
  timer_start=1;
  end

  else if(timer_done==1 && current_floor+1<target_floor)
  begin
  next_state=UP;
  timer_start=1;
  count_en=1;
  end

  else if(timer_done==1 && current_floor+1==target_floor)
  begin
  next_state=IDLE;
  timer_start=0;
  count_en=1;
  end
  end

if(current_state==DOWN)
begin
direction=DOWN;
  if(timer_done==0)
  begin
    timer_start=1;
  end

  else if(timer_done==1 && current_floor-1>target_floor)
  begin
  next_state=DOWN;
  timer_start=1;
  count_en=1;
  end

  else if(timer_done==1 && current_floor-1==target_floor)
  begin
  next_state=IDLE;
  timer_start=0;
  count_en=1;
  end
  end

  end

  endmodule
