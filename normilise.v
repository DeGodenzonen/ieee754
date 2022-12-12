`timescale 1ns / 1ps

module normilise(input [24:0] result,input [7:0] e ,output reg [22:0] final, output reg  [7:0] es);

reg [24:0]  x;

reg [4:0] count;
integer i;

reg [1:0] ch;

always@(*)
begin
  ch<=result[24:23];
  case(ch)
  2'b10:begin 
          
          x<=result>>1;
          es<=e+1;
          final<=x[22:0];
        end
  2'b01: begin
           
            x<=result;
            es<=e;
            final<=x[22:0];
         end
  
  2'b00: begin
          count=5'b00001;
          
          for(i=22;i>=0;i=i-1)
             begin
               if(result[i]==1)
                  begin
                  
                   i=-1;    //breaking loop
                  end
               else
                  begin
                    $display("Hi3");
                    count=count+1'b1;
                  end 
              end
          x <= (result<<count);
          es <= (e-count);
          final<=x[22:0];
         end
  
  endcase
end

endmodule
