/*
Random input logic for DLA
*/

`include "../../random_number_generator.sv"

module dla_random(
    input logic clk,
    input logic rst,
    input logic i_ddr_wen_0_0,
    output logic o_dummy_out_0_0,
    input logic i_ddr_wen_0_1,
    output logic o_dummy_out_0_1,
	input logic i_ddr_wen_1_0,
    output logic o_dummy_out_1_0,
	input logic i_ddr_wen_1_1,
    output logic o_dummy_out_1_1,
	input logic i_ddr_wen_2_0,
    output logic o_dummy_out_2_0,
	input logic i_ddr_wen_2_1,
    output logic o_dummy_out_2_1,
    input logic i_ddr_wen_3_0,
    output logic o_dummy_out_3_0,
    input logic i_ddr_wen_3_1,
    output logic o_dummy_out_3_1,
    input logic i_ddr_wen_4_0,
    output logic o_dummy_out_4_0,
    input logic i_ddr_wen_4_1,
    output logic o_dummy_out_4_1,
    input logic i_ddr_wen_5_0,
    output logic o_dummy_out_5_0,
    input logic i_ddr_wen_5_1,
    output logic o_dummy_out_5_1,
    output logic o_valid
);

logic [15:0] i_ddr[5:0][3:0];
generate // generate block for random number generator
genvar i;
genvar j;
for(i=0; i<6; i=i+1) begin
    for(j=0; j<2; j=j+1) begin
        RandomNumberGenerator #(16, i+j) random_number_generator_0(
            .clk(clk),
            .reset(rst),
            .random_number(i_ddr[i][j])
        );
    end
end
endgenerate


DLA dla0(
	clk,
	rst,
	i_ddr_wen_0_0,
	i_ddr[0][0],
	o_dummy_out_0_0,
	i_ddr_wen_0_1,
	i_ddr[0][1],
	o_dummy_out_0_1,
	i_ddr_wen_1_0,
	i_ddr[1][0],
	o_dummy_out_1_0,
	i_ddr_wen_1_1,
	i_ddr[1][1],
	o_dummy_out_1_1,
	i_ddr_wen_2_0,
	i_ddr[2][0],
	o_dummy_out_2_0,
	i_ddr_wen_2_1,
	i_ddr[2][1],
	o_dummy_out_2_1,
	i_ddr_wen_3_0,
	i_ddr[3][0],
	o_dummy_out_3_0,
	i_ddr_wen_3_1,
	i_ddr[3][1],
	o_dummy_out_3_1,
	i_ddr_wen_4_0,
	i_ddr[4][0],
	o_dummy_out_4_0,
	i_ddr_wen_4_1,
	i_ddr[4][1],
	o_dummy_out_4_1,
	i_ddr_wen_5_0,
	i_ddr[5][0],
	o_dummy_out_5_0,
	i_ddr_wen_5_1,
	i_ddr[5][1],
	o_dummy_out_5_1,
	o_valid
);


endmodule