

`define REG_RX_SADDR     5'b00000 //BASEADDR+0x00
`define REG_RX_SIZE      5'b00001 //BASEADDR+0x04
`define REG_RX_CFG       5'b00010 //BASEADDR+0x08
`define REG_RX_INTCFG    5'b00011 //BASEADDR+0x0C

// ADC can't transmit
// `define REG_TX_SADDR     5'b00100 //BASEADDR+0x10
// `define REG_TX_SIZE      5'b00101 //BASEADDR+0x14
// `define REG_TX_CFG       5'b00110 //BASEADDR+0x18
// `define REG_TX_INTCFG    5'b00111 //BASEADDR+0x1C

`define REG_STATUS       5'b01000 //BASEADDR+0x20
// `define REG_VALID        5'b01100 //BASEADDR+0x24
// `define REG_DATA         5'b01101 //BASEADDR+0x28

module udma_adc_reg_if #(
    parameter L2_AWIDTH_NOAL = 12,
    parameter TRANS_SIZE     = 16,
    parameter ADC_WIDTH      = 12
) (
    input  logic 	                  clk_i,
    input  logic   	                  rstn_i,

    input  logic               [31:0] cfg_data_i,
    input  logic                [4:0] cfg_addr_i,
    input  logic                      cfg_valid_i,
    input  logic                      cfg_rwn_i,
    output logic               [31:0] cfg_data_o,
    output logic                      cfg_ready_o,

    output logic [L2_AWIDTH_NOAL-1:0] cfg_rx_startaddr_o,
    output logic     [TRANS_SIZE-1:0] cfg_rx_size_o,
    output logic                      cfg_rx_continuous_o,
    output logic                      cfg_rx_en_o,
    output logic                      cfg_rx_clr_o,
    input  logic                      cfg_rx_en_i,
    input  logic                      cfg_rx_pending_i,
    input  logic [L2_AWIDTH_NOAL-1:0] cfg_rx_curr_addr_i,
    input  logic     [TRANS_SIZE-1:0] cfg_rx_bytes_left_i,

    // input  logic        [ADC_WIDTH:0] rx_data_i,
    // input  logic                      rx_valid_i,
    // output logic                      rx_ready_o,

    // input  logic                      adc_update_i,

    // output logic [L2_AWIDTH_NOAL-1:0] cfg_tx_startaddr_o,
    // output logic     [TRANS_SIZE-1:0] cfg_tx_size_o,
    // output logic                      cfg_tx_continuous_o,
    // output logic                      cfg_tx_en_o,
    // output logic                      cfg_tx_clr_o,
    // input  logic                      cfg_tx_en_i,
    // input  logic                      cfg_tx_pending_i,
    // input  logic [L2_AWIDTH_NOAL-1:0] cfg_tx_curr_addr_i,
    // input  logic     [TRANS_SIZE-1:0] cfg_tx_bytes_left_i,

    input  logic               [1:0]  status_i
);

    logic [L2_AWIDTH_NOAL-1:0] r_rx_startaddr;
    logic   [TRANS_SIZE-1 : 0] r_rx_size;
    logic                      r_rx_continuous;
    logic                      r_rx_en;
    logic                      r_rx_clr;

    // logic [L2_AWIDTH_NOAL-1:0] r_tx_startaddr;
    // logic   [TRANS_SIZE-1 : 0] r_tx_size;
    // logic                      r_tx_continuous;
    // logic                      r_tx_en;
    // logic                      r_tx_clr;

    logic                      r_uart_en_tx;
    logic                      r_uart_en_rx;
    logic               [15:0] r_uart_div;
    logic                      r_uart_stop_bits;
    logic                [1:0] r_uart_bits;
    logic                      r_uart_parity_en;

    logic                [4:0] s_wr_addr;
    logic                [4:0] s_rd_addr;

    logic        [ADC_WIDTH:0] buf_data;
    logic                      buf_data_valid;
    logic                      adc_update_flag;

    assign rx_ready_o =  s_rx_valid_clr;

    assign s_wr_addr = (cfg_valid_i & ~cfg_rwn_i) ? cfg_addr_i : 5'h0;
    assign s_rd_addr = (cfg_valid_i &  cfg_rwn_i) ? cfg_addr_i : 5'h0;

    assign cfg_rx_startaddr_o  = r_rx_startaddr;
    assign cfg_rx_size_o       = r_rx_size;
    assign cfg_rx_continuous_o = r_rx_continuous;
    assign cfg_rx_en_o         = r_rx_en;
    assign cfg_rx_clr_o        = r_rx_clr;

    // assign cfg_tx_startaddr_o  = r_tx_startaddr;
    // assign cfg_tx_size_o       = r_tx_size;
    // assign cfg_tx_continuous_o = r_tx_continuous;
    // assign cfg_tx_en_o         = r_tx_en;
    // assign cfg_tx_clr_o        = r_tx_clr;

    // always_ff @(posedge clk_i, negedge rstn_i)
    // begin
    //     if(~rstn_i)
    //     begin
    //         buf_data <= 'h0;
    //         buf_data_valid <= 'h0;
    //         adc_update_flag <= 'h0;
    //     end
    //     else 
    //     begin
    //         if (s_rx_valid_clr)
    //         begin
    //             buf_data_valid <= 'h0;
    //             if (adc_update_i)  // if read access during adc_update 
    //             begin              // -> set flag
    //                 adc_update_flag <= 'h1;
    //             end
    //         end
    //         else 
    //         begin  // on not read access:
    //             if (adc_update_i | adc_update_flag)
    //             begin  // update data if new input
    //                 buf_data <= rx_data_i;
    //                 buf_data_valid <= 'h1;
    //                 adc_update_flag <= 'h0;
    //             end  // adc_update
    //         end  // s_rx_valid_clr
    //     end  // rstn_i 
    // end  // always_ff

    always_ff @(posedge clk_i, negedge rstn_i)
    begin
        if(~rstn_i)
        begin
            // SPI REGS
            r_rx_startaddr     <=  'h0;
            r_rx_size          <=  'h0;
            r_rx_continuous    <=  'h0;
            r_rx_en             =  'h0;
            r_rx_clr            =  'h0;
            // r_tx_startaddr     <=  'h0;
            // r_tx_size          <=  'h0;
            // r_tx_continuous    <=  'h0;
            // r_tx_en             =  'h0;
            // r_tx_clr            =  'h0;
        end
        else
        begin
            r_rx_en   =  'h0;
            r_rx_clr  =  'h0;
            // r_tx_en   =  'h0;
            // r_tx_clr  =  'h0;

            if (cfg_valid_i & ~cfg_rwn_i)
            begin
                case (s_wr_addr)
                `REG_RX_SADDR:
                    r_rx_startaddr    <= cfg_data_i[L2_AWIDTH_NOAL-1:0];
                `REG_RX_SIZE:
                    r_rx_size         <= cfg_data_i[TRANS_SIZE-1:0];
                `REG_RX_CFG:
                begin
                    r_rx_clr           = cfg_data_i[6];
                    r_rx_en            = cfg_data_i[4];
                    r_rx_continuous   <= cfg_data_i[0];
                end
                // `REG_TX_SADDR:
                //     r_tx_startaddr    <= cfg_data_i[L2_AWIDTH_NOAL-1:0];
                // `REG_TX_SIZE:
                //     r_tx_size         <= cfg_data_i[TRANS_SIZE-1:0];
                // `REG_TX_CFG:
                // begin
                //     r_tx_clr           = cfg_data_i[6];
                //     r_tx_en            = cfg_data_i[4];
                //     r_tx_continuous   <= cfg_data_i[0];
                // end

                endcase
            end
        end
    end //always

    always_comb
    begin
        cfg_data_o = 32'h0;

        s_rx_valid_clr = 1'b0;

        case (s_rd_addr)
        `REG_RX_SADDR:
            cfg_data_o = cfg_rx_curr_addr_i;
        `REG_RX_SIZE:
            cfg_data_o[TRANS_SIZE-1:0] = cfg_rx_bytes_left_i;
        `REG_RX_CFG:
            cfg_data_o = {26'h0,cfg_rx_pending_i,cfg_rx_en_i,3'h0,r_rx_continuous};
        // `REG_TX_SADDR:
        //     cfg_data_o = cfg_tx_curr_addr_i;
        // `REG_TX_SIZE:
        //     cfg_data_o[TRANS_SIZE-1:0] = cfg_tx_bytes_left_i;
        // `REG_TX_CFG:
        //     cfg_data_o = {26'h0,cfg_tx_pending_i,cfg_tx_en_i,3'h0,r_tx_continuous};
        `REG_STATUS:
            cfg_data_o = {30'h0,status_i};
        // `REG_VALID:
        //     cfg_data_o = {31'h0, buf_data_valid};
        // `REG_DATA:
        //   begin
        //      cfg_data_o     = {24'h0, buf_data};
        //      s_rx_valid_clr = 1'b1;
        //   end
        default:
            cfg_data_o = 'h0;
        endcase
    end

    assign cfg_ready_o  = 1'b1;

endmodule