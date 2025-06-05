module fir_filter (
    input  wire        clk,
    input  wire        rst,       // synchronous reset (active high)
    input  wire signed [15:0] xn, // current input sample x[n]
    output reg  signed [31:0] yn  // output sample y[n]
);
    localparam signed [15:0] b0 = 16'h0199; // ≈ +0.1000
    localparam signed [15:0] b1 = 16'h0332; // ≈ +0.2000
    localparam signed [15:0] b2 = 16'h0666; // ≈ +0.4000
    localparam signed [15:0] b3 = 16'h0332; // ≈ +0.2000
    localparam signed [15:0] b4 = 16'h0199; // ≈ +0.1000

    reg signed [15:0] x_reg0, x_reg1, x_reg2, x_reg3, x_reg4;


    always @(posedge clk) begin
        if (rst) begin
            x_reg0 <= 16'sd0;
            x_reg1 <= 16'sd0;
            x_reg2 <= 16'sd0;
            x_reg3 <= 16'sd0;
            x_reg4 <= 16'sd0;
            yn     <= 32'sd0;
        end else begin
            // shift down
            x_reg4 <= x_reg3;
            x_reg3 <= x_reg2;
            x_reg2 <= x_reg1;
            x_reg1 <= x_reg0;
            x_reg0 <= xn;

            // multiply-accumulate five terms
            yn <= (b0 * x_reg0) +
                  (b1 * x_reg1) +
                  (b2 * x_reg2) +
                  (b3 * x_reg3) +
                  (b4 * x_reg4);
        end
    end
endmodule
