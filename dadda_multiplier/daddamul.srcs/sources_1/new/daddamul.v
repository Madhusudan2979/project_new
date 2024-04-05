`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2022 16:43:52
// Design Name: 
// Module Name: daddamul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module daddamul(

    )
endmodule*/
module daddamul(
   out21, // g8,g48,g47,g46,g93,g132,g149,g151,
    a,b,c,d,e,f,g,h,en
);
output [7:0]out21;//g8,g48,g47,g46,g93,g132,g149,g151;

  
 input a,b,c,d,e,f,g,h,en;

wire g8_y,g48_y,g47_y,g46_y,g93_y,g132_y,g149_y,g151_y;
supply1 vdd;
supply0 gnd;
    
   
/*assign a[3]=a;
assign a[2]=b;
assign a[1]=c;
assign a[0]=d;
assign b[3]=e;
assign b[2]=f;
assign b[1]=g;
assign b[0]=h;*/

wire  and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15; //and16;
wire   fas2, fas3, fas4,  fas6, fas7, fas8  ; //fas1,fas5,fas10, fas11,fas9,fas12

wire  fac1, fac2, fac3, fac4, fac5, fac6, fac7, fac8, fac9, fac10, fac11; //, fac12
wire [7:0]p;
and a0(p[0],d,h); 

and a1(and1,d,g); 
and a2(and2,c,h); 

and a3(and3,c,g); 
and a4(and4,b,h); 

and a5(and5,b,g); 
and a6(and6,a,h); 

and a7(and7,a,g); 

and a8(and8,d,f); 

and a9(and9,c,f); 

and a10(and10,b,f); 

and a11(and11,a,f); 

and a12(and12,d,e); 

and a13(and13,c,e); 

and a14(and14,b,e); 

and a15(and15,a,e); 

ha ha1(p[1], hc1,and2,and1);

fa fa1(fs1, fc1,and3,and4,and5);

fa fa2(fs2, fc2,and7,and8,and9);

fa fa3(fs3, fc3,and10,and11,and12);


ha ha2(p[2], hc2,hc1,fs1);

fa fa4(fs4, fc4,and6,fc1,fs2);

ha ha3(hs3,hc3,fs3,fc2);

fa fa5(fs5, fc5,fc3,and13,and14);


ha ha4(p[3], hc4,fs4,hc2);

fa fa6(p[4], fc6,hc4,fc4,hs3);

fa fa7(p[5], fc7,fc6,hc3,fs5);

fa fa8(p[6], p[7],fc7,fc5,and15);
assign g8_y=p[0];
assign g48_y=p[1];
assign g47_y=p[2];
assign g46_y=p[3];
assign g93_y=p[4];
assign g132_y=p[5];
assign g149_y=p[6];
assign g151_y=p[7];


bufif1 o0_1(out21[0],g8_y,en); 

bufif1 o0_2(out21[1],g48_y,en);

bufif1 o0_3(out21[2],g47_y,en);

bufif1 o0_4(out21[3],g46_y,en);
bufif1 o0_5(out21[4],g93_y,en);
bufif1 o0_6(out21[5],g132_y,en);
bufif1 o0_7(out21[6],g149_y,en);
bufif1 o0_8(out21[7],g151_y,en);
endmodule