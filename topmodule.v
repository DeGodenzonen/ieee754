`timescale 1ns / 1ps
module topmodule( input [31:0] A, input [31:0] B,output  [31:0] outpt);

reg [22:0] mA;
reg [22:0] mB;
reg sA; reg sB; 
reg [7:0] eA;
reg [7:0] eB;
reg [23:0] mAc;
reg [23:0] mBc;

always@(*)
begin
   {sA,eA,mA}<=A;
   {sB,eB,mB}<=B;

   mAc<={1'b1,mA};
   mBc<={1'b1,mB};
   
  

end

wire [7:0] we;
wire [23:0] wmAes;
wire [23:0] wmBes;

exponent a1(.eA(eA),.eB(eB),.mAc(mAc),.mBc(mBc),
                .e(we),.mAes(wmAes),.mBes(wmBes));
                

wire [24:0] wresult;                
adder  a2( .sA(sA), .sB(sB), .mAes(wmAes),.mBes(wmBes),.result(wresult),
           .s(ws)); //signed bit and mantisa is the output


wire [22:0] wfinal;
wire [7:0] wes;

normilise  a3(.result(wresult), .e(we) , .final(wfinal), .es(wes));

assign outpt={ws,wes[7:0],wfinal[22:0]};
endmodule