///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2016 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2016.1
//  \   \          Description : Xilinx Formal Library Component
//  /   /                        CMACE4
// /___/   /\      Filename    : CMACE4.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module CMACE4 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter CTL_PTP_TRANSPCLK_MODE = "FALSE",
  parameter CTL_RX_CHECK_ACK = "TRUE",
  parameter CTL_RX_CHECK_PREAMBLE = "FALSE",
  parameter CTL_RX_CHECK_SFD = "FALSE",
  parameter CTL_RX_DELETE_FCS = "TRUE",
  parameter [15:0] CTL_RX_ETYPE_GCP = 16'h8808,
  parameter [15:0] CTL_RX_ETYPE_GPP = 16'h8808,
  parameter [15:0] CTL_RX_ETYPE_PCP = 16'h8808,
  parameter [15:0] CTL_RX_ETYPE_PPP = 16'h8808,
  parameter CTL_RX_FORWARD_CONTROL = "FALSE",
  parameter CTL_RX_IGNORE_FCS = "FALSE",
  parameter [14:0] CTL_RX_MAX_PACKET_LEN = 15'h2580,
  parameter [7:0] CTL_RX_MIN_PACKET_LEN = 8'h40,
  parameter [15:0] CTL_RX_OPCODE_GPP = 16'h0001,
  parameter [15:0] CTL_RX_OPCODE_MAX_GCP = 16'hFFFF,
  parameter [15:0] CTL_RX_OPCODE_MAX_PCP = 16'hFFFF,
  parameter [15:0] CTL_RX_OPCODE_MIN_GCP = 16'h0000,
  parameter [15:0] CTL_RX_OPCODE_MIN_PCP = 16'h0000,
  parameter [15:0] CTL_RX_OPCODE_PPP = 16'h0001,
  parameter [47:0] CTL_RX_PAUSE_DA_MCAST = 48'h0180C2000001,
  parameter [47:0] CTL_RX_PAUSE_DA_UCAST = 48'h000000000000,
  parameter [47:0] CTL_RX_PAUSE_SA = 48'h000000000000,
  parameter CTL_RX_PROCESS_LFI = "FALSE",
  parameter [8:0] CTL_RX_RSFEC_AM_THRESHOLD = 9'h046,
  parameter [1:0] CTL_RX_RSFEC_FILL_ADJUST = 2'h0,
  parameter [15:0] CTL_RX_VL_LENGTH_MINUS1 = 16'h3FFF,
  parameter [63:0] CTL_RX_VL_MARKER_ID0 = 64'hC16821003E97DE00,
  parameter [63:0] CTL_RX_VL_MARKER_ID1 = 64'h9D718E00628E7100,
  parameter [63:0] CTL_RX_VL_MARKER_ID10 = 64'hFD6C990002936600,
  parameter [63:0] CTL_RX_VL_MARKER_ID11 = 64'hB9915500466EAA00,
  parameter [63:0] CTL_RX_VL_MARKER_ID12 = 64'h5CB9B200A3464D00,
  parameter [63:0] CTL_RX_VL_MARKER_ID13 = 64'h1AF8BD00E5074200,
  parameter [63:0] CTL_RX_VL_MARKER_ID14 = 64'h83C7CA007C383500,
  parameter [63:0] CTL_RX_VL_MARKER_ID15 = 64'h3536CD00CAC93200,
  parameter [63:0] CTL_RX_VL_MARKER_ID16 = 64'hC4314C003BCEB300,
  parameter [63:0] CTL_RX_VL_MARKER_ID17 = 64'hADD6B70052294800,
  parameter [63:0] CTL_RX_VL_MARKER_ID18 = 64'h5F662A00A099D500,
  parameter [63:0] CTL_RX_VL_MARKER_ID19 = 64'hC0F0E5003F0F1A00,
  parameter [63:0] CTL_RX_VL_MARKER_ID2 = 64'h594BE800A6B41700,
  parameter [63:0] CTL_RX_VL_MARKER_ID3 = 64'h4D957B00B26A8400,
  parameter [63:0] CTL_RX_VL_MARKER_ID4 = 64'hF50709000AF8F600,
  parameter [63:0] CTL_RX_VL_MARKER_ID5 = 64'hDD14C20022EB3D00,
  parameter [63:0] CTL_RX_VL_MARKER_ID6 = 64'h9A4A260065B5D900,
  parameter [63:0] CTL_RX_VL_MARKER_ID7 = 64'h7B45660084BA9900,
  parameter [63:0] CTL_RX_VL_MARKER_ID8 = 64'hA02476005FDB8900,
  parameter [63:0] CTL_RX_VL_MARKER_ID9 = 64'h68C9FB0097360400,
  parameter CTL_TEST_MODE_PIN_CHAR = "FALSE",
  parameter CTL_TX_CUSTOM_PREAMBLE_ENABLE = "FALSE",
  parameter [47:0] CTL_TX_DA_GPP = 48'h0180C2000001,
  parameter [47:0] CTL_TX_DA_PPP = 48'h0180C2000001,
  parameter [15:0] CTL_TX_ETHERTYPE_GPP = 16'h8808,
  parameter [15:0] CTL_TX_ETHERTYPE_PPP = 16'h8808,
  parameter CTL_TX_FCS_INS_ENABLE = "TRUE",
  parameter CTL_TX_IGNORE_FCS = "FALSE",
  parameter [3:0] CTL_TX_IPG_VALUE = 4'hC,
  parameter [15:0] CTL_TX_OPCODE_GPP = 16'h0001,
  parameter [15:0] CTL_TX_OPCODE_PPP = 16'h0001,
  parameter CTL_TX_PTP_1STEP_ENABLE = "FALSE",
  parameter [10:0] CTL_TX_PTP_LATENCY_ADJUST = 11'h2C1,
  parameter [47:0] CTL_TX_SA_GPP = 48'h000000000000,
  parameter [47:0] CTL_TX_SA_PPP = 48'h000000000000,
  parameter [15:0] CTL_TX_VL_LENGTH_MINUS1 = 16'h3FFF,
  parameter [63:0] CTL_TX_VL_MARKER_ID0 = 64'hC16821003E97DE00,
  parameter [63:0] CTL_TX_VL_MARKER_ID1 = 64'h9D718E00628E7100,
  parameter [63:0] CTL_TX_VL_MARKER_ID10 = 64'hFD6C990002936600,
  parameter [63:0] CTL_TX_VL_MARKER_ID11 = 64'hB9915500466EAA00,
  parameter [63:0] CTL_TX_VL_MARKER_ID12 = 64'h5CB9B200A3464D00,
  parameter [63:0] CTL_TX_VL_MARKER_ID13 = 64'h1AF8BD00E5074200,
  parameter [63:0] CTL_TX_VL_MARKER_ID14 = 64'h83C7CA007C383500,
  parameter [63:0] CTL_TX_VL_MARKER_ID15 = 64'h3536CD00CAC93200,
  parameter [63:0] CTL_TX_VL_MARKER_ID16 = 64'hC4314C003BCEB300,
  parameter [63:0] CTL_TX_VL_MARKER_ID17 = 64'hADD6B70052294800,
  parameter [63:0] CTL_TX_VL_MARKER_ID18 = 64'h5F662A00A099D500,
  parameter [63:0] CTL_TX_VL_MARKER_ID19 = 64'hC0F0E5003F0F1A00,
  parameter [63:0] CTL_TX_VL_MARKER_ID2 = 64'h594BE800A6B41700,
  parameter [63:0] CTL_TX_VL_MARKER_ID3 = 64'h4D957B00B26A8400,
  parameter [63:0] CTL_TX_VL_MARKER_ID4 = 64'hF50709000AF8F600,
  parameter [63:0] CTL_TX_VL_MARKER_ID5 = 64'hDD14C20022EB3D00,
  parameter [63:0] CTL_TX_VL_MARKER_ID6 = 64'h9A4A260065B5D900,
  parameter [63:0] CTL_TX_VL_MARKER_ID7 = 64'h7B45660084BA9900,
  parameter [63:0] CTL_TX_VL_MARKER_ID8 = 64'hA02476005FDB8900,
  parameter [63:0] CTL_TX_VL_MARKER_ID9 = 64'h68C9FB0097360400,
  parameter SIM_DEVICE = "ULTRASCALE_PLUS",
  parameter TEST_MODE_PIN_CHAR = "FALSE"
)(
  output [15:0] DRP_DO,
  output DRP_RDY,
  output [329:0] RSFEC_BYPASS_RX_DOUT,
  output RSFEC_BYPASS_RX_DOUT_CW_START,
  output RSFEC_BYPASS_RX_DOUT_VALID,
  output [329:0] RSFEC_BYPASS_TX_DOUT,
  output RSFEC_BYPASS_TX_DOUT_CW_START,
  output RSFEC_BYPASS_TX_DOUT_VALID,
  output [127:0] RX_DATAOUT0,
  output [127:0] RX_DATAOUT1,
  output [127:0] RX_DATAOUT2,
  output [127:0] RX_DATAOUT3,
  output RX_ENAOUT0,
  output RX_ENAOUT1,
  output RX_ENAOUT2,
  output RX_ENAOUT3,
  output RX_EOPOUT0,
  output RX_EOPOUT1,
  output RX_EOPOUT2,
  output RX_EOPOUT3,
  output RX_ERROUT0,
  output RX_ERROUT1,
  output RX_ERROUT2,
  output RX_ERROUT3,
  output [6:0] RX_LANE_ALIGNER_FILL_0,
  output [6:0] RX_LANE_ALIGNER_FILL_1,
  output [6:0] RX_LANE_ALIGNER_FILL_10,
  output [6:0] RX_LANE_ALIGNER_FILL_11,
  output [6:0] RX_LANE_ALIGNER_FILL_12,
  output [6:0] RX_LANE_ALIGNER_FILL_13,
  output [6:0] RX_LANE_ALIGNER_FILL_14,
  output [6:0] RX_LANE_ALIGNER_FILL_15,
  output [6:0] RX_LANE_ALIGNER_FILL_16,
  output [6:0] RX_LANE_ALIGNER_FILL_17,
  output [6:0] RX_LANE_ALIGNER_FILL_18,
  output [6:0] RX_LANE_ALIGNER_FILL_19,
  output [6:0] RX_LANE_ALIGNER_FILL_2,
  output [6:0] RX_LANE_ALIGNER_FILL_3,
  output [6:0] RX_LANE_ALIGNER_FILL_4,
  output [6:0] RX_LANE_ALIGNER_FILL_5,
  output [6:0] RX_LANE_ALIGNER_FILL_6,
  output [6:0] RX_LANE_ALIGNER_FILL_7,
  output [6:0] RX_LANE_ALIGNER_FILL_8,
  output [6:0] RX_LANE_ALIGNER_FILL_9,
  output [3:0] RX_MTYOUT0,
  output [3:0] RX_MTYOUT1,
  output [3:0] RX_MTYOUT2,
  output [3:0] RX_MTYOUT3,
  output [7:0] RX_OTN_BIP8_0,
  output [7:0] RX_OTN_BIP8_1,
  output [7:0] RX_OTN_BIP8_2,
  output [7:0] RX_OTN_BIP8_3,
  output [7:0] RX_OTN_BIP8_4,
  output [65:0] RX_OTN_DATA_0,
  output [65:0] RX_OTN_DATA_1,
  output [65:0] RX_OTN_DATA_2,
  output [65:0] RX_OTN_DATA_3,
  output [65:0] RX_OTN_DATA_4,
  output RX_OTN_ENA,
  output RX_OTN_LANE0,
  output RX_OTN_VLMARKER,
  output [55:0] RX_PREOUT,
  output [4:0] RX_PTP_PCSLANE_OUT,
  output [79:0] RX_PTP_TSTAMP_OUT,
  output RX_SOPOUT0,
  output RX_SOPOUT1,
  output RX_SOPOUT2,
  output RX_SOPOUT3,
  output STAT_RX_ALIGNED,
  output STAT_RX_ALIGNED_ERR,
  output [2:0] STAT_RX_BAD_CODE,
  output [2:0] STAT_RX_BAD_FCS,
  output STAT_RX_BAD_PREAMBLE,
  output STAT_RX_BAD_SFD,
  output STAT_RX_BIP_ERR_0,
  output STAT_RX_BIP_ERR_1,
  output STAT_RX_BIP_ERR_10,
  output STAT_RX_BIP_ERR_11,
  output STAT_RX_BIP_ERR_12,
  output STAT_RX_BIP_ERR_13,
  output STAT_RX_BIP_ERR_14,
  output STAT_RX_BIP_ERR_15,
  output STAT_RX_BIP_ERR_16,
  output STAT_RX_BIP_ERR_17,
  output STAT_RX_BIP_ERR_18,
  output STAT_RX_BIP_ERR_19,
  output STAT_RX_BIP_ERR_2,
  output STAT_RX_BIP_ERR_3,
  output STAT_RX_BIP_ERR_4,
  output STAT_RX_BIP_ERR_5,
  output STAT_RX_BIP_ERR_6,
  output STAT_RX_BIP_ERR_7,
  output STAT_RX_BIP_ERR_8,
  output STAT_RX_BIP_ERR_9,
  output [19:0] STAT_RX_BLOCK_LOCK,
  output STAT_RX_BROADCAST,
  output [2:0] STAT_RX_FRAGMENT,
  output [1:0] STAT_RX_FRAMING_ERR_0,
  output [1:0] STAT_RX_FRAMING_ERR_1,
  output [1:0] STAT_RX_FRAMING_ERR_10,
  output [1:0] STAT_RX_FRAMING_ERR_11,
  output [1:0] STAT_RX_FRAMING_ERR_12,
  output [1:0] STAT_RX_FRAMING_ERR_13,
  output [1:0] STAT_RX_FRAMING_ERR_14,
  output [1:0] STAT_RX_FRAMING_ERR_15,
  output [1:0] STAT_RX_FRAMING_ERR_16,
  output [1:0] STAT_RX_FRAMING_ERR_17,
  output [1:0] STAT_RX_FRAMING_ERR_18,
  output [1:0] STAT_RX_FRAMING_ERR_19,
  output [1:0] STAT_RX_FRAMING_ERR_2,
  output [1:0] STAT_RX_FRAMING_ERR_3,
  output [1:0] STAT_RX_FRAMING_ERR_4,
  output [1:0] STAT_RX_FRAMING_ERR_5,
  output [1:0] STAT_RX_FRAMING_ERR_6,
  output [1:0] STAT_RX_FRAMING_ERR_7,
  output [1:0] STAT_RX_FRAMING_ERR_8,
  output [1:0] STAT_RX_FRAMING_ERR_9,
  output STAT_RX_FRAMING_ERR_VALID_0,
  output STAT_RX_FRAMING_ERR_VALID_1,
  output STAT_RX_FRAMING_ERR_VALID_10,
  output STAT_RX_FRAMING_ERR_VALID_11,
  output STAT_RX_FRAMING_ERR_VALID_12,
  output STAT_RX_FRAMING_ERR_VALID_13,
  output STAT_RX_FRAMING_ERR_VALID_14,
  output STAT_RX_FRAMING_ERR_VALID_15,
  output STAT_RX_FRAMING_ERR_VALID_16,
  output STAT_RX_FRAMING_ERR_VALID_17,
  output STAT_RX_FRAMING_ERR_VALID_18,
  output STAT_RX_FRAMING_ERR_VALID_19,
  output STAT_RX_FRAMING_ERR_VALID_2,
  output STAT_RX_FRAMING_ERR_VALID_3,
  output STAT_RX_FRAMING_ERR_VALID_4,
  output STAT_RX_FRAMING_ERR_VALID_5,
  output STAT_RX_FRAMING_ERR_VALID_6,
  output STAT_RX_FRAMING_ERR_VALID_7,
  output STAT_RX_FRAMING_ERR_VALID_8,
  output STAT_RX_FRAMING_ERR_VALID_9,
  output STAT_RX_GOT_SIGNAL_OS,
  output STAT_RX_HI_BER,
  output STAT_RX_INRANGEERR,
  output STAT_RX_INTERNAL_LOCAL_FAULT,
  output STAT_RX_JABBER,
  output [7:0] STAT_RX_LANE0_VLM_BIP7,
  output STAT_RX_LANE0_VLM_BIP7_VALID,
  output STAT_RX_LOCAL_FAULT,
  output [19:0] STAT_RX_MF_ERR,
  output [19:0] STAT_RX_MF_LEN_ERR,
  output [19:0] STAT_RX_MF_REPEAT_ERR,
  output STAT_RX_MISALIGNED,
  output STAT_RX_MULTICAST,
  output STAT_RX_OVERSIZE,
  output STAT_RX_PACKET_1024_1518_BYTES,
  output STAT_RX_PACKET_128_255_BYTES,
  output STAT_RX_PACKET_1519_1522_BYTES,
  output STAT_RX_PACKET_1523_1548_BYTES,
  output STAT_RX_PACKET_1549_2047_BYTES,
  output STAT_RX_PACKET_2048_4095_BYTES,
  output STAT_RX_PACKET_256_511_BYTES,
  output STAT_RX_PACKET_4096_8191_BYTES,
  output STAT_RX_PACKET_512_1023_BYTES,
  output STAT_RX_PACKET_64_BYTES,
  output STAT_RX_PACKET_65_127_BYTES,
  output STAT_RX_PACKET_8192_9215_BYTES,
  output STAT_RX_PACKET_BAD_FCS,
  output STAT_RX_PACKET_LARGE,
  output [2:0] STAT_RX_PACKET_SMALL,
  output STAT_RX_PAUSE,
  output [15:0] STAT_RX_PAUSE_QUANTA0,
  output [15:0] STAT_RX_PAUSE_QUANTA1,
  output [15:0] STAT_RX_PAUSE_QUANTA2,
  output [15:0] STAT_RX_PAUSE_QUANTA3,
  output [15:0] STAT_RX_PAUSE_QUANTA4,
  output [15:0] STAT_RX_PAUSE_QUANTA5,
  output [15:0] STAT_RX_PAUSE_QUANTA6,
  output [15:0] STAT_RX_PAUSE_QUANTA7,
  output [15:0] STAT_RX_PAUSE_QUANTA8,
  output [8:0] STAT_RX_PAUSE_REQ,
  output [8:0] STAT_RX_PAUSE_VALID,
  output STAT_RX_RECEIVED_LOCAL_FAULT,
  output STAT_RX_REMOTE_FAULT,
  output STAT_RX_RSFEC_AM_LOCK0,
  output STAT_RX_RSFEC_AM_LOCK1,
  output STAT_RX_RSFEC_AM_LOCK2,
  output STAT_RX_RSFEC_AM_LOCK3,
  output STAT_RX_RSFEC_CORRECTED_CW_INC,
  output STAT_RX_RSFEC_CW_INC,
  output [2:0] STAT_RX_RSFEC_ERR_COUNT0_INC,
  output [2:0] STAT_RX_RSFEC_ERR_COUNT1_INC,
  output [2:0] STAT_RX_RSFEC_ERR_COUNT2_INC,
  output [2:0] STAT_RX_RSFEC_ERR_COUNT3_INC,
  output STAT_RX_RSFEC_HI_SER,
  output STAT_RX_RSFEC_LANE_ALIGNMENT_STATUS,
  output [13:0] STAT_RX_RSFEC_LANE_FILL_0,
  output [13:0] STAT_RX_RSFEC_LANE_FILL_1,
  output [13:0] STAT_RX_RSFEC_LANE_FILL_2,
  output [13:0] STAT_RX_RSFEC_LANE_FILL_3,
  output [7:0] STAT_RX_RSFEC_LANE_MAPPING,
  output [31:0] STAT_RX_RSFEC_RSVD,
  output STAT_RX_RSFEC_UNCORRECTED_CW_INC,
  output STAT_RX_STATUS,
  output [2:0] STAT_RX_STOMPED_FCS,
  output [19:0] STAT_RX_SYNCED,
  output [19:0] STAT_RX_SYNCED_ERR,
  output [2:0] STAT_RX_TEST_PATTERN_MISMATCH,
  output STAT_RX_TOOLONG,
  output [6:0] STAT_RX_TOTAL_BYTES,
  output [13:0] STAT_RX_TOTAL_GOOD_BYTES,
  output STAT_RX_TOTAL_GOOD_PACKETS,
  output [2:0] STAT_RX_TOTAL_PACKETS,
  output STAT_RX_TRUNCATED,
  output [2:0] STAT_RX_UNDERSIZE,
  output STAT_RX_UNICAST,
  output STAT_RX_USER_PAUSE,
  output STAT_RX_VLAN,
  output [19:0] STAT_RX_VL_DEMUXED,
  output [4:0] STAT_RX_VL_NUMBER_0,
  output [4:0] STAT_RX_VL_NUMBER_1,
  output [4:0] STAT_RX_VL_NUMBER_10,
  output [4:0] STAT_RX_VL_NUMBER_11,
  output [4:0] STAT_RX_VL_NUMBER_12,
  output [4:0] STAT_RX_VL_NUMBER_13,
  output [4:0] STAT_RX_VL_NUMBER_14,
  output [4:0] STAT_RX_VL_NUMBER_15,
  output [4:0] STAT_RX_VL_NUMBER_16,
  output [4:0] STAT_RX_VL_NUMBER_17,
  output [4:0] STAT_RX_VL_NUMBER_18,
  output [4:0] STAT_RX_VL_NUMBER_19,
  output [4:0] STAT_RX_VL_NUMBER_2,
  output [4:0] STAT_RX_VL_NUMBER_3,
  output [4:0] STAT_RX_VL_NUMBER_4,
  output [4:0] STAT_RX_VL_NUMBER_5,
  output [4:0] STAT_RX_VL_NUMBER_6,
  output [4:0] STAT_RX_VL_NUMBER_7,
  output [4:0] STAT_RX_VL_NUMBER_8,
  output [4:0] STAT_RX_VL_NUMBER_9,
  output STAT_TX_BAD_FCS,
  output STAT_TX_BROADCAST,
  output STAT_TX_FRAME_ERROR,
  output STAT_TX_LOCAL_FAULT,
  output STAT_TX_MULTICAST,
  output STAT_TX_PACKET_1024_1518_BYTES,
  output STAT_TX_PACKET_128_255_BYTES,
  output STAT_TX_PACKET_1519_1522_BYTES,
  output STAT_TX_PACKET_1523_1548_BYTES,
  output STAT_TX_PACKET_1549_2047_BYTES,
  output STAT_TX_PACKET_2048_4095_BYTES,
  output STAT_TX_PACKET_256_511_BYTES,
  output STAT_TX_PACKET_4096_8191_BYTES,
  output STAT_TX_PACKET_512_1023_BYTES,
  output STAT_TX_PACKET_64_BYTES,
  output STAT_TX_PACKET_65_127_BYTES,
  output STAT_TX_PACKET_8192_9215_BYTES,
  output STAT_TX_PACKET_LARGE,
  output STAT_TX_PACKET_SMALL,
  output STAT_TX_PAUSE,
  output [8:0] STAT_TX_PAUSE_VALID,
  output STAT_TX_PTP_FIFO_READ_ERROR,
  output STAT_TX_PTP_FIFO_WRITE_ERROR,
  output [5:0] STAT_TX_TOTAL_BYTES,
  output [13:0] STAT_TX_TOTAL_GOOD_BYTES,
  output STAT_TX_TOTAL_GOOD_PACKETS,
  output STAT_TX_TOTAL_PACKETS,
  output STAT_TX_UNICAST,
  output STAT_TX_USER_PAUSE,
  output STAT_TX_VLAN,
  output TX_OVFOUT,
  output [4:0] TX_PTP_PCSLANE_OUT,
  output [79:0] TX_PTP_TSTAMP_OUT,
  output [15:0] TX_PTP_TSTAMP_TAG_OUT,
  output TX_PTP_TSTAMP_VALID_OUT,
  output TX_RDYOUT,
  output [15:0] TX_SERDES_ALT_DATA0,
  output [15:0] TX_SERDES_ALT_DATA1,
  output [15:0] TX_SERDES_ALT_DATA2,
  output [15:0] TX_SERDES_ALT_DATA3,
  output [63:0] TX_SERDES_DATA0,
  output [63:0] TX_SERDES_DATA1,
  output [63:0] TX_SERDES_DATA2,
  output [63:0] TX_SERDES_DATA3,
  output [31:0] TX_SERDES_DATA4,
  output [31:0] TX_SERDES_DATA5,
  output [31:0] TX_SERDES_DATA6,
  output [31:0] TX_SERDES_DATA7,
  output [31:0] TX_SERDES_DATA8,
  output [31:0] TX_SERDES_DATA9,
  output TX_UNFOUT,

  input CTL_CAUI4_MODE,
  input CTL_RSFEC_ENABLE_TRANSCODER_BYPASS_MODE,
  input CTL_RSFEC_IEEE_ERROR_INDICATION_MODE,
  input CTL_RX_CHECK_ETYPE_GCP,
  input CTL_RX_CHECK_ETYPE_GPP,
  input CTL_RX_CHECK_ETYPE_PCP,
  input CTL_RX_CHECK_ETYPE_PPP,
  input CTL_RX_CHECK_MCAST_GCP,
  input CTL_RX_CHECK_MCAST_GPP,
  input CTL_RX_CHECK_MCAST_PCP,
  input CTL_RX_CHECK_MCAST_PPP,
  input CTL_RX_CHECK_OPCODE_GCP,
  input CTL_RX_CHECK_OPCODE_GPP,
  input CTL_RX_CHECK_OPCODE_PCP,
  input CTL_RX_CHECK_OPCODE_PPP,
  input CTL_RX_CHECK_SA_GCP,
  input CTL_RX_CHECK_SA_GPP,
  input CTL_RX_CHECK_SA_PCP,
  input CTL_RX_CHECK_SA_PPP,
  input CTL_RX_CHECK_UCAST_GCP,
  input CTL_RX_CHECK_UCAST_GPP,
  input CTL_RX_CHECK_UCAST_PCP,
  input CTL_RX_CHECK_UCAST_PPP,
  input CTL_RX_ENABLE,
  input CTL_RX_ENABLE_GCP,
  input CTL_RX_ENABLE_GPP,
  input CTL_RX_ENABLE_PCP,
  input CTL_RX_ENABLE_PPP,
  input CTL_RX_FORCE_RESYNC,
  input [8:0] CTL_RX_PAUSE_ACK,
  input [8:0] CTL_RX_PAUSE_ENABLE,
  input CTL_RX_RSFEC_ENABLE,
  input CTL_RX_RSFEC_ENABLE_CORRECTION,
  input CTL_RX_RSFEC_ENABLE_INDICATION,
  input [79:0] CTL_RX_SYSTEMTIMERIN,
  input CTL_RX_TEST_PATTERN,
  input CTL_TX_ENABLE,
  input CTL_TX_LANE0_VLM_BIP7_OVERRIDE,
  input [7:0] CTL_TX_LANE0_VLM_BIP7_OVERRIDE_VALUE,
  input [8:0] CTL_TX_PAUSE_ENABLE,
  input [15:0] CTL_TX_PAUSE_QUANTA0,
  input [15:0] CTL_TX_PAUSE_QUANTA1,
  input [15:0] CTL_TX_PAUSE_QUANTA2,
  input [15:0] CTL_TX_PAUSE_QUANTA3,
  input [15:0] CTL_TX_PAUSE_QUANTA4,
  input [15:0] CTL_TX_PAUSE_QUANTA5,
  input [15:0] CTL_TX_PAUSE_QUANTA6,
  input [15:0] CTL_TX_PAUSE_QUANTA7,
  input [15:0] CTL_TX_PAUSE_QUANTA8,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER0,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER1,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER2,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER3,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER4,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER5,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER6,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER7,
  input [15:0] CTL_TX_PAUSE_REFRESH_TIMER8,
  input [8:0] CTL_TX_PAUSE_REQ,
  input CTL_TX_PTP_VLANE_ADJUST_MODE,
  input CTL_TX_RESEND_PAUSE,
  input CTL_TX_RSFEC_ENABLE,
  input CTL_TX_SEND_IDLE,
  input CTL_TX_SEND_LFI,
  input CTL_TX_SEND_RFI,
  input [79:0] CTL_TX_SYSTEMTIMERIN,
  input CTL_TX_TEST_PATTERN,
  input [9:0] DRP_ADDR,
  input DRP_CLK,
  input [15:0] DRP_DI,
  input DRP_EN,
  input DRP_WE,
  input [329:0] RSFEC_BYPASS_RX_DIN,
  input RSFEC_BYPASS_RX_DIN_CW_START,
  input [329:0] RSFEC_BYPASS_TX_DIN,
  input RSFEC_BYPASS_TX_DIN_CW_START,
  input RX_CLK,
  input RX_RESET,
  input [15:0] RX_SERDES_ALT_DATA0,
  input [15:0] RX_SERDES_ALT_DATA1,
  input [15:0] RX_SERDES_ALT_DATA2,
  input [15:0] RX_SERDES_ALT_DATA3,
  input [9:0] RX_SERDES_CLK,
  input [63:0] RX_SERDES_DATA0,
  input [63:0] RX_SERDES_DATA1,
  input [63:0] RX_SERDES_DATA2,
  input [63:0] RX_SERDES_DATA3,
  input [31:0] RX_SERDES_DATA4,
  input [31:0] RX_SERDES_DATA5,
  input [31:0] RX_SERDES_DATA6,
  input [31:0] RX_SERDES_DATA7,
  input [31:0] RX_SERDES_DATA8,
  input [31:0] RX_SERDES_DATA9,
  input [9:0] RX_SERDES_RESET,
  input TX_CLK,
  input [127:0] TX_DATAIN0,
  input [127:0] TX_DATAIN1,
  input [127:0] TX_DATAIN2,
  input [127:0] TX_DATAIN3,
  input TX_ENAIN0,
  input TX_ENAIN1,
  input TX_ENAIN2,
  input TX_ENAIN3,
  input TX_EOPIN0,
  input TX_EOPIN1,
  input TX_EOPIN2,
  input TX_EOPIN3,
  input TX_ERRIN0,
  input TX_ERRIN1,
  input TX_ERRIN2,
  input TX_ERRIN3,
  input [3:0] TX_MTYIN0,
  input [3:0] TX_MTYIN1,
  input [3:0] TX_MTYIN2,
  input [3:0] TX_MTYIN3,
  input [55:0] TX_PREIN,
  input [1:0] TX_PTP_1588OP_IN,
  input [15:0] TX_PTP_CHKSUM_OFFSET_IN,
  input [63:0] TX_PTP_RXTSTAMP_IN,
  input [15:0] TX_PTP_TAG_FIELD_IN,
  input [15:0] TX_PTP_TSTAMP_OFFSET_IN,
  input TX_PTP_UPD_CHKSUM_IN,
  input TX_RESET,
  input TX_SOPIN0,
  input TX_SOPIN1,
  input TX_SOPIN2,
  input TX_SOPIN3
);

endmodule

`endcelldefine