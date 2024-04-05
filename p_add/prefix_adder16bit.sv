`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 20:31:41
// Design Name: 
// Module Name: prefix_adder16bit
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
module prefix_adder16bit(
input logic[15:0]a,b,input cin,output logic [15:0]sum,output logic Carry);
    logic[15:0]g,p;
    //logic[15:0] c;
    logic[7:0]gb1,pb1;//first level 
    logic[7:0]gb2,pb2;//econd level
    logic[7:0]gb3,pb3; //third level
    logic[7:0]gb4,pb4;//fourth level 
    //computng the generate and propogate of all the blocks 
    gen_prop GP0(a[0],b[0],g[0],p[0]);
    gen_prop GP1(a[1],b[1],g[1],p[1]);
    gen_prop GP2(a[2],b[2],g[2],p[2]);
    gen_prop GP3(a[3],b[3],g[3],p[3]);
    gen_prop GP4(a[4],b[4],g[4],p[4]);
    gen_prop GP5(a[5],b[5],g[5],p[5]);
    gen_prop GP6(a[6],b[6],g[6],p[6]);
    gen_prop GP7(a[7],b[7],g[7],p[7]);
    gen_prop GP78(a[8],b[8],g[8],p[8]);
    gen_prop GP10(a[9],b[9],g[9],p[9]);
    gen_prop GP11(a[10],b[10],g[10],p[10]);
    gen_prop GP12(a[11],b[11],g[11],p[11]);
    gen_prop GP13(a[12],b[12],g[12],p[12]);
    gen_prop GP14(a[13],b[13],g[13],p[13]);
    gen_prop GP15(a[14],b[14],g[14],p[14]); 
    gen_prop GP16(a[15],b[15],g[15],p[15]);
    
    //computng the generatea and propogate of the first level - checked
    GP_block GPB1_0(g[0],cin,p[0],0,gb1[0],pb1[0]); // C0
    GP_block GPB1_2(g[2],g[1],p[2],p[1],gb1[1],pb1[1]);
    GP_block GPB1_4(g[4],g[3],p[4],p[3],gb1[2],pb1[2]); 
    GP_block GPB1_6(g[6],g[5],p[6],p[5],gb1[3],pb1[3]); 
    GP_block GPB1_8(g[8],g[7],p[8],p[7],gb1[4],pb1[4]); 
    GP_block GPB1_10(g[10],g[9],p[10],p[9],gb1[5],pb1[5]); 
    GP_block GPB1_12(g[12],g[11],p[12],p[11],gb1[6],pb1[6]); 
    GP_block GPB_14(g[14],g[13],p[14],p[13],gb1[7],pb1[7]); 
    
    //computing the generate and propogate of the second level  -
    GP_block GPB2_2(g[1],gb1[0],p[1],pb1[0],gb2[0],pb2[0]); //C1 
    GP_block GPB2_1(gb1[1],gb1[0],pb1[1],pb1[0],gb2[1],pb2[1]); //C2
    GP_block GPB2_4(g[5],gb1[2],p[5],pb1[2],gb2[2],pb2[2]);//5:3
    GP_block GPB2_3(gb1[3],gb1[2],pb1[3],pb1[2],gb2[3],pb2[3]);//6:3
    //extend the same for a 16 bit adder by following the same tree 
    GP_block GPB2_5(g[9],gb1[4],p[9],pb1[4],gb2[4],pb2[4]); //9-7
    GP_block GPB2_6(gb1[5],gb1[4],pb1[5],pb1[4],gb2[5],pb2[5]); //10-7
    GP_block GPB2_7(g[13],gb1[6],p[13],pb1[6],gb2[6],pb2[6]); //13-11
    GP_block GPB2_8(gb1[7],gb1[6],pb1[7],pb1[6],gb2[7],pb2[7]); //14-11
    
    //computing the generate and propogate signals of the third level 
    GP_block GPB3_4(g[3],gb2[1],p[3],pb2[1],gb3[0],pb3[0]); //c3
    GP_block GPB3_3(gb1[2],gb2[1],pb1[2],pb2[1],gb3[1],gb3[1]); //c4
    GP_block GPB3_1(gb2[2],gb2[1],pb2[2],pb2[1],gb3[2],pb3[2]);//c5 
    GP_block GPB3_2(gb2[3],gb2[1],pb2[3],pb2[1],gb3[3],pb3[3]);//c6 
    //exending the same for a 16 bit machine 
    GP_block GPB3_5(g[11],gb2[5],p[11],pb2[5],gb3[4],pb3[4]);//11-7
    GP_block GPB3_6(gb1[6],gb2[5],pb1[6],pb2[5],gb3[5],pb3[5]); //12-7
    GP_block GPB3_7(gb2[6],gb2[5],pb2[6],pb2[5],gb3[6],pb3[6]); //13-7
    GP_block GPB3_8(gb2[7],gb2[5],pb2[7],pb2[5],gb3[7],pb3[7]); //14-7
    
    //computing the generate and propogate signals for the fourth level 
    GP_block GPB4_1(g[7],gb3[3],p[7],pb3[3],gb4[0],pb4[0]); //c7
GP_block GPB4_2(gb1[4],gb3[3],pb1[4],pb3[3],gb4[1],pb4[1]); //c8
GP_block GPB4_3(gb2[4],gb3[3],pb2[4],pb3[3],gb4[2],pb4[2]); //c9
GP_block GPB4_4(gb2[5],gb3[3],pb2[5],pb3[3],gb4[3],pb4[3]); //c10
GP_block GPB4_5(gb3[4],gb3[3],pb3[4],pb3[3],gb4[4],pb4[4]); //c11
GP_block GPB4_6(gb3[5],gb3[3],pb3[5],pb3[3],gb4[5],pb4[5]); //c12
GP_block GPB4_7(gb3[6],gb3[3],pb3[6],pb3[3],gb4[6],pb4[6]); //c13
GP_block GPB4_8(gb3[7],gb3[3],pb3[7],pb3[3],gb4[7],pb4[7]); //c14
    
    //calculating the sum prefixes 
    sum_prefix S1(a[0],b[0],cin,sum[0]);
    sum_prefix S2(a[1],b[1],gb1[0],sum[1]);
    sum_prefix S3(a[2],b[2],gb2[0],sum[2]);
    sum_prefix S4(a[3],b[3],gb2[1],sum[3]);
    sum_prefix S5(a[4],b[4],gb3[0],sum[4]); 
    sum_prefix S6(a[5],b[5],gb3[2],sum[5]); 
    sum_prefix S7(a[6],b[6],gb3[2],sum[6]); 
    sum_prefix S8(a[7],b[7],gb3[3],sum[7]);
    sum_prefix S9(a[8],b[8],gb4[1],sum[8]); 
    sum_prefix S10(a[9],b[9],gb4[0],sum[9]); 
    sum_prefix S11(a[10],b[10],gb4[1],sum[10]);
    sum_prefix S12(a[11],b[11],gb4[2],sum[11]); 
    sum_prefix S13(a[12],b[12],gb4[3],sum[12]); 
    sum_prefix S14(a[13],b[13],gb4[4],sum[13]); 
    sum_prefix S15(a[14],b[14],gb4[5],sum[14]); 
    sum_prefix S16(a[15],b[15],gb4[6],sum[15]);  
    
    assign Carry = (a[7] & gb3[0]) | (b[7] & gb3[3]) | (b[7] & gb3[3]);
endmodule