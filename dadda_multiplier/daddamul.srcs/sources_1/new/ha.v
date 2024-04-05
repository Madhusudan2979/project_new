`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2022 16:46:41
// Design Name: 
// Module Name: ha
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


/*module ha(

    );
endmodule*/
/*module ha(Data_out_Sum,
    Data_out_Carry,
    Data_in_A,
    Data_in_B
    
    );

    //what are the input ports.
    input Data_in_A;
    input Data_in_B;
    //What are the output ports.
    output Data_out_Sum;
     output Data_out_Carry;
     
     //Implement the Sum and Carry equations using Verilog Bit operators.
     assign Data_out_Sum = Data_in_A ^ Data_in_B;  //XOR operation
     assign Data_out_Carry = Data_in_A & Data_in_B; //AND operation
    
endmodule*/
module ha(s,c,a,b

    );
    output s,c;
    input a,b;
    assign s=a^b;
    assign c=a&b;
endmodule
