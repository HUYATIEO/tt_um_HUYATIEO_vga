/*
 * Copyright (c) 2024 Tiny Tapeout LTD
 * SPDX-License-Identifier: Apache-2.0
 * Author: Uri Shaked
 */

`default_nettype none

module bitmap_rom (
    input wire [4:0] x,
    input wire [4:0] y,
    output wire pixel
);

reg [7:0] mem[79:0];
initial begin
    mem[0] = 8'hff;
    mem[1] = 8'hff;
    mem[2] = 8'h0f;
    mem[3] = 8'h00;
    mem[4] = 8'h9f;
    mem[5] = 8'h9f;
    mem[6] = 8'h0f;
    mem[7] = 8'h00;
    mem[8] = 8'h8f;
    mem[9] = 8'h19;
    mem[10] = 8'h0f;
    mem[11] = 8'h00;
    mem[12] = 8'hc7;
    mem[13] = 8'h30;
    mem[14] = 8'h0e;
    mem[15] = 8'h00;
    mem[16] = 8'he3;
    mem[17] = 8'h70;
    mem[18] = 8'h0c;
    mem[19] = 8'h00;
    mem[20] = 8'hf1;
    mem[21] = 8'hf0;
    mem[22] = 8'h08;
    mem[23] = 8'h00;
    mem[24] = 8'h79;
    mem[25] = 8'he0;
    mem[26] = 8'h09;
    mem[27] = 8'h00;
    mem[28] = 8'h78;
    mem[29] = 8'he6;
    mem[30] = 8'h01;
    mem[31] = 8'h00;
    mem[32] = 8'h7c;
    mem[33] = 8'he6;
    mem[34] = 8'h03;
    mem[35] = 8'h00;
    mem[36] = 8'h00;
    mem[37] = 8'h00;
    mem[38] = 8'h00;
    mem[39] = 8'h00;
    mem[40] = 8'h00;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
    mem[43] = 8'h00;
    mem[44] = 8'h3c;
    mem[45] = 8'hcf;
    mem[46] = 8'h03;
    mem[47] = 8'h00;
    mem[48] = 8'h3c;
    mem[49] = 8'hcf;
    mem[50] = 8'h03;
    mem[51] = 8'h00;
    mem[52] = 8'h38;
    mem[53] = 8'hcf;
    mem[54] = 8'h01;
    mem[55] = 8'h00;
    mem[56] = 8'h19;
    mem[57] = 8'h8f;
    mem[58] = 8'h09;
    mem[59] = 8'h00;
    mem[60] = 8'h91;
    mem[61] = 8'h9f;
    mem[62] = 8'h08;
    mem[63] = 8'h00;
    mem[64] = 8'h83;
    mem[65] = 8'h1f;
    mem[66] = 8'h0c;
    mem[67] = 8'h00;
    mem[68] = 8'h07;
    mem[69] = 8'h0f;
    mem[70] = 8'h0e;
    mem[71] = 8'h00;
    mem[72] = 8'h0f;
    mem[73] = 8'h0f;
    mem[74] = 8'h0f;
    mem[75] = 8'h00;
    mem[76] = 8'hff;
    mem[77] = 8'hff;
    mem[78] = 8'h0f;
    mem[79] = 8'h00;
end
  // Địa chỉ byte: y * 4 + (x / 8)
  wire [6:0] addr = {y[4:0], x[4:3]};
  // Trích xuất bit
  assign pixel = mem[addr][x[2:0]];

endmodule
