module topmodule(clk,rst,button_0,button_1,button_2,button_3);

input button_0 , button_1 , button_2 , button_3 ;
input clk,rst;
wire [1:0]direction;
wire count_en,timer_start,timer_done;
wire [1:0] current_floor;
reg [1:0] target_floor;

always @ (posedge clk or posedge rst) begin
if(rst==1) begin
target_floor <= 2'b00;
end 

else begin
   if(button_0) target_floor <= 2'b00;
   else if(button_1) target_floor <= 2'b01;
   else if(button_2) target_floor <= 2'b10;
   else if(button_3) target_floor <= 2'b11;
   
  end 

  end

  elevator fsm(
    .current_floor(current_floor), 
    .target_floor(target_floor),  
    .timer_done(timer_done),       
    .count_en(count_en),           
    .direction(direction),         
    .timer_start(timer_start),    
    .clk(clk),
    .rst(rst)
);

floor_counter block1 (
    .current_floor(current_floor), 
    .count_en(count_en),         
    .direction(direction),         
    .clk(clk),
    .rst(rst)
);

timer block2 (
    .timer_done(timer_done),      
    .timer_start(timer_start),     
    .clk(clk),
    .rst(rst)
);

endmodule



