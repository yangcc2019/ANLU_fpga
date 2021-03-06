module Top_gy_25_tx(
	input clk,
	input rst_n,
	
	output RX232,
	output over_rx,
	output over_all
    );
	wire [7:0]data_rx;
	uart_tx_dzj a (
    .clk(clk), 
    .rst_n(rst_n), 
    .over_tx(over_rx), 
    .data_rx(data_rx), 
    .send_en(send_en),
	.over_all(over_all)
    );
	uart_tx_GY25 abc (
    .clk(clk), 
    .bps_clk(bps_clk), 
    .send_en(send_en), 
    .rst_n(rst_n), 
    .data_rx(data_rx), 
    .RX232(RX232), 
    .over_rx(over_rx), 
    .bps_start(bps_start)
    );
	bps_set_115200 abcd (
    .clk(clk), 
    .rst_n(rst_n), 
    .bps_start(bps_start), 
    .bps_clk(bps_clk)
    );


endmodule