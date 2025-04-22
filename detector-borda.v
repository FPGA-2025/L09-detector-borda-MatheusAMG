module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output [1:0] detector
);

reg [1:0] sinal_atual;
reg [1:0] sinal_anterior;

assign detector[0] = (~sinal_anterior[0] & sinal_atual[0]);
assign detector[1] = (~sinal_anterior[1] & sinal_atual[1]);

always @(posedge clk, posedge rst) begin
    if (rst == 1) begin
        sinal_anterior <= 2'b00;
        sinal_atual <= 2'b00;
    end
    else begin
        sinal_atual <= entrada;
        sinal_anterior <= sinal_atual;
    end
end

endmodule

// detector tem que ser comportamental?? Reg?


// module tb;
//     reg clk = 0;
//     reg rst = 1;
//     reg [1:0] entrada = 0;
//     wire [1:0] detector;

//     Instância do DUT (Device Under Test)
//     detector_borda dut (
//         .clk(clk),
//         .rst(rst),
//         .entrada(entrada),
//         .detector(detector)
//     );

//     Clock de 10ns
//     always #5 clk = ~clk;

//     initial begin
//          $monitor("entrada[0]=%b, detector[0]=%b, entrada[1]=%b, detector[1]=%b", entrada[0], detector[0], entrada[1], detector[1]);

//         #10 rst = 0;

//         #10 entrada = 2'b 00; 
//         #10 entrada = 2'b 11; 
//         #10 entrada = 2'b 00; 
//         #10 entrada = 2'b 11; 
//         #10 entrada = 2'b 00; 


//         #20 $finish;
//     end
// endmodule
