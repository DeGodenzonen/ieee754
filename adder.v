`timescale 1ns / 1ps
module adder( input sA, input sB, input [23:0] mAes,input [23:0] mBes,output reg [24:0] result,
              output reg s);

always@(*)
begin
if(sA==sB)
  begin
  
  s<=sA;
  result<=mAes+mBes;
  end

else
  begin
  
  if(mAes>mBes)
    begin
      s<=sA;
      result<=mAes-mBes;
    end
   if(mAes<mBes)
   begin
     s<=sB;
     result<=mBes-mAes;
   end
   if(mAes==mBes)
   begin
   s<=0;
   result<=mBes-mAes;
   
   end
  end  
end
endmodule