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
    mem[0] = 8'h00;
    mem[1] = 8'h00;
    mem[2] = 8'h00;
    mem[3] = 8'h00;
    mem[4] = 8'haa;
    mem[5] = 8'h0a;
    mem[6] = 8'h00;
    mem[7] = 8'h00;
    mem[8] = 8'hae;
    mem[9] = 8'h04;
    mem[10] = 8'h00;
    mem[11] = 8'h00;
    mem[12] = 8'haa;
    mem[13] = 8'h04;
    mem[14] = 8'h00;
    mem[15] = 8'h00;
    mem[16] = 8'h4a;
    mem[17] = 8'h04;
    mem[18] = 8'h00;
    mem[19] = 8'h00;
    mem[20] = 8'h00;
    mem[21] = 8'h00;
    mem[22] = 8'h00;
    mem[23] = 8'h00;
    mem[24] = 8'he4;
    mem[25] = 8'h3a;
    mem[26] = 8'h01;
    mem[27] = 8'h00;
    mem[28] = 8'h4a;
    mem[29] = 8'h9a;
    mem[30] = 8'h02;
    mem[31] = 8'h00;
    mem[32] = 8'h4e;
    mem[33] = 8'h8a;
    mem[34] = 8'h02;
    mem[35] = 8'h00;
    mem[36] = 8'h4a;
    mem[37] = 8'h3a;
    mem[38] = 8'h01;
    mem[39] = 8'h00;
    mem[40] = 8'h00;
    mem[41] = 8'h00;
    mem[42] = 8'h00;
    mem[43] = 8'h00;
    mem[44] = 8'h00;
    mem[45] = 8'hf8;
    mem[46] = 8'h01;
    mem[47] = 8'h00;
    mem[48] = 8'h00;
    mem[49] = 8'hfc;
    mem[50] = 8'h03;
    mem[51] = 8'h00;
    mem[52] = 8'h7c;
    mem[53] = 8'hde;
    mem[54] = 8'h07;
    mem[55] = 8'h00;
    mem[56] = 8'h44;
    mem[57] = 8'h9e;
    mem[58] = 8'h07;
    mem[59] = 8'h00;
    mem[60] = 8'h54;
    mem[61] = 8'h1e;
    mem[62] = 8'h07;
    mem[63] = 8'h00;
    mem[64] = 8'h44;
    mem[65] = 8'h9e;
    mem[66] = 8'h07;
    mem[67] = 8'h00;
    mem[68] = 8'h7c;
    mem[69] = 8'hde;
    mem[70] = 8'h07;
    mem[71] = 8'h00;
    mem[72] = 8'h00;
    mem[73] = 8'hfc;
    mem[74] = 8'h03;
    mem[75] = 8'h00;
    mem[76] = 8'h00;
    mem[77] = 8'hf8;
    mem[78] = 8'h01;
    mem[79] = 8'h00;
end

  // Địa chỉ byte: y * 4 + (x / 8)
  wire [6:0] addr = {y[4:0], x[4:3]};
  // Trích xuất bit
  assign pixel = mem[addr][x[2:0]];

endmodule
