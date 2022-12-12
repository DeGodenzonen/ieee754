`timescale 1ns / 1ps

module exponent(input [7:0] eA,input [7:0] eB,input [23:0] mAc,input [23:0] mBc,
                output reg [7:0] e,output reg [23:0] mAes,output reg [23:0] mBes);

reg [7:0] diff;

always@(*)
begin
if(eA>eB)
  begin
   e<=eA;
   diff<=eA-eB;
   mBes<=mBc>>diff;
   mAes<=mAc;
  end
  
if(eB>eA)
  begin
   e<=eB;
   diff<=eB-eA;
   mAes<=mAc>>diff;
   mBes<=mBc;
  end

if(eA==eB)
begin
   e<=eA;
   diff<=0;
   mAes<=mAc;
   mBes<=mBc;
  end

end
endmodule
