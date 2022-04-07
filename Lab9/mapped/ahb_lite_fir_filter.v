/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar 31 00:17:00 2022
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, coefficient_num, modwait, fir_out, err, 
        hsel, haddr, hsize, htrans, hwrite, hwdata, clear_new_coefficient, 
        sample_data, data_ready, new_coefficient_set, fir_coefficient, hrdata, 
        hresp );
  input [1:0] coefficient_num;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] sample_data;
  output [15:0] fir_coefficient;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite, clear_new_coefficient;
  output data_ready, new_coefficient_set, hresp;
  wire   N53, N163, N164, N165, N169, N171, N172, N173, N180, N181,
         \Register_Map[15][7] , \Register_Map[15][6] , \Register_Map[15][5] ,
         \Register_Map[15][4] , \Register_Map[15][3] , \Register_Map[15][2] ,
         \Register_Map[15][1] , \Register_Map[15][0] , \Register_Map[14][7] ,
         \Register_Map[14][6] , \Register_Map[14][5] , \Register_Map[14][4] ,
         \Register_Map[14][3] , \Register_Map[14][2] , \Register_Map[14][1] ,
         \Register_Map[13][7] , \Register_Map[13][6] , \Register_Map[13][5] ,
         \Register_Map[13][4] , \Register_Map[13][3] , \Register_Map[13][2] ,
         \Register_Map[13][1] , \Register_Map[13][0] , \Register_Map[12][7] ,
         \Register_Map[12][6] , \Register_Map[12][5] , \Register_Map[12][4] ,
         \Register_Map[12][3] , \Register_Map[12][2] , \Register_Map[12][1] ,
         \Register_Map[12][0] , \Register_Map[11][7] , \Register_Map[11][6] ,
         \Register_Map[11][5] , \Register_Map[11][4] , \Register_Map[11][3] ,
         \Register_Map[11][2] , \Register_Map[11][1] , \Register_Map[11][0] ,
         \Register_Map[10][7] , \Register_Map[10][6] , \Register_Map[10][5] ,
         \Register_Map[10][4] , \Register_Map[10][3] , \Register_Map[10][2] ,
         \Register_Map[10][1] , \Register_Map[10][0] , \Register_Map[9][7] ,
         \Register_Map[9][6] , \Register_Map[9][5] , \Register_Map[9][4] ,
         \Register_Map[9][3] , \Register_Map[9][2] , \Register_Map[9][1] ,
         \Register_Map[9][0] , \Register_Map[8][7] , \Register_Map[8][6] ,
         \Register_Map[8][5] , \Register_Map[8][4] , \Register_Map[8][3] ,
         \Register_Map[8][2] , \Register_Map[8][1] , \Register_Map[8][0] ,
         \Register_Map[7][7] , \Register_Map[7][6] , \Register_Map[7][5] ,
         \Register_Map[7][4] , \Register_Map[7][3] , \Register_Map[7][2] ,
         \Register_Map[7][1] , \Register_Map[7][0] , \Register_Map[6][7] ,
         \Register_Map[6][6] , \Register_Map[6][5] , \Register_Map[6][4] ,
         \Register_Map[6][3] , \Register_Map[6][2] , \Register_Map[6][1] ,
         \Register_Map[6][0] , \Register_Map[3][7] , \Register_Map[3][6] ,
         \Register_Map[3][5] , \Register_Map[3][4] , \Register_Map[3][3] ,
         \Register_Map[3][2] , \Register_Map[3][1] , \Register_Map[3][0] ,
         \Register_Map[2][7] , \Register_Map[2][6] , \Register_Map[2][5] ,
         \Register_Map[2][4] , \Register_Map[2][3] , \Register_Map[2][2] ,
         \Register_Map[2][1] , \Register_Map[2][0] , \Register_Map[1][7] ,
         \Register_Map[1][6] , \Register_Map[1][5] , \Register_Map[1][4] ,
         \Register_Map[1][3] , \Register_Map[1][2] , \Register_Map[1][1] ,
         \Register_Map[1][0] , \Register_Map[0][7] , \Register_Map[0][6] ,
         \Register_Map[0][5] , \Register_Map[0][4] , \Register_Map[0][3] ,
         \Register_Map[0][2] , \Register_Map[0][1] , \Register_Map[0][0] ,
         size_buffer, \next_Register_Map[15][7] , \next_Register_Map[15][6] ,
         \next_Register_Map[15][5] , \next_Register_Map[15][4] ,
         \next_Register_Map[15][3] , \next_Register_Map[15][2] ,
         \next_Register_Map[15][1] , \next_Register_Map[15][0] ,
         \next_Register_Map[14][7] , \next_Register_Map[14][6] ,
         \next_Register_Map[14][5] , \next_Register_Map[14][4] ,
         \next_Register_Map[14][3] , \next_Register_Map[14][2] ,
         \next_Register_Map[14][1] , \next_Register_Map[14][0] ,
         \next_Register_Map[3][7] , \next_Register_Map[3][6] ,
         \next_Register_Map[3][5] , \next_Register_Map[3][4] ,
         \next_Register_Map[3][3] , \next_Register_Map[3][2] ,
         \next_Register_Map[3][1] , \next_Register_Map[3][0] ,
         \next_Register_Map[2][7] , \next_Register_Map[2][6] ,
         \next_Register_Map[2][5] , \next_Register_Map[2][4] ,
         \next_Register_Map[2][3] , \next_Register_Map[2][2] ,
         \next_Register_Map[2][1] , \next_Register_Map[2][0] ,
         \next_Register_Map[1][7] , \next_Register_Map[1][6] ,
         \next_Register_Map[1][5] , \next_Register_Map[1][4] ,
         \next_Register_Map[1][3] , \next_Register_Map[1][2] ,
         \next_Register_Map[1][1] , \next_Register_Map[1][0] ,
         \next_Register_Map[0][7] , \next_Register_Map[0][6] ,
         \next_Register_Map[0][5] , \next_Register_Map[0][4] ,
         \next_Register_Map[0][3] , \next_Register_Map[0][2] ,
         \next_Register_Map[0][1] , \next_Register_Map[0][0] , N215, N216,
         N217, N218, N219, N220, N221, N222, N227, N228, N229, N230, N231,
         N232, N233, N234, N251, N252, N253, N254, N255, N256, N257, N258,
         n508, n510, n512, n514, n516, n518, n520, n522, n524, n526, n528,
         n530, n532, n534, n536, n538, n540, n542, n544, n546, n548, n550,
         n552, n554, n564, n566, n568, n570, n572, n574, n576, n578, n580,
         n582, n584, n586, n588, n590, n592, n594, n596, n598, n600, n602,
         n604, n606, n608, n610, n612, n614, n616, n618, n620, n622, n624,
         n626, n628, n630, n632, n634, n636, n638, n640, n642, n668, n670,
         n672, n674, n676, n678, n680, n682, n684, n686, n688, n690, n692,
         n694, n696, n698, n858, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n723, n724, n725, n726, n727, n728, n729, n730,
         n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n921, n922, n923, n924, n925, n926, n927, n928, n929,
         n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964, n965, n966, n967, n968, n969, n970, n971, n972, n973,
         n974, n975, n976, n977, n978, n979, n980, n981, n982, n983, n984,
         n985, n986, n987, n988, n989, n990, n991, n992, n993, n994, n995,
         n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005,
         n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015,
         n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045,
         n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055,
         n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065,
         n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075,
         n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085,
         n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095,
         n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105,
         n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115,
         n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135,
         n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145,
         n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155,
         n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165,
         n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175,
         n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185,
         n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
         n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
         n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
         n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225,
         n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235,
         n1236, n1237, n1238, n1239, n1240;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFSR size_buffer_reg ( .D(hsize), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        size_buffer) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \address_mapping_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N165) );
  DFFSR \address_mapping_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N164) );
  DFFSR \address_mapping_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N163) );
  DFFSR data_ready_reg ( .D(n858), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR \address_mapping_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N53) );
  DFFSR \Register_Map_reg[3][0]  ( .D(\next_Register_Map[3][0] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][0] ) );
  DFFSR \Register_Map_reg[3][1]  ( .D(\next_Register_Map[3][1] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][1] ) );
  DFFSR \Register_Map_reg[3][2]  ( .D(\next_Register_Map[3][2] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][2] ) );
  DFFSR \Register_Map_reg[3][3]  ( .D(\next_Register_Map[3][3] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][3] ) );
  DFFSR \Register_Map_reg[3][4]  ( .D(\next_Register_Map[3][4] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][4] ) );
  DFFSR \Register_Map_reg[3][5]  ( .D(\next_Register_Map[3][5] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][5] ) );
  DFFSR \Register_Map_reg[3][6]  ( .D(\next_Register_Map[3][6] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][6] ) );
  DFFSR \Register_Map_reg[3][7]  ( .D(\next_Register_Map[3][7] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[3][7] ) );
  DFFSR \Register_Map_reg[15][7]  ( .D(\next_Register_Map[15][7] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][7] ) );
  DFFSR \Register_Map_reg[15][6]  ( .D(\next_Register_Map[15][6] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][6] ) );
  DFFSR \Register_Map_reg[15][5]  ( .D(\next_Register_Map[15][5] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][5] ) );
  DFFSR \Register_Map_reg[15][4]  ( .D(\next_Register_Map[15][4] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][4] ) );
  DFFSR \Register_Map_reg[15][3]  ( .D(\next_Register_Map[15][3] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][3] ) );
  DFFSR \Register_Map_reg[15][2]  ( .D(\next_Register_Map[15][2] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][2] ) );
  DFFSR \Register_Map_reg[15][1]  ( .D(\next_Register_Map[15][1] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][1] ) );
  DFFSR \Register_Map_reg[15][0]  ( .D(\next_Register_Map[15][0] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[15][0] ) );
  DFFSR \Register_Map_reg[11][7]  ( .D(n698), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][7] ) );
  DFFSR \Register_Map_reg[11][6]  ( .D(n696), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][6] ) );
  DFFSR \Register_Map_reg[11][5]  ( .D(n694), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][5] ) );
  DFFSR \Register_Map_reg[11][4]  ( .D(n692), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][4] ) );
  DFFSR \Register_Map_reg[11][3]  ( .D(n690), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][3] ) );
  DFFSR \Register_Map_reg[11][2]  ( .D(n688), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][2] ) );
  DFFSR \Register_Map_reg[11][1]  ( .D(n686), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][1] ) );
  DFFSR \Register_Map_reg[11][0]  ( .D(n684), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[11][0] ) );
  DFFSR \Register_Map_reg[7][7]  ( .D(n682), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][7] ) );
  DFFSR \Register_Map_reg[7][6]  ( .D(n680), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][6] ) );
  DFFSR \Register_Map_reg[7][5]  ( .D(n678), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][5] ) );
  DFFSR \Register_Map_reg[7][4]  ( .D(n676), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][4] ) );
  DFFSR \Register_Map_reg[7][3]  ( .D(n674), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][3] ) );
  DFFSR \Register_Map_reg[7][2]  ( .D(n672), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][2] ) );
  DFFSR \Register_Map_reg[7][1]  ( .D(n670), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][1] ) );
  DFFSR \Register_Map_reg[7][0]  ( .D(n668), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[7][0] ) );
  DFFSR \Register_Map_reg[2][0]  ( .D(\next_Register_Map[2][0] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][0] ) );
  DFFSR \Register_Map_reg[2][1]  ( .D(\next_Register_Map[2][1] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][1] ) );
  DFFSR \Register_Map_reg[2][2]  ( .D(\next_Register_Map[2][2] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][2] ) );
  DFFSR \Register_Map_reg[2][3]  ( .D(\next_Register_Map[2][3] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][3] ) );
  DFFSR \Register_Map_reg[2][4]  ( .D(\next_Register_Map[2][4] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][4] ) );
  DFFSR \Register_Map_reg[2][5]  ( .D(\next_Register_Map[2][5] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][5] ) );
  DFFSR \Register_Map_reg[2][6]  ( .D(\next_Register_Map[2][6] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][6] ) );
  DFFSR \Register_Map_reg[2][7]  ( .D(\next_Register_Map[2][7] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[2][7] ) );
  DFFSR \Register_Map_reg[14][0]  ( .D(\next_Register_Map[14][0] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(new_coefficient_set) );
  DFFSR \Register_Map_reg[14][1]  ( .D(\next_Register_Map[14][1] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][1] ) );
  DFFSR \Register_Map_reg[14][2]  ( .D(\next_Register_Map[14][2] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][2] ) );
  DFFSR \Register_Map_reg[14][3]  ( .D(\next_Register_Map[14][3] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][3] ) );
  DFFSR \Register_Map_reg[14][4]  ( .D(\next_Register_Map[14][4] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][4] ) );
  DFFSR \Register_Map_reg[14][5]  ( .D(\next_Register_Map[14][5] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][5] ) );
  DFFSR \Register_Map_reg[14][6]  ( .D(\next_Register_Map[14][6] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][6] ) );
  DFFSR \Register_Map_reg[14][7]  ( .D(\next_Register_Map[14][7] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[14][7] ) );
  DFFSR \Register_Map_reg[0][7]  ( .D(\next_Register_Map[0][7] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][7] ) );
  DFFSR \Register_Map_reg[0][6]  ( .D(\next_Register_Map[0][6] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][6] ) );
  DFFSR \Register_Map_reg[0][5]  ( .D(\next_Register_Map[0][5] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][5] ) );
  DFFSR \Register_Map_reg[0][4]  ( .D(\next_Register_Map[0][4] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][4] ) );
  DFFSR \Register_Map_reg[0][3]  ( .D(\next_Register_Map[0][3] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][3] ) );
  DFFSR \Register_Map_reg[0][2]  ( .D(\next_Register_Map[0][2] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][2] ) );
  DFFSR \Register_Map_reg[0][1]  ( .D(\next_Register_Map[0][1] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][1] ) );
  DFFSR \Register_Map_reg[0][0]  ( .D(\next_Register_Map[0][0] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[0][0] ) );
  DFFSR \Register_Map_reg[12][7]  ( .D(n642), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][7] ) );
  DFFSR \Register_Map_reg[12][6]  ( .D(n640), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][6] ) );
  DFFSR \Register_Map_reg[12][5]  ( .D(n638), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][5] ) );
  DFFSR \Register_Map_reg[12][4]  ( .D(n636), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][4] ) );
  DFFSR \Register_Map_reg[12][3]  ( .D(n634), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][3] ) );
  DFFSR \Register_Map_reg[12][2]  ( .D(n632), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][2] ) );
  DFFSR \Register_Map_reg[12][1]  ( .D(n630), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][1] ) );
  DFFSR \Register_Map_reg[12][0]  ( .D(n628), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[12][0] ) );
  DFFSR \Register_Map_reg[10][0]  ( .D(n626), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][0] ) );
  DFFSR \Register_Map_reg[10][1]  ( .D(n624), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][1] ) );
  DFFSR \Register_Map_reg[10][2]  ( .D(n622), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][2] ) );
  DFFSR \Register_Map_reg[10][3]  ( .D(n620), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][3] ) );
  DFFSR \Register_Map_reg[10][4]  ( .D(n618), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][4] ) );
  DFFSR \Register_Map_reg[10][5]  ( .D(n616), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][5] ) );
  DFFSR \Register_Map_reg[10][6]  ( .D(n614), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][6] ) );
  DFFSR \Register_Map_reg[10][7]  ( .D(n612), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[10][7] ) );
  DFFSR \Register_Map_reg[8][7]  ( .D(n610), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][7] ) );
  DFFSR \Register_Map_reg[8][6]  ( .D(n608), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][6] ) );
  DFFSR \Register_Map_reg[8][5]  ( .D(n606), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][5] ) );
  DFFSR \Register_Map_reg[8][4]  ( .D(n604), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][4] ) );
  DFFSR \Register_Map_reg[8][3]  ( .D(n602), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][3] ) );
  DFFSR \Register_Map_reg[8][2]  ( .D(n600), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][2] ) );
  DFFSR \Register_Map_reg[8][1]  ( .D(n598), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][1] ) );
  DFFSR \Register_Map_reg[8][0]  ( .D(n596), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[8][0] ) );
  DFFSR \Register_Map_reg[6][0]  ( .D(n594), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][0] ) );
  DFFSR \Register_Map_reg[6][1]  ( .D(n592), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][1] ) );
  DFFSR \Register_Map_reg[6][2]  ( .D(n590), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][2] ) );
  DFFSR \Register_Map_reg[6][3]  ( .D(n588), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][3] ) );
  DFFSR \Register_Map_reg[6][4]  ( .D(n586), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][4] ) );
  DFFSR \Register_Map_reg[6][5]  ( .D(n584), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][5] ) );
  DFFSR \Register_Map_reg[6][6]  ( .D(n582), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][6] ) );
  DFFSR \Register_Map_reg[6][7]  ( .D(n580), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[6][7] ) );
  DFFSR \Register_Map_reg[4][7]  ( .D(n578), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[7]) );
  DFFSR \Register_Map_reg[4][6]  ( .D(n576), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[6]) );
  DFFSR \Register_Map_reg[4][5]  ( .D(n574), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[5]) );
  DFFSR \Register_Map_reg[4][4]  ( .D(n572), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[4]) );
  DFFSR \Register_Map_reg[4][3]  ( .D(n570), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[3]) );
  DFFSR \Register_Map_reg[4][2]  ( .D(n568), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[2]) );
  DFFSR \Register_Map_reg[4][1]  ( .D(n566), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[1]) );
  DFFSR \Register_Map_reg[4][0]  ( .D(n564), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[0]) );
  DFFSR \Register_Map_reg[1][7]  ( .D(\next_Register_Map[1][7] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][7] ) );
  DFFSR \Register_Map_reg[1][6]  ( .D(\next_Register_Map[1][6] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][6] ) );
  DFFSR \Register_Map_reg[1][5]  ( .D(\next_Register_Map[1][5] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][5] ) );
  DFFSR \Register_Map_reg[1][4]  ( .D(\next_Register_Map[1][4] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][4] ) );
  DFFSR \Register_Map_reg[1][3]  ( .D(\next_Register_Map[1][3] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][3] ) );
  DFFSR \Register_Map_reg[1][2]  ( .D(\next_Register_Map[1][2] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][2] ) );
  DFFSR \Register_Map_reg[1][1]  ( .D(\next_Register_Map[1][1] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][1] ) );
  DFFSR \Register_Map_reg[1][0]  ( .D(\next_Register_Map[1][0] ), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(\Register_Map[1][0] ) );
  DFFSR \Register_Map_reg[13][7]  ( .D(n554), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][7] ) );
  DFFSR \Register_Map_reg[13][6]  ( .D(n552), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][6] ) );
  DFFSR \Register_Map_reg[13][5]  ( .D(n550), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][5] ) );
  DFFSR \Register_Map_reg[13][4]  ( .D(n548), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][4] ) );
  DFFSR \Register_Map_reg[13][3]  ( .D(n546), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][3] ) );
  DFFSR \Register_Map_reg[13][2]  ( .D(n544), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][2] ) );
  DFFSR \Register_Map_reg[13][1]  ( .D(n542), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][1] ) );
  DFFSR \Register_Map_reg[13][0]  ( .D(n540), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[13][0] ) );
  DFFSR \Register_Map_reg[9][7]  ( .D(n538), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][7] ) );
  DFFSR \Register_Map_reg[9][6]  ( .D(n536), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][6] ) );
  DFFSR \Register_Map_reg[9][5]  ( .D(n534), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][5] ) );
  DFFSR \Register_Map_reg[9][4]  ( .D(n532), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][4] ) );
  DFFSR \Register_Map_reg[9][3]  ( .D(n530), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][3] ) );
  DFFSR \Register_Map_reg[9][2]  ( .D(n528), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][2] ) );
  DFFSR \Register_Map_reg[9][1]  ( .D(n526), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][1] ) );
  DFFSR \Register_Map_reg[9][0]  ( .D(n524), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\Register_Map[9][0] ) );
  DFFSR \Register_Map_reg[5][7]  ( .D(n522), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[15]) );
  DFFSR \Register_Map_reg[5][6]  ( .D(n520), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[14]) );
  DFFSR \Register_Map_reg[5][5]  ( .D(n518), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[13]) );
  DFFSR \Register_Map_reg[5][4]  ( .D(n516), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[12]) );
  DFFSR \Register_Map_reg[5][3]  ( .D(n514), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[11]) );
  DFFSR \Register_Map_reg[5][2]  ( .D(n512), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[10]) );
  DFFSR \Register_Map_reg[5][1]  ( .D(n510), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[9]) );
  DFFSR \Register_Map_reg[5][0]  ( .D(n508), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(sample_data[8]) );
  INVX2 U3 ( .A(N53), .Y(n1240) );
  BUFX2 U4 ( .A(n822), .Y(n1) );
  BUFX2 U5 ( .A(n818), .Y(n2) );
  BUFX2 U6 ( .A(n304), .Y(n3) );
  BUFX2 U7 ( .A(n814), .Y(n4) );
  BUFX2 U8 ( .A(n453), .Y(n5) );
  BUFX2 U9 ( .A(n810), .Y(n6) );
  BUFX2 U10 ( .A(n302), .Y(n7) );
  BUFX2 U11 ( .A(n806), .Y(n8) );
  BUFX2 U12 ( .A(n451), .Y(n9) );
  BUFX2 U13 ( .A(n307), .Y(n10) );
  BUFX2 U14 ( .A(n456), .Y(n11) );
  BUFX2 U15 ( .A(n801), .Y(n12) );
  BUFX2 U16 ( .A(n169), .Y(n13) );
  BUFX2 U17 ( .A(n163), .Y(n14) );
  BUFX2 U18 ( .A(n303), .Y(n15) );
  NOR2X1 U19 ( .A(N180), .B(N181), .Y(n16) );
  BUFX2 U20 ( .A(n166), .Y(n17) );
  BUFX2 U21 ( .A(n830), .Y(n18) );
  BUFX2 U22 ( .A(n310), .Y(n19) );
  BUFX2 U23 ( .A(n459), .Y(n20) );
  BUFX2 U24 ( .A(n161), .Y(n21) );
  BUFX2 U25 ( .A(n450), .Y(n22) );
  BUFX2 U26 ( .A(n826), .Y(n23) );
  BUFX2 U27 ( .A(n312), .Y(n24) );
  BUFX2 U28 ( .A(n461), .Y(n25) );
  BUFX2 U29 ( .A(n171), .Y(n26) );
  BUFX2 U30 ( .A(n452), .Y(n27) );
  BUFX2 U31 ( .A(n162), .Y(n28) );
  INVX2 U32 ( .A(coefficient_num[0]), .Y(n1237) );
  BUFX2 U33 ( .A(n301), .Y(n29) );
  BUFX2 U34 ( .A(n160), .Y(n30) );
  BUFX2 U35 ( .A(n311), .Y(n31) );
  BUFX2 U36 ( .A(n460), .Y(n32) );
  BUFX2 U37 ( .A(n170), .Y(n33) );
  BUFX2 U38 ( .A(n784), .Y(n34) );
  BUFX2 U39 ( .A(n731), .Y(n35) );
  BUFX2 U40 ( .A(n785), .Y(n36) );
  INVX2 U41 ( .A(n870), .Y(n37) );
  NOR2X1 U42 ( .A(n973), .B(N164), .Y(n40) );
  NAND2X1 U43 ( .A(n40), .B(N53), .Y(n161) );
  NOR2X1 U44 ( .A(N163), .B(N164), .Y(n41) );
  NAND2X1 U45 ( .A(n41), .B(N53), .Y(n160) );
  OAI22X1 U46 ( .A(\Register_Map[11][0] ), .B(n21), .C(\Register_Map[9][0] ), 
        .D(n30), .Y(n39) );
  NOR2X1 U47 ( .A(n1201), .B(n973), .Y(n44) );
  NAND2X1 U48 ( .A(N53), .B(n44), .Y(n163) );
  NOR2X1 U49 ( .A(n1201), .B(N163), .Y(n45) );
  NAND2X1 U50 ( .A(n45), .B(N53), .Y(n162) );
  OAI22X1 U51 ( .A(\Register_Map[15][0] ), .B(n14), .C(\Register_Map[13][0] ), 
        .D(n28), .Y(n38) );
  NOR2X1 U52 ( .A(n39), .B(n38), .Y(n57) );
  NAND2X1 U53 ( .A(n40), .B(n1240), .Y(n169) );
  NAND2X1 U54 ( .A(n41), .B(n1240), .Y(n166) );
  NOR2X1 U55 ( .A(\Register_Map[8][0] ), .B(n17), .Y(n42) );
  NOR2X1 U56 ( .A(n1235), .B(n42), .Y(n43) );
  OAI21X1 U57 ( .A(\Register_Map[10][0] ), .B(n13), .C(n43), .Y(n47) );
  NAND2X1 U58 ( .A(n44), .B(n1240), .Y(n171) );
  NAND2X1 U59 ( .A(n45), .B(n1240), .Y(n170) );
  OAI22X1 U60 ( .A(new_coefficient_set), .B(n26), .C(\Register_Map[12][0] ), 
        .D(n33), .Y(n46) );
  NOR2X1 U61 ( .A(n47), .B(n46), .Y(n56) );
  OAI22X1 U62 ( .A(\Register_Map[3][0] ), .B(n21), .C(\Register_Map[1][0] ), 
        .D(n30), .Y(n49) );
  OAI22X1 U63 ( .A(\Register_Map[7][0] ), .B(n14), .C(sample_data[8]), .D(n28), 
        .Y(n48) );
  NOR2X1 U64 ( .A(n49), .B(n48), .Y(n55) );
  NOR2X1 U65 ( .A(\Register_Map[0][0] ), .B(n17), .Y(n50) );
  NOR2X1 U66 ( .A(N165), .B(n50), .Y(n51) );
  OAI21X1 U67 ( .A(\Register_Map[2][0] ), .B(n13), .C(n51), .Y(n53) );
  OAI22X1 U68 ( .A(\Register_Map[6][0] ), .B(n26), .C(sample_data[0]), .D(n33), 
        .Y(n52) );
  NOR2X1 U69 ( .A(n53), .B(n52), .Y(n54) );
  AOI22X1 U70 ( .A(n57), .B(n56), .C(n55), .D(n54), .Y(N258) );
  OAI22X1 U71 ( .A(\Register_Map[11][1] ), .B(n21), .C(\Register_Map[9][1] ), 
        .D(n30), .Y(n59) );
  OAI22X1 U72 ( .A(\Register_Map[15][1] ), .B(n14), .C(\Register_Map[13][1] ), 
        .D(n28), .Y(n58) );
  NOR2X1 U73 ( .A(n59), .B(n58), .Y(n73) );
  NOR2X1 U74 ( .A(\Register_Map[8][1] ), .B(n17), .Y(n60) );
  NOR2X1 U75 ( .A(n1235), .B(n60), .Y(n61) );
  OAI21X1 U76 ( .A(\Register_Map[10][1] ), .B(n13), .C(n61), .Y(n63) );
  OAI22X1 U77 ( .A(\Register_Map[14][1] ), .B(n26), .C(\Register_Map[12][1] ), 
        .D(n33), .Y(n62) );
  NOR2X1 U78 ( .A(n63), .B(n62), .Y(n72) );
  OAI22X1 U79 ( .A(\Register_Map[3][1] ), .B(n21), .C(\Register_Map[1][1] ), 
        .D(n30), .Y(n65) );
  OAI22X1 U80 ( .A(\Register_Map[7][1] ), .B(n14), .C(sample_data[9]), .D(n28), 
        .Y(n64) );
  NOR2X1 U81 ( .A(n65), .B(n64), .Y(n71) );
  NOR2X1 U82 ( .A(\Register_Map[0][1] ), .B(n17), .Y(n66) );
  NOR2X1 U83 ( .A(N165), .B(n66), .Y(n67) );
  OAI21X1 U84 ( .A(\Register_Map[2][1] ), .B(n13), .C(n67), .Y(n69) );
  OAI22X1 U85 ( .A(\Register_Map[6][1] ), .B(n26), .C(sample_data[1]), .D(n33), 
        .Y(n68) );
  NOR2X1 U86 ( .A(n69), .B(n68), .Y(n70) );
  AOI22X1 U87 ( .A(n73), .B(n72), .C(n71), .D(n70), .Y(N257) );
  OAI22X1 U88 ( .A(\Register_Map[11][2] ), .B(n21), .C(\Register_Map[9][2] ), 
        .D(n30), .Y(n75) );
  OAI22X1 U89 ( .A(\Register_Map[15][2] ), .B(n14), .C(\Register_Map[13][2] ), 
        .D(n28), .Y(n74) );
  NOR2X1 U90 ( .A(n75), .B(n74), .Y(n89) );
  NOR2X1 U91 ( .A(\Register_Map[8][2] ), .B(n17), .Y(n76) );
  NOR2X1 U92 ( .A(n1235), .B(n76), .Y(n77) );
  OAI21X1 U93 ( .A(\Register_Map[10][2] ), .B(n13), .C(n77), .Y(n79) );
  OAI22X1 U94 ( .A(\Register_Map[14][2] ), .B(n26), .C(\Register_Map[12][2] ), 
        .D(n33), .Y(n78) );
  NOR2X1 U95 ( .A(n79), .B(n78), .Y(n88) );
  OAI22X1 U96 ( .A(\Register_Map[3][2] ), .B(n21), .C(\Register_Map[1][2] ), 
        .D(n30), .Y(n81) );
  OAI22X1 U97 ( .A(\Register_Map[7][2] ), .B(n14), .C(sample_data[10]), .D(n28), .Y(n80) );
  NOR2X1 U98 ( .A(n81), .B(n80), .Y(n87) );
  NOR2X1 U99 ( .A(\Register_Map[0][2] ), .B(n17), .Y(n82) );
  NOR2X1 U100 ( .A(N165), .B(n82), .Y(n83) );
  OAI21X1 U101 ( .A(\Register_Map[2][2] ), .B(n13), .C(n83), .Y(n85) );
  OAI22X1 U102 ( .A(\Register_Map[6][2] ), .B(n26), .C(sample_data[2]), .D(n33), .Y(n84) );
  NOR2X1 U103 ( .A(n85), .B(n84), .Y(n86) );
  AOI22X1 U104 ( .A(n89), .B(n88), .C(n87), .D(n86), .Y(N256) );
  OAI22X1 U105 ( .A(\Register_Map[11][3] ), .B(n21), .C(\Register_Map[9][3] ), 
        .D(n30), .Y(n91) );
  OAI22X1 U106 ( .A(\Register_Map[15][3] ), .B(n14), .C(\Register_Map[13][3] ), 
        .D(n28), .Y(n90) );
  NOR2X1 U107 ( .A(n91), .B(n90), .Y(n105) );
  NOR2X1 U108 ( .A(\Register_Map[8][3] ), .B(n17), .Y(n92) );
  NOR2X1 U109 ( .A(n1235), .B(n92), .Y(n93) );
  OAI21X1 U110 ( .A(\Register_Map[10][3] ), .B(n13), .C(n93), .Y(n95) );
  OAI22X1 U111 ( .A(\Register_Map[14][3] ), .B(n26), .C(\Register_Map[12][3] ), 
        .D(n33), .Y(n94) );
  NOR2X1 U112 ( .A(n95), .B(n94), .Y(n104) );
  OAI22X1 U113 ( .A(\Register_Map[3][3] ), .B(n21), .C(\Register_Map[1][3] ), 
        .D(n30), .Y(n97) );
  OAI22X1 U114 ( .A(\Register_Map[7][3] ), .B(n14), .C(sample_data[11]), .D(
        n28), .Y(n96) );
  NOR2X1 U115 ( .A(n97), .B(n96), .Y(n103) );
  NOR2X1 U116 ( .A(\Register_Map[0][3] ), .B(n17), .Y(n98) );
  NOR2X1 U117 ( .A(N165), .B(n98), .Y(n99) );
  OAI21X1 U118 ( .A(\Register_Map[2][3] ), .B(n13), .C(n99), .Y(n101) );
  OAI22X1 U119 ( .A(\Register_Map[6][3] ), .B(n26), .C(sample_data[3]), .D(n33), .Y(n100) );
  NOR2X1 U120 ( .A(n101), .B(n100), .Y(n102) );
  AOI22X1 U121 ( .A(n105), .B(n104), .C(n103), .D(n102), .Y(N255) );
  OAI22X1 U122 ( .A(\Register_Map[11][4] ), .B(n21), .C(\Register_Map[9][4] ), 
        .D(n30), .Y(n107) );
  OAI22X1 U123 ( .A(\Register_Map[15][4] ), .B(n14), .C(\Register_Map[13][4] ), 
        .D(n28), .Y(n106) );
  NOR2X1 U124 ( .A(n107), .B(n106), .Y(n121) );
  NOR2X1 U125 ( .A(\Register_Map[8][4] ), .B(n17), .Y(n108) );
  NOR2X1 U126 ( .A(n1235), .B(n108), .Y(n109) );
  OAI21X1 U127 ( .A(\Register_Map[10][4] ), .B(n13), .C(n109), .Y(n111) );
  OAI22X1 U128 ( .A(\Register_Map[14][4] ), .B(n26), .C(\Register_Map[12][4] ), 
        .D(n33), .Y(n110) );
  NOR2X1 U129 ( .A(n111), .B(n110), .Y(n120) );
  OAI22X1 U130 ( .A(\Register_Map[3][4] ), .B(n21), .C(\Register_Map[1][4] ), 
        .D(n30), .Y(n113) );
  OAI22X1 U131 ( .A(\Register_Map[7][4] ), .B(n14), .C(sample_data[12]), .D(
        n28), .Y(n112) );
  NOR2X1 U132 ( .A(n113), .B(n112), .Y(n119) );
  NOR2X1 U133 ( .A(\Register_Map[0][4] ), .B(n17), .Y(n114) );
  NOR2X1 U134 ( .A(N165), .B(n114), .Y(n115) );
  OAI21X1 U135 ( .A(\Register_Map[2][4] ), .B(n13), .C(n115), .Y(n117) );
  OAI22X1 U136 ( .A(\Register_Map[6][4] ), .B(n26), .C(sample_data[4]), .D(n33), .Y(n116) );
  NOR2X1 U137 ( .A(n117), .B(n116), .Y(n118) );
  AOI22X1 U138 ( .A(n121), .B(n120), .C(n119), .D(n118), .Y(N254) );
  OAI22X1 U139 ( .A(\Register_Map[11][5] ), .B(n21), .C(\Register_Map[9][5] ), 
        .D(n30), .Y(n123) );
  OAI22X1 U140 ( .A(\Register_Map[15][5] ), .B(n14), .C(\Register_Map[13][5] ), 
        .D(n28), .Y(n122) );
  NOR2X1 U141 ( .A(n123), .B(n122), .Y(n137) );
  NOR2X1 U142 ( .A(\Register_Map[8][5] ), .B(n17), .Y(n124) );
  NOR2X1 U143 ( .A(n1235), .B(n124), .Y(n125) );
  OAI21X1 U144 ( .A(\Register_Map[10][5] ), .B(n13), .C(n125), .Y(n127) );
  OAI22X1 U145 ( .A(\Register_Map[14][5] ), .B(n26), .C(\Register_Map[12][5] ), 
        .D(n33), .Y(n126) );
  NOR2X1 U146 ( .A(n127), .B(n126), .Y(n136) );
  OAI22X1 U147 ( .A(\Register_Map[3][5] ), .B(n21), .C(\Register_Map[1][5] ), 
        .D(n30), .Y(n129) );
  OAI22X1 U148 ( .A(\Register_Map[7][5] ), .B(n14), .C(sample_data[13]), .D(
        n28), .Y(n128) );
  NOR2X1 U149 ( .A(n129), .B(n128), .Y(n135) );
  NOR2X1 U150 ( .A(\Register_Map[0][5] ), .B(n17), .Y(n130) );
  NOR2X1 U151 ( .A(N165), .B(n130), .Y(n131) );
  OAI21X1 U152 ( .A(\Register_Map[2][5] ), .B(n13), .C(n131), .Y(n133) );
  OAI22X1 U153 ( .A(\Register_Map[6][5] ), .B(n26), .C(sample_data[5]), .D(n33), .Y(n132) );
  NOR2X1 U154 ( .A(n133), .B(n132), .Y(n134) );
  AOI22X1 U155 ( .A(n137), .B(n136), .C(n135), .D(n134), .Y(N253) );
  OAI22X1 U156 ( .A(\Register_Map[11][6] ), .B(n21), .C(\Register_Map[9][6] ), 
        .D(n30), .Y(n139) );
  OAI22X1 U157 ( .A(\Register_Map[15][6] ), .B(n14), .C(\Register_Map[13][6] ), 
        .D(n28), .Y(n138) );
  NOR2X1 U158 ( .A(n139), .B(n138), .Y(n153) );
  NOR2X1 U159 ( .A(\Register_Map[8][6] ), .B(n17), .Y(n140) );
  NOR2X1 U160 ( .A(n1235), .B(n140), .Y(n141) );
  OAI21X1 U161 ( .A(\Register_Map[10][6] ), .B(n13), .C(n141), .Y(n143) );
  OAI22X1 U162 ( .A(\Register_Map[14][6] ), .B(n26), .C(\Register_Map[12][6] ), 
        .D(n33), .Y(n142) );
  NOR2X1 U163 ( .A(n143), .B(n142), .Y(n152) );
  OAI22X1 U164 ( .A(\Register_Map[3][6] ), .B(n21), .C(\Register_Map[1][6] ), 
        .D(n30), .Y(n145) );
  OAI22X1 U165 ( .A(\Register_Map[7][6] ), .B(n14), .C(sample_data[14]), .D(
        n28), .Y(n144) );
  NOR2X1 U166 ( .A(n145), .B(n144), .Y(n151) );
  NOR2X1 U167 ( .A(\Register_Map[0][6] ), .B(n17), .Y(n146) );
  NOR2X1 U168 ( .A(N165), .B(n146), .Y(n147) );
  OAI21X1 U169 ( .A(\Register_Map[2][6] ), .B(n13), .C(n147), .Y(n149) );
  OAI22X1 U170 ( .A(\Register_Map[6][6] ), .B(n26), .C(sample_data[6]), .D(n33), .Y(n148) );
  NOR2X1 U171 ( .A(n149), .B(n148), .Y(n150) );
  AOI22X1 U172 ( .A(n153), .B(n152), .C(n151), .D(n150), .Y(N252) );
  OAI22X1 U173 ( .A(\Register_Map[13][7] ), .B(n28), .C(\Register_Map[11][7] ), 
        .D(n21), .Y(n155) );
  OAI21X1 U174 ( .A(\Register_Map[15][7] ), .B(n14), .C(N165), .Y(n154) );
  NOR2X1 U175 ( .A(n155), .B(n154), .Y(n177) );
  OR2X1 U176 ( .A(\Register_Map[8][7] ), .B(n17), .Y(n156) );
  OAI21X1 U177 ( .A(n13), .B(\Register_Map[10][7] ), .C(n156), .Y(n157) );
  OAI21X1 U178 ( .A(\Register_Map[12][7] ), .B(n33), .C(n178), .Y(n159) );
  OAI22X1 U179 ( .A(\Register_Map[9][7] ), .B(n30), .C(\Register_Map[14][7] ), 
        .D(n26), .Y(n158) );
  NOR2X1 U180 ( .A(n159), .B(n158), .Y(n176) );
  OAI22X1 U181 ( .A(\Register_Map[3][7] ), .B(n21), .C(\Register_Map[1][7] ), 
        .D(n30), .Y(n165) );
  OAI22X1 U182 ( .A(\Register_Map[7][7] ), .B(n14), .C(sample_data[15]), .D(
        n28), .Y(n164) );
  NOR2X1 U183 ( .A(n165), .B(n164), .Y(n175) );
  NOR2X1 U184 ( .A(\Register_Map[0][7] ), .B(n17), .Y(n167) );
  NOR2X1 U185 ( .A(N165), .B(n167), .Y(n168) );
  OAI21X1 U186 ( .A(\Register_Map[2][7] ), .B(n13), .C(n168), .Y(n173) );
  OAI22X1 U187 ( .A(\Register_Map[6][7] ), .B(n26), .C(sample_data[7]), .D(n33), .Y(n172) );
  NOR2X1 U188 ( .A(n173), .B(n172), .Y(n174) );
  AOI22X1 U189 ( .A(n177), .B(n176), .C(n175), .D(n174), .Y(N251) );
  INVX2 U190 ( .A(n157), .Y(n178) );
  NOR2X1 U191 ( .A(N171), .B(n1238), .Y(n181) );
  NAND2X1 U192 ( .A(n181), .B(n1240), .Y(n302) );
  NOR2X1 U193 ( .A(n1239), .B(n1238), .Y(n182) );
  NAND2X1 U194 ( .A(n182), .B(n1240), .Y(n301) );
  OAI22X1 U195 ( .A(\Register_Map[11][0] ), .B(n7), .C(\Register_Map[9][0] ), 
        .D(n29), .Y(n180) );
  NOR2X1 U196 ( .A(n966), .B(N171), .Y(n185) );
  NAND2X1 U197 ( .A(n1240), .B(n185), .Y(n304) );
  NOR2X1 U198 ( .A(n966), .B(n1239), .Y(n186) );
  NAND2X1 U199 ( .A(n186), .B(n1240), .Y(n303) );
  OAI22X1 U200 ( .A(\Register_Map[15][0] ), .B(n3), .C(\Register_Map[13][0] ), 
        .D(n15), .Y(n179) );
  NOR2X1 U201 ( .A(n180), .B(n179), .Y(n198) );
  NAND2X1 U202 ( .A(n181), .B(N53), .Y(n310) );
  NAND2X1 U203 ( .A(n182), .B(N53), .Y(n307) );
  NOR2X1 U204 ( .A(\Register_Map[8][0] ), .B(n10), .Y(n183) );
  NOR2X1 U205 ( .A(n320), .B(n183), .Y(n184) );
  OAI21X1 U206 ( .A(\Register_Map[10][0] ), .B(n19), .C(n184), .Y(n188) );
  NAND2X1 U207 ( .A(n185), .B(N53), .Y(n312) );
  NAND2X1 U208 ( .A(n186), .B(N53), .Y(n311) );
  OAI22X1 U209 ( .A(new_coefficient_set), .B(n24), .C(\Register_Map[12][0] ), 
        .D(n31), .Y(n187) );
  NOR2X1 U210 ( .A(n188), .B(n187), .Y(n197) );
  OAI22X1 U211 ( .A(\Register_Map[3][0] ), .B(n7), .C(\Register_Map[1][0] ), 
        .D(n29), .Y(n190) );
  OAI22X1 U212 ( .A(\Register_Map[7][0] ), .B(n3), .C(sample_data[8]), .D(n15), 
        .Y(n189) );
  NOR2X1 U213 ( .A(n190), .B(n189), .Y(n196) );
  NOR2X1 U214 ( .A(\Register_Map[0][0] ), .B(n10), .Y(n191) );
  NOR2X1 U215 ( .A(N169), .B(n191), .Y(n192) );
  OAI21X1 U216 ( .A(\Register_Map[2][0] ), .B(n19), .C(n192), .Y(n194) );
  OAI22X1 U217 ( .A(\Register_Map[6][0] ), .B(n24), .C(sample_data[0]), .D(n31), .Y(n193) );
  NOR2X1 U218 ( .A(n194), .B(n193), .Y(n195) );
  AOI22X1 U219 ( .A(n198), .B(n197), .C(n196), .D(n195), .Y(N222) );
  OAI22X1 U220 ( .A(\Register_Map[11][1] ), .B(n7), .C(\Register_Map[9][1] ), 
        .D(n29), .Y(n200) );
  OAI22X1 U221 ( .A(\Register_Map[15][1] ), .B(n3), .C(\Register_Map[13][1] ), 
        .D(n15), .Y(n199) );
  NOR2X1 U222 ( .A(n200), .B(n199), .Y(n214) );
  NOR2X1 U223 ( .A(\Register_Map[8][1] ), .B(n10), .Y(n201) );
  NOR2X1 U224 ( .A(n320), .B(n201), .Y(n202) );
  OAI21X1 U225 ( .A(\Register_Map[10][1] ), .B(n19), .C(n202), .Y(n204) );
  OAI22X1 U226 ( .A(\Register_Map[14][1] ), .B(n24), .C(\Register_Map[12][1] ), 
        .D(n31), .Y(n203) );
  NOR2X1 U227 ( .A(n204), .B(n203), .Y(n213) );
  OAI22X1 U228 ( .A(\Register_Map[3][1] ), .B(n7), .C(\Register_Map[1][1] ), 
        .D(n29), .Y(n206) );
  OAI22X1 U229 ( .A(\Register_Map[7][1] ), .B(n3), .C(sample_data[9]), .D(n15), 
        .Y(n205) );
  NOR2X1 U230 ( .A(n206), .B(n205), .Y(n212) );
  NOR2X1 U231 ( .A(\Register_Map[0][1] ), .B(n10), .Y(n207) );
  NOR2X1 U232 ( .A(N169), .B(n207), .Y(n208) );
  OAI21X1 U233 ( .A(\Register_Map[2][1] ), .B(n19), .C(n208), .Y(n210) );
  OAI22X1 U234 ( .A(\Register_Map[6][1] ), .B(n24), .C(sample_data[1]), .D(n31), .Y(n209) );
  NOR2X1 U235 ( .A(n210), .B(n209), .Y(n211) );
  AOI22X1 U236 ( .A(n214), .B(n213), .C(n212), .D(n211), .Y(N221) );
  OAI22X1 U237 ( .A(\Register_Map[11][2] ), .B(n7), .C(\Register_Map[9][2] ), 
        .D(n29), .Y(n216) );
  OAI22X1 U238 ( .A(\Register_Map[15][2] ), .B(n3), .C(\Register_Map[13][2] ), 
        .D(n15), .Y(n215) );
  NOR2X1 U239 ( .A(n216), .B(n215), .Y(n230) );
  NOR2X1 U240 ( .A(\Register_Map[8][2] ), .B(n10), .Y(n217) );
  NOR2X1 U241 ( .A(n320), .B(n217), .Y(n218) );
  OAI21X1 U242 ( .A(\Register_Map[10][2] ), .B(n19), .C(n218), .Y(n220) );
  OAI22X1 U243 ( .A(\Register_Map[14][2] ), .B(n24), .C(\Register_Map[12][2] ), 
        .D(n31), .Y(n219) );
  NOR2X1 U244 ( .A(n220), .B(n219), .Y(n229) );
  OAI22X1 U245 ( .A(\Register_Map[3][2] ), .B(n7), .C(\Register_Map[1][2] ), 
        .D(n29), .Y(n222) );
  OAI22X1 U246 ( .A(\Register_Map[7][2] ), .B(n3), .C(sample_data[10]), .D(n15), .Y(n221) );
  NOR2X1 U247 ( .A(n222), .B(n221), .Y(n228) );
  NOR2X1 U248 ( .A(\Register_Map[0][2] ), .B(n10), .Y(n223) );
  NOR2X1 U249 ( .A(N169), .B(n223), .Y(n224) );
  OAI21X1 U250 ( .A(\Register_Map[2][2] ), .B(n19), .C(n224), .Y(n226) );
  OAI22X1 U251 ( .A(\Register_Map[6][2] ), .B(n24), .C(sample_data[2]), .D(n31), .Y(n225) );
  NOR2X1 U252 ( .A(n226), .B(n225), .Y(n227) );
  AOI22X1 U253 ( .A(n230), .B(n229), .C(n228), .D(n227), .Y(N220) );
  OAI22X1 U254 ( .A(\Register_Map[11][3] ), .B(n7), .C(\Register_Map[9][3] ), 
        .D(n29), .Y(n232) );
  OAI22X1 U255 ( .A(\Register_Map[15][3] ), .B(n3), .C(\Register_Map[13][3] ), 
        .D(n15), .Y(n231) );
  NOR2X1 U256 ( .A(n232), .B(n231), .Y(n246) );
  NOR2X1 U257 ( .A(\Register_Map[8][3] ), .B(n10), .Y(n233) );
  NOR2X1 U258 ( .A(n320), .B(n233), .Y(n234) );
  OAI21X1 U259 ( .A(\Register_Map[10][3] ), .B(n19), .C(n234), .Y(n236) );
  OAI22X1 U260 ( .A(\Register_Map[14][3] ), .B(n24), .C(\Register_Map[12][3] ), 
        .D(n31), .Y(n235) );
  NOR2X1 U261 ( .A(n236), .B(n235), .Y(n245) );
  OAI22X1 U262 ( .A(\Register_Map[3][3] ), .B(n7), .C(\Register_Map[1][3] ), 
        .D(n29), .Y(n238) );
  OAI22X1 U263 ( .A(\Register_Map[7][3] ), .B(n3), .C(sample_data[11]), .D(n15), .Y(n237) );
  NOR2X1 U264 ( .A(n238), .B(n237), .Y(n244) );
  NOR2X1 U265 ( .A(\Register_Map[0][3] ), .B(n10), .Y(n239) );
  NOR2X1 U266 ( .A(N169), .B(n239), .Y(n240) );
  OAI21X1 U267 ( .A(\Register_Map[2][3] ), .B(n19), .C(n240), .Y(n242) );
  OAI22X1 U268 ( .A(\Register_Map[6][3] ), .B(n24), .C(sample_data[3]), .D(n31), .Y(n241) );
  NOR2X1 U269 ( .A(n242), .B(n241), .Y(n243) );
  AOI22X1 U270 ( .A(n246), .B(n245), .C(n244), .D(n243), .Y(N219) );
  OAI22X1 U271 ( .A(\Register_Map[11][4] ), .B(n7), .C(\Register_Map[9][4] ), 
        .D(n29), .Y(n248) );
  OAI22X1 U272 ( .A(\Register_Map[15][4] ), .B(n3), .C(\Register_Map[13][4] ), 
        .D(n15), .Y(n247) );
  NOR2X1 U273 ( .A(n248), .B(n247), .Y(n262) );
  NOR2X1 U274 ( .A(\Register_Map[8][4] ), .B(n10), .Y(n249) );
  NOR2X1 U275 ( .A(n320), .B(n249), .Y(n250) );
  OAI21X1 U276 ( .A(\Register_Map[10][4] ), .B(n19), .C(n250), .Y(n252) );
  OAI22X1 U277 ( .A(\Register_Map[14][4] ), .B(n24), .C(\Register_Map[12][4] ), 
        .D(n31), .Y(n251) );
  NOR2X1 U278 ( .A(n252), .B(n251), .Y(n261) );
  OAI22X1 U279 ( .A(\Register_Map[3][4] ), .B(n7), .C(\Register_Map[1][4] ), 
        .D(n29), .Y(n254) );
  OAI22X1 U280 ( .A(\Register_Map[7][4] ), .B(n3), .C(sample_data[12]), .D(n15), .Y(n253) );
  NOR2X1 U281 ( .A(n254), .B(n253), .Y(n260) );
  NOR2X1 U282 ( .A(\Register_Map[0][4] ), .B(n10), .Y(n255) );
  NOR2X1 U283 ( .A(N169), .B(n255), .Y(n256) );
  OAI21X1 U284 ( .A(\Register_Map[2][4] ), .B(n19), .C(n256), .Y(n258) );
  OAI22X1 U285 ( .A(\Register_Map[6][4] ), .B(n24), .C(sample_data[4]), .D(n31), .Y(n257) );
  NOR2X1 U286 ( .A(n258), .B(n257), .Y(n259) );
  AOI22X1 U287 ( .A(n262), .B(n261), .C(n260), .D(n259), .Y(N218) );
  OAI22X1 U288 ( .A(\Register_Map[11][5] ), .B(n7), .C(\Register_Map[9][5] ), 
        .D(n29), .Y(n264) );
  OAI22X1 U289 ( .A(\Register_Map[15][5] ), .B(n3), .C(\Register_Map[13][5] ), 
        .D(n15), .Y(n263) );
  NOR2X1 U290 ( .A(n264), .B(n263), .Y(n278) );
  NOR2X1 U291 ( .A(\Register_Map[8][5] ), .B(n10), .Y(n265) );
  NOR2X1 U292 ( .A(n320), .B(n265), .Y(n266) );
  OAI21X1 U293 ( .A(\Register_Map[10][5] ), .B(n19), .C(n266), .Y(n268) );
  OAI22X1 U294 ( .A(\Register_Map[14][5] ), .B(n24), .C(\Register_Map[12][5] ), 
        .D(n31), .Y(n267) );
  NOR2X1 U295 ( .A(n268), .B(n267), .Y(n277) );
  OAI22X1 U296 ( .A(\Register_Map[3][5] ), .B(n7), .C(\Register_Map[1][5] ), 
        .D(n29), .Y(n270) );
  OAI22X1 U297 ( .A(\Register_Map[7][5] ), .B(n3), .C(sample_data[13]), .D(n15), .Y(n269) );
  NOR2X1 U298 ( .A(n270), .B(n269), .Y(n276) );
  NOR2X1 U299 ( .A(\Register_Map[0][5] ), .B(n10), .Y(n271) );
  NOR2X1 U300 ( .A(N169), .B(n271), .Y(n272) );
  OAI21X1 U301 ( .A(\Register_Map[2][5] ), .B(n19), .C(n272), .Y(n274) );
  OAI22X1 U302 ( .A(\Register_Map[6][5] ), .B(n24), .C(sample_data[5]), .D(n31), .Y(n273) );
  NOR2X1 U303 ( .A(n274), .B(n273), .Y(n275) );
  AOI22X1 U304 ( .A(n278), .B(n277), .C(n276), .D(n275), .Y(N217) );
  OAI22X1 U305 ( .A(\Register_Map[11][6] ), .B(n7), .C(\Register_Map[9][6] ), 
        .D(n29), .Y(n280) );
  OAI22X1 U306 ( .A(\Register_Map[15][6] ), .B(n3), .C(\Register_Map[13][6] ), 
        .D(n15), .Y(n279) );
  NOR2X1 U307 ( .A(n280), .B(n279), .Y(n294) );
  NOR2X1 U308 ( .A(\Register_Map[8][6] ), .B(n10), .Y(n281) );
  NOR2X1 U309 ( .A(n320), .B(n281), .Y(n282) );
  OAI21X1 U310 ( .A(\Register_Map[10][6] ), .B(n19), .C(n282), .Y(n284) );
  OAI22X1 U311 ( .A(\Register_Map[14][6] ), .B(n24), .C(\Register_Map[12][6] ), 
        .D(n31), .Y(n283) );
  NOR2X1 U312 ( .A(n284), .B(n283), .Y(n293) );
  OAI22X1 U313 ( .A(\Register_Map[3][6] ), .B(n7), .C(\Register_Map[1][6] ), 
        .D(n29), .Y(n286) );
  OAI22X1 U314 ( .A(\Register_Map[7][6] ), .B(n3), .C(sample_data[14]), .D(n15), .Y(n285) );
  NOR2X1 U315 ( .A(n286), .B(n285), .Y(n292) );
  NOR2X1 U316 ( .A(\Register_Map[0][6] ), .B(n10), .Y(n287) );
  NOR2X1 U317 ( .A(N169), .B(n287), .Y(n288) );
  OAI21X1 U318 ( .A(\Register_Map[2][6] ), .B(n19), .C(n288), .Y(n290) );
  OAI22X1 U319 ( .A(\Register_Map[6][6] ), .B(n24), .C(sample_data[6]), .D(n31), .Y(n289) );
  NOR2X1 U320 ( .A(n290), .B(n289), .Y(n291) );
  AOI22X1 U321 ( .A(n294), .B(n293), .C(n292), .D(n291), .Y(N216) );
  OAI22X1 U322 ( .A(\Register_Map[13][7] ), .B(n15), .C(\Register_Map[11][7] ), 
        .D(n7), .Y(n296) );
  OAI21X1 U323 ( .A(\Register_Map[15][7] ), .B(n3), .C(N169), .Y(n295) );
  NOR2X1 U324 ( .A(n296), .B(n295), .Y(n318) );
  OR2X1 U325 ( .A(\Register_Map[8][7] ), .B(n10), .Y(n297) );
  OAI21X1 U326 ( .A(n19), .B(\Register_Map[10][7] ), .C(n297), .Y(n298) );
  OAI21X1 U327 ( .A(\Register_Map[12][7] ), .B(n31), .C(n319), .Y(n300) );
  OAI22X1 U328 ( .A(\Register_Map[9][7] ), .B(n29), .C(\Register_Map[14][7] ), 
        .D(n24), .Y(n299) );
  NOR2X1 U329 ( .A(n300), .B(n299), .Y(n317) );
  OAI22X1 U330 ( .A(\Register_Map[3][7] ), .B(n7), .C(\Register_Map[1][7] ), 
        .D(n29), .Y(n306) );
  OAI22X1 U331 ( .A(\Register_Map[7][7] ), .B(n3), .C(sample_data[15]), .D(n15), .Y(n305) );
  NOR2X1 U332 ( .A(n306), .B(n305), .Y(n316) );
  NOR2X1 U333 ( .A(\Register_Map[0][7] ), .B(n10), .Y(n308) );
  NOR2X1 U334 ( .A(N169), .B(n308), .Y(n309) );
  OAI21X1 U335 ( .A(\Register_Map[2][7] ), .B(n19), .C(n309), .Y(n314) );
  OAI22X1 U336 ( .A(\Register_Map[6][7] ), .B(n24), .C(sample_data[7]), .D(n31), .Y(n313) );
  NOR2X1 U337 ( .A(n314), .B(n313), .Y(n315) );
  AOI22X1 U338 ( .A(n318), .B(n317), .C(n316), .D(n315), .Y(N215) );
  INVX2 U339 ( .A(n298), .Y(n319) );
  INVX2 U340 ( .A(N169), .Y(n320) );
  NOR2X1 U341 ( .A(n1239), .B(N172), .Y(n323) );
  NAND2X1 U342 ( .A(n323), .B(n1240), .Y(n451) );
  NOR2X1 U343 ( .A(N171), .B(N172), .Y(n324) );
  NAND2X1 U344 ( .A(n324), .B(n1240), .Y(n450) );
  OAI22X1 U345 ( .A(\Register_Map[11][0] ), .B(n9), .C(\Register_Map[9][0] ), 
        .D(n22), .Y(n322) );
  NOR2X1 U346 ( .A(n470), .B(n1239), .Y(n327) );
  NAND2X1 U347 ( .A(n1240), .B(n327), .Y(n453) );
  NOR2X1 U348 ( .A(n470), .B(N171), .Y(n328) );
  NAND2X1 U349 ( .A(n328), .B(n1240), .Y(n452) );
  OAI22X1 U350 ( .A(\Register_Map[15][0] ), .B(n5), .C(\Register_Map[13][0] ), 
        .D(n27), .Y(n321) );
  NOR2X1 U351 ( .A(n322), .B(n321), .Y(n340) );
  NAND2X1 U352 ( .A(n323), .B(N53), .Y(n459) );
  NAND2X1 U353 ( .A(n324), .B(N53), .Y(n456) );
  NOR2X1 U354 ( .A(\Register_Map[8][0] ), .B(n11), .Y(n325) );
  NOR2X1 U355 ( .A(n964), .B(n325), .Y(n326) );
  OAI21X1 U356 ( .A(\Register_Map[10][0] ), .B(n20), .C(n326), .Y(n330) );
  NAND2X1 U357 ( .A(n327), .B(N53), .Y(n461) );
  NAND2X1 U358 ( .A(n328), .B(N53), .Y(n460) );
  OAI22X1 U359 ( .A(new_coefficient_set), .B(n25), .C(\Register_Map[12][0] ), 
        .D(n32), .Y(n329) );
  NOR2X1 U360 ( .A(n330), .B(n329), .Y(n339) );
  OAI22X1 U361 ( .A(\Register_Map[3][0] ), .B(n9), .C(\Register_Map[1][0] ), 
        .D(n22), .Y(n332) );
  OAI22X1 U362 ( .A(\Register_Map[7][0] ), .B(n5), .C(sample_data[8]), .D(n27), 
        .Y(n331) );
  NOR2X1 U363 ( .A(n332), .B(n331), .Y(n338) );
  NOR2X1 U364 ( .A(\Register_Map[0][0] ), .B(n11), .Y(n333) );
  NOR2X1 U365 ( .A(N173), .B(n333), .Y(n334) );
  OAI21X1 U366 ( .A(\Register_Map[2][0] ), .B(n20), .C(n334), .Y(n336) );
  OAI22X1 U367 ( .A(\Register_Map[6][0] ), .B(n25), .C(sample_data[0]), .D(n32), .Y(n335) );
  NOR2X1 U368 ( .A(n336), .B(n335), .Y(n337) );
  AOI22X1 U369 ( .A(n340), .B(n339), .C(n338), .D(n337), .Y(n341) );
  OAI22X1 U370 ( .A(\Register_Map[11][1] ), .B(n9), .C(\Register_Map[9][1] ), 
        .D(n22), .Y(n343) );
  OAI22X1 U371 ( .A(\Register_Map[15][1] ), .B(n5), .C(\Register_Map[13][1] ), 
        .D(n27), .Y(n342) );
  NOR2X1 U372 ( .A(n343), .B(n342), .Y(n357) );
  NOR2X1 U373 ( .A(\Register_Map[8][1] ), .B(n11), .Y(n344) );
  NOR2X1 U374 ( .A(n964), .B(n344), .Y(n345) );
  OAI21X1 U375 ( .A(\Register_Map[10][1] ), .B(n20), .C(n345), .Y(n347) );
  OAI22X1 U376 ( .A(\Register_Map[14][1] ), .B(n25), .C(\Register_Map[12][1] ), 
        .D(n32), .Y(n346) );
  NOR2X1 U377 ( .A(n347), .B(n346), .Y(n356) );
  OAI22X1 U378 ( .A(\Register_Map[3][1] ), .B(n9), .C(\Register_Map[1][1] ), 
        .D(n22), .Y(n349) );
  OAI22X1 U379 ( .A(\Register_Map[7][1] ), .B(n5), .C(sample_data[9]), .D(n27), 
        .Y(n348) );
  NOR2X1 U380 ( .A(n349), .B(n348), .Y(n355) );
  NOR2X1 U381 ( .A(\Register_Map[0][1] ), .B(n11), .Y(n350) );
  NOR2X1 U382 ( .A(N173), .B(n350), .Y(n351) );
  OAI21X1 U383 ( .A(\Register_Map[2][1] ), .B(n20), .C(n351), .Y(n353) );
  OAI22X1 U384 ( .A(\Register_Map[6][1] ), .B(n25), .C(sample_data[1]), .D(n32), .Y(n352) );
  NOR2X1 U385 ( .A(n353), .B(n352), .Y(n354) );
  AOI22X1 U386 ( .A(n357), .B(n356), .C(n355), .D(n354), .Y(n358) );
  OAI22X1 U387 ( .A(\Register_Map[11][2] ), .B(n9), .C(\Register_Map[9][2] ), 
        .D(n22), .Y(n360) );
  OAI22X1 U388 ( .A(\Register_Map[15][2] ), .B(n5), .C(\Register_Map[13][2] ), 
        .D(n27), .Y(n359) );
  NOR2X1 U389 ( .A(n360), .B(n359), .Y(n374) );
  NOR2X1 U390 ( .A(\Register_Map[8][2] ), .B(n11), .Y(n361) );
  NOR2X1 U391 ( .A(n964), .B(n361), .Y(n362) );
  OAI21X1 U392 ( .A(\Register_Map[10][2] ), .B(n20), .C(n362), .Y(n364) );
  OAI22X1 U393 ( .A(\Register_Map[14][2] ), .B(n25), .C(\Register_Map[12][2] ), 
        .D(n32), .Y(n363) );
  NOR2X1 U394 ( .A(n364), .B(n363), .Y(n373) );
  OAI22X1 U395 ( .A(\Register_Map[3][2] ), .B(n9), .C(\Register_Map[1][2] ), 
        .D(n22), .Y(n366) );
  OAI22X1 U396 ( .A(\Register_Map[7][2] ), .B(n5), .C(sample_data[10]), .D(n27), .Y(n365) );
  NOR2X1 U397 ( .A(n366), .B(n365), .Y(n372) );
  NOR2X1 U398 ( .A(\Register_Map[0][2] ), .B(n11), .Y(n367) );
  NOR2X1 U399 ( .A(N173), .B(n367), .Y(n368) );
  OAI21X1 U400 ( .A(\Register_Map[2][2] ), .B(n20), .C(n368), .Y(n370) );
  OAI22X1 U401 ( .A(\Register_Map[6][2] ), .B(n25), .C(sample_data[2]), .D(n32), .Y(n369) );
  NOR2X1 U402 ( .A(n370), .B(n369), .Y(n371) );
  AOI22X1 U403 ( .A(n374), .B(n373), .C(n372), .D(n371), .Y(n375) );
  OAI22X1 U404 ( .A(\Register_Map[11][3] ), .B(n9), .C(\Register_Map[9][3] ), 
        .D(n22), .Y(n377) );
  OAI22X1 U405 ( .A(\Register_Map[15][3] ), .B(n5), .C(\Register_Map[13][3] ), 
        .D(n27), .Y(n376) );
  NOR2X1 U406 ( .A(n377), .B(n376), .Y(n391) );
  NOR2X1 U407 ( .A(\Register_Map[8][3] ), .B(n11), .Y(n378) );
  NOR2X1 U408 ( .A(n964), .B(n378), .Y(n379) );
  OAI21X1 U409 ( .A(\Register_Map[10][3] ), .B(n20), .C(n379), .Y(n381) );
  OAI22X1 U410 ( .A(\Register_Map[14][3] ), .B(n25), .C(\Register_Map[12][3] ), 
        .D(n32), .Y(n380) );
  NOR2X1 U411 ( .A(n381), .B(n380), .Y(n390) );
  OAI22X1 U412 ( .A(\Register_Map[3][3] ), .B(n9), .C(\Register_Map[1][3] ), 
        .D(n22), .Y(n383) );
  OAI22X1 U413 ( .A(\Register_Map[7][3] ), .B(n5), .C(sample_data[11]), .D(n27), .Y(n382) );
  NOR2X1 U414 ( .A(n383), .B(n382), .Y(n389) );
  NOR2X1 U415 ( .A(\Register_Map[0][3] ), .B(n11), .Y(n384) );
  NOR2X1 U416 ( .A(N173), .B(n384), .Y(n385) );
  OAI21X1 U417 ( .A(\Register_Map[2][3] ), .B(n20), .C(n385), .Y(n387) );
  OAI22X1 U418 ( .A(\Register_Map[6][3] ), .B(n25), .C(sample_data[3]), .D(n32), .Y(n386) );
  NOR2X1 U419 ( .A(n387), .B(n386), .Y(n388) );
  AOI22X1 U420 ( .A(n391), .B(n390), .C(n389), .D(n388), .Y(n392) );
  OAI22X1 U421 ( .A(\Register_Map[11][4] ), .B(n9), .C(\Register_Map[9][4] ), 
        .D(n22), .Y(n394) );
  OAI22X1 U422 ( .A(\Register_Map[15][4] ), .B(n5), .C(\Register_Map[13][4] ), 
        .D(n27), .Y(n393) );
  NOR2X1 U423 ( .A(n394), .B(n393), .Y(n408) );
  NOR2X1 U424 ( .A(\Register_Map[8][4] ), .B(n11), .Y(n395) );
  NOR2X1 U425 ( .A(n964), .B(n395), .Y(n396) );
  OAI21X1 U426 ( .A(\Register_Map[10][4] ), .B(n20), .C(n396), .Y(n398) );
  OAI22X1 U427 ( .A(\Register_Map[14][4] ), .B(n25), .C(\Register_Map[12][4] ), 
        .D(n32), .Y(n397) );
  NOR2X1 U428 ( .A(n398), .B(n397), .Y(n407) );
  OAI22X1 U429 ( .A(\Register_Map[3][4] ), .B(n9), .C(\Register_Map[1][4] ), 
        .D(n22), .Y(n400) );
  OAI22X1 U430 ( .A(\Register_Map[7][4] ), .B(n5), .C(sample_data[12]), .D(n27), .Y(n399) );
  NOR2X1 U431 ( .A(n400), .B(n399), .Y(n406) );
  NOR2X1 U432 ( .A(\Register_Map[0][4] ), .B(n11), .Y(n401) );
  NOR2X1 U433 ( .A(N173), .B(n401), .Y(n402) );
  OAI21X1 U434 ( .A(\Register_Map[2][4] ), .B(n20), .C(n402), .Y(n404) );
  OAI22X1 U435 ( .A(\Register_Map[6][4] ), .B(n25), .C(sample_data[4]), .D(n32), .Y(n403) );
  NOR2X1 U436 ( .A(n404), .B(n403), .Y(n405) );
  AOI22X1 U437 ( .A(n408), .B(n407), .C(n406), .D(n405), .Y(n409) );
  OAI22X1 U438 ( .A(\Register_Map[11][5] ), .B(n9), .C(\Register_Map[9][5] ), 
        .D(n22), .Y(n411) );
  OAI22X1 U439 ( .A(\Register_Map[15][5] ), .B(n5), .C(\Register_Map[13][5] ), 
        .D(n27), .Y(n410) );
  NOR2X1 U440 ( .A(n411), .B(n410), .Y(n425) );
  NOR2X1 U441 ( .A(\Register_Map[8][5] ), .B(n11), .Y(n412) );
  NOR2X1 U442 ( .A(n964), .B(n412), .Y(n413) );
  OAI21X1 U443 ( .A(\Register_Map[10][5] ), .B(n20), .C(n413), .Y(n415) );
  OAI22X1 U444 ( .A(\Register_Map[14][5] ), .B(n25), .C(\Register_Map[12][5] ), 
        .D(n32), .Y(n414) );
  NOR2X1 U445 ( .A(n415), .B(n414), .Y(n424) );
  OAI22X1 U446 ( .A(\Register_Map[3][5] ), .B(n9), .C(\Register_Map[1][5] ), 
        .D(n22), .Y(n417) );
  OAI22X1 U447 ( .A(\Register_Map[7][5] ), .B(n5), .C(sample_data[13]), .D(n27), .Y(n416) );
  NOR2X1 U448 ( .A(n417), .B(n416), .Y(n423) );
  NOR2X1 U449 ( .A(\Register_Map[0][5] ), .B(n11), .Y(n418) );
  NOR2X1 U450 ( .A(N173), .B(n418), .Y(n419) );
  OAI21X1 U451 ( .A(\Register_Map[2][5] ), .B(n20), .C(n419), .Y(n421) );
  OAI22X1 U452 ( .A(\Register_Map[6][5] ), .B(n25), .C(sample_data[5]), .D(n32), .Y(n420) );
  NOR2X1 U453 ( .A(n421), .B(n420), .Y(n422) );
  AOI22X1 U454 ( .A(n425), .B(n424), .C(n423), .D(n422), .Y(n426) );
  OAI22X1 U455 ( .A(\Register_Map[11][6] ), .B(n9), .C(\Register_Map[9][6] ), 
        .D(n22), .Y(n428) );
  OAI22X1 U456 ( .A(\Register_Map[15][6] ), .B(n5), .C(\Register_Map[13][6] ), 
        .D(n27), .Y(n427) );
  NOR2X1 U457 ( .A(n428), .B(n427), .Y(n442) );
  NOR2X1 U458 ( .A(\Register_Map[8][6] ), .B(n11), .Y(n429) );
  NOR2X1 U459 ( .A(n964), .B(n429), .Y(n430) );
  OAI21X1 U460 ( .A(\Register_Map[10][6] ), .B(n20), .C(n430), .Y(n432) );
  OAI22X1 U461 ( .A(\Register_Map[14][6] ), .B(n25), .C(\Register_Map[12][6] ), 
        .D(n32), .Y(n431) );
  NOR2X1 U462 ( .A(n432), .B(n431), .Y(n441) );
  OAI22X1 U463 ( .A(\Register_Map[3][6] ), .B(n9), .C(\Register_Map[1][6] ), 
        .D(n22), .Y(n434) );
  OAI22X1 U464 ( .A(\Register_Map[7][6] ), .B(n5), .C(sample_data[14]), .D(n27), .Y(n433) );
  NOR2X1 U465 ( .A(n434), .B(n433), .Y(n440) );
  NOR2X1 U466 ( .A(\Register_Map[0][6] ), .B(n11), .Y(n435) );
  NOR2X1 U467 ( .A(N173), .B(n435), .Y(n436) );
  OAI21X1 U468 ( .A(\Register_Map[2][6] ), .B(n20), .C(n436), .Y(n438) );
  OAI22X1 U469 ( .A(\Register_Map[6][6] ), .B(n25), .C(sample_data[6]), .D(n32), .Y(n437) );
  NOR2X1 U470 ( .A(n438), .B(n437), .Y(n439) );
  AOI22X1 U471 ( .A(n442), .B(n441), .C(n440), .D(n439), .Y(n443) );
  OAI22X1 U472 ( .A(\Register_Map[13][7] ), .B(n27), .C(\Register_Map[11][7] ), 
        .D(n9), .Y(n445) );
  OAI21X1 U473 ( .A(\Register_Map[15][7] ), .B(n5), .C(N173), .Y(n444) );
  NOR2X1 U474 ( .A(n445), .B(n444), .Y(n467) );
  OR2X1 U475 ( .A(\Register_Map[8][7] ), .B(n11), .Y(n446) );
  OAI21X1 U476 ( .A(n20), .B(\Register_Map[10][7] ), .C(n446), .Y(n447) );
  OAI21X1 U477 ( .A(\Register_Map[12][7] ), .B(n32), .C(n469), .Y(n449) );
  OAI22X1 U478 ( .A(\Register_Map[9][7] ), .B(n22), .C(\Register_Map[14][7] ), 
        .D(n25), .Y(n448) );
  NOR2X1 U479 ( .A(n449), .B(n448), .Y(n466) );
  OAI22X1 U480 ( .A(\Register_Map[3][7] ), .B(n9), .C(\Register_Map[1][7] ), 
        .D(n22), .Y(n455) );
  OAI22X1 U481 ( .A(\Register_Map[7][7] ), .B(n5), .C(sample_data[15]), .D(n27), .Y(n454) );
  NOR2X1 U482 ( .A(n455), .B(n454), .Y(n465) );
  NOR2X1 U483 ( .A(\Register_Map[0][7] ), .B(n11), .Y(n457) );
  NOR2X1 U484 ( .A(N173), .B(n457), .Y(n458) );
  OAI21X1 U485 ( .A(\Register_Map[2][7] ), .B(n20), .C(n458), .Y(n463) );
  OAI22X1 U486 ( .A(\Register_Map[6][7] ), .B(n25), .C(sample_data[7]), .D(n32), .Y(n462) );
  NOR2X1 U487 ( .A(n463), .B(n462), .Y(n464) );
  AOI22X1 U488 ( .A(n467), .B(n466), .C(n465), .D(n464), .Y(n468) );
  INVX2 U489 ( .A(n447), .Y(n469) );
  INVX2 U490 ( .A(N172), .Y(n470) );
  INVX2 U491 ( .A(n468), .Y(N227) );
  INVX2 U492 ( .A(n443), .Y(N228) );
  INVX2 U493 ( .A(n426), .Y(N229) );
  INVX2 U494 ( .A(n409), .Y(N230) );
  INVX2 U495 ( .A(n392), .Y(N231) );
  INVX2 U496 ( .A(n375), .Y(N232) );
  INVX2 U497 ( .A(n358), .Y(N233) );
  INVX2 U498 ( .A(n341), .Y(N234) );
  NOR2X1 U499 ( .A(n738), .B(n737), .Y(n731) );
  AOI22X1 U500 ( .A(\Register_Map[9][0] ), .B(n784), .C(\Register_Map[13][0] ), 
        .D(n35), .Y(n472) );
  NOR2X1 U501 ( .A(N180), .B(N181), .Y(n732) );
  AOI22X1 U502 ( .A(\Register_Map[1][0] ), .B(n732), .C(sample_data[8]), .D(
        n785), .Y(n471) );
  AOI21X1 U503 ( .A(n472), .B(n471), .C(n1237), .Y(n476) );
  AOI22X1 U504 ( .A(\Register_Map[11][0] ), .B(n784), .C(\Register_Map[15][0] ), .D(n35), .Y(n474) );
  AOI22X1 U505 ( .A(\Register_Map[3][0] ), .B(n16), .C(\Register_Map[7][0] ), 
        .D(n785), .Y(n473) );
  AOI21X1 U506 ( .A(n474), .B(n473), .C(n739), .Y(n475) );
  OR2X1 U507 ( .A(n476), .B(n475), .Y(fir_coefficient[8]) );
  AOI22X1 U508 ( .A(\Register_Map[9][1] ), .B(n784), .C(\Register_Map[13][1] ), 
        .D(n35), .Y(n478) );
  AOI22X1 U509 ( .A(\Register_Map[1][1] ), .B(n786), .C(sample_data[9]), .D(
        n785), .Y(n477) );
  AOI21X1 U510 ( .A(n478), .B(n477), .C(n1237), .Y(n482) );
  AOI22X1 U511 ( .A(\Register_Map[11][1] ), .B(n784), .C(\Register_Map[15][1] ), .D(n35), .Y(n480) );
  AOI22X1 U512 ( .A(\Register_Map[3][1] ), .B(n732), .C(\Register_Map[7][1] ), 
        .D(n785), .Y(n479) );
  AOI21X1 U513 ( .A(n480), .B(n479), .C(n739), .Y(n481) );
  OR2X1 U514 ( .A(n482), .B(n481), .Y(fir_coefficient[9]) );
  AOI22X1 U515 ( .A(\Register_Map[9][2] ), .B(n784), .C(\Register_Map[13][2] ), 
        .D(n35), .Y(n484) );
  AOI22X1 U516 ( .A(\Register_Map[1][2] ), .B(n16), .C(sample_data[10]), .D(
        n785), .Y(n483) );
  AOI21X1 U517 ( .A(n484), .B(n483), .C(n1237), .Y(n488) );
  AOI22X1 U518 ( .A(\Register_Map[11][2] ), .B(n784), .C(\Register_Map[15][2] ), .D(n35), .Y(n486) );
  AOI22X1 U519 ( .A(\Register_Map[3][2] ), .B(n786), .C(\Register_Map[7][2] ), 
        .D(n785), .Y(n485) );
  AOI21X1 U520 ( .A(n486), .B(n485), .C(n739), .Y(n487) );
  OR2X1 U521 ( .A(n488), .B(n487), .Y(fir_coefficient[10]) );
  AOI22X1 U522 ( .A(\Register_Map[9][3] ), .B(n784), .C(\Register_Map[13][3] ), 
        .D(n35), .Y(n490) );
  AOI22X1 U523 ( .A(\Register_Map[1][3] ), .B(n732), .C(sample_data[11]), .D(
        n785), .Y(n489) );
  AOI21X1 U524 ( .A(n490), .B(n489), .C(n1237), .Y(n494) );
  AOI22X1 U525 ( .A(\Register_Map[11][3] ), .B(n784), .C(\Register_Map[15][3] ), .D(n35), .Y(n492) );
  AOI22X1 U526 ( .A(\Register_Map[3][3] ), .B(n16), .C(\Register_Map[7][3] ), 
        .D(n785), .Y(n491) );
  AOI21X1 U527 ( .A(n492), .B(n491), .C(n739), .Y(n493) );
  OR2X1 U528 ( .A(n494), .B(n493), .Y(fir_coefficient[11]) );
  AOI22X1 U529 ( .A(\Register_Map[9][4] ), .B(n784), .C(\Register_Map[13][4] ), 
        .D(n35), .Y(n496) );
  AOI22X1 U530 ( .A(\Register_Map[1][4] ), .B(n786), .C(sample_data[12]), .D(
        n785), .Y(n495) );
  AOI21X1 U531 ( .A(n496), .B(n495), .C(n1237), .Y(n500) );
  AOI22X1 U532 ( .A(\Register_Map[11][4] ), .B(n784), .C(\Register_Map[15][4] ), .D(n35), .Y(n498) );
  AOI22X1 U533 ( .A(\Register_Map[3][4] ), .B(n732), .C(\Register_Map[7][4] ), 
        .D(n785), .Y(n497) );
  AOI21X1 U534 ( .A(n498), .B(n497), .C(n739), .Y(n499) );
  OR2X1 U535 ( .A(n500), .B(n499), .Y(fir_coefficient[12]) );
  AOI22X1 U536 ( .A(\Register_Map[9][5] ), .B(n784), .C(\Register_Map[13][5] ), 
        .D(n35), .Y(n502) );
  AOI22X1 U537 ( .A(\Register_Map[1][5] ), .B(n16), .C(sample_data[13]), .D(
        n785), .Y(n501) );
  AOI21X1 U538 ( .A(n502), .B(n501), .C(n1237), .Y(n506) );
  AOI22X1 U539 ( .A(\Register_Map[11][5] ), .B(n34), .C(\Register_Map[15][5] ), 
        .D(n35), .Y(n504) );
  AOI22X1 U540 ( .A(\Register_Map[3][5] ), .B(n786), .C(\Register_Map[7][5] ), 
        .D(n36), .Y(n503) );
  AOI21X1 U541 ( .A(n504), .B(n503), .C(n739), .Y(n505) );
  OR2X1 U542 ( .A(n506), .B(n505), .Y(fir_coefficient[13]) );
  AOI22X1 U543 ( .A(\Register_Map[9][6] ), .B(n34), .C(\Register_Map[13][6] ), 
        .D(n35), .Y(n724) );
  AOI22X1 U544 ( .A(\Register_Map[1][6] ), .B(n732), .C(sample_data[14]), .D(
        n36), .Y(n723) );
  AOI21X1 U545 ( .A(n724), .B(n723), .C(n1237), .Y(n728) );
  AOI22X1 U546 ( .A(\Register_Map[11][6] ), .B(n34), .C(\Register_Map[15][6] ), 
        .D(n35), .Y(n726) );
  AOI22X1 U547 ( .A(\Register_Map[3][6] ), .B(n16), .C(\Register_Map[7][6] ), 
        .D(n36), .Y(n725) );
  AOI21X1 U548 ( .A(n726), .B(n725), .C(n739), .Y(n727) );
  OR2X1 U549 ( .A(n728), .B(n727), .Y(fir_coefficient[14]) );
  AOI22X1 U550 ( .A(\Register_Map[9][7] ), .B(n34), .C(\Register_Map[13][7] ), 
        .D(n35), .Y(n730) );
  AOI22X1 U551 ( .A(\Register_Map[1][7] ), .B(n786), .C(sample_data[15]), .D(
        n36), .Y(n729) );
  AOI21X1 U552 ( .A(n730), .B(n729), .C(n1237), .Y(n736) );
  AOI22X1 U553 ( .A(\Register_Map[11][7] ), .B(n34), .C(\Register_Map[15][7] ), 
        .D(n35), .Y(n734) );
  AOI22X1 U554 ( .A(\Register_Map[3][7] ), .B(n732), .C(\Register_Map[7][7] ), 
        .D(n36), .Y(n733) );
  AOI21X1 U555 ( .A(n734), .B(n733), .C(n739), .Y(n735) );
  OR2X1 U556 ( .A(n736), .B(n735), .Y(fir_coefficient[15]) );
  INVX2 U557 ( .A(N180), .Y(n737) );
  INVX2 U558 ( .A(N181), .Y(n738) );
  INVX2 U559 ( .A(n1237), .Y(n739) );
  NOR2X1 U560 ( .A(n738), .B(N180), .Y(n784) );
  AOI22X1 U561 ( .A(\Register_Map[8][0] ), .B(n34), .C(\Register_Map[12][0] ), 
        .D(n731), .Y(n741) );
  NOR2X1 U562 ( .A(N180), .B(N181), .Y(n786) );
  NOR2X1 U563 ( .A(n737), .B(N181), .Y(n785) );
  AOI22X1 U564 ( .A(\Register_Map[0][0] ), .B(n786), .C(sample_data[0]), .D(
        n36), .Y(n740) );
  AOI21X1 U565 ( .A(n741), .B(n740), .C(n1237), .Y(n745) );
  AOI22X1 U566 ( .A(\Register_Map[10][0] ), .B(n34), .C(new_coefficient_set), 
        .D(n731), .Y(n743) );
  AOI22X1 U567 ( .A(\Register_Map[2][0] ), .B(n732), .C(\Register_Map[6][0] ), 
        .D(n36), .Y(n742) );
  AOI21X1 U568 ( .A(n743), .B(n742), .C(n739), .Y(n744) );
  OR2X1 U569 ( .A(n745), .B(n744), .Y(fir_coefficient[0]) );
  AOI22X1 U570 ( .A(\Register_Map[8][1] ), .B(n34), .C(\Register_Map[12][1] ), 
        .D(n731), .Y(n747) );
  AOI22X1 U571 ( .A(\Register_Map[0][1] ), .B(n16), .C(sample_data[1]), .D(n36), .Y(n746) );
  AOI21X1 U572 ( .A(n747), .B(n746), .C(n1237), .Y(n751) );
  AOI22X1 U573 ( .A(\Register_Map[10][1] ), .B(n34), .C(\Register_Map[14][1] ), 
        .D(n731), .Y(n749) );
  AOI22X1 U574 ( .A(\Register_Map[2][1] ), .B(n786), .C(\Register_Map[6][1] ), 
        .D(n36), .Y(n748) );
  AOI21X1 U575 ( .A(n749), .B(n748), .C(coefficient_num[0]), .Y(n750) );
  OR2X1 U576 ( .A(n751), .B(n750), .Y(fir_coefficient[1]) );
  AOI22X1 U577 ( .A(\Register_Map[8][2] ), .B(n34), .C(\Register_Map[12][2] ), 
        .D(n731), .Y(n753) );
  AOI22X1 U578 ( .A(\Register_Map[0][2] ), .B(n732), .C(sample_data[2]), .D(
        n36), .Y(n752) );
  AOI21X1 U579 ( .A(n753), .B(n752), .C(n1237), .Y(n757) );
  AOI22X1 U580 ( .A(\Register_Map[10][2] ), .B(n34), .C(\Register_Map[14][2] ), 
        .D(n731), .Y(n755) );
  AOI22X1 U581 ( .A(\Register_Map[2][2] ), .B(n16), .C(\Register_Map[6][2] ), 
        .D(n36), .Y(n754) );
  AOI21X1 U582 ( .A(n755), .B(n754), .C(coefficient_num[0]), .Y(n756) );
  OR2X1 U583 ( .A(n757), .B(n756), .Y(fir_coefficient[2]) );
  AOI22X1 U584 ( .A(\Register_Map[8][3] ), .B(n34), .C(\Register_Map[12][3] ), 
        .D(n731), .Y(n759) );
  AOI22X1 U585 ( .A(\Register_Map[0][3] ), .B(n786), .C(sample_data[3]), .D(
        n36), .Y(n758) );
  AOI21X1 U586 ( .A(n759), .B(n758), .C(n1237), .Y(n763) );
  AOI22X1 U587 ( .A(\Register_Map[10][3] ), .B(n34), .C(\Register_Map[14][3] ), 
        .D(n731), .Y(n761) );
  AOI22X1 U588 ( .A(\Register_Map[2][3] ), .B(n732), .C(\Register_Map[6][3] ), 
        .D(n36), .Y(n760) );
  AOI21X1 U589 ( .A(n761), .B(n760), .C(coefficient_num[0]), .Y(n762) );
  OR2X1 U590 ( .A(n763), .B(n762), .Y(fir_coefficient[3]) );
  AOI22X1 U591 ( .A(\Register_Map[8][4] ), .B(n34), .C(\Register_Map[12][4] ), 
        .D(n731), .Y(n765) );
  AOI22X1 U592 ( .A(\Register_Map[0][4] ), .B(n16), .C(sample_data[4]), .D(n36), .Y(n764) );
  AOI21X1 U593 ( .A(n765), .B(n764), .C(n1237), .Y(n769) );
  AOI22X1 U594 ( .A(\Register_Map[10][4] ), .B(n34), .C(\Register_Map[14][4] ), 
        .D(n731), .Y(n767) );
  AOI22X1 U595 ( .A(\Register_Map[2][4] ), .B(n786), .C(\Register_Map[6][4] ), 
        .D(n36), .Y(n766) );
  AOI21X1 U596 ( .A(n767), .B(n766), .C(coefficient_num[0]), .Y(n768) );
  OR2X1 U597 ( .A(n769), .B(n768), .Y(fir_coefficient[4]) );
  AOI22X1 U598 ( .A(\Register_Map[8][5] ), .B(n34), .C(\Register_Map[12][5] ), 
        .D(n731), .Y(n771) );
  AOI22X1 U599 ( .A(\Register_Map[0][5] ), .B(n732), .C(sample_data[5]), .D(
        n36), .Y(n770) );
  AOI21X1 U600 ( .A(n771), .B(n770), .C(n1237), .Y(n775) );
  AOI22X1 U601 ( .A(\Register_Map[10][5] ), .B(n34), .C(\Register_Map[14][5] ), 
        .D(n35), .Y(n773) );
  AOI22X1 U602 ( .A(\Register_Map[2][5] ), .B(n16), .C(\Register_Map[6][5] ), 
        .D(n36), .Y(n772) );
  AOI21X1 U603 ( .A(n773), .B(n772), .C(coefficient_num[0]), .Y(n774) );
  OR2X1 U604 ( .A(n775), .B(n774), .Y(fir_coefficient[5]) );
  AOI22X1 U605 ( .A(\Register_Map[8][6] ), .B(n34), .C(\Register_Map[12][6] ), 
        .D(n35), .Y(n777) );
  AOI22X1 U606 ( .A(\Register_Map[0][6] ), .B(n786), .C(sample_data[6]), .D(
        n36), .Y(n776) );
  AOI21X1 U607 ( .A(n777), .B(n776), .C(n1237), .Y(n781) );
  AOI22X1 U608 ( .A(\Register_Map[10][6] ), .B(n34), .C(\Register_Map[14][6] ), 
        .D(n35), .Y(n779) );
  AOI22X1 U609 ( .A(\Register_Map[2][6] ), .B(n732), .C(\Register_Map[6][6] ), 
        .D(n36), .Y(n778) );
  AOI21X1 U610 ( .A(n779), .B(n778), .C(coefficient_num[0]), .Y(n780) );
  OR2X1 U611 ( .A(n781), .B(n780), .Y(fir_coefficient[6]) );
  AOI22X1 U612 ( .A(\Register_Map[8][7] ), .B(n34), .C(\Register_Map[12][7] ), 
        .D(n35), .Y(n783) );
  AOI22X1 U613 ( .A(\Register_Map[0][7] ), .B(n16), .C(sample_data[7]), .D(n36), .Y(n782) );
  AOI21X1 U614 ( .A(n783), .B(n782), .C(n1237), .Y(n790) );
  AOI22X1 U615 ( .A(\Register_Map[10][7] ), .B(n34), .C(\Register_Map[14][7] ), 
        .D(n35), .Y(n788) );
  AOI22X1 U616 ( .A(\Register_Map[2][7] ), .B(n786), .C(\Register_Map[6][7] ), 
        .D(n36), .Y(n787) );
  AOI21X1 U617 ( .A(n788), .B(n787), .C(coefficient_num[0]), .Y(n789) );
  OR2X1 U618 ( .A(n790), .B(n789), .Y(fir_coefficient[7]) );
  OAI21X1 U619 ( .A(n791), .B(n792), .C(n793), .Y(next_state[1]) );
  NAND2X1 U620 ( .A(n794), .B(n795), .Y(n792) );
  INVX1 U621 ( .A(hsel), .Y(n791) );
  NAND2X1 U622 ( .A(n793), .B(n794), .Y(next_state[0]) );
  NAND3X1 U623 ( .A(hsel), .B(n795), .C(hwrite), .Y(n794) );
  OR2X1 U624 ( .A(htrans[0]), .B(htrans[1]), .Y(n795) );
  OAI21X1 U625 ( .A(n796), .B(n797), .C(n798), .Y(\next_Register_Map[3][7] )
         );
  AOI22X1 U626 ( .A(n799), .B(n800), .C(n12), .D(n802), .Y(n798) );
  INVX1 U627 ( .A(fir_out[15]), .Y(n797) );
  OAI21X1 U628 ( .A(n796), .B(n803), .C(n804), .Y(\next_Register_Map[3][6] )
         );
  AOI22X1 U629 ( .A(n805), .B(n800), .C(n8), .D(n802), .Y(n804) );
  INVX1 U630 ( .A(fir_out[14]), .Y(n803) );
  OAI21X1 U631 ( .A(n796), .B(n807), .C(n808), .Y(\next_Register_Map[3][5] )
         );
  AOI22X1 U632 ( .A(n809), .B(n800), .C(n6), .D(n802), .Y(n808) );
  INVX1 U633 ( .A(fir_out[13]), .Y(n807) );
  OAI21X1 U634 ( .A(n796), .B(n811), .C(n812), .Y(\next_Register_Map[3][4] )
         );
  AOI22X1 U635 ( .A(n813), .B(n800), .C(n4), .D(n802), .Y(n812) );
  INVX1 U636 ( .A(fir_out[12]), .Y(n811) );
  OAI21X1 U637 ( .A(n796), .B(n815), .C(n816), .Y(\next_Register_Map[3][3] )
         );
  AOI22X1 U638 ( .A(n817), .B(n800), .C(n2), .D(n802), .Y(n816) );
  INVX1 U639 ( .A(fir_out[11]), .Y(n815) );
  OAI21X1 U640 ( .A(n796), .B(n819), .C(n820), .Y(\next_Register_Map[3][2] )
         );
  AOI22X1 U641 ( .A(n821), .B(n800), .C(n1), .D(n802), .Y(n820) );
  INVX1 U642 ( .A(fir_out[10]), .Y(n819) );
  OAI21X1 U643 ( .A(n796), .B(n823), .C(n824), .Y(\next_Register_Map[3][1] )
         );
  AOI22X1 U644 ( .A(n825), .B(n800), .C(n23), .D(n802), .Y(n824) );
  INVX1 U645 ( .A(fir_out[9]), .Y(n823) );
  OAI21X1 U646 ( .A(n796), .B(n827), .C(n828), .Y(\next_Register_Map[3][0] )
         );
  AOI22X1 U647 ( .A(n829), .B(n800), .C(n18), .D(n802), .Y(n828) );
  OAI22X1 U648 ( .A(n831), .B(n832), .C(n833), .D(n834), .Y(n802) );
  OAI22X1 U649 ( .A(n831), .B(n835), .C(n836), .D(n837), .Y(n800) );
  INVX1 U650 ( .A(fir_out[8]), .Y(n827) );
  OAI21X1 U651 ( .A(n838), .B(n839), .C(n840), .Y(n796) );
  NAND3X1 U652 ( .A(n841), .B(n842), .C(n843), .Y(n840) );
  NAND2X1 U653 ( .A(n844), .B(n845), .Y(n839) );
  OAI21X1 U654 ( .A(n846), .B(n847), .C(n848), .Y(\next_Register_Map[2][7] )
         );
  AOI22X1 U655 ( .A(n799), .B(n849), .C(n12), .D(n850), .Y(n848) );
  INVX1 U656 ( .A(fir_out[7]), .Y(n847) );
  OAI21X1 U657 ( .A(n846), .B(n851), .C(n852), .Y(\next_Register_Map[2][6] )
         );
  AOI22X1 U658 ( .A(n805), .B(n849), .C(n8), .D(n850), .Y(n852) );
  INVX1 U659 ( .A(fir_out[6]), .Y(n851) );
  OAI21X1 U660 ( .A(n846), .B(n853), .C(n854), .Y(\next_Register_Map[2][5] )
         );
  AOI22X1 U661 ( .A(n809), .B(n849), .C(n6), .D(n850), .Y(n854) );
  INVX1 U662 ( .A(fir_out[5]), .Y(n853) );
  OAI21X1 U799 ( .A(n846), .B(n855), .C(n856), .Y(\next_Register_Map[2][4] )
         );
  AOI22X1 U800 ( .A(n813), .B(n849), .C(n4), .D(n850), .Y(n856) );
  INVX1 U801 ( .A(fir_out[4]), .Y(n855) );
  OAI21X1 U802 ( .A(n846), .B(n857), .C(n859), .Y(\next_Register_Map[2][3] )
         );
  AOI22X1 U803 ( .A(n817), .B(n849), .C(n2), .D(n850), .Y(n859) );
  INVX1 U804 ( .A(fir_out[3]), .Y(n857) );
  OAI21X1 U805 ( .A(n846), .B(n860), .C(n861), .Y(\next_Register_Map[2][2] )
         );
  AOI22X1 U806 ( .A(n821), .B(n849), .C(n1), .D(n850), .Y(n861) );
  INVX1 U807 ( .A(fir_out[2]), .Y(n860) );
  OAI21X1 U808 ( .A(n846), .B(n862), .C(n863), .Y(\next_Register_Map[2][1] )
         );
  AOI22X1 U809 ( .A(n825), .B(n849), .C(n23), .D(n850), .Y(n863) );
  INVX1 U810 ( .A(fir_out[1]), .Y(n862) );
  OAI21X1 U811 ( .A(n846), .B(n864), .C(n865), .Y(\next_Register_Map[2][0] )
         );
  AOI22X1 U812 ( .A(n829), .B(n849), .C(n18), .D(n850), .Y(n865) );
  OAI22X1 U813 ( .A(haddr[0]), .B(n866), .C(n834), .D(n867), .Y(n850) );
  OAI22X1 U814 ( .A(n868), .B(n866), .C(n837), .D(n869), .Y(n849) );
  INVX1 U815 ( .A(fir_out[0]), .Y(n864) );
  OAI21X1 U816 ( .A(n870), .B(n866), .C(n871), .Y(n846) );
  NAND3X1 U817 ( .A(n872), .B(n844), .C(n873), .Y(n871) );
  INVX1 U818 ( .A(n874), .Y(n873) );
  OR2X1 U819 ( .A(n875), .B(n831), .Y(n866) );
  OAI22X1 U820 ( .A(n876), .B(n877), .C(n878), .D(n879), .Y(
        \next_Register_Map[1][7] ) );
  OAI22X1 U821 ( .A(n880), .B(n877), .C(n881), .D(n879), .Y(
        \next_Register_Map[1][6] ) );
  OAI22X1 U822 ( .A(n882), .B(n877), .C(n883), .D(n879), .Y(
        \next_Register_Map[1][5] ) );
  OAI22X1 U823 ( .A(n884), .B(n877), .C(n885), .D(n879), .Y(
        \next_Register_Map[1][4] ) );
  OAI22X1 U824 ( .A(n886), .B(n877), .C(n887), .D(n879), .Y(
        \next_Register_Map[1][3] ) );
  OAI22X1 U825 ( .A(n888), .B(n877), .C(n889), .D(n879), .Y(
        \next_Register_Map[1][2] ) );
  OAI22X1 U826 ( .A(n890), .B(n877), .C(n891), .D(n879), .Y(
        \next_Register_Map[1][1] ) );
  OAI21X1 U827 ( .A(n892), .B(n877), .C(n893), .Y(\next_Register_Map[1][0] )
         );
  AOI21X1 U828 ( .A(n894), .B(hwdata[8]), .C(n895), .Y(n893) );
  AOI21X1 U829 ( .A(n842), .B(n896), .C(n897), .Y(n895) );
  OAI21X1 U830 ( .A(n898), .B(n899), .C(n900), .Y(n896) );
  NAND2X1 U831 ( .A(n844), .B(size_buffer), .Y(n899) );
  AOI22X1 U832 ( .A(n901), .B(n902), .C(n903), .D(n904), .Y(n844) );
  INVX1 U833 ( .A(n879), .Y(n894) );
  NAND2X1 U834 ( .A(n37), .B(n905), .Y(n879) );
  OAI22X1 U835 ( .A(n868), .B(n900), .C(n837), .D(n833), .Y(n905) );
  OR2X1 U836 ( .A(n906), .B(n901), .Y(n837) );
  NAND2X1 U837 ( .A(n37), .B(n907), .Y(n877) );
  OAI22X1 U838 ( .A(haddr[0]), .B(n900), .C(n836), .D(n834), .Y(n907) );
  NAND2X1 U839 ( .A(n908), .B(n843), .Y(n900) );
  OAI22X1 U840 ( .A(n876), .B(n909), .C(n878), .D(n910), .Y(
        \next_Register_Map[15][7] ) );
  OAI22X1 U841 ( .A(n880), .B(n909), .C(n881), .D(n910), .Y(
        \next_Register_Map[15][6] ) );
  OAI22X1 U842 ( .A(n882), .B(n909), .C(n883), .D(n910), .Y(
        \next_Register_Map[15][5] ) );
  OAI22X1 U843 ( .A(n884), .B(n909), .C(n885), .D(n910), .Y(
        \next_Register_Map[15][4] ) );
  OAI22X1 U844 ( .A(n886), .B(n909), .C(n887), .D(n910), .Y(
        \next_Register_Map[15][3] ) );
  OAI22X1 U845 ( .A(n888), .B(n909), .C(n889), .D(n910), .Y(
        \next_Register_Map[15][2] ) );
  OAI22X1 U846 ( .A(n890), .B(n909), .C(n891), .D(n910), .Y(
        \next_Register_Map[15][1] ) );
  OAI22X1 U847 ( .A(n892), .B(n909), .C(n911), .D(n910), .Y(
        \next_Register_Map[15][0] ) );
  NAND2X1 U848 ( .A(n37), .B(n912), .Y(n910) );
  OAI22X1 U849 ( .A(n835), .B(n913), .C(n836), .D(n914), .Y(n912) );
  INVX1 U850 ( .A(hwdata[8]), .Y(n911) );
  NAND2X1 U851 ( .A(n37), .B(n915), .Y(n909) );
  OAI22X1 U852 ( .A(n832), .B(n913), .C(n833), .D(n916), .Y(n915) );
  OAI21X1 U853 ( .A(n917), .B(n918), .C(n919), .Y(\next_Register_Map[14][7] )
         );
  AOI22X1 U854 ( .A(n12), .B(n920), .C(\Register_Map[14][7] ), .D(n921), .Y(
        n919) );
  OAI21X1 U855 ( .A(n917), .B(n922), .C(n923), .Y(\next_Register_Map[14][6] )
         );
  AOI22X1 U856 ( .A(n8), .B(n920), .C(\Register_Map[14][6] ), .D(n921), .Y(
        n923) );
  OAI21X1 U857 ( .A(n917), .B(n924), .C(n925), .Y(\next_Register_Map[14][5] )
         );
  AOI22X1 U858 ( .A(n6), .B(n920), .C(\Register_Map[14][5] ), .D(n921), .Y(
        n925) );
  OAI21X1 U859 ( .A(n917), .B(n926), .C(n927), .Y(\next_Register_Map[14][4] )
         );
  AOI22X1 U860 ( .A(n4), .B(n920), .C(\Register_Map[14][4] ), .D(n921), .Y(
        n927) );
  OAI21X1 U861 ( .A(n917), .B(n928), .C(n929), .Y(\next_Register_Map[14][3] )
         );
  AOI22X1 U862 ( .A(n2), .B(n920), .C(\Register_Map[14][3] ), .D(n921), .Y(
        n929) );
  OAI21X1 U863 ( .A(n917), .B(n930), .C(n931), .Y(\next_Register_Map[14][2] )
         );
  AOI22X1 U864 ( .A(n1), .B(n920), .C(\Register_Map[14][2] ), .D(n921), .Y(
        n931) );
  OAI21X1 U865 ( .A(n917), .B(n932), .C(n933), .Y(\next_Register_Map[14][1] )
         );
  AOI22X1 U866 ( .A(n23), .B(n920), .C(\Register_Map[14][1] ), .D(n921), .Y(
        n933) );
  OAI21X1 U867 ( .A(n917), .B(n934), .C(n935), .Y(\next_Register_Map[14][0] )
         );
  AOI22X1 U868 ( .A(n18), .B(n920), .C(new_coefficient_set), .D(n921), .Y(n935) );
  INVX1 U869 ( .A(n936), .Y(n921) );
  OAI21X1 U870 ( .A(n1237), .B(n937), .C(n938), .Y(n936) );
  AOI22X1 U871 ( .A(n872), .B(n939), .C(n940), .D(n842), .Y(n938) );
  OAI21X1 U872 ( .A(n941), .B(n942), .C(n943), .Y(n939) );
  NAND3X1 U873 ( .A(n944), .B(n945), .C(n946), .Y(n943) );
  NAND2X1 U874 ( .A(n947), .B(n906), .Y(n942) );
  INVX1 U875 ( .A(n838), .Y(n872) );
  NAND2X1 U876 ( .A(size_buffer), .B(n37), .Y(n838) );
  OAI22X1 U877 ( .A(haddr[0]), .B(n948), .C(n867), .D(n916), .Y(n920) );
  AOI22X1 U878 ( .A(haddr[0]), .B(n940), .C(n944), .D(n949), .Y(n917) );
  INVX1 U879 ( .A(n914), .Y(n949) );
  OAI22X1 U880 ( .A(n876), .B(n950), .C(n878), .D(n951), .Y(
        \next_Register_Map[0][7] ) );
  INVX1 U881 ( .A(hwdata[15]), .Y(n878) );
  OAI22X1 U882 ( .A(n880), .B(n950), .C(n881), .D(n951), .Y(
        \next_Register_Map[0][6] ) );
  INVX1 U883 ( .A(hwdata[14]), .Y(n881) );
  OAI22X1 U884 ( .A(n882), .B(n950), .C(n883), .D(n951), .Y(
        \next_Register_Map[0][5] ) );
  INVX1 U885 ( .A(hwdata[13]), .Y(n883) );
  OAI22X1 U886 ( .A(n884), .B(n950), .C(n885), .D(n951), .Y(
        \next_Register_Map[0][4] ) );
  INVX1 U887 ( .A(hwdata[12]), .Y(n885) );
  OAI22X1 U888 ( .A(n886), .B(n950), .C(n887), .D(n951), .Y(
        \next_Register_Map[0][3] ) );
  INVX1 U889 ( .A(hwdata[11]), .Y(n887) );
  OAI22X1 U890 ( .A(n888), .B(n950), .C(n889), .D(n951), .Y(
        \next_Register_Map[0][2] ) );
  INVX1 U891 ( .A(hwdata[10]), .Y(n889) );
  OAI22X1 U892 ( .A(n890), .B(n950), .C(n891), .D(n951), .Y(
        \next_Register_Map[0][1] ) );
  INVX1 U893 ( .A(n952), .Y(n951) );
  INVX1 U894 ( .A(hwdata[9]), .Y(n891) );
  OAI21X1 U895 ( .A(n892), .B(n950), .C(n953), .Y(\next_Register_Map[0][0] )
         );
  AOI21X1 U896 ( .A(n952), .B(hwdata[8]), .C(n954), .Y(n953) );
  AOI21X1 U897 ( .A(n842), .B(n955), .C(n956), .Y(n954) );
  OAI21X1 U898 ( .A(new_coefficient_set), .B(modwait), .C(n897), .Y(n956) );
  INVX1 U899 ( .A(err), .Y(n897) );
  OAI21X1 U900 ( .A(n957), .B(n958), .C(n959), .Y(n955) );
  OAI21X1 U901 ( .A(n960), .B(n906), .C(n961), .Y(n958) );
  OAI21X1 U902 ( .A(n903), .B(n869), .C(n904), .Y(n961) );
  NOR2X1 U903 ( .A(n870), .B(n962), .Y(n952) );
  AOI22X1 U904 ( .A(haddr[0]), .B(n963), .C(n902), .D(n960), .Y(n962) );
  NOR2X1 U905 ( .A(n867), .B(n901), .Y(n960) );
  NAND2X1 U906 ( .A(n470), .B(n964), .Y(n901) );
  NAND2X1 U907 ( .A(n37), .B(n965), .Y(n950) );
  OAI22X1 U908 ( .A(haddr[0]), .B(n959), .C(n834), .D(n869), .Y(n965) );
  OR2X1 U909 ( .A(n945), .B(n903), .Y(n834) );
  NAND2X1 U910 ( .A(n966), .B(n320), .Y(n903) );
  INVX1 U911 ( .A(n793), .Y(hresp) );
  NAND2X1 U912 ( .A(n967), .B(hsel), .Y(n793) );
  MUX2X1 U913 ( .B(n968), .A(n969), .S(haddr[3]), .Y(n967) );
  NAND3X1 U914 ( .A(haddr[1]), .B(haddr[0]), .C(haddr[2]), .Y(n969) );
  NAND2X1 U915 ( .A(hwrite), .B(n970), .Y(n968) );
  INVX1 U916 ( .A(haddr[2]), .Y(n970) );
  NOR2X1 U917 ( .A(modwait), .B(n971), .Y(n858) );
  AOI21X1 U918 ( .A(n972), .B(n973), .C(data_ready), .Y(n971) );
  INVX1 U919 ( .A(n974), .Y(n972) );
  OAI21X1 U920 ( .A(n975), .B(n976), .C(n977), .Y(n698) );
  AOI22X1 U921 ( .A(n799), .B(n978), .C(n12), .D(n979), .Y(n977) );
  INVX1 U922 ( .A(\Register_Map[11][7] ), .Y(n976) );
  OAI21X1 U923 ( .A(n975), .B(n980), .C(n981), .Y(n696) );
  AOI22X1 U924 ( .A(n805), .B(n978), .C(n8), .D(n979), .Y(n981) );
  INVX1 U925 ( .A(\Register_Map[11][6] ), .Y(n980) );
  OAI21X1 U926 ( .A(n975), .B(n982), .C(n983), .Y(n694) );
  AOI22X1 U927 ( .A(n809), .B(n978), .C(n6), .D(n979), .Y(n983) );
  INVX1 U928 ( .A(\Register_Map[11][5] ), .Y(n982) );
  OAI21X1 U929 ( .A(n975), .B(n984), .C(n985), .Y(n692) );
  AOI22X1 U930 ( .A(n813), .B(n978), .C(n4), .D(n979), .Y(n985) );
  INVX1 U931 ( .A(\Register_Map[11][4] ), .Y(n984) );
  OAI21X1 U932 ( .A(n975), .B(n986), .C(n987), .Y(n690) );
  AOI22X1 U933 ( .A(n817), .B(n978), .C(n2), .D(n979), .Y(n987) );
  INVX1 U934 ( .A(\Register_Map[11][3] ), .Y(n986) );
  OAI21X1 U935 ( .A(n975), .B(n988), .C(n989), .Y(n688) );
  AOI22X1 U936 ( .A(n821), .B(n978), .C(n1), .D(n979), .Y(n989) );
  INVX1 U937 ( .A(\Register_Map[11][2] ), .Y(n988) );
  OAI21X1 U938 ( .A(n975), .B(n990), .C(n991), .Y(n686) );
  AOI22X1 U939 ( .A(n825), .B(n978), .C(n23), .D(n979), .Y(n991) );
  INVX1 U940 ( .A(\Register_Map[11][1] ), .Y(n990) );
  OAI21X1 U941 ( .A(n975), .B(n992), .C(n993), .Y(n684) );
  AOI22X1 U942 ( .A(n829), .B(n978), .C(n18), .D(n979), .Y(n993) );
  OAI22X1 U943 ( .A(n832), .B(n994), .C(n833), .D(n995), .Y(n979) );
  OAI22X1 U944 ( .A(n835), .B(n994), .C(n836), .D(n996), .Y(n978) );
  INVX1 U945 ( .A(\Register_Map[11][0] ), .Y(n992) );
  OAI22X1 U946 ( .A(n997), .B(n998), .C(n999), .D(n1000), .Y(n975) );
  OAI21X1 U947 ( .A(n1001), .B(n1002), .C(n1003), .Y(n682) );
  AOI22X1 U948 ( .A(n799), .B(n1004), .C(n12), .D(n1005), .Y(n1003) );
  INVX1 U949 ( .A(\Register_Map[7][7] ), .Y(n1002) );
  OAI21X1 U950 ( .A(n1001), .B(n1006), .C(n1007), .Y(n680) );
  AOI22X1 U951 ( .A(n805), .B(n1004), .C(n8), .D(n1005), .Y(n1007) );
  INVX1 U952 ( .A(\Register_Map[7][6] ), .Y(n1006) );
  OAI21X1 U953 ( .A(n1001), .B(n1008), .C(n1009), .Y(n678) );
  AOI22X1 U954 ( .A(n809), .B(n1004), .C(n6), .D(n1005), .Y(n1009) );
  INVX1 U955 ( .A(\Register_Map[7][5] ), .Y(n1008) );
  OAI21X1 U956 ( .A(n1001), .B(n1010), .C(n1011), .Y(n676) );
  AOI22X1 U957 ( .A(n813), .B(n1004), .C(n4), .D(n1005), .Y(n1011) );
  INVX1 U958 ( .A(\Register_Map[7][4] ), .Y(n1010) );
  OAI21X1 U959 ( .A(n1001), .B(n1012), .C(n1013), .Y(n674) );
  AOI22X1 U960 ( .A(n817), .B(n1004), .C(n2), .D(n1005), .Y(n1013) );
  INVX1 U961 ( .A(\Register_Map[7][3] ), .Y(n1012) );
  OAI21X1 U962 ( .A(n1001), .B(n1014), .C(n1015), .Y(n672) );
  AOI22X1 U963 ( .A(n821), .B(n1004), .C(n1), .D(n1005), .Y(n1015) );
  INVX1 U964 ( .A(\Register_Map[7][2] ), .Y(n1014) );
  OAI21X1 U965 ( .A(n1001), .B(n1016), .C(n1017), .Y(n670) );
  AOI22X1 U966 ( .A(n825), .B(n1004), .C(n23), .D(n1005), .Y(n1017) );
  INVX1 U967 ( .A(\Register_Map[7][1] ), .Y(n1016) );
  OAI21X1 U968 ( .A(n1001), .B(n1018), .C(n1019), .Y(n668) );
  AOI22X1 U969 ( .A(n829), .B(n1004), .C(n18), .D(n1005), .Y(n1019) );
  OAI22X1 U970 ( .A(n1020), .B(n832), .C(n833), .D(n1021), .Y(n1005) );
  NAND2X1 U971 ( .A(n841), .B(n868), .Y(n832) );
  OAI22X1 U972 ( .A(n1020), .B(n835), .C(n836), .D(n1022), .Y(n1004) );
  NAND2X1 U973 ( .A(n841), .B(haddr[0]), .Y(n835) );
  INVX1 U974 ( .A(\Register_Map[7][0] ), .Y(n1018) );
  OAI22X1 U975 ( .A(n997), .B(n974), .C(n999), .D(n1023), .Y(n1001) );
  INVX1 U976 ( .A(n845), .Y(n999) );
  AOI22X1 U977 ( .A(n833), .B(n904), .C(n836), .D(n902), .Y(n845) );
  OAI21X1 U978 ( .A(n1024), .B(n1025), .C(n1026), .Y(n642) );
  AOI22X1 U979 ( .A(n799), .B(n1027), .C(n12), .D(n1028), .Y(n1026) );
  INVX1 U980 ( .A(\Register_Map[12][7] ), .Y(n1025) );
  OAI21X1 U981 ( .A(n1024), .B(n1029), .C(n1030), .Y(n640) );
  AOI22X1 U982 ( .A(n805), .B(n1027), .C(n8), .D(n1028), .Y(n1030) );
  INVX1 U983 ( .A(\Register_Map[12][6] ), .Y(n1029) );
  OAI21X1 U984 ( .A(n1024), .B(n1031), .C(n1032), .Y(n638) );
  AOI22X1 U985 ( .A(n809), .B(n1027), .C(n6), .D(n1028), .Y(n1032) );
  INVX1 U986 ( .A(\Register_Map[12][5] ), .Y(n1031) );
  OAI21X1 U987 ( .A(n1024), .B(n1033), .C(n1034), .Y(n636) );
  AOI22X1 U988 ( .A(n813), .B(n1027), .C(n4), .D(n1028), .Y(n1034) );
  INVX1 U989 ( .A(\Register_Map[12][4] ), .Y(n1033) );
  OAI21X1 U990 ( .A(n1024), .B(n1035), .C(n1036), .Y(n634) );
  AOI22X1 U991 ( .A(n817), .B(n1027), .C(n2), .D(n1028), .Y(n1036) );
  INVX1 U992 ( .A(\Register_Map[12][3] ), .Y(n1035) );
  OAI21X1 U993 ( .A(n1024), .B(n1037), .C(n1038), .Y(n632) );
  AOI22X1 U994 ( .A(n821), .B(n1027), .C(n1), .D(n1028), .Y(n1038) );
  INVX1 U995 ( .A(\Register_Map[12][2] ), .Y(n1037) );
  OAI21X1 U996 ( .A(n1024), .B(n1039), .C(n1040), .Y(n630) );
  AOI22X1 U997 ( .A(n825), .B(n1027), .C(n23), .D(n1028), .Y(n1040) );
  INVX1 U998 ( .A(\Register_Map[12][1] ), .Y(n1039) );
  OAI21X1 U999 ( .A(n1024), .B(n1041), .C(n1042), .Y(n628) );
  AOI22X1 U1000 ( .A(n829), .B(n1027), .C(n18), .D(n1028), .Y(n1042) );
  OAI22X1 U1001 ( .A(haddr[0]), .B(n1043), .C(n869), .D(n916), .Y(n1028) );
  OAI22X1 U1002 ( .A(n868), .B(n1043), .C(n867), .D(n914), .Y(n1027) );
  INVX1 U1003 ( .A(\Register_Map[12][0] ), .Y(n1041) );
  AND2X1 U1004 ( .A(n37), .B(n1044), .Y(n1024) );
  OAI21X1 U1005 ( .A(n1045), .B(n1046), .C(n1043), .Y(n1044) );
  NAND2X1 U1006 ( .A(n1047), .B(n1048), .Y(n1043) );
  NAND2X1 U1007 ( .A(n946), .B(size_buffer), .Y(n1046) );
  OAI21X1 U1008 ( .A(n1049), .B(n1050), .C(n1051), .Y(n626) );
  AOI22X1 U1009 ( .A(n18), .B(n1052), .C(n829), .D(n1053), .Y(n1051) );
  INVX1 U1010 ( .A(\Register_Map[10][0] ), .Y(n1050) );
  OAI21X1 U1011 ( .A(n1049), .B(n1054), .C(n1055), .Y(n624) );
  AOI22X1 U1012 ( .A(n23), .B(n1052), .C(n825), .D(n1053), .Y(n1055) );
  INVX1 U1013 ( .A(\Register_Map[10][1] ), .Y(n1054) );
  OAI21X1 U1014 ( .A(n1049), .B(n1056), .C(n1057), .Y(n622) );
  AOI22X1 U1015 ( .A(n1), .B(n1052), .C(n821), .D(n1053), .Y(n1057) );
  INVX1 U1016 ( .A(\Register_Map[10][2] ), .Y(n1056) );
  OAI21X1 U1017 ( .A(n1049), .B(n1058), .C(n1059), .Y(n620) );
  AOI22X1 U1018 ( .A(n2), .B(n1052), .C(n817), .D(n1053), .Y(n1059) );
  INVX1 U1019 ( .A(\Register_Map[10][3] ), .Y(n1058) );
  OAI21X1 U1020 ( .A(n1049), .B(n1060), .C(n1061), .Y(n618) );
  AOI22X1 U1021 ( .A(n4), .B(n1052), .C(n813), .D(n1053), .Y(n1061) );
  INVX1 U1022 ( .A(\Register_Map[10][4] ), .Y(n1060) );
  OAI21X1 U1023 ( .A(n1049), .B(n1062), .C(n1063), .Y(n616) );
  AOI22X1 U1024 ( .A(n6), .B(n1052), .C(n809), .D(n1053), .Y(n1063) );
  INVX1 U1025 ( .A(\Register_Map[10][5] ), .Y(n1062) );
  OAI21X1 U1026 ( .A(n1049), .B(n1064), .C(n1065), .Y(n614) );
  AOI22X1 U1027 ( .A(n8), .B(n1052), .C(n805), .D(n1053), .Y(n1065) );
  INVX1 U1028 ( .A(\Register_Map[10][6] ), .Y(n1064) );
  OAI21X1 U1029 ( .A(n1049), .B(n1066), .C(n1067), .Y(n612) );
  AOI22X1 U1030 ( .A(n12), .B(n1052), .C(n799), .D(n1053), .Y(n1067) );
  OAI22X1 U1031 ( .A(n875), .B(n1068), .C(n869), .D(n996), .Y(n1053) );
  OAI22X1 U1032 ( .A(n875), .B(n1069), .C(n867), .D(n995), .Y(n1052) );
  INVX1 U1033 ( .A(\Register_Map[10][7] ), .Y(n1066) );
  OAI22X1 U1034 ( .A(n875), .B(n998), .C(n874), .D(n1000), .Y(n1049) );
  OAI21X1 U1035 ( .A(n1070), .B(n1071), .C(n1072), .Y(n610) );
  AOI22X1 U1036 ( .A(n799), .B(n1073), .C(n12), .D(n1074), .Y(n1072) );
  INVX1 U1037 ( .A(\Register_Map[8][7] ), .Y(n1071) );
  OAI21X1 U1038 ( .A(n1070), .B(n1075), .C(n1076), .Y(n608) );
  AOI22X1 U1039 ( .A(n805), .B(n1073), .C(n8), .D(n1074), .Y(n1076) );
  INVX1 U1040 ( .A(\Register_Map[8][6] ), .Y(n1075) );
  OAI21X1 U1041 ( .A(n1070), .B(n1077), .C(n1078), .Y(n606) );
  AOI22X1 U1042 ( .A(n809), .B(n1073), .C(n6), .D(n1074), .Y(n1078) );
  INVX1 U1043 ( .A(\Register_Map[8][5] ), .Y(n1077) );
  OAI21X1 U1044 ( .A(n1070), .B(n1079), .C(n1080), .Y(n604) );
  AOI22X1 U1045 ( .A(n813), .B(n1073), .C(n4), .D(n1074), .Y(n1080) );
  INVX1 U1046 ( .A(\Register_Map[8][4] ), .Y(n1079) );
  OAI21X1 U1047 ( .A(n1070), .B(n1081), .C(n1082), .Y(n602) );
  AOI22X1 U1048 ( .A(n817), .B(n1073), .C(n2), .D(n1074), .Y(n1082) );
  INVX1 U1049 ( .A(\Register_Map[8][3] ), .Y(n1081) );
  OAI21X1 U1050 ( .A(n1070), .B(n1083), .C(n1084), .Y(n600) );
  AOI22X1 U1051 ( .A(n821), .B(n1073), .C(n1), .D(n1074), .Y(n1084) );
  INVX1 U1052 ( .A(\Register_Map[8][2] ), .Y(n1083) );
  OAI21X1 U1053 ( .A(n1070), .B(n1085), .C(n1086), .Y(n598) );
  AOI22X1 U1054 ( .A(n825), .B(n1073), .C(n23), .D(n1074), .Y(n1086) );
  INVX1 U1055 ( .A(\Register_Map[8][1] ), .Y(n1085) );
  OAI21X1 U1056 ( .A(n1070), .B(n1087), .C(n1088), .Y(n596) );
  AOI22X1 U1057 ( .A(n829), .B(n1073), .C(n18), .D(n1074), .Y(n1088) );
  OAI22X1 U1058 ( .A(n1089), .B(n1069), .C(n869), .D(n995), .Y(n1074) );
  OAI22X1 U1059 ( .A(n1089), .B(n1068), .C(n867), .D(n996), .Y(n1073) );
  INVX1 U1060 ( .A(\Register_Map[8][0] ), .Y(n1087) );
  OAI22X1 U1061 ( .A(n1089), .B(n998), .C(n1000), .D(n1045), .Y(n1070) );
  OAI21X1 U1062 ( .A(n1090), .B(n1091), .C(n1092), .Y(n594) );
  AOI22X1 U1063 ( .A(n18), .B(n1093), .C(n829), .D(n1094), .Y(n1092) );
  INVX1 U1064 ( .A(\Register_Map[6][0] ), .Y(n1091) );
  OAI21X1 U1065 ( .A(n1090), .B(n1095), .C(n1096), .Y(n592) );
  AOI22X1 U1066 ( .A(n23), .B(n1093), .C(n825), .D(n1094), .Y(n1096) );
  INVX1 U1067 ( .A(\Register_Map[6][1] ), .Y(n1095) );
  OAI21X1 U1068 ( .A(n1090), .B(n1097), .C(n1098), .Y(n590) );
  AOI22X1 U1069 ( .A(n1), .B(n1093), .C(n821), .D(n1094), .Y(n1098) );
  INVX1 U1070 ( .A(\Register_Map[6][2] ), .Y(n1097) );
  OAI21X1 U1071 ( .A(n1090), .B(n1099), .C(n1100), .Y(n588) );
  AOI22X1 U1072 ( .A(n2), .B(n1093), .C(n817), .D(n1094), .Y(n1100) );
  INVX1 U1073 ( .A(\Register_Map[6][3] ), .Y(n1099) );
  OAI21X1 U1074 ( .A(n1090), .B(n1101), .C(n1102), .Y(n586) );
  AOI22X1 U1075 ( .A(n4), .B(n1093), .C(n813), .D(n1094), .Y(n1102) );
  INVX1 U1076 ( .A(\Register_Map[6][4] ), .Y(n1101) );
  OAI21X1 U1077 ( .A(n1090), .B(n1103), .C(n1104), .Y(n584) );
  AOI22X1 U1078 ( .A(n6), .B(n1093), .C(n809), .D(n1094), .Y(n1104) );
  INVX1 U1079 ( .A(\Register_Map[6][5] ), .Y(n1103) );
  OAI21X1 U1080 ( .A(n1090), .B(n1105), .C(n1106), .Y(n582) );
  AOI22X1 U1081 ( .A(n8), .B(n1093), .C(n805), .D(n1094), .Y(n1106) );
  INVX1 U1082 ( .A(\Register_Map[6][6] ), .Y(n1105) );
  OAI21X1 U1083 ( .A(n1090), .B(n1107), .C(n1108), .Y(n580) );
  AOI22X1 U1084 ( .A(n12), .B(n1093), .C(n799), .D(n1094), .Y(n1108) );
  OAI22X1 U1085 ( .A(n875), .B(n1109), .C(n869), .D(n1022), .Y(n1094) );
  OAI22X1 U1086 ( .A(n875), .B(n1110), .C(n867), .D(n1021), .Y(n1093) );
  INVX1 U1087 ( .A(\Register_Map[6][7] ), .Y(n1107) );
  OAI22X1 U1088 ( .A(n875), .B(n974), .C(n874), .D(n1023), .Y(n1090) );
  OAI22X1 U1089 ( .A(n947), .B(n945), .C(n944), .D(n906), .Y(n874) );
  OAI21X1 U1090 ( .A(n1111), .B(n1112), .C(n1113), .Y(n578) );
  AOI22X1 U1091 ( .A(n799), .B(n1114), .C(n12), .D(n1115), .Y(n1113) );
  INVX1 U1092 ( .A(sample_data[7]), .Y(n1112) );
  OAI21X1 U1093 ( .A(n1111), .B(n1116), .C(n1117), .Y(n576) );
  AOI22X1 U1094 ( .A(n805), .B(n1114), .C(n8), .D(n1115), .Y(n1117) );
  INVX1 U1095 ( .A(sample_data[6]), .Y(n1116) );
  OAI21X1 U1096 ( .A(n1111), .B(n1118), .C(n1119), .Y(n574) );
  AOI22X1 U1097 ( .A(n809), .B(n1114), .C(n6), .D(n1115), .Y(n1119) );
  INVX1 U1098 ( .A(sample_data[5]), .Y(n1118) );
  OAI21X1 U1099 ( .A(n1111), .B(n1120), .C(n1121), .Y(n572) );
  AOI22X1 U1100 ( .A(n813), .B(n1114), .C(n4), .D(n1115), .Y(n1121) );
  INVX1 U1101 ( .A(sample_data[4]), .Y(n1120) );
  OAI21X1 U1102 ( .A(n1111), .B(n1122), .C(n1123), .Y(n570) );
  AOI22X1 U1103 ( .A(n817), .B(n1114), .C(n2), .D(n1115), .Y(n1123) );
  INVX1 U1104 ( .A(sample_data[3]), .Y(n1122) );
  OAI21X1 U1105 ( .A(n1111), .B(n1124), .C(n1125), .Y(n568) );
  AOI22X1 U1106 ( .A(n821), .B(n1114), .C(n1), .D(n1115), .Y(n1125) );
  INVX1 U1107 ( .A(sample_data[2]), .Y(n1124) );
  OAI21X1 U1108 ( .A(n1111), .B(n1126), .C(n1127), .Y(n566) );
  AOI22X1 U1109 ( .A(n825), .B(n1114), .C(n23), .D(n1115), .Y(n1127) );
  INVX1 U1110 ( .A(sample_data[1]), .Y(n1126) );
  OAI21X1 U1111 ( .A(n1111), .B(n1128), .C(n1129), .Y(n564) );
  AOI22X1 U1112 ( .A(n829), .B(n1114), .C(n18), .D(n1115), .Y(n1129) );
  OAI22X1 U1113 ( .A(n1089), .B(n1110), .C(n869), .D(n1021), .Y(n1115) );
  OAI22X1 U1114 ( .A(n1089), .B(n1109), .C(n867), .D(n1022), .Y(n1114) );
  INVX1 U1115 ( .A(sample_data[0]), .Y(n1128) );
  OAI22X1 U1116 ( .A(n1089), .B(n974), .C(n1023), .D(n1045), .Y(n1111) );
  OAI22X1 U1117 ( .A(n947), .B(n906), .C(n944), .D(n945), .Y(n1045) );
  INVX1 U1118 ( .A(n869), .Y(n944) );
  NAND2X1 U1119 ( .A(N53), .B(N171), .Y(n869) );
  INVX1 U1120 ( .A(n867), .Y(n947) );
  NAND2X1 U1121 ( .A(n1239), .B(N53), .Y(n867) );
  OAI21X1 U1122 ( .A(n1130), .B(n1131), .C(n1132), .Y(n554) );
  AOI22X1 U1123 ( .A(n799), .B(n1133), .C(n12), .D(n1134), .Y(n1132) );
  INVX1 U1124 ( .A(\Register_Map[13][7] ), .Y(n1131) );
  OAI21X1 U1125 ( .A(n1130), .B(n1135), .C(n1136), .Y(n552) );
  AOI22X1 U1126 ( .A(n805), .B(n1133), .C(n8), .D(n1134), .Y(n1136) );
  INVX1 U1127 ( .A(\Register_Map[13][6] ), .Y(n1135) );
  OAI21X1 U1128 ( .A(n1130), .B(n1137), .C(n1138), .Y(n550) );
  AOI22X1 U1129 ( .A(n809), .B(n1133), .C(n6), .D(n1134), .Y(n1138) );
  INVX1 U1130 ( .A(\Register_Map[13][5] ), .Y(n1137) );
  OAI21X1 U1131 ( .A(n1130), .B(n1139), .C(n1140), .Y(n548) );
  AOI22X1 U1132 ( .A(n813), .B(n1133), .C(n4), .D(n1134), .Y(n1140) );
  INVX1 U1133 ( .A(\Register_Map[13][4] ), .Y(n1139) );
  OAI21X1 U1134 ( .A(n1130), .B(n1141), .C(n1142), .Y(n546) );
  AOI22X1 U1135 ( .A(n817), .B(n1133), .C(n2), .D(n1134), .Y(n1142) );
  INVX1 U1136 ( .A(\Register_Map[13][3] ), .Y(n1141) );
  OAI21X1 U1137 ( .A(n1130), .B(n1143), .C(n1144), .Y(n544) );
  AOI22X1 U1138 ( .A(n821), .B(n1133), .C(n1), .D(n1134), .Y(n1144) );
  INVX1 U1139 ( .A(\Register_Map[13][2] ), .Y(n1143) );
  OAI21X1 U1140 ( .A(n1130), .B(n1145), .C(n1146), .Y(n542) );
  AOI22X1 U1141 ( .A(n825), .B(n1133), .C(n23), .D(n1134), .Y(n1146) );
  INVX1 U1142 ( .A(\Register_Map[13][1] ), .Y(n1145) );
  OAI21X1 U1143 ( .A(n1130), .B(n1147), .C(n1148), .Y(n540) );
  AOI22X1 U1144 ( .A(n829), .B(n1133), .C(n18), .D(n1134), .Y(n1148) );
  OAI22X1 U1145 ( .A(haddr[0]), .B(n1149), .C(n836), .D(n916), .Y(n1134) );
  OR2X1 U1146 ( .A(n941), .B(n945), .Y(n916) );
  NAND2X1 U1147 ( .A(n1238), .B(N169), .Y(n941) );
  OAI22X1 U1148 ( .A(n868), .B(n1149), .C(n833), .D(n914), .Y(n1133) );
  NAND2X1 U1149 ( .A(n946), .B(n902), .Y(n914) );
  INVX1 U1150 ( .A(n1150), .Y(n946) );
  INVX1 U1151 ( .A(\Register_Map[13][0] ), .Y(n1147) );
  AND2X1 U1152 ( .A(n37), .B(n1151), .Y(n1130) );
  OAI21X1 U1153 ( .A(n1150), .B(n1152), .C(n1149), .Y(n1151) );
  NAND2X1 U1154 ( .A(n1047), .B(n908), .Y(n1149) );
  INVX1 U1155 ( .A(n1153), .Y(n908) );
  NAND2X1 U1156 ( .A(n1154), .B(size_buffer), .Y(n1152) );
  NAND2X1 U1157 ( .A(N172), .B(N173), .Y(n1150) );
  OAI21X1 U1158 ( .A(n1155), .B(n1156), .C(n1157), .Y(n538) );
  AOI22X1 U1159 ( .A(n799), .B(n1158), .C(n12), .D(n1159), .Y(n1157) );
  INVX1 U1160 ( .A(\Register_Map[9][7] ), .Y(n1156) );
  OAI21X1 U1161 ( .A(n1155), .B(n1160), .C(n1161), .Y(n536) );
  AOI22X1 U1162 ( .A(n805), .B(n1158), .C(n8), .D(n1159), .Y(n1161) );
  INVX1 U1163 ( .A(\Register_Map[9][6] ), .Y(n1160) );
  OAI21X1 U1164 ( .A(n1155), .B(n1162), .C(n1163), .Y(n534) );
  AOI22X1 U1165 ( .A(n809), .B(n1158), .C(n6), .D(n1159), .Y(n1163) );
  INVX1 U1166 ( .A(\Register_Map[9][5] ), .Y(n1162) );
  OAI21X1 U1167 ( .A(n1155), .B(n1164), .C(n1165), .Y(n532) );
  AOI22X1 U1168 ( .A(n813), .B(n1158), .C(n4), .D(n1159), .Y(n1165) );
  INVX1 U1169 ( .A(\Register_Map[9][4] ), .Y(n1164) );
  OAI21X1 U1170 ( .A(n1155), .B(n1166), .C(n1167), .Y(n530) );
  AOI22X1 U1171 ( .A(n817), .B(n1158), .C(n2), .D(n1159), .Y(n1167) );
  INVX1 U1172 ( .A(\Register_Map[9][3] ), .Y(n1166) );
  OAI21X1 U1173 ( .A(n1155), .B(n1168), .C(n1169), .Y(n528) );
  AOI22X1 U1174 ( .A(n821), .B(n1158), .C(n1), .D(n1159), .Y(n1169) );
  INVX1 U1175 ( .A(\Register_Map[9][2] ), .Y(n1168) );
  OAI21X1 U1176 ( .A(n1155), .B(n1170), .C(n1171), .Y(n526) );
  AOI22X1 U1177 ( .A(n825), .B(n1158), .C(n23), .D(n1159), .Y(n1171) );
  INVX1 U1178 ( .A(\Register_Map[9][1] ), .Y(n1170) );
  OAI21X1 U1179 ( .A(n1155), .B(n1172), .C(n1173), .Y(n524) );
  AOI22X1 U1180 ( .A(n829), .B(n1158), .C(n18), .D(n1159), .Y(n1173) );
  OAI22X1 U1181 ( .A(n1153), .B(n1069), .C(n836), .D(n995), .Y(n1159) );
  OR2X1 U1182 ( .A(n1174), .B(n945), .Y(n995) );
  NAND2X1 U1183 ( .A(n1175), .B(n868), .Y(n1069) );
  OAI22X1 U1184 ( .A(n1153), .B(n1068), .C(n833), .D(n996), .Y(n1158) );
  NAND3X1 U1185 ( .A(n470), .B(N173), .C(n902), .Y(n996) );
  NAND2X1 U1186 ( .A(n1175), .B(haddr[0]), .Y(n1068) );
  INVX1 U1187 ( .A(\Register_Map[9][0] ), .Y(n1172) );
  OAI22X1 U1188 ( .A(n1153), .B(n998), .C(n898), .D(n1000), .Y(n1155) );
  NAND3X1 U1189 ( .A(size_buffer), .B(n842), .C(n1176), .Y(n1000) );
  AOI22X1 U1190 ( .A(n902), .B(n1177), .C(n904), .D(n1174), .Y(n1176) );
  NAND2X1 U1191 ( .A(n966), .B(N169), .Y(n1174) );
  INVX1 U1192 ( .A(n1238), .Y(n966) );
  NAND2X1 U1193 ( .A(n470), .B(N173), .Y(n1177) );
  NAND2X1 U1194 ( .A(n1175), .B(n37), .Y(n998) );
  INVX1 U1195 ( .A(n994), .Y(n1175) );
  OAI21X1 U1196 ( .A(n1178), .B(n1179), .C(n1180), .Y(n522) );
  AOI22X1 U1197 ( .A(n12), .B(n1181), .C(n799), .D(n1182), .Y(n1180) );
  INVX1 U1198 ( .A(n918), .Y(n799) );
  NAND2X1 U1199 ( .A(hwdata[15]), .B(n842), .Y(n918) );
  NOR2X1 U1200 ( .A(n876), .B(n870), .Y(n801) );
  INVX1 U1201 ( .A(hwdata[7]), .Y(n876) );
  INVX1 U1202 ( .A(sample_data[15]), .Y(n1179) );
  OAI21X1 U1203 ( .A(n1178), .B(n1183), .C(n1184), .Y(n520) );
  AOI22X1 U1204 ( .A(n8), .B(n1181), .C(n805), .D(n1182), .Y(n1184) );
  INVX1 U1205 ( .A(n922), .Y(n805) );
  NAND2X1 U1206 ( .A(hwdata[14]), .B(n842), .Y(n922) );
  NOR2X1 U1207 ( .A(n880), .B(n870), .Y(n806) );
  INVX1 U1208 ( .A(hwdata[6]), .Y(n880) );
  INVX1 U1209 ( .A(sample_data[14]), .Y(n1183) );
  OAI21X1 U1210 ( .A(n1178), .B(n1185), .C(n1186), .Y(n518) );
  AOI22X1 U1211 ( .A(n6), .B(n1181), .C(n809), .D(n1182), .Y(n1186) );
  INVX1 U1212 ( .A(n924), .Y(n809) );
  NAND2X1 U1213 ( .A(hwdata[13]), .B(n842), .Y(n924) );
  NOR2X1 U1214 ( .A(n882), .B(n870), .Y(n810) );
  INVX1 U1215 ( .A(hwdata[5]), .Y(n882) );
  INVX1 U1216 ( .A(sample_data[13]), .Y(n1185) );
  OAI21X1 U1217 ( .A(n1178), .B(n1187), .C(n1188), .Y(n516) );
  AOI22X1 U1218 ( .A(n4), .B(n1181), .C(n813), .D(n1182), .Y(n1188) );
  INVX1 U1219 ( .A(n926), .Y(n813) );
  NAND2X1 U1220 ( .A(hwdata[12]), .B(n842), .Y(n926) );
  NOR2X1 U1221 ( .A(n884), .B(n870), .Y(n814) );
  INVX1 U1222 ( .A(hwdata[4]), .Y(n884) );
  INVX1 U1223 ( .A(sample_data[12]), .Y(n1187) );
  OAI21X1 U1224 ( .A(n1178), .B(n1189), .C(n1190), .Y(n514) );
  AOI22X1 U1225 ( .A(n2), .B(n1181), .C(n817), .D(n1182), .Y(n1190) );
  INVX1 U1226 ( .A(n928), .Y(n817) );
  NAND2X1 U1227 ( .A(hwdata[11]), .B(n842), .Y(n928) );
  NOR2X1 U1228 ( .A(n886), .B(n870), .Y(n818) );
  INVX1 U1229 ( .A(hwdata[3]), .Y(n886) );
  INVX1 U1230 ( .A(sample_data[11]), .Y(n1189) );
  OAI21X1 U1231 ( .A(n1178), .B(n1191), .C(n1192), .Y(n512) );
  AOI22X1 U1232 ( .A(n1), .B(n1181), .C(n821), .D(n1182), .Y(n1192) );
  INVX1 U1233 ( .A(n930), .Y(n821) );
  NAND2X1 U1234 ( .A(hwdata[10]), .B(n842), .Y(n930) );
  NOR2X1 U1235 ( .A(n888), .B(n870), .Y(n822) );
  INVX1 U1236 ( .A(hwdata[2]), .Y(n888) );
  INVX1 U1237 ( .A(sample_data[10]), .Y(n1191) );
  OAI21X1 U1238 ( .A(n1178), .B(n1193), .C(n1194), .Y(n510) );
  AOI22X1 U1239 ( .A(n825), .B(n1182), .C(n23), .D(n1181), .Y(n1194) );
  NOR2X1 U1240 ( .A(n890), .B(n870), .Y(n826) );
  INVX1 U1241 ( .A(hwdata[1]), .Y(n890) );
  INVX1 U1242 ( .A(n932), .Y(n825) );
  NAND2X1 U1243 ( .A(hwdata[9]), .B(n842), .Y(n932) );
  INVX1 U1244 ( .A(sample_data[9]), .Y(n1193) );
  OAI21X1 U1245 ( .A(n1178), .B(n1195), .C(n1196), .Y(n508) );
  AOI22X1 U1246 ( .A(n829), .B(n1182), .C(n18), .D(n1181), .Y(n1196) );
  OAI22X1 U1247 ( .A(n1153), .B(n1110), .C(n836), .D(n1021), .Y(n1181) );
  OR2X1 U1248 ( .A(n1197), .B(n945), .Y(n1021) );
  NAND2X1 U1249 ( .A(n1198), .B(n868), .Y(n1110) );
  NOR2X1 U1250 ( .A(n892), .B(n870), .Y(n830) );
  INVX1 U1251 ( .A(n842), .Y(n870) );
  INVX1 U1252 ( .A(hwdata[0]), .Y(n892) );
  OAI22X1 U1253 ( .A(n1153), .B(n1109), .C(n833), .D(n1022), .Y(n1182) );
  NAND3X1 U1254 ( .A(N172), .B(n964), .C(n902), .Y(n1022) );
  NAND2X1 U1255 ( .A(n1198), .B(haddr[0]), .Y(n1109) );
  INVX1 U1256 ( .A(n934), .Y(n829) );
  NAND2X1 U1257 ( .A(hwdata[8]), .B(n842), .Y(n934) );
  INVX1 U1258 ( .A(sample_data[8]), .Y(n1195) );
  OAI22X1 U1259 ( .A(n1153), .B(n974), .C(n898), .D(n1023), .Y(n1178) );
  NAND3X1 U1260 ( .A(size_buffer), .B(n842), .C(n1199), .Y(n1023) );
  AOI21X1 U1261 ( .A(n904), .B(n1197), .C(n1200), .Y(n1199) );
  AOI21X1 U1262 ( .A(N172), .B(n964), .C(n906), .Y(n1200) );
  INVX1 U1263 ( .A(N173), .Y(n964) );
  NAND2X1 U1264 ( .A(n1238), .B(n320), .Y(n1197) );
  XNOR2X1 U1265 ( .A(n1201), .B(n1048), .Y(n1238) );
  INVX1 U1266 ( .A(n1154), .Y(n898) );
  AOI22X1 U1267 ( .A(n833), .B(n902), .C(n836), .D(n904), .Y(n1154) );
  INVX1 U1268 ( .A(n945), .Y(n904) );
  NAND2X1 U1269 ( .A(size_buffer), .B(haddr[0]), .Y(n945) );
  NAND2X1 U1270 ( .A(N171), .B(n1240), .Y(n836) );
  INVX1 U1271 ( .A(n906), .Y(n902) );
  NAND2X1 U1272 ( .A(size_buffer), .B(n868), .Y(n906) );
  INVX1 U1273 ( .A(haddr[0]), .Y(n868) );
  NAND2X1 U1274 ( .A(n1240), .B(n1239), .Y(n833) );
  NAND2X1 U1275 ( .A(n1198), .B(n842), .Y(n974) );
  NOR2X1 U1276 ( .A(n1202), .B(state[1]), .Y(n842) );
  NAND2X1 U1277 ( .A(N53), .B(n973), .Y(n1153) );
  OAI21X1 U1278 ( .A(N257), .B(n1203), .C(n1204), .Y(hrdata[9]) );
  NAND2X1 U1279 ( .A(N233), .B(n1205), .Y(n1204) );
  OAI21X1 U1280 ( .A(N258), .B(n1203), .C(n1206), .Y(hrdata[8]) );
  NAND2X1 U1281 ( .A(N234), .B(n1205), .Y(n1206) );
  OAI21X1 U1282 ( .A(N215), .B(n1207), .C(n1208), .Y(hrdata[7]) );
  AOI22X1 U1283 ( .A(n1209), .B(\Register_Map[14][7] ), .C(n1210), .D(n1211), 
        .Y(n1208) );
  INVX1 U1284 ( .A(N251), .Y(n1211) );
  OAI21X1 U1285 ( .A(N216), .B(n1207), .C(n1212), .Y(hrdata[6]) );
  AOI22X1 U1286 ( .A(n1209), .B(\Register_Map[14][6] ), .C(n1210), .D(n1213), 
        .Y(n1212) );
  INVX1 U1287 ( .A(N252), .Y(n1213) );
  OAI21X1 U1288 ( .A(N217), .B(n1207), .C(n1214), .Y(hrdata[5]) );
  AOI22X1 U1289 ( .A(n1209), .B(\Register_Map[14][5] ), .C(n1210), .D(n1215), 
        .Y(n1214) );
  INVX1 U1290 ( .A(N253), .Y(n1215) );
  OAI21X1 U1291 ( .A(N218), .B(n1207), .C(n1216), .Y(hrdata[4]) );
  AOI22X1 U1292 ( .A(n1209), .B(\Register_Map[14][4] ), .C(n1210), .D(n1217), 
        .Y(n1216) );
  INVX1 U1293 ( .A(N254), .Y(n1217) );
  OAI21X1 U1294 ( .A(N219), .B(n1207), .C(n1218), .Y(hrdata[3]) );
  AOI22X1 U1295 ( .A(n1209), .B(\Register_Map[14][3] ), .C(n1210), .D(n1219), 
        .Y(n1218) );
  INVX1 U1296 ( .A(N255), .Y(n1219) );
  OAI21X1 U1297 ( .A(N220), .B(n1207), .C(n1220), .Y(hrdata[2]) );
  AOI22X1 U1298 ( .A(n1209), .B(\Register_Map[14][2] ), .C(n1210), .D(n1221), 
        .Y(n1220) );
  INVX1 U1299 ( .A(N256), .Y(n1221) );
  OAI21X1 U1300 ( .A(N221), .B(n1207), .C(n1222), .Y(hrdata[1]) );
  AOI22X1 U1301 ( .A(n1209), .B(\Register_Map[14][1] ), .C(n1210), .D(n1223), 
        .Y(n1222) );
  INVX1 U1302 ( .A(N257), .Y(n1223) );
  OAI21X1 U1303 ( .A(N251), .B(n1203), .C(n1224), .Y(hrdata[15]) );
  NAND2X1 U1304 ( .A(N227), .B(n1205), .Y(n1224) );
  OAI21X1 U1305 ( .A(N252), .B(n1203), .C(n1225), .Y(hrdata[14]) );
  NAND2X1 U1306 ( .A(N228), .B(n1205), .Y(n1225) );
  OAI21X1 U1307 ( .A(N253), .B(n1203), .C(n1226), .Y(hrdata[13]) );
  NAND2X1 U1308 ( .A(N229), .B(n1205), .Y(n1226) );
  OAI21X1 U1309 ( .A(N254), .B(n1203), .C(n1227), .Y(hrdata[12]) );
  NAND2X1 U1310 ( .A(N230), .B(n1205), .Y(n1227) );
  OAI21X1 U1311 ( .A(N255), .B(n1203), .C(n1228), .Y(hrdata[11]) );
  NAND2X1 U1312 ( .A(N231), .B(n1205), .Y(n1228) );
  OAI21X1 U1313 ( .A(N256), .B(n1203), .C(n1229), .Y(hrdata[10]) );
  NAND2X1 U1314 ( .A(N232), .B(n1205), .Y(n1229) );
  NOR2X1 U1315 ( .A(n1230), .B(n957), .Y(n1205) );
  OAI21X1 U1316 ( .A(N222), .B(n1207), .C(n1231), .Y(hrdata[0]) );
  AOI22X1 U1317 ( .A(n1209), .B(new_coefficient_set), .C(n1210), .D(n1232), 
        .Y(n1231) );
  INVX1 U1318 ( .A(N258), .Y(n1232) );
  INVX1 U1319 ( .A(n1230), .Y(n1210) );
  NAND3X1 U1320 ( .A(n948), .B(n1240), .C(n1233), .Y(n1230) );
  INVX1 U1321 ( .A(n940), .Y(n948) );
  AND2X1 U1322 ( .A(n1233), .B(n940), .Y(n1209) );
  NOR2X1 U1323 ( .A(n913), .B(n875), .Y(n940) );
  NAND2X1 U1324 ( .A(N163), .B(n1240), .Y(n875) );
  OR2X1 U1325 ( .A(n1203), .B(n957), .Y(n1207) );
  INVX1 U1326 ( .A(size_buffer), .Y(n957) );
  NAND2X1 U1327 ( .A(n1233), .B(N53), .Y(n1203) );
  AND2X1 U1328 ( .A(state[1]), .B(n1202), .Y(n1233) );
  INVX1 U1329 ( .A(state[0]), .Y(n1202) );
  OAI21X1 U1330 ( .A(n1237), .B(n937), .C(N181), .Y(N180) );
  NAND2X1 U1331 ( .A(n937), .B(n1237), .Y(N181) );
  INVX1 U1332 ( .A(coefficient_num[1]), .Y(n937) );
  NAND2X1 U1333 ( .A(n1234), .B(n994), .Y(N173) );
  NAND2X1 U1334 ( .A(N165), .B(n1201), .Y(n994) );
  MUX2X1 U1335 ( .B(N165), .A(n1198), .S(n841), .Y(n1234) );
  INVX1 U1336 ( .A(n997), .Y(n841) );
  INVX1 U1337 ( .A(n1020), .Y(n1198) );
  NAND2X1 U1338 ( .A(N164), .B(n1235), .Y(n1020) );
  XNOR2X1 U1339 ( .A(n997), .B(N164), .Y(N172) );
  INVX1 U1340 ( .A(n1239), .Y(N171) );
  NAND2X1 U1341 ( .A(n997), .B(n1089), .Y(n1239) );
  NAND2X1 U1342 ( .A(N163), .B(N53), .Y(n997) );
  OAI21X1 U1343 ( .A(n1048), .B(n1235), .C(n1236), .Y(N169) );
  NOR2X1 U1344 ( .A(n1047), .B(n963), .Y(n1236) );
  INVX1 U1345 ( .A(n959), .Y(n963) );
  NAND2X1 U1346 ( .A(n1048), .B(n843), .Y(n959) );
  INVX1 U1347 ( .A(n831), .Y(n843) );
  NAND2X1 U1348 ( .A(n1235), .B(n1201), .Y(n831) );
  INVX1 U1349 ( .A(N164), .Y(n1201) );
  INVX1 U1350 ( .A(n913), .Y(n1047) );
  NAND2X1 U1351 ( .A(N164), .B(N165), .Y(n913) );
  INVX1 U1352 ( .A(N165), .Y(n1235) );
  INVX1 U1353 ( .A(n1089), .Y(n1048) );
  NAND2X1 U1354 ( .A(n973), .B(n1240), .Y(n1089) );
  INVX1 U1355 ( .A(N163), .Y(n973) );
endmodule


module coefficient_loader ( clk, n_reset, new_coefficient_set, modwait, 
        load_coeff, coefficient_num, clear_new_coefficient );
  output [1:0] coefficient_num;
  input clk, n_reset, new_coefficient_set, modwait;
  output load_coeff, clear_new_coefficient;
  wire   next_load_coeff, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26;
  wire   [3:0] state;
  wire   [3:0] next_state;
  wire   [1:0] next_coefficient_num;
  assign clear_new_coefficient = 1'b0;

  DFFSR \state_reg[0]  ( .D(n25), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \coefficient_num_reg[0]  ( .D(next_coefficient_num[0]), .CLK(clk), .R(
        n_reset), .S(1'b1), .Q(coefficient_num[0]) );
  DFFSR \coefficient_num_reg[1]  ( .D(next_coefficient_num[1]), .CLK(clk), .R(
        n_reset), .S(1'b1), .Q(coefficient_num[1]) );
  DFFSR load_coeff_reg ( .D(next_load_coeff), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(load_coeff) );
  INVX1 U10 ( .A(n8), .Y(next_state[3]) );
  NOR2X1 U11 ( .A(state[3]), .B(n9), .Y(next_state[2]) );
  XOR2X1 U12 ( .A(n10), .B(n11), .Y(n9) );
  NOR2X1 U13 ( .A(state[3]), .B(n12), .Y(next_load_coeff) );
  OAI21X1 U14 ( .A(n11), .B(n13), .C(n14), .Y(next_coefficient_num[1]) );
  AND2X1 U15 ( .A(n8), .B(n15), .Y(n14) );
  NAND3X1 U16 ( .A(n10), .B(n16), .C(state[2]), .Y(n8) );
  INVX1 U17 ( .A(state[2]), .Y(n11) );
  OAI21X1 U18 ( .A(n17), .B(n18), .C(n15), .Y(next_coefficient_num[0]) );
  NAND3X1 U19 ( .A(n19), .B(n20), .C(state[3]), .Y(n15) );
  INVX1 U20 ( .A(n17), .Y(n19) );
  OR2X1 U21 ( .A(n20), .B(state[3]), .Y(n18) );
  NOR2X1 U22 ( .A(state[2]), .B(n10), .Y(n20) );
  AND2X1 U23 ( .A(state[1]), .B(state[0]), .Y(n10) );
  NOR2X1 U24 ( .A(n21), .B(n22), .Y(n25) );
  NAND2X1 U25 ( .A(n12), .B(n16), .Y(n22) );
  INVX1 U26 ( .A(state[0]), .Y(n12) );
  MUX2X1 U27 ( .B(n23), .A(new_coefficient_set), .S(n24), .Y(n21) );
  NOR2X1 U28 ( .A(state[1]), .B(state[2]), .Y(n24) );
  INVX1 U29 ( .A(modwait), .Y(n23) );
  INVX1 U30 ( .A(n13), .Y(n26) );
  NAND2X1 U31 ( .A(n17), .B(n16), .Y(n13) );
  INVX1 U32 ( .A(state[3]), .Y(n16) );
  XOR2X1 U33 ( .A(state[1]), .B(state[0]), .Y(n17) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   lc, n111, next_modwait, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107;
  wire   [4:0] state;
  wire   [4:0] next_state;
  assign src1[3] = 1'b0;
  assign clear = lc;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  INVX1 U9 ( .A(n111), .Y(n7) );
  INVX2 U10 ( .A(n7), .Y(src2[3]) );
  NAND3X1 U11 ( .A(n9), .B(n10), .C(n11), .Y(src2[1]) );
  NOR2X1 U12 ( .A(n12), .B(n13), .Y(n11) );
  NAND3X1 U13 ( .A(n14), .B(n15), .C(n16), .Y(src1[1]) );
  AND2X1 U14 ( .A(n17), .B(n18), .Y(n16) );
  NAND3X1 U15 ( .A(n19), .B(n15), .C(n20), .Y(src1[0]) );
  INVX1 U16 ( .A(n21), .Y(n20) );
  OAI21X1 U17 ( .A(n22), .B(n23), .C(n24), .Y(op[2]) );
  NOR2X1 U18 ( .A(src2[3]), .B(src2[2]), .Y(n24) );
  NAND3X1 U19 ( .A(n25), .B(n9), .C(n26), .Y(n111) );
  AND2X1 U20 ( .A(n27), .B(n28), .Y(n26) );
  NAND3X1 U21 ( .A(n29), .B(n30), .C(n31), .Y(op[0]) );
  NOR2X1 U22 ( .A(n32), .B(n33), .Y(n31) );
  INVX1 U23 ( .A(n34), .Y(n30) );
  INVX1 U24 ( .A(n35), .Y(n29) );
  NAND3X1 U25 ( .A(n36), .B(n28), .C(n37), .Y(next_state[4]) );
  AOI21X1 U26 ( .A(n38), .B(overflow), .C(n39), .Y(n37) );
  NAND2X1 U27 ( .A(n27), .B(n10), .Y(n39) );
  INVX1 U28 ( .A(n25), .Y(n38) );
  INVX1 U29 ( .A(n40), .Y(n28) );
  INVX1 U30 ( .A(n41), .Y(n36) );
  OR2X1 U31 ( .A(n42), .B(n43), .Y(next_state[3]) );
  OAI21X1 U32 ( .A(overflow), .B(n25), .C(n44), .Y(n43) );
  OAI21X1 U33 ( .A(n45), .B(n46), .C(n47), .Y(n42) );
  AOI21X1 U34 ( .A(n48), .B(n49), .C(n50), .Y(n47) );
  INVX1 U35 ( .A(n19), .Y(n50) );
  NOR2X1 U36 ( .A(state[4]), .B(n51), .Y(n48) );
  INVX1 U37 ( .A(n52), .Y(n45) );
  NAND2X1 U38 ( .A(n53), .B(n54), .Y(next_state[2]) );
  NOR2X1 U39 ( .A(n55), .B(n56), .Y(n54) );
  OAI21X1 U40 ( .A(n57), .B(n58), .C(n27), .Y(n56) );
  OAI21X1 U41 ( .A(n59), .B(n60), .C(n61), .Y(n58) );
  NAND2X1 U42 ( .A(n62), .B(n63), .Y(n55) );
  INVX1 U43 ( .A(src1[2]), .Y(n63) );
  NAND3X1 U44 ( .A(n64), .B(n25), .C(n19), .Y(src1[2]) );
  NOR2X1 U45 ( .A(n41), .B(n65), .Y(n53) );
  OAI21X1 U46 ( .A(state[2]), .B(n66), .C(n67), .Y(n65) );
  OAI21X1 U47 ( .A(n68), .B(n40), .C(overflow), .Y(n67) );
  NAND3X1 U48 ( .A(n14), .B(n69), .C(n70), .Y(n40) );
  INVX1 U49 ( .A(n17), .Y(n68) );
  NAND3X1 U50 ( .A(n71), .B(n22), .C(n72), .Y(next_state[1]) );
  NOR2X1 U51 ( .A(n41), .B(n73), .Y(n72) );
  OAI21X1 U52 ( .A(n74), .B(n60), .C(n75), .Y(n73) );
  OAI21X1 U53 ( .A(n13), .B(n21), .C(overflow), .Y(n75) );
  NAND2X1 U54 ( .A(n62), .B(n14), .Y(n21) );
  OAI21X1 U55 ( .A(n9), .B(n76), .C(n77), .Y(n41) );
  NAND2X1 U56 ( .A(n78), .B(n46), .Y(n77) );
  INVX1 U57 ( .A(dr), .Y(n46) );
  OAI21X1 U58 ( .A(lc), .B(n79), .C(n80), .Y(n78) );
  INVX1 U59 ( .A(n32), .Y(n9) );
  NOR2X1 U60 ( .A(n51), .B(n81), .Y(n32) );
  NOR2X1 U61 ( .A(src2[0]), .B(n12), .Y(n71) );
  INVX1 U62 ( .A(n70), .Y(n12) );
  NAND2X1 U63 ( .A(n25), .B(n17), .Y(src2[0]) );
  NAND2X1 U64 ( .A(n82), .B(n44), .Y(next_state[0]) );
  AOI21X1 U65 ( .A(cnt_up), .B(dr), .C(n83), .Y(n44) );
  AOI22X1 U66 ( .A(lc), .B(n84), .C(n85), .D(n76), .Y(n82) );
  INVX1 U67 ( .A(overflow), .Y(n76) );
  OAI21X1 U68 ( .A(dr), .B(n79), .C(n86), .Y(n84) );
  OAI21X1 U69 ( .A(n87), .B(n88), .C(n59), .Y(n86) );
  AOI21X1 U70 ( .A(dr), .B(n60), .C(state[3]), .Y(n87) );
  NAND3X1 U71 ( .A(n89), .B(n90), .C(n91), .Y(next_modwait) );
  NOR2X1 U72 ( .A(n13), .B(n35), .Y(n91) );
  NAND3X1 U73 ( .A(n92), .B(n22), .C(n93), .Y(n35) );
  AND2X1 U74 ( .A(n15), .B(n70), .Y(n93) );
  NAND3X1 U75 ( .A(state[0]), .B(n60), .C(n94), .Y(n70) );
  INVX1 U76 ( .A(n83), .Y(n92) );
  NAND2X1 U77 ( .A(n27), .B(n69), .Y(n13) );
  NAND2X1 U78 ( .A(n95), .B(n96), .Y(n69) );
  NAND3X1 U79 ( .A(state[1]), .B(state[0]), .C(n94), .Y(n27) );
  INVX1 U80 ( .A(op[1]), .Y(n90) );
  NAND3X1 U81 ( .A(n80), .B(n97), .C(n98), .Y(op[1]) );
  OAI21X1 U82 ( .A(lc), .B(dr), .C(n52), .Y(n89) );
  OAI21X1 U83 ( .A(n99), .B(n100), .C(n79), .Y(n52) );
  NAND2X1 U84 ( .A(n59), .B(n60), .Y(n100) );
  INVX1 U85 ( .A(n80), .Y(cnt_up) );
  INVX1 U86 ( .A(n79), .Y(err) );
  NAND3X1 U87 ( .A(n88), .B(n51), .C(n101), .Y(n79) );
  NOR2X1 U88 ( .A(n61), .B(n60), .Y(n101) );
  INVX1 U89 ( .A(n97), .Y(dest[3]) );
  NOR2X1 U90 ( .A(n85), .B(n34), .Y(n97) );
  OAI21X1 U91 ( .A(n99), .B(n66), .C(n102), .Y(n34) );
  NAND3X1 U92 ( .A(n80), .B(n19), .C(n98), .Y(dest[2]) );
  NAND2X1 U93 ( .A(n103), .B(n96), .Y(n19) );
  NAND3X1 U94 ( .A(n64), .B(n15), .C(n104), .Y(dest[1]) );
  NOR2X1 U95 ( .A(n33), .B(n85), .Y(n104) );
  NAND3X1 U96 ( .A(n25), .B(n10), .C(n14), .Y(n85) );
  NAND3X1 U97 ( .A(n51), .B(n60), .C(n94), .Y(n14) );
  INVX1 U98 ( .A(src2[2]), .Y(n10) );
  NAND2X1 U99 ( .A(n17), .B(n62), .Y(src2[2]) );
  OR2X1 U100 ( .A(n81), .B(state[0]), .Y(n62) );
  NAND3X1 U101 ( .A(n88), .B(n60), .C(state[4]), .Y(n81) );
  NAND3X1 U102 ( .A(state[1]), .B(n51), .C(n94), .Y(n17) );
  NOR2X1 U103 ( .A(n99), .B(n61), .Y(n94) );
  NAND3X1 U104 ( .A(n59), .B(n96), .C(state[1]), .Y(n25) );
  INVX1 U105 ( .A(n98), .Y(n33) );
  OAI21X1 U106 ( .A(n95), .B(n103), .C(n88), .Y(n98) );
  NAND2X1 U107 ( .A(n49), .B(n95), .Y(n15) );
  INVX1 U108 ( .A(n66), .Y(n95) );
  NAND3X1 U109 ( .A(state[0]), .B(n61), .C(state[1]), .Y(n66) );
  NAND3X1 U110 ( .A(n80), .B(n102), .C(n105), .Y(dest[0]) );
  AOI21X1 U111 ( .A(n103), .B(n88), .C(n83), .Y(n105) );
  NAND2X1 U112 ( .A(n64), .B(n18), .Y(n83) );
  NAND3X1 U113 ( .A(state[1]), .B(n59), .C(n49), .Y(n18) );
  NAND3X1 U114 ( .A(n96), .B(n60), .C(n59), .Y(n64) );
  NOR2X1 U115 ( .A(n106), .B(n107), .Y(n96) );
  INVX1 U116 ( .A(n57), .Y(n88) );
  NAND2X1 U117 ( .A(state[2]), .B(n106), .Y(n57) );
  INVX1 U118 ( .A(n22), .Y(n103) );
  OR2X1 U119 ( .A(n22), .B(n99), .Y(n102) );
  NAND2X1 U120 ( .A(n107), .B(n106), .Y(n99) );
  INVX1 U121 ( .A(state[3]), .Y(n106) );
  NAND3X1 U122 ( .A(n60), .B(n61), .C(state[0]), .Y(n22) );
  NAND3X1 U123 ( .A(n59), .B(n60), .C(n49), .Y(n80) );
  INVX1 U124 ( .A(n23), .Y(n49) );
  NAND2X1 U125 ( .A(state[3]), .B(n107), .Y(n23) );
  INVX1 U126 ( .A(state[2]), .Y(n107) );
  INVX1 U127 ( .A(state[1]), .Y(n60) );
  INVX1 U128 ( .A(n74), .Y(n59) );
  NAND2X1 U129 ( .A(n61), .B(n51), .Y(n74) );
  INVX1 U130 ( .A(state[0]), .Y(n51) );
  INVX1 U131 ( .A(state[4]), .Y(n61) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N20, N21, N22, N23, N24,
         N25, N26, N27, N28, N29, n1, n2, n3, n4, n5, n6, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80;

  DFFSR \count_reg[0]  ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_reg[1]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_reg[2]  ( .D(n78), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_reg[3]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_reg[4]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_reg[5]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_reg[6]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_reg[7]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_reg[8]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR rollover_flag_reg ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_reg[9]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_50_aco ( .A({N29, N28, N27, N26, 
        N25, N24, N23, N22, N21, N20}), .SUM({N15, N14, N13, N12, N11, N10, N9, 
        N8, N7, N6}) );
  OAI21X1 U4 ( .A(n1), .B(n2), .C(n3), .Y(n70) );
  NAND2X1 U5 ( .A(rollover_flag), .B(n4), .Y(n3) );
  NAND3X1 U16 ( .A(n5), .B(n6), .C(n18), .Y(n2) );
  NOR2X1 U17 ( .A(n19), .B(n20), .Y(n18) );
  XOR2X1 U18 ( .A(rollover_val[8]), .B(N14), .Y(n20) );
  XOR2X1 U19 ( .A(rollover_val[7]), .B(N13), .Y(n19) );
  XOR2X1 U20 ( .A(n21), .B(rollover_val[5]), .Y(n6) );
  NOR2X1 U21 ( .A(n22), .B(n23), .Y(n5) );
  XOR2X1 U22 ( .A(rollover_val[4]), .B(N10), .Y(n23) );
  XOR2X1 U23 ( .A(rollover_val[6]), .B(N12), .Y(n22) );
  OR2X1 U24 ( .A(n24), .B(n25), .Y(n1) );
  NAND3X1 U25 ( .A(n26), .B(n27), .C(n28), .Y(n25) );
  XOR2X1 U26 ( .A(n29), .B(rollover_val[2]), .Y(n28) );
  XOR2X1 U27 ( .A(n30), .B(rollover_val[3]), .Y(n27) );
  XOR2X1 U28 ( .A(n31), .B(rollover_val[1]), .Y(n26) );
  NAND3X1 U29 ( .A(n32), .B(n33), .C(n34), .Y(n24) );
  XOR2X1 U30 ( .A(n35), .B(rollover_val[9]), .Y(n34) );
  XOR2X1 U31 ( .A(n36), .B(rollover_val[0]), .Y(n32) );
  OAI22X1 U32 ( .A(n37), .B(n38), .C(n35), .D(n39), .Y(n71) );
  INVX1 U33 ( .A(N15), .Y(n35) );
  OAI22X1 U34 ( .A(n37), .B(n40), .C(n41), .D(n39), .Y(n72) );
  INVX1 U35 ( .A(N14), .Y(n41) );
  OAI22X1 U36 ( .A(n37), .B(n42), .C(n43), .D(n39), .Y(n73) );
  INVX1 U37 ( .A(N13), .Y(n43) );
  OAI22X1 U38 ( .A(n37), .B(n44), .C(n45), .D(n39), .Y(n74) );
  INVX1 U39 ( .A(N12), .Y(n45) );
  OAI22X1 U40 ( .A(n37), .B(n46), .C(n21), .D(n39), .Y(n75) );
  INVX1 U41 ( .A(N11), .Y(n21) );
  OAI22X1 U42 ( .A(n37), .B(n47), .C(n48), .D(n39), .Y(n76) );
  INVX1 U43 ( .A(N10), .Y(n48) );
  OAI22X1 U44 ( .A(n37), .B(n49), .C(n30), .D(n39), .Y(n77) );
  INVX1 U45 ( .A(N9), .Y(n30) );
  OAI22X1 U46 ( .A(n37), .B(n50), .C(n29), .D(n39), .Y(n78) );
  INVX1 U47 ( .A(N8), .Y(n29) );
  OAI22X1 U48 ( .A(n37), .B(n51), .C(n31), .D(n39), .Y(n79) );
  INVX1 U49 ( .A(N7), .Y(n31) );
  OAI22X1 U50 ( .A(n37), .B(n52), .C(n36), .D(n39), .Y(n80) );
  INVX1 U51 ( .A(n33), .Y(n39) );
  NOR2X1 U52 ( .A(n4), .B(clear), .Y(n33) );
  INVX1 U53 ( .A(N6), .Y(n36) );
  INVX1 U54 ( .A(n4), .Y(n37) );
  NOR2X1 U55 ( .A(count_enable), .B(clear), .Y(n4) );
  NOR2X1 U56 ( .A(n53), .B(n38), .Y(N29) );
  INVX1 U57 ( .A(count_out[9]), .Y(n38) );
  NOR2X1 U58 ( .A(n53), .B(n40), .Y(N28) );
  INVX1 U59 ( .A(count_out[8]), .Y(n40) );
  NOR2X1 U60 ( .A(n53), .B(n42), .Y(N27) );
  INVX1 U61 ( .A(count_out[7]), .Y(n42) );
  NOR2X1 U62 ( .A(n53), .B(n44), .Y(N26) );
  INVX1 U63 ( .A(count_out[6]), .Y(n44) );
  NOR2X1 U64 ( .A(n53), .B(n46), .Y(N25) );
  INVX1 U65 ( .A(count_out[5]), .Y(n46) );
  NOR2X1 U66 ( .A(n53), .B(n47), .Y(N24) );
  INVX1 U67 ( .A(count_out[4]), .Y(n47) );
  NOR2X1 U68 ( .A(n53), .B(n49), .Y(N23) );
  INVX1 U69 ( .A(count_out[3]), .Y(n49) );
  NOR2X1 U70 ( .A(n53), .B(n50), .Y(N22) );
  INVX1 U71 ( .A(count_out[2]), .Y(n50) );
  NOR2X1 U72 ( .A(n53), .B(n51), .Y(N21) );
  INVX1 U73 ( .A(count_out[1]), .Y(n51) );
  NOR2X1 U74 ( .A(n53), .B(n52), .Y(N20) );
  INVX1 U75 ( .A(count_out[0]), .Y(n52) );
  AND2X1 U76 ( .A(n54), .B(n55), .Y(n53) );
  NOR2X1 U77 ( .A(n56), .B(n57), .Y(n55) );
  NAND2X1 U78 ( .A(n58), .B(n59), .Y(n57) );
  XNOR2X1 U79 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n59) );
  XNOR2X1 U80 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n58) );
  NAND3X1 U81 ( .A(n60), .B(n61), .C(n62), .Y(n56) );
  XNOR2X1 U82 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n62) );
  XNOR2X1 U83 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n61) );
  XNOR2X1 U84 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n60) );
  NOR2X1 U85 ( .A(n63), .B(n64), .Y(n54) );
  NAND2X1 U86 ( .A(n65), .B(n66), .Y(n64) );
  XNOR2X1 U87 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n66) );
  XNOR2X1 U88 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n65) );
  NAND3X1 U89 ( .A(n67), .B(n68), .C(n69), .Y(n63) );
  XNOR2X1 U90 ( .A(count_out[6]), .B(rollover_val[6]), .Y(n69) );
  XNOR2X1 U91 ( .A(count_out[7]), .B(rollover_val[7]), .Y(n68) );
  XNOR2X1 U92 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n67) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 count_to_a_thousand ( .clk(clk), .n_rst(n_rst), 
        .clear(clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(
        one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n1, n2, n3, n4, n5;

  NAND3X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(w_en) );
  INVX1 U4 ( .A(op[1]), .Y(n1) );
  NOR2X1 U5 ( .A(w_data_sel[1]), .B(n3), .Y(w_data_sel[0]) );
  NAND2X1 U6 ( .A(op[1]), .B(n2), .Y(w_data_sel[1]) );
  INVX1 U7 ( .A(op[2]), .Y(n2) );
  MUX2X1 U8 ( .B(n4), .A(n5), .S(op[1]), .Y(alu_op[1]) );
  NAND2X1 U9 ( .A(op[2]), .B(op[0]), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(alu_op[0]) );
  NAND2X1 U11 ( .A(op[2]), .B(n3), .Y(n5) );
  INVX1 U12 ( .A(op[0]), .Y(n3) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [17:1] carry;

  FAX1 U1_17 ( .A(A[17]), .B(B[17]), .C(carry[17]), .YS(SUM[17]) );
  FAX1 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .YC(carry[17]), .YS(
        SUM[16]) );
  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YC(carry[16]), .YS(
        SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [18:0] carry;

  FAX1 U2_17 ( .A(A[17]), .B(n1), .C(carry[17]), .YS(DIFF[17]) );
  FAX1 U2_16 ( .A(A[16]), .B(n1), .C(carry[16]), .YC(carry[17]), .YS(DIFF[16])
         );
  FAX1 U2_15 ( .A(A[15]), .B(n2), .C(carry[15]), .YC(carry[16]), .YS(DIFF[15])
         );
  FAX1 U2_14 ( .A(A[14]), .B(n3), .C(carry[14]), .YC(carry[15]), .YS(DIFF[14])
         );
  FAX1 U2_13 ( .A(A[13]), .B(n4), .C(carry[13]), .YC(carry[14]), .YS(DIFF[13])
         );
  FAX1 U2_12 ( .A(A[12]), .B(n5), .C(carry[12]), .YC(carry[13]), .YS(DIFF[12])
         );
  FAX1 U2_11 ( .A(A[11]), .B(n6), .C(carry[11]), .YC(carry[12]), .YS(DIFF[11])
         );
  FAX1 U2_10 ( .A(A[10]), .B(n7), .C(carry[10]), .YC(carry[11]), .YS(DIFF[10])
         );
  FAX1 U2_9 ( .A(A[9]), .B(n8), .C(carry[9]), .YC(carry[10]), .YS(DIFF[9]) );
  FAX1 U2_8 ( .A(A[8]), .B(n9), .C(carry[8]), .YC(carry[9]), .YS(DIFF[8]) );
  FAX1 U2_7 ( .A(A[7]), .B(n10), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n11), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n12), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n13), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n14), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n15), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n16), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n17), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(B[17]), .Y(n1) );
  INVX2 U4 ( .A(B[15]), .Y(n2) );
  INVX2 U5 ( .A(B[14]), .Y(n3) );
  INVX2 U6 ( .A(B[13]), .Y(n4) );
  INVX2 U7 ( .A(B[12]), .Y(n5) );
  INVX2 U8 ( .A(B[11]), .Y(n6) );
  INVX2 U9 ( .A(B[10]), .Y(n7) );
  INVX2 U10 ( .A(B[9]), .Y(n8) );
  INVX2 U11 ( .A(B[8]), .Y(n9) );
  INVX2 U12 ( .A(B[7]), .Y(n10) );
  INVX2 U13 ( .A(B[6]), .Y(n11) );
  INVX2 U14 ( .A(B[5]), .Y(n12) );
  INVX2 U15 ( .A(B[4]), .Y(n13) );
  INVX2 U16 ( .A(B[3]), .Y(n14) );
  INVX2 U17 ( .A(B[2]), .Y(n15) );
  INVX2 U18 ( .A(B[1]), .Y(n16) );
  INVX2 U19 ( .A(B[0]), .Y(n17) );
endmodule


module alu_DW_mult_uns_1 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n3, n4, n5, n7, n8, n9, n11, n12, n13, n15, n16, n17, n19, n20,
         n21, n23, n25, n27, n29, n31, n33, n35, n37, n39, n41, n43, n45, n47,
         n49, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n86, n87, n88, n89, n91, n92, n94, n95,
         n96, n97, n98, n99, n100, n101, n103, n104, n105, n106, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n121,
         n122, n123, n124, n125, n126, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n803,
         n804, n805, n806, n807, n815, n816, n817, n818, n819, n836, n837,
         n838, n839, n840, n841, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906;

  XOR2X1 U53 ( .A(n54), .B(n53), .Y(product[46]) );
  XOR2X1 U54 ( .A(n86), .B(n901), .Y(n53) );
  FAX1 U55 ( .A(n87), .B(n88), .C(n55), .YC(n54), .YS(product[45]) );
  FAX1 U56 ( .A(n89), .B(n91), .C(n56), .YC(n55), .YS(product[44]) );
  FAX1 U57 ( .A(n94), .B(n92), .C(n57), .YC(n56), .YS(product[43]) );
  FAX1 U58 ( .A(n95), .B(n98), .C(n58), .YC(n57), .YS(product[42]) );
  FAX1 U59 ( .A(n99), .B(n103), .C(n59), .YC(n58), .YS(product[41]) );
  FAX1 U60 ( .A(n108), .B(n104), .C(n60), .YC(n59), .YS(product[40]) );
  FAX1 U61 ( .A(n109), .B(n114), .C(n61), .YC(n60), .YS(product[39]) );
  FAX1 U62 ( .A(n115), .B(n121), .C(n62), .YC(n61), .YS(product[38]) );
  FAX1 U63 ( .A(n128), .B(n122), .C(n63), .YC(n62), .YS(product[37]) );
  FAX1 U64 ( .A(n129), .B(n136), .C(n64), .YC(n63), .YS(product[36]) );
  FAX1 U65 ( .A(n137), .B(n144), .C(n65), .YC(n64), .YS(product[35]) );
  FAX1 U66 ( .A(n152), .B(n145), .C(n66), .YC(n65), .YS(product[34]) );
  FAX1 U67 ( .A(n160), .B(n153), .C(n67), .YC(n66), .YS(product[33]) );
  FAX1 U68 ( .A(n555), .B(n161), .C(n68), .YC(n67), .YS(product[32]) );
  FAX1 U69 ( .A(n169), .B(n556), .C(n69), .YC(n68), .YS(product[31]) );
  FAX1 U70 ( .A(n177), .B(n557), .C(n70), .YC(n69), .YS(product[30]) );
  FAX1 U71 ( .A(n185), .B(n558), .C(n71), .YC(n70) );
  FAX1 U72 ( .A(n193), .B(n559), .C(n72), .YC(n71) );
  FAX1 U73 ( .A(n201), .B(n560), .C(n73), .YC(n72) );
  FAX1 U74 ( .A(n209), .B(n561), .C(n74), .YC(n73) );
  FAX1 U75 ( .A(n215), .B(n562), .C(n75), .YC(n74) );
  FAX1 U76 ( .A(n221), .B(n563), .C(n76), .YC(n75) );
  FAX1 U77 ( .A(n227), .B(n564), .C(n77), .YC(n76) );
  FAX1 U78 ( .A(n231), .B(n565), .C(n78), .YC(n77) );
  FAX1 U79 ( .A(n235), .B(n566), .C(n79), .YC(n78) );
  FAX1 U80 ( .A(n239), .B(n567), .C(n80), .YC(n79) );
  FAX1 U81 ( .A(n241), .B(n568), .C(n81), .YC(n80) );
  FAX1 U82 ( .A(n243), .B(n569), .C(n82), .YC(n81) );
  HAX1 U83 ( .A(n570), .B(n83), .YC(n82) );
  HAX1 U84 ( .A(n571), .B(n84), .YC(n83) );
  HAX1 U85 ( .A(n1), .B(n572), .YC(n84) );
  FAX1 U87 ( .A(n478), .B(n246), .C(n250), .YC(n86), .YS(n87) );
  FAX1 U88 ( .A(n248), .B(n249), .C(n479), .YC(n88), .YS(n89) );
  FAX1 U90 ( .A(n249), .B(n96), .C(n480), .YC(n91), .YS(n92) );
  FAX1 U92 ( .A(n97), .B(n481), .C(n100), .YC(n94), .YS(n95) );
  FAX1 U93 ( .A(n497), .B(n254), .C(n252), .YC(n96), .YS(n97) );
  FAX1 U94 ( .A(n482), .B(n101), .C(n498), .YC(n98), .YS(n99) );
  FAX1 U95 ( .A(n256), .B(n253), .C(n105), .YC(n100), .YS(n101) );
  FAX1 U97 ( .A(n110), .B(n106), .C(n499), .YC(n103), .YS(n104) );
  FAX1 U98 ( .A(n255), .B(n112), .C(n483), .YC(n105), .YS(n106) );
  FAX1 U100 ( .A(n111), .B(n500), .C(n116), .YC(n108), .YS(n109) );
  FAX1 U101 ( .A(n113), .B(n118), .C(n484), .YC(n110), .YS(n111) );
  FAX1 U102 ( .A(n516), .B(n258), .C(n262), .YC(n112), .YS(n113) );
  FAX1 U103 ( .A(n501), .B(n117), .C(n517), .YC(n114), .YS(n115) );
  FAX1 U104 ( .A(n125), .B(n119), .C(n123), .YC(n116), .YS(n117) );
  FAX1 U105 ( .A(n260), .B(n261), .C(n485), .YC(n118), .YS(n119) );
  FAX1 U107 ( .A(n130), .B(n124), .C(n518), .YC(n121), .YS(n122) );
  FAX1 U108 ( .A(n132), .B(n126), .C(n502), .YC(n123), .YS(n124) );
  FAX1 U109 ( .A(n261), .B(n134), .C(n486), .YC(n125), .YS(n126) );
  FAX1 U111 ( .A(n131), .B(n519), .C(n138), .YC(n128), .YS(n129) );
  FAX1 U112 ( .A(n133), .B(n140), .C(n503), .YC(n130), .YS(n131) );
  FAX1 U113 ( .A(n135), .B(n142), .C(n487), .YC(n132), .YS(n133) );
  FAX1 U114 ( .A(n535), .B(n554), .C(n264), .YC(n134), .YS(n135) );
  FAX1 U115 ( .A(n520), .B(n139), .C(n536), .YC(n136), .YS(n137) );
  FAX1 U116 ( .A(n148), .B(n141), .C(n146), .YC(n138), .YS(n139) );
  FAX1 U117 ( .A(n488), .B(n143), .C(n504), .YC(n140), .YS(n141) );
  FAX1 U118 ( .A(n1), .B(n266), .C(n150), .YC(n142), .YS(n143) );
  FAX1 U119 ( .A(n521), .B(n147), .C(n537), .YC(n144), .YS(n145) );
  FAX1 U120 ( .A(n156), .B(n149), .C(n154), .YC(n146), .YS(n147) );
  FAX1 U121 ( .A(n489), .B(n151), .C(n505), .YC(n148), .YS(n149) );
  FAX1 U122 ( .A(n1), .B(n268), .C(n158), .YC(n150), .YS(n151) );
  FAX1 U123 ( .A(n162), .B(n155), .C(n538), .YC(n152), .YS(n153) );
  FAX1 U124 ( .A(n164), .B(n157), .C(n522), .YC(n154), .YS(n155) );
  FAX1 U125 ( .A(n166), .B(n159), .C(n506), .YC(n156), .YS(n157) );
  FAX1 U126 ( .A(n1), .B(n270), .C(n490), .YC(n158), .YS(n159) );
  FAX1 U127 ( .A(n163), .B(n539), .C(n168), .YC(n160), .YS(n161) );
  FAX1 U128 ( .A(n165), .B(n523), .C(n170), .YC(n162), .YS(n163) );
  FAX1 U129 ( .A(n167), .B(n507), .C(n172), .YC(n164), .YS(n165) );
  FAX1 U130 ( .A(n272), .B(n491), .C(n174), .YC(n166), .YS(n167) );
  FAX1 U131 ( .A(n171), .B(n540), .C(n176), .YC(n168), .YS(n169) );
  FAX1 U132 ( .A(n173), .B(n524), .C(n178), .YC(n170), .YS(n171) );
  FAX1 U133 ( .A(n175), .B(n508), .C(n180), .YC(n172), .YS(n173) );
  FAX1 U134 ( .A(n274), .B(n492), .C(n182), .YC(n174), .YS(n175) );
  FAX1 U135 ( .A(n179), .B(n541), .C(n184), .YC(n176), .YS(n177) );
  FAX1 U136 ( .A(n181), .B(n525), .C(n186), .YC(n178), .YS(n179) );
  FAX1 U137 ( .A(n183), .B(n509), .C(n188), .YC(n180), .YS(n181) );
  FAX1 U138 ( .A(n275), .B(n493), .C(n190), .YC(n182), .YS(n183) );
  FAX1 U139 ( .A(n187), .B(n542), .C(n192), .YC(n184), .YS(n185) );
  FAX1 U140 ( .A(n189), .B(n526), .C(n194), .YC(n186), .YS(n187) );
  FAX1 U141 ( .A(n191), .B(n510), .C(n196), .YC(n188), .YS(n189) );
  HAX1 U142 ( .A(n494), .B(n198), .YC(n190), .YS(n191) );
  FAX1 U143 ( .A(n195), .B(n543), .C(n200), .YC(n192), .YS(n193) );
  FAX1 U144 ( .A(n197), .B(n527), .C(n202), .YC(n194), .YS(n195) );
  FAX1 U145 ( .A(n199), .B(n511), .C(n204), .YC(n196), .YS(n197) );
  HAX1 U146 ( .A(n495), .B(n206), .YC(n198), .YS(n199) );
  FAX1 U147 ( .A(n203), .B(n544), .C(n208), .YC(n200), .YS(n201) );
  FAX1 U148 ( .A(n205), .B(n528), .C(n210), .YC(n202), .YS(n203) );
  FAX1 U149 ( .A(n207), .B(n512), .C(n212), .YC(n204), .YS(n205) );
  HAX1 U150 ( .A(n17), .B(n496), .YC(n206), .YS(n207) );
  FAX1 U151 ( .A(n211), .B(n545), .C(n214), .YC(n208), .YS(n209) );
  FAX1 U152 ( .A(n213), .B(n529), .C(n216), .YC(n210), .YS(n211) );
  HAX1 U153 ( .A(n513), .B(n218), .YC(n212), .YS(n213) );
  FAX1 U154 ( .A(n217), .B(n546), .C(n220), .YC(n214), .YS(n215) );
  FAX1 U155 ( .A(n219), .B(n530), .C(n222), .YC(n216), .YS(n217) );
  HAX1 U156 ( .A(n514), .B(n224), .YC(n218), .YS(n219) );
  FAX1 U157 ( .A(n223), .B(n547), .C(n226), .YC(n220), .YS(n221) );
  FAX1 U158 ( .A(n225), .B(n531), .C(n228), .YC(n222), .YS(n223) );
  HAX1 U159 ( .A(n13), .B(n515), .YC(n224), .YS(n225) );
  FAX1 U160 ( .A(n229), .B(n548), .C(n230), .YC(n226), .YS(n227) );
  HAX1 U161 ( .A(n532), .B(n232), .YC(n228), .YS(n229) );
  FAX1 U162 ( .A(n233), .B(n549), .C(n234), .YC(n230), .YS(n231) );
  HAX1 U163 ( .A(n533), .B(n236), .YC(n232), .YS(n233) );
  FAX1 U164 ( .A(n237), .B(n550), .C(n238), .YC(n234), .YS(n235) );
  HAX1 U165 ( .A(n9), .B(n534), .YC(n236), .YS(n237) );
  HAX1 U166 ( .A(n551), .B(n240), .YC(n238), .YS(n239) );
  HAX1 U167 ( .A(n552), .B(n242), .YC(n240), .YS(n241) );
  HAX1 U168 ( .A(n5), .B(n553), .YC(n242), .YS(n243) );
  INVX2 U170 ( .A(n245), .Y(n246) );
  AOI22X1 U171 ( .A(n836), .B(n51), .C(n49), .D(n890), .Y(n245) );
  INVX2 U172 ( .A(n247), .Y(n248) );
  AOI22X1 U173 ( .A(n836), .B(n49), .C(n47), .D(n890), .Y(n247) );
  INVX2 U174 ( .A(n249), .Y(n250) );
  AOI22X1 U175 ( .A(n836), .B(n47), .C(n45), .D(n890), .Y(n249) );
  INVX2 U176 ( .A(n251), .Y(n252) );
  AOI22X1 U177 ( .A(n836), .B(n45), .C(n43), .D(n890), .Y(n251) );
  INVX2 U178 ( .A(n253), .Y(n254) );
  AOI22X1 U179 ( .A(n836), .B(n43), .C(n41), .D(n890), .Y(n253) );
  INVX2 U180 ( .A(n255), .Y(n256) );
  AOI22X1 U181 ( .A(n836), .B(n41), .C(n39), .D(n890), .Y(n255) );
  INVX2 U182 ( .A(n257), .Y(n258) );
  AOI22X1 U183 ( .A(n836), .B(n39), .C(n37), .D(n890), .Y(n257) );
  INVX2 U184 ( .A(n259), .Y(n260) );
  AOI22X1 U185 ( .A(n836), .B(n37), .C(n35), .D(n890), .Y(n259) );
  INVX2 U186 ( .A(n261), .Y(n262) );
  AOI22X1 U187 ( .A(n836), .B(n35), .C(n33), .D(n890), .Y(n261) );
  INVX2 U188 ( .A(n263), .Y(n264) );
  AOI22X1 U189 ( .A(n836), .B(n33), .C(n31), .D(n890), .Y(n263) );
  INVX2 U190 ( .A(n265), .Y(n266) );
  AOI22X1 U191 ( .A(n836), .B(n31), .C(n29), .D(n890), .Y(n265) );
  INVX2 U192 ( .A(n267), .Y(n268) );
  AOI22X1 U193 ( .A(n836), .B(n29), .C(n27), .D(n890), .Y(n267) );
  INVX2 U194 ( .A(n269), .Y(n270) );
  AOI22X1 U195 ( .A(n836), .B(n27), .C(n25), .D(n890), .Y(n269) );
  INVX2 U196 ( .A(n271), .Y(n272) );
  AOI22X1 U197 ( .A(n836), .B(n25), .C(n23), .D(n890), .Y(n271) );
  INVX2 U198 ( .A(n273), .Y(n274) );
  AOI22X1 U199 ( .A(n836), .B(n23), .C(n21), .D(n890), .Y(n273) );
  AND2X2 U200 ( .A(n836), .B(n21), .Y(n275) );
  INVX2 U201 ( .A(n17), .Y(n478) );
  XOR2X1 U202 ( .A(n573), .B(n17), .Y(n479) );
  OAI21X1 U203 ( .A(n20), .B(n748), .C(n591), .Y(n573) );
  NAND2X1 U204 ( .A(n51), .B(n900), .Y(n591) );
  XOR2X1 U205 ( .A(n574), .B(n17), .Y(n480) );
  OAI21X1 U206 ( .A(n20), .B(n749), .C(n592), .Y(n574) );
  AOI21X1 U207 ( .A(n49), .B(n900), .C(n276), .Y(n592) );
  AND2X2 U208 ( .A(n894), .B(n51), .Y(n276) );
  XOR2X1 U209 ( .A(n575), .B(n17), .Y(n481) );
  OAI21X1 U210 ( .A(n20), .B(n750), .C(n593), .Y(n575) );
  AOI21X1 U211 ( .A(n47), .B(n900), .C(n278), .Y(n593) );
  INVX2 U212 ( .A(n277), .Y(n278) );
  AOI22X1 U213 ( .A(n815), .B(n51), .C(n49), .D(n894), .Y(n277) );
  XOR2X1 U214 ( .A(n576), .B(n17), .Y(n482) );
  OAI21X1 U215 ( .A(n20), .B(n751), .C(n594), .Y(n576) );
  AOI21X1 U216 ( .A(n45), .B(n900), .C(n280), .Y(n594) );
  INVX2 U217 ( .A(n279), .Y(n280) );
  AOI22X1 U218 ( .A(n815), .B(n49), .C(n47), .D(n894), .Y(n279) );
  XOR2X1 U219 ( .A(n577), .B(n17), .Y(n483) );
  OAI21X1 U220 ( .A(n20), .B(n752), .C(n595), .Y(n577) );
  AOI21X1 U221 ( .A(n43), .B(n900), .C(n282), .Y(n595) );
  INVX2 U222 ( .A(n281), .Y(n282) );
  AOI22X1 U223 ( .A(n815), .B(n47), .C(n45), .D(n894), .Y(n281) );
  XOR2X1 U224 ( .A(n578), .B(n17), .Y(n484) );
  OAI21X1 U225 ( .A(n20), .B(n753), .C(n596), .Y(n578) );
  AOI21X1 U226 ( .A(n41), .B(n900), .C(n284), .Y(n596) );
  INVX2 U227 ( .A(n283), .Y(n284) );
  AOI22X1 U228 ( .A(n815), .B(n45), .C(n43), .D(n894), .Y(n283) );
  XOR2X1 U229 ( .A(n579), .B(n17), .Y(n485) );
  OAI21X1 U230 ( .A(n20), .B(n754), .C(n597), .Y(n579) );
  AOI21X1 U231 ( .A(n39), .B(n900), .C(n286), .Y(n597) );
  INVX2 U232 ( .A(n285), .Y(n286) );
  AOI22X1 U233 ( .A(n815), .B(n43), .C(n41), .D(n894), .Y(n285) );
  XOR2X1 U234 ( .A(n580), .B(n17), .Y(n486) );
  OAI21X1 U235 ( .A(n20), .B(n755), .C(n598), .Y(n580) );
  AOI21X1 U236 ( .A(n37), .B(n900), .C(n288), .Y(n598) );
  INVX2 U237 ( .A(n287), .Y(n288) );
  AOI22X1 U238 ( .A(n815), .B(n41), .C(n39), .D(n894), .Y(n287) );
  XOR2X1 U239 ( .A(n581), .B(n17), .Y(n487) );
  OAI21X1 U240 ( .A(n20), .B(n756), .C(n599), .Y(n581) );
  AOI21X1 U241 ( .A(n35), .B(n900), .C(n290), .Y(n599) );
  INVX2 U242 ( .A(n289), .Y(n290) );
  AOI22X1 U243 ( .A(n815), .B(n39), .C(n37), .D(n894), .Y(n289) );
  XOR2X1 U244 ( .A(n582), .B(n17), .Y(n488) );
  OAI21X1 U245 ( .A(n19), .B(n757), .C(n600), .Y(n582) );
  AOI21X1 U246 ( .A(n33), .B(n900), .C(n292), .Y(n600) );
  INVX2 U247 ( .A(n291), .Y(n292) );
  AOI22X1 U248 ( .A(n815), .B(n37), .C(n35), .D(n894), .Y(n291) );
  XOR2X1 U249 ( .A(n583), .B(n17), .Y(n489) );
  OAI21X1 U250 ( .A(n19), .B(n758), .C(n601), .Y(n583) );
  AOI21X1 U251 ( .A(n31), .B(n900), .C(n294), .Y(n601) );
  INVX2 U252 ( .A(n293), .Y(n294) );
  AOI22X1 U253 ( .A(n815), .B(n35), .C(n33), .D(n894), .Y(n293) );
  XOR2X1 U254 ( .A(n584), .B(n17), .Y(n490) );
  OAI21X1 U255 ( .A(n19), .B(n759), .C(n602), .Y(n584) );
  AOI21X1 U256 ( .A(n29), .B(n900), .C(n296), .Y(n602) );
  INVX2 U257 ( .A(n295), .Y(n296) );
  AOI22X1 U258 ( .A(n815), .B(n33), .C(n31), .D(n894), .Y(n295) );
  XOR2X1 U259 ( .A(n585), .B(n17), .Y(n491) );
  OAI21X1 U260 ( .A(n19), .B(n760), .C(n603), .Y(n585) );
  AOI21X1 U261 ( .A(n27), .B(n900), .C(n298), .Y(n603) );
  INVX2 U262 ( .A(n297), .Y(n298) );
  AOI22X1 U263 ( .A(n815), .B(n31), .C(n29), .D(n894), .Y(n297) );
  XOR2X1 U264 ( .A(n586), .B(n17), .Y(n492) );
  OAI21X1 U265 ( .A(n19), .B(n761), .C(n604), .Y(n586) );
  AOI21X1 U266 ( .A(n25), .B(n900), .C(n300), .Y(n604) );
  INVX2 U267 ( .A(n299), .Y(n300) );
  AOI22X1 U268 ( .A(n815), .B(n29), .C(n27), .D(n894), .Y(n299) );
  XOR2X1 U269 ( .A(n587), .B(n17), .Y(n493) );
  OAI21X1 U270 ( .A(n19), .B(n762), .C(n605), .Y(n587) );
  AOI21X1 U271 ( .A(n23), .B(n900), .C(n302), .Y(n605) );
  INVX2 U272 ( .A(n301), .Y(n302) );
  AOI22X1 U273 ( .A(n815), .B(n27), .C(n25), .D(n894), .Y(n301) );
  XOR2X1 U274 ( .A(n588), .B(n17), .Y(n494) );
  OAI21X1 U275 ( .A(n19), .B(n763), .C(n606), .Y(n588) );
  AOI21X1 U276 ( .A(n21), .B(n900), .C(n304), .Y(n606) );
  INVX2 U277 ( .A(n303), .Y(n304) );
  AOI22X1 U278 ( .A(n815), .B(n25), .C(n23), .D(n894), .Y(n303) );
  XOR2X1 U279 ( .A(n589), .B(n17), .Y(n495) );
  OAI21X1 U280 ( .A(n764), .B(n19), .C(n305), .Y(n589) );
  AOI22X1 U281 ( .A(n815), .B(n23), .C(n21), .D(n894), .Y(n305) );
  XOR2X1 U282 ( .A(n590), .B(n17), .Y(n496) );
  OAI21X1 U283 ( .A(n765), .B(n19), .C(n906), .Y(n590) );
  INVX2 U286 ( .A(n13), .Y(n497) );
  XOR2X1 U287 ( .A(n608), .B(n13), .Y(n498) );
  OAI21X1 U288 ( .A(n16), .B(n748), .C(n626), .Y(n608) );
  NAND2X1 U289 ( .A(n51), .B(n899), .Y(n626) );
  XOR2X1 U290 ( .A(n609), .B(n13), .Y(n499) );
  OAI21X1 U291 ( .A(n16), .B(n749), .C(n627), .Y(n609) );
  AOI21X1 U292 ( .A(n49), .B(n899), .C(n307), .Y(n627) );
  AND2X2 U293 ( .A(n893), .B(n51), .Y(n307) );
  XOR2X1 U294 ( .A(n610), .B(n13), .Y(n500) );
  OAI21X1 U295 ( .A(n16), .B(n750), .C(n628), .Y(n610) );
  AOI21X1 U296 ( .A(n47), .B(n899), .C(n309), .Y(n628) );
  INVX2 U297 ( .A(n308), .Y(n309) );
  AOI22X1 U298 ( .A(n816), .B(n51), .C(n49), .D(n893), .Y(n308) );
  XOR2X1 U299 ( .A(n611), .B(n13), .Y(n501) );
  OAI21X1 U300 ( .A(n16), .B(n751), .C(n629), .Y(n611) );
  AOI21X1 U301 ( .A(n45), .B(n899), .C(n311), .Y(n629) );
  INVX2 U302 ( .A(n310), .Y(n311) );
  AOI22X1 U303 ( .A(n816), .B(n49), .C(n47), .D(n893), .Y(n310) );
  XOR2X1 U304 ( .A(n612), .B(n13), .Y(n502) );
  OAI21X1 U305 ( .A(n16), .B(n752), .C(n630), .Y(n612) );
  AOI21X1 U306 ( .A(n43), .B(n899), .C(n313), .Y(n630) );
  INVX2 U307 ( .A(n312), .Y(n313) );
  AOI22X1 U308 ( .A(n816), .B(n47), .C(n45), .D(n893), .Y(n312) );
  XOR2X1 U309 ( .A(n613), .B(n13), .Y(n503) );
  OAI21X1 U310 ( .A(n16), .B(n753), .C(n631), .Y(n613) );
  AOI21X1 U311 ( .A(n41), .B(n899), .C(n315), .Y(n631) );
  INVX2 U312 ( .A(n314), .Y(n315) );
  AOI22X1 U313 ( .A(n816), .B(n45), .C(n43), .D(n893), .Y(n314) );
  XOR2X1 U314 ( .A(n614), .B(n13), .Y(n504) );
  OAI21X1 U315 ( .A(n16), .B(n754), .C(n632), .Y(n614) );
  AOI21X1 U316 ( .A(n39), .B(n899), .C(n317), .Y(n632) );
  INVX2 U317 ( .A(n316), .Y(n317) );
  AOI22X1 U318 ( .A(n816), .B(n43), .C(n41), .D(n893), .Y(n316) );
  XOR2X1 U319 ( .A(n615), .B(n13), .Y(n505) );
  OAI21X1 U320 ( .A(n16), .B(n755), .C(n633), .Y(n615) );
  AOI21X1 U321 ( .A(n37), .B(n899), .C(n319), .Y(n633) );
  INVX2 U322 ( .A(n318), .Y(n319) );
  AOI22X1 U323 ( .A(n816), .B(n41), .C(n39), .D(n893), .Y(n318) );
  XOR2X1 U324 ( .A(n616), .B(n13), .Y(n506) );
  OAI21X1 U325 ( .A(n16), .B(n756), .C(n634), .Y(n616) );
  AOI21X1 U326 ( .A(n35), .B(n899), .C(n321), .Y(n634) );
  INVX2 U327 ( .A(n320), .Y(n321) );
  AOI22X1 U328 ( .A(n816), .B(n39), .C(n37), .D(n893), .Y(n320) );
  XOR2X1 U329 ( .A(n617), .B(n13), .Y(n507) );
  OAI21X1 U330 ( .A(n15), .B(n757), .C(n635), .Y(n617) );
  AOI21X1 U331 ( .A(n33), .B(n899), .C(n323), .Y(n635) );
  INVX2 U332 ( .A(n322), .Y(n323) );
  AOI22X1 U333 ( .A(n816), .B(n37), .C(n35), .D(n893), .Y(n322) );
  XOR2X1 U334 ( .A(n618), .B(n13), .Y(n508) );
  OAI21X1 U335 ( .A(n15), .B(n758), .C(n636), .Y(n618) );
  AOI21X1 U336 ( .A(n31), .B(n899), .C(n325), .Y(n636) );
  INVX2 U337 ( .A(n324), .Y(n325) );
  AOI22X1 U338 ( .A(n816), .B(n35), .C(n33), .D(n893), .Y(n324) );
  XOR2X1 U339 ( .A(n619), .B(n13), .Y(n509) );
  OAI21X1 U340 ( .A(n15), .B(n759), .C(n637), .Y(n619) );
  AOI21X1 U341 ( .A(n29), .B(n899), .C(n327), .Y(n637) );
  INVX2 U342 ( .A(n326), .Y(n327) );
  AOI22X1 U343 ( .A(n816), .B(n33), .C(n31), .D(n893), .Y(n326) );
  XOR2X1 U344 ( .A(n620), .B(n13), .Y(n510) );
  OAI21X1 U345 ( .A(n15), .B(n760), .C(n638), .Y(n620) );
  AOI21X1 U346 ( .A(n27), .B(n899), .C(n329), .Y(n638) );
  INVX2 U347 ( .A(n328), .Y(n329) );
  AOI22X1 U348 ( .A(n816), .B(n31), .C(n29), .D(n893), .Y(n328) );
  XOR2X1 U349 ( .A(n621), .B(n13), .Y(n511) );
  OAI21X1 U350 ( .A(n15), .B(n761), .C(n639), .Y(n621) );
  AOI21X1 U351 ( .A(n25), .B(n899), .C(n331), .Y(n639) );
  INVX2 U352 ( .A(n330), .Y(n331) );
  AOI22X1 U353 ( .A(n816), .B(n29), .C(n27), .D(n893), .Y(n330) );
  XOR2X1 U354 ( .A(n622), .B(n13), .Y(n512) );
  OAI21X1 U355 ( .A(n15), .B(n762), .C(n640), .Y(n622) );
  AOI21X1 U356 ( .A(n23), .B(n899), .C(n333), .Y(n640) );
  INVX2 U357 ( .A(n332), .Y(n333) );
  AOI22X1 U358 ( .A(n816), .B(n27), .C(n25), .D(n893), .Y(n332) );
  XOR2X1 U359 ( .A(n623), .B(n13), .Y(n513) );
  OAI21X1 U360 ( .A(n15), .B(n763), .C(n641), .Y(n623) );
  AOI21X1 U361 ( .A(n21), .B(n899), .C(n335), .Y(n641) );
  INVX2 U362 ( .A(n334), .Y(n335) );
  AOI22X1 U363 ( .A(n816), .B(n25), .C(n23), .D(n893), .Y(n334) );
  XOR2X1 U364 ( .A(n624), .B(n13), .Y(n514) );
  OAI21X1 U365 ( .A(n764), .B(n15), .C(n336), .Y(n624) );
  AOI22X1 U366 ( .A(n816), .B(n23), .C(n21), .D(n893), .Y(n336) );
  XOR2X1 U367 ( .A(n625), .B(n13), .Y(n515) );
  OAI21X1 U368 ( .A(n765), .B(n15), .C(n905), .Y(n625) );
  INVX2 U371 ( .A(n9), .Y(n516) );
  XOR2X1 U372 ( .A(n643), .B(n9), .Y(n517) );
  OAI21X1 U373 ( .A(n12), .B(n748), .C(n661), .Y(n643) );
  NAND2X1 U374 ( .A(n51), .B(n898), .Y(n661) );
  XOR2X1 U375 ( .A(n644), .B(n9), .Y(n518) );
  OAI21X1 U376 ( .A(n12), .B(n749), .C(n662), .Y(n644) );
  AOI21X1 U377 ( .A(n49), .B(n898), .C(n338), .Y(n662) );
  AND2X2 U378 ( .A(n892), .B(n51), .Y(n338) );
  XOR2X1 U379 ( .A(n645), .B(n9), .Y(n519) );
  OAI21X1 U380 ( .A(n12), .B(n750), .C(n663), .Y(n645) );
  AOI21X1 U381 ( .A(n47), .B(n898), .C(n340), .Y(n663) );
  INVX2 U382 ( .A(n339), .Y(n340) );
  AOI22X1 U383 ( .A(n817), .B(n51), .C(n49), .D(n892), .Y(n339) );
  XOR2X1 U384 ( .A(n646), .B(n9), .Y(n520) );
  OAI21X1 U385 ( .A(n12), .B(n751), .C(n664), .Y(n646) );
  AOI21X1 U386 ( .A(n45), .B(n898), .C(n342), .Y(n664) );
  INVX2 U387 ( .A(n341), .Y(n342) );
  AOI22X1 U388 ( .A(n817), .B(n49), .C(n47), .D(n892), .Y(n341) );
  XOR2X1 U389 ( .A(n647), .B(n9), .Y(n521) );
  OAI21X1 U390 ( .A(n12), .B(n752), .C(n665), .Y(n647) );
  AOI21X1 U391 ( .A(n43), .B(n898), .C(n344), .Y(n665) );
  INVX2 U392 ( .A(n343), .Y(n344) );
  AOI22X1 U393 ( .A(n817), .B(n47), .C(n45), .D(n892), .Y(n343) );
  XOR2X1 U394 ( .A(n648), .B(n9), .Y(n522) );
  OAI21X1 U395 ( .A(n12), .B(n753), .C(n666), .Y(n648) );
  AOI21X1 U396 ( .A(n41), .B(n898), .C(n346), .Y(n666) );
  INVX2 U397 ( .A(n345), .Y(n346) );
  AOI22X1 U398 ( .A(n817), .B(n45), .C(n43), .D(n892), .Y(n345) );
  XOR2X1 U399 ( .A(n649), .B(n9), .Y(n523) );
  OAI21X1 U400 ( .A(n12), .B(n754), .C(n667), .Y(n649) );
  AOI21X1 U401 ( .A(n39), .B(n898), .C(n348), .Y(n667) );
  INVX2 U402 ( .A(n347), .Y(n348) );
  AOI22X1 U403 ( .A(n817), .B(n43), .C(n41), .D(n892), .Y(n347) );
  XOR2X1 U404 ( .A(n650), .B(n9), .Y(n524) );
  OAI21X1 U405 ( .A(n12), .B(n755), .C(n668), .Y(n650) );
  AOI21X1 U406 ( .A(n37), .B(n898), .C(n350), .Y(n668) );
  INVX2 U407 ( .A(n349), .Y(n350) );
  AOI22X1 U408 ( .A(n817), .B(n41), .C(n39), .D(n892), .Y(n349) );
  XOR2X1 U409 ( .A(n651), .B(n9), .Y(n525) );
  OAI21X1 U410 ( .A(n12), .B(n756), .C(n669), .Y(n651) );
  AOI21X1 U411 ( .A(n35), .B(n898), .C(n352), .Y(n669) );
  INVX2 U412 ( .A(n351), .Y(n352) );
  AOI22X1 U413 ( .A(n817), .B(n39), .C(n37), .D(n892), .Y(n351) );
  XOR2X1 U414 ( .A(n652), .B(n9), .Y(n526) );
  OAI21X1 U415 ( .A(n11), .B(n757), .C(n670), .Y(n652) );
  AOI21X1 U416 ( .A(n33), .B(n898), .C(n354), .Y(n670) );
  INVX2 U417 ( .A(n353), .Y(n354) );
  AOI22X1 U418 ( .A(n817), .B(n37), .C(n35), .D(n892), .Y(n353) );
  XOR2X1 U419 ( .A(n653), .B(n9), .Y(n527) );
  OAI21X1 U420 ( .A(n11), .B(n758), .C(n671), .Y(n653) );
  AOI21X1 U421 ( .A(n31), .B(n898), .C(n356), .Y(n671) );
  INVX2 U422 ( .A(n355), .Y(n356) );
  AOI22X1 U423 ( .A(n817), .B(n35), .C(n33), .D(n892), .Y(n355) );
  XOR2X1 U424 ( .A(n654), .B(n9), .Y(n528) );
  OAI21X1 U425 ( .A(n11), .B(n759), .C(n672), .Y(n654) );
  AOI21X1 U426 ( .A(n29), .B(n898), .C(n358), .Y(n672) );
  INVX2 U427 ( .A(n357), .Y(n358) );
  AOI22X1 U428 ( .A(n817), .B(n33), .C(n31), .D(n892), .Y(n357) );
  XOR2X1 U429 ( .A(n655), .B(n9), .Y(n529) );
  OAI21X1 U430 ( .A(n11), .B(n760), .C(n673), .Y(n655) );
  AOI21X1 U431 ( .A(n27), .B(n898), .C(n360), .Y(n673) );
  INVX2 U432 ( .A(n359), .Y(n360) );
  AOI22X1 U433 ( .A(n817), .B(n31), .C(n29), .D(n892), .Y(n359) );
  XOR2X1 U434 ( .A(n656), .B(n9), .Y(n530) );
  OAI21X1 U435 ( .A(n11), .B(n761), .C(n674), .Y(n656) );
  AOI21X1 U436 ( .A(n25), .B(n898), .C(n362), .Y(n674) );
  INVX2 U437 ( .A(n361), .Y(n362) );
  AOI22X1 U438 ( .A(n817), .B(n29), .C(n27), .D(n892), .Y(n361) );
  XOR2X1 U439 ( .A(n657), .B(n9), .Y(n531) );
  OAI21X1 U440 ( .A(n11), .B(n762), .C(n675), .Y(n657) );
  AOI21X1 U441 ( .A(n23), .B(n898), .C(n364), .Y(n675) );
  INVX2 U442 ( .A(n363), .Y(n364) );
  AOI22X1 U443 ( .A(n817), .B(n27), .C(n25), .D(n892), .Y(n363) );
  XOR2X1 U444 ( .A(n658), .B(n9), .Y(n532) );
  OAI21X1 U445 ( .A(n11), .B(n763), .C(n676), .Y(n658) );
  AOI21X1 U446 ( .A(n21), .B(n898), .C(n366), .Y(n676) );
  INVX2 U447 ( .A(n365), .Y(n366) );
  AOI22X1 U448 ( .A(n817), .B(n25), .C(n23), .D(n892), .Y(n365) );
  XOR2X1 U449 ( .A(n659), .B(n9), .Y(n533) );
  OAI21X1 U450 ( .A(n764), .B(n11), .C(n367), .Y(n659) );
  AOI22X1 U451 ( .A(n817), .B(n23), .C(n21), .D(n892), .Y(n367) );
  XOR2X1 U452 ( .A(n660), .B(n9), .Y(n534) );
  OAI21X1 U453 ( .A(n765), .B(n11), .C(n904), .Y(n660) );
  INVX2 U456 ( .A(n5), .Y(n535) );
  XOR2X1 U457 ( .A(n678), .B(n5), .Y(n536) );
  OAI21X1 U458 ( .A(n8), .B(n748), .C(n696), .Y(n678) );
  NAND2X1 U459 ( .A(n51), .B(n897), .Y(n696) );
  XOR2X1 U460 ( .A(n679), .B(n5), .Y(n537) );
  OAI21X1 U461 ( .A(n8), .B(n749), .C(n697), .Y(n679) );
  AOI21X1 U462 ( .A(n49), .B(n897), .C(n369), .Y(n697) );
  AND2X2 U463 ( .A(n891), .B(n51), .Y(n369) );
  XOR2X1 U464 ( .A(n680), .B(n5), .Y(n538) );
  OAI21X1 U465 ( .A(n8), .B(n750), .C(n698), .Y(n680) );
  AOI21X1 U466 ( .A(n47), .B(n897), .C(n371), .Y(n698) );
  INVX2 U467 ( .A(n370), .Y(n371) );
  AOI22X1 U468 ( .A(n818), .B(n51), .C(n49), .D(n891), .Y(n370) );
  XOR2X1 U469 ( .A(n681), .B(n5), .Y(n539) );
  OAI21X1 U470 ( .A(n8), .B(n751), .C(n699), .Y(n681) );
  AOI21X1 U471 ( .A(n45), .B(n897), .C(n373), .Y(n699) );
  INVX2 U472 ( .A(n372), .Y(n373) );
  AOI22X1 U473 ( .A(n818), .B(n49), .C(n47), .D(n891), .Y(n372) );
  XOR2X1 U474 ( .A(n682), .B(n5), .Y(n540) );
  OAI21X1 U475 ( .A(n8), .B(n752), .C(n700), .Y(n682) );
  AOI21X1 U476 ( .A(n43), .B(n897), .C(n375), .Y(n700) );
  INVX2 U477 ( .A(n374), .Y(n375) );
  AOI22X1 U478 ( .A(n818), .B(n47), .C(n45), .D(n891), .Y(n374) );
  XOR2X1 U479 ( .A(n683), .B(n5), .Y(n541) );
  OAI21X1 U480 ( .A(n8), .B(n753), .C(n701), .Y(n683) );
  AOI21X1 U481 ( .A(n41), .B(n897), .C(n377), .Y(n701) );
  INVX2 U482 ( .A(n376), .Y(n377) );
  AOI22X1 U483 ( .A(n818), .B(n45), .C(n43), .D(n891), .Y(n376) );
  XOR2X1 U484 ( .A(n684), .B(n5), .Y(n542) );
  OAI21X1 U485 ( .A(n8), .B(n754), .C(n702), .Y(n684) );
  AOI21X1 U486 ( .A(n39), .B(n897), .C(n379), .Y(n702) );
  INVX2 U487 ( .A(n378), .Y(n379) );
  AOI22X1 U488 ( .A(n818), .B(n43), .C(n41), .D(n891), .Y(n378) );
  XOR2X1 U489 ( .A(n685), .B(n5), .Y(n543) );
  OAI21X1 U490 ( .A(n8), .B(n755), .C(n703), .Y(n685) );
  AOI21X1 U491 ( .A(n37), .B(n897), .C(n381), .Y(n703) );
  INVX2 U492 ( .A(n380), .Y(n381) );
  AOI22X1 U493 ( .A(n818), .B(n41), .C(n39), .D(n891), .Y(n380) );
  XOR2X1 U494 ( .A(n686), .B(n5), .Y(n544) );
  OAI21X1 U495 ( .A(n8), .B(n756), .C(n704), .Y(n686) );
  AOI21X1 U496 ( .A(n35), .B(n897), .C(n383), .Y(n704) );
  INVX2 U497 ( .A(n382), .Y(n383) );
  AOI22X1 U498 ( .A(n818), .B(n39), .C(n37), .D(n891), .Y(n382) );
  XOR2X1 U499 ( .A(n687), .B(n5), .Y(n545) );
  OAI21X1 U500 ( .A(n7), .B(n757), .C(n705), .Y(n687) );
  AOI21X1 U501 ( .A(n33), .B(n897), .C(n385), .Y(n705) );
  INVX2 U502 ( .A(n384), .Y(n385) );
  AOI22X1 U503 ( .A(n818), .B(n37), .C(n35), .D(n891), .Y(n384) );
  XOR2X1 U504 ( .A(n688), .B(n5), .Y(n546) );
  OAI21X1 U505 ( .A(n7), .B(n758), .C(n706), .Y(n688) );
  AOI21X1 U506 ( .A(n31), .B(n897), .C(n387), .Y(n706) );
  INVX2 U507 ( .A(n386), .Y(n387) );
  AOI22X1 U508 ( .A(n818), .B(n35), .C(n33), .D(n891), .Y(n386) );
  XOR2X1 U509 ( .A(n689), .B(n5), .Y(n547) );
  OAI21X1 U510 ( .A(n7), .B(n759), .C(n707), .Y(n689) );
  AOI21X1 U511 ( .A(n29), .B(n897), .C(n389), .Y(n707) );
  INVX2 U512 ( .A(n388), .Y(n389) );
  AOI22X1 U513 ( .A(n818), .B(n33), .C(n31), .D(n891), .Y(n388) );
  XOR2X1 U514 ( .A(n690), .B(n5), .Y(n548) );
  OAI21X1 U515 ( .A(n7), .B(n760), .C(n708), .Y(n690) );
  AOI21X1 U516 ( .A(n27), .B(n897), .C(n391), .Y(n708) );
  INVX2 U517 ( .A(n390), .Y(n391) );
  AOI22X1 U518 ( .A(n818), .B(n31), .C(n29), .D(n891), .Y(n390) );
  XOR2X1 U519 ( .A(n691), .B(n5), .Y(n549) );
  OAI21X1 U520 ( .A(n7), .B(n761), .C(n709), .Y(n691) );
  AOI21X1 U521 ( .A(n25), .B(n897), .C(n393), .Y(n709) );
  INVX2 U522 ( .A(n392), .Y(n393) );
  AOI22X1 U523 ( .A(n818), .B(n29), .C(n27), .D(n891), .Y(n392) );
  XOR2X1 U524 ( .A(n692), .B(n5), .Y(n550) );
  OAI21X1 U525 ( .A(n7), .B(n762), .C(n710), .Y(n692) );
  AOI21X1 U526 ( .A(n23), .B(n897), .C(n395), .Y(n710) );
  INVX2 U527 ( .A(n394), .Y(n395) );
  AOI22X1 U528 ( .A(n818), .B(n27), .C(n25), .D(n891), .Y(n394) );
  XOR2X1 U529 ( .A(n693), .B(n5), .Y(n551) );
  OAI21X1 U530 ( .A(n7), .B(n763), .C(n711), .Y(n693) );
  AOI21X1 U531 ( .A(n21), .B(n897), .C(n397), .Y(n711) );
  INVX2 U532 ( .A(n396), .Y(n397) );
  AOI22X1 U533 ( .A(n818), .B(n25), .C(n23), .D(n891), .Y(n396) );
  XOR2X1 U534 ( .A(n694), .B(n5), .Y(n552) );
  OAI21X1 U535 ( .A(n764), .B(n7), .C(n398), .Y(n694) );
  AOI22X1 U536 ( .A(n818), .B(n23), .C(n21), .D(n891), .Y(n398) );
  XOR2X1 U537 ( .A(n695), .B(n5), .Y(n553) );
  OAI21X1 U538 ( .A(n765), .B(n7), .C(n903), .Y(n695) );
  INVX2 U541 ( .A(n1), .Y(n554) );
  XOR2X1 U542 ( .A(n713), .B(n1), .Y(n555) );
  OAI21X1 U543 ( .A(n4), .B(n748), .C(n731), .Y(n713) );
  NAND2X1 U544 ( .A(n51), .B(n896), .Y(n731) );
  XOR2X1 U545 ( .A(n714), .B(n1), .Y(n556) );
  OAI21X1 U546 ( .A(n4), .B(n749), .C(n732), .Y(n714) );
  AOI21X1 U547 ( .A(n49), .B(n896), .C(n400), .Y(n732) );
  AND2X2 U548 ( .A(n895), .B(n51), .Y(n400) );
  XOR2X1 U549 ( .A(n715), .B(n1), .Y(n557) );
  OAI21X1 U550 ( .A(n4), .B(n750), .C(n733), .Y(n715) );
  AOI21X1 U551 ( .A(n47), .B(n896), .C(n402), .Y(n733) );
  INVX2 U552 ( .A(n401), .Y(n402) );
  AOI22X1 U553 ( .A(n819), .B(n51), .C(n49), .D(n895), .Y(n401) );
  XOR2X1 U554 ( .A(n716), .B(n1), .Y(n558) );
  OAI21X1 U555 ( .A(n4), .B(n751), .C(n734), .Y(n716) );
  AOI21X1 U556 ( .A(n45), .B(n896), .C(n404), .Y(n734) );
  INVX2 U557 ( .A(n403), .Y(n404) );
  AOI22X1 U558 ( .A(n819), .B(n49), .C(n47), .D(n895), .Y(n403) );
  XOR2X1 U559 ( .A(n717), .B(n1), .Y(n559) );
  OAI21X1 U560 ( .A(n4), .B(n752), .C(n735), .Y(n717) );
  AOI21X1 U561 ( .A(n43), .B(n896), .C(n406), .Y(n735) );
  INVX2 U562 ( .A(n405), .Y(n406) );
  AOI22X1 U563 ( .A(n819), .B(n47), .C(n45), .D(n895), .Y(n405) );
  XOR2X1 U564 ( .A(n718), .B(n1), .Y(n560) );
  OAI21X1 U565 ( .A(n4), .B(n753), .C(n736), .Y(n718) );
  AOI21X1 U566 ( .A(n41), .B(n896), .C(n408), .Y(n736) );
  INVX2 U567 ( .A(n407), .Y(n408) );
  AOI22X1 U568 ( .A(n819), .B(n45), .C(n43), .D(n895), .Y(n407) );
  XOR2X1 U569 ( .A(n719), .B(n1), .Y(n561) );
  OAI21X1 U570 ( .A(n4), .B(n754), .C(n737), .Y(n719) );
  AOI21X1 U571 ( .A(n39), .B(n896), .C(n410), .Y(n737) );
  INVX2 U572 ( .A(n409), .Y(n410) );
  AOI22X1 U573 ( .A(n819), .B(n43), .C(n41), .D(n895), .Y(n409) );
  XOR2X1 U574 ( .A(n720), .B(n1), .Y(n562) );
  OAI21X1 U575 ( .A(n4), .B(n755), .C(n738), .Y(n720) );
  AOI21X1 U576 ( .A(n37), .B(n896), .C(n412), .Y(n738) );
  INVX2 U577 ( .A(n411), .Y(n412) );
  AOI22X1 U578 ( .A(n819), .B(n41), .C(n39), .D(n895), .Y(n411) );
  XOR2X1 U579 ( .A(n721), .B(n1), .Y(n563) );
  OAI21X1 U580 ( .A(n4), .B(n756), .C(n739), .Y(n721) );
  AOI21X1 U581 ( .A(n35), .B(n896), .C(n414), .Y(n739) );
  INVX2 U582 ( .A(n413), .Y(n414) );
  AOI22X1 U583 ( .A(n819), .B(n39), .C(n37), .D(n895), .Y(n413) );
  XOR2X1 U584 ( .A(n722), .B(n1), .Y(n564) );
  OAI21X1 U585 ( .A(n3), .B(n757), .C(n740), .Y(n722) );
  AOI21X1 U586 ( .A(n33), .B(n896), .C(n416), .Y(n740) );
  INVX2 U587 ( .A(n415), .Y(n416) );
  AOI22X1 U588 ( .A(n819), .B(n37), .C(n35), .D(n895), .Y(n415) );
  XOR2X1 U589 ( .A(n723), .B(n1), .Y(n565) );
  OAI21X1 U590 ( .A(n3), .B(n758), .C(n741), .Y(n723) );
  AOI21X1 U591 ( .A(n31), .B(n896), .C(n418), .Y(n741) );
  INVX2 U592 ( .A(n417), .Y(n418) );
  AOI22X1 U593 ( .A(n819), .B(n35), .C(n33), .D(n895), .Y(n417) );
  XOR2X1 U594 ( .A(n724), .B(n1), .Y(n566) );
  OAI21X1 U595 ( .A(n3), .B(n759), .C(n742), .Y(n724) );
  AOI21X1 U596 ( .A(n29), .B(n896), .C(n420), .Y(n742) );
  INVX2 U597 ( .A(n419), .Y(n420) );
  AOI22X1 U598 ( .A(n819), .B(n33), .C(n31), .D(n895), .Y(n419) );
  XOR2X1 U599 ( .A(n725), .B(n1), .Y(n567) );
  OAI21X1 U600 ( .A(n3), .B(n760), .C(n743), .Y(n725) );
  AOI21X1 U601 ( .A(n27), .B(n896), .C(n422), .Y(n743) );
  INVX2 U602 ( .A(n421), .Y(n422) );
  AOI22X1 U603 ( .A(n819), .B(n31), .C(n29), .D(n895), .Y(n421) );
  XOR2X1 U604 ( .A(n726), .B(n1), .Y(n568) );
  OAI21X1 U605 ( .A(n3), .B(n761), .C(n744), .Y(n726) );
  AOI21X1 U606 ( .A(n25), .B(n896), .C(n424), .Y(n744) );
  INVX2 U607 ( .A(n423), .Y(n424) );
  AOI22X1 U608 ( .A(n819), .B(n29), .C(n27), .D(n895), .Y(n423) );
  XOR2X1 U609 ( .A(n727), .B(n1), .Y(n569) );
  OAI21X1 U610 ( .A(n3), .B(n762), .C(n745), .Y(n727) );
  AOI21X1 U611 ( .A(n23), .B(n896), .C(n426), .Y(n745) );
  INVX2 U612 ( .A(n425), .Y(n426) );
  AOI22X1 U613 ( .A(n819), .B(n27), .C(n25), .D(n895), .Y(n425) );
  XOR2X1 U614 ( .A(n728), .B(n1), .Y(n570) );
  OAI21X1 U615 ( .A(n3), .B(n763), .C(n746), .Y(n728) );
  AOI21X1 U616 ( .A(n21), .B(n896), .C(n428), .Y(n746) );
  INVX2 U617 ( .A(n427), .Y(n428) );
  AOI22X1 U618 ( .A(n819), .B(n25), .C(n23), .D(n895), .Y(n427) );
  XOR2X1 U619 ( .A(n729), .B(n1), .Y(n571) );
  OAI21X1 U620 ( .A(n764), .B(n3), .C(n429), .Y(n729) );
  AOI22X1 U621 ( .A(n819), .B(n23), .C(n21), .D(n895), .Y(n429) );
  XOR2X1 U622 ( .A(n730), .B(n1), .Y(n572) );
  OAI21X1 U623 ( .A(n765), .B(n3), .C(n902), .Y(n730) );
  INVX2 U662 ( .A(n782), .Y(n836) );
  XNOR2X1 U663 ( .A(b[14]), .B(b[15]), .Y(n782) );
  AND2X2 U665 ( .A(n793), .B(n783), .Y(n431) );
  OR2X2 U666 ( .A(n783), .B(n432), .Y(n803) );
  INVX2 U667 ( .A(n793), .Y(n432) );
  INVX2 U669 ( .A(n788), .Y(n433) );
  NOR2X1 U670 ( .A(n783), .B(n793), .Y(n837) );
  XNOR2X1 U671 ( .A(b[12]), .B(b[13]), .Y(n788) );
  XNOR2X1 U672 ( .A(b[11]), .B(b[12]), .Y(n783) );
  XOR2X1 U673 ( .A(b[13]), .B(b[14]), .Y(n793) );
  AND2X2 U675 ( .A(n794), .B(n784), .Y(n434) );
  OR2X2 U676 ( .A(n784), .B(n435), .Y(n804) );
  INVX2 U677 ( .A(n794), .Y(n435) );
  INVX2 U679 ( .A(n789), .Y(n436) );
  NOR2X1 U680 ( .A(n784), .B(n794), .Y(n838) );
  XNOR2X1 U681 ( .A(b[9]), .B(b[10]), .Y(n789) );
  XNOR2X1 U682 ( .A(b[8]), .B(b[9]), .Y(n784) );
  XOR2X1 U683 ( .A(b[10]), .B(b[11]), .Y(n794) );
  AND2X2 U685 ( .A(n795), .B(n785), .Y(n437) );
  OR2X2 U686 ( .A(n785), .B(n438), .Y(n805) );
  INVX2 U687 ( .A(n795), .Y(n438) );
  INVX2 U689 ( .A(n790), .Y(n439) );
  NOR2X1 U690 ( .A(n785), .B(n795), .Y(n839) );
  XNOR2X1 U691 ( .A(b[6]), .B(b[7]), .Y(n790) );
  XNOR2X1 U692 ( .A(b[5]), .B(b[6]), .Y(n785) );
  XOR2X1 U693 ( .A(b[7]), .B(b[8]), .Y(n795) );
  AND2X2 U695 ( .A(n796), .B(n786), .Y(n440) );
  OR2X2 U696 ( .A(n786), .B(n441), .Y(n806) );
  INVX2 U697 ( .A(n796), .Y(n441) );
  INVX2 U699 ( .A(n791), .Y(n442) );
  NOR2X1 U700 ( .A(n786), .B(n796), .Y(n840) );
  XNOR2X1 U701 ( .A(b[3]), .B(b[4]), .Y(n791) );
  XNOR2X1 U702 ( .A(b[2]), .B(b[3]), .Y(n786) );
  XOR2X1 U703 ( .A(b[4]), .B(b[5]), .Y(n796) );
  AND2X2 U705 ( .A(n797), .B(n792), .Y(n443) );
  OR2X2 U706 ( .A(n787), .B(n444), .Y(n807) );
  INVX2 U707 ( .A(n797), .Y(n444) );
  INVX2 U709 ( .A(n792), .Y(n445) );
  NOR2X1 U710 ( .A(n787), .B(n797), .Y(n841) );
  XNOR2X1 U711 ( .A(b[0]), .B(b[1]), .Y(n792) );
  INVX2 U712 ( .A(b[0]), .Y(n787) );
  XOR2X1 U713 ( .A(b[1]), .B(b[2]), .Y(n797) );
  HAX1 U714 ( .A(a[30]), .B(n446), .YC(n461), .YS(n462) );
  FAX1 U715 ( .A(a[30]), .B(a[29]), .C(n447), .YC(n446), .YS(n463) );
  FAX1 U716 ( .A(a[29]), .B(a[28]), .C(n448), .YC(n447), .YS(n464) );
  FAX1 U717 ( .A(a[28]), .B(a[27]), .C(n449), .YC(n448), .YS(n465) );
  FAX1 U718 ( .A(a[27]), .B(a[26]), .C(n450), .YC(n449), .YS(n466) );
  FAX1 U719 ( .A(a[26]), .B(a[25]), .C(n451), .YC(n450), .YS(n467) );
  FAX1 U720 ( .A(a[25]), .B(a[24]), .C(n452), .YC(n451), .YS(n468) );
  FAX1 U721 ( .A(a[24]), .B(a[23]), .C(n453), .YC(n452), .YS(n469) );
  FAX1 U722 ( .A(a[23]), .B(a[22]), .C(n454), .YC(n453), .YS(n470) );
  FAX1 U723 ( .A(a[22]), .B(a[21]), .C(n455), .YC(n454), .YS(n471) );
  FAX1 U724 ( .A(a[21]), .B(a[20]), .C(n456), .YC(n455), .YS(n472) );
  FAX1 U725 ( .A(a[20]), .B(a[19]), .C(n457), .YC(n456), .YS(n473) );
  FAX1 U726 ( .A(a[19]), .B(a[18]), .C(n458), .YC(n457), .YS(n474) );
  FAX1 U727 ( .A(a[18]), .B(a[17]), .C(n459), .YC(n458), .YS(n475) );
  FAX1 U728 ( .A(a[17]), .B(a[16]), .C(n460), .YC(n459), .YS(n476) );
  HAX1 U729 ( .A(a[16]), .B(a[15]), .YC(n460), .YS(n477) );
  AND2X2 U733 ( .A(n782), .B(b[15]), .Y(n890) );
  AND2X2 U734 ( .A(n786), .B(n442), .Y(n891) );
  AND2X2 U735 ( .A(n785), .B(n439), .Y(n892) );
  AND2X2 U736 ( .A(n784), .B(n436), .Y(n893) );
  AND2X2 U737 ( .A(n783), .B(n433), .Y(n894) );
  AND2X2 U738 ( .A(n787), .B(n445), .Y(n895) );
  AND2X2 U739 ( .A(n787), .B(n443), .Y(n896) );
  AND2X2 U740 ( .A(n791), .B(n440), .Y(n897) );
  AND2X2 U741 ( .A(n790), .B(n437), .Y(n898) );
  AND2X2 U742 ( .A(n789), .B(n434), .Y(n899) );
  AND2X2 U743 ( .A(n788), .B(n431), .Y(n900) );
  NAND2X1 U744 ( .A(n890), .B(n51), .Y(n901) );
  NAND2X1 U745 ( .A(n819), .B(n21), .Y(n902) );
  NAND2X1 U746 ( .A(n818), .B(n21), .Y(n903) );
  NAND2X1 U747 ( .A(n817), .B(n21), .Y(n904) );
  NAND2X1 U748 ( .A(n816), .B(n21), .Y(n905) );
  NAND2X1 U749 ( .A(n815), .B(n21), .Y(n906) );
  BUFX2 U750 ( .A(n806), .Y(n7) );
  BUFX2 U751 ( .A(n803), .Y(n19) );
  BUFX2 U752 ( .A(n805), .Y(n11) );
  BUFX2 U753 ( .A(n804), .Y(n15) );
  BUFX2 U754 ( .A(n807), .Y(n3) );
  BUFX2 U755 ( .A(n806), .Y(n8) );
  BUFX2 U756 ( .A(n805), .Y(n12) );
  BUFX2 U757 ( .A(n804), .Y(n16) );
  BUFX2 U758 ( .A(n803), .Y(n20) );
  BUFX2 U759 ( .A(n807), .Y(n4) );
  BUFX2 U760 ( .A(n841), .Y(n819) );
  BUFX2 U761 ( .A(n840), .Y(n818) );
  BUFX2 U762 ( .A(n839), .Y(n817) );
  BUFX2 U763 ( .A(n838), .Y(n816) );
  BUFX2 U764 ( .A(n837), .Y(n815) );
  INVX2 U765 ( .A(n461), .Y(n748) );
  INVX2 U766 ( .A(n476), .Y(n763) );
  INVX2 U767 ( .A(n474), .Y(n761) );
  INVX2 U768 ( .A(n475), .Y(n762) );
  INVX2 U769 ( .A(n473), .Y(n760) );
  INVX2 U770 ( .A(n472), .Y(n759) );
  INVX2 U771 ( .A(n471), .Y(n758) );
  INVX2 U772 ( .A(n470), .Y(n757) );
  INVX2 U773 ( .A(n469), .Y(n756) );
  INVX2 U774 ( .A(n467), .Y(n754) );
  INVX2 U775 ( .A(n468), .Y(n755) );
  INVX2 U776 ( .A(n466), .Y(n753) );
  INVX2 U777 ( .A(n464), .Y(n751) );
  INVX2 U778 ( .A(n465), .Y(n752) );
  INVX2 U779 ( .A(n463), .Y(n750) );
  INVX2 U780 ( .A(n462), .Y(n749) );
  INVX2 U781 ( .A(n477), .Y(n764) );
  BUFX4 U782 ( .A(b[2]), .Y(n1) );
  BUFX4 U783 ( .A(b[5]), .Y(n5) );
  BUFX4 U784 ( .A(b[8]), .Y(n9) );
  BUFX4 U785 ( .A(b[11]), .Y(n13) );
  BUFX4 U786 ( .A(b[14]), .Y(n17) );
  BUFX2 U787 ( .A(a[17]), .Y(n25) );
  BUFX2 U788 ( .A(a[18]), .Y(n27) );
  BUFX2 U789 ( .A(a[19]), .Y(n29) );
  BUFX2 U790 ( .A(a[20]), .Y(n31) );
  BUFX2 U791 ( .A(a[21]), .Y(n33) );
  BUFX2 U792 ( .A(a[22]), .Y(n35) );
  BUFX2 U793 ( .A(a[23]), .Y(n37) );
  BUFX2 U794 ( .A(a[24]), .Y(n39) );
  BUFX2 U795 ( .A(a[25]), .Y(n41) );
  BUFX2 U796 ( .A(a[26]), .Y(n43) );
  BUFX2 U797 ( .A(a[27]), .Y(n45) );
  BUFX2 U798 ( .A(a[28]), .Y(n47) );
  BUFX2 U799 ( .A(a[29]), .Y(n49) );
  BUFX2 U800 ( .A(a[16]), .Y(n23) );
  BUFX2 U801 ( .A(a[15]), .Y(n21) );
  BUFX2 U802 ( .A(a[30]), .Y(n51) );
  INVX2 U803 ( .A(a[15]), .Y(n765) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_add_0 add_41 ( .A({src1_data[16], src1_data}), .B({src2_data[16], 
        src2_data}), .CI(1'b0), .SUM(large_sum) );
  alu_DW01_sub_0 sub_44 ( .A({src1_data[16], src1_data}), .B({src2_data[16], 
        src2_data}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW_mult_uns_1 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b(src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U4 ( .A(n25), .Y(n8) );
  BUFX2 U7 ( .A(n5), .Y(n1) );
  INVX2 U8 ( .A(n42), .Y(n6) );
  BUFX2 U9 ( .A(n7), .Y(n2) );
  NAND2X1 U10 ( .A(n3), .B(n4), .Y(result[9]) );
  AOI22X1 U11 ( .A(src1_data[9]), .B(n1), .C(full_mult[39]), .D(n6), .Y(n4) );
  AOI22X1 U12 ( .A(large_dif[9]), .B(n2), .C(large_sum[9]), .D(n8), .Y(n3) );
  NAND2X1 U13 ( .A(n9), .B(n10), .Y(result[8]) );
  AOI22X1 U14 ( .A(src1_data[8]), .B(n1), .C(full_mult[38]), .D(n6), .Y(n10)
         );
  AOI22X1 U15 ( .A(large_dif[8]), .B(n2), .C(large_sum[8]), .D(n8), .Y(n9) );
  NAND2X1 U16 ( .A(n11), .B(n12), .Y(result[7]) );
  AOI22X1 U17 ( .A(src1_data[7]), .B(n1), .C(full_mult[37]), .D(n6), .Y(n12)
         );
  AOI22X1 U18 ( .A(large_dif[7]), .B(n2), .C(large_sum[7]), .D(n8), .Y(n11) );
  NAND2X1 U19 ( .A(n13), .B(n14), .Y(result[6]) );
  AOI22X1 U20 ( .A(src1_data[6]), .B(n1), .C(full_mult[36]), .D(n6), .Y(n14)
         );
  AOI22X1 U21 ( .A(large_dif[6]), .B(n2), .C(large_sum[6]), .D(n8), .Y(n13) );
  NAND2X1 U22 ( .A(n15), .B(n16), .Y(result[5]) );
  AOI22X1 U23 ( .A(src1_data[5]), .B(n1), .C(full_mult[35]), .D(n6), .Y(n16)
         );
  AOI22X1 U24 ( .A(large_dif[5]), .B(n2), .C(large_sum[5]), .D(n8), .Y(n15) );
  NAND2X1 U25 ( .A(n17), .B(n18), .Y(result[4]) );
  AOI22X1 U26 ( .A(src1_data[4]), .B(n1), .C(full_mult[34]), .D(n6), .Y(n18)
         );
  AOI22X1 U27 ( .A(large_dif[4]), .B(n2), .C(large_sum[4]), .D(n8), .Y(n17) );
  NAND2X1 U28 ( .A(n19), .B(n20), .Y(result[3]) );
  AOI22X1 U29 ( .A(src1_data[3]), .B(n1), .C(full_mult[33]), .D(n6), .Y(n20)
         );
  AOI22X1 U30 ( .A(large_dif[3]), .B(n2), .C(large_sum[3]), .D(n8), .Y(n19) );
  NAND2X1 U31 ( .A(n21), .B(n22), .Y(result[2]) );
  AOI22X1 U32 ( .A(src1_data[2]), .B(n1), .C(full_mult[32]), .D(n6), .Y(n22)
         );
  AOI22X1 U33 ( .A(large_dif[2]), .B(n2), .C(large_sum[2]), .D(n8), .Y(n21) );
  NAND2X1 U34 ( .A(n23), .B(n24), .Y(result[1]) );
  AOI22X1 U35 ( .A(src1_data[1]), .B(n1), .C(full_mult[31]), .D(n6), .Y(n24)
         );
  AOI22X1 U36 ( .A(large_dif[1]), .B(n2), .C(large_sum[1]), .D(n8), .Y(n23) );
  OAI21X1 U37 ( .A(n25), .B(n26), .C(n27), .Y(result[16]) );
  AOI22X1 U38 ( .A(src1_data[16]), .B(n1), .C(large_dif[16]), .D(n2), .Y(n27)
         );
  INVX1 U39 ( .A(large_sum[16]), .Y(n26) );
  NAND2X1 U40 ( .A(n28), .B(n29), .Y(result[15]) );
  AOI22X1 U41 ( .A(src1_data[15]), .B(n1), .C(full_mult[45]), .D(n6), .Y(n29)
         );
  AOI22X1 U42 ( .A(large_dif[15]), .B(n2), .C(large_sum[15]), .D(n8), .Y(n28)
         );
  NAND2X1 U43 ( .A(n30), .B(n31), .Y(result[14]) );
  AOI22X1 U44 ( .A(src1_data[14]), .B(n1), .C(full_mult[44]), .D(n6), .Y(n31)
         );
  AOI22X1 U45 ( .A(large_dif[14]), .B(n2), .C(large_sum[14]), .D(n8), .Y(n30)
         );
  NAND2X1 U46 ( .A(n32), .B(n33), .Y(result[13]) );
  AOI22X1 U47 ( .A(src1_data[13]), .B(n1), .C(full_mult[43]), .D(n6), .Y(n33)
         );
  AOI22X1 U48 ( .A(large_dif[13]), .B(n2), .C(large_sum[13]), .D(n8), .Y(n32)
         );
  NAND2X1 U49 ( .A(n34), .B(n35), .Y(result[12]) );
  AOI22X1 U50 ( .A(src1_data[12]), .B(n1), .C(full_mult[42]), .D(n6), .Y(n35)
         );
  AOI22X1 U51 ( .A(large_dif[12]), .B(n2), .C(large_sum[12]), .D(n8), .Y(n34)
         );
  NAND2X1 U52 ( .A(n36), .B(n37), .Y(result[11]) );
  AOI22X1 U53 ( .A(src1_data[11]), .B(n1), .C(full_mult[41]), .D(n6), .Y(n37)
         );
  AOI22X1 U54 ( .A(large_dif[11]), .B(n2), .C(large_sum[11]), .D(n8), .Y(n36)
         );
  NAND2X1 U55 ( .A(n38), .B(n39), .Y(result[10]) );
  AOI22X1 U56 ( .A(src1_data[10]), .B(n1), .C(full_mult[40]), .D(n6), .Y(n39)
         );
  AOI22X1 U57 ( .A(large_dif[10]), .B(n2), .C(large_sum[10]), .D(n8), .Y(n38)
         );
  NAND2X1 U58 ( .A(n40), .B(n41), .Y(result[0]) );
  AOI22X1 U59 ( .A(src1_data[0]), .B(n1), .C(full_mult[30]), .D(n6), .Y(n41)
         );
  NOR2X1 U60 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n5) );
  AOI22X1 U61 ( .A(large_dif[0]), .B(n2), .C(large_sum[0]), .D(n8), .Y(n40) );
  OAI21X1 U62 ( .A(n42), .B(n43), .C(n44), .Y(overflow) );
  AOI22X1 U63 ( .A(n2), .B(n45), .C(n8), .D(n46), .Y(n44) );
  XOR2X1 U64 ( .A(large_sum[17]), .B(large_sum[16]), .Y(n46) );
  NAND2X1 U65 ( .A(alu_op[0]), .B(n47), .Y(n25) );
  XOR2X1 U66 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n45) );
  NOR2X1 U67 ( .A(n47), .B(alu_op[0]), .Y(n7) );
  INVX1 U68 ( .A(alu_op[1]), .Y(n47) );
  INVX1 U69 ( .A(N26), .Y(n43) );
  NAND2X1 U70 ( .A(alu_op[1]), .B(alu_op[0]), .Y(n42) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n32), .new_value(w_data), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n25), .new_value(w_data), .current_value({
        \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] , 
        \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] , 
        \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] , 
        \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] , 
        \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] , 
        \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n24), .new_value(w_data), .current_value({
        \regs_matrix[2][16] , \regs_matrix[2][15] , \regs_matrix[2][14] , 
        \regs_matrix[2][13] , \regs_matrix[2][12] , \regs_matrix[2][11] , 
        \regs_matrix[2][10] , \regs_matrix[2][9] , \regs_matrix[2][8] , 
        \regs_matrix[2][7] , \regs_matrix[2][6] , \regs_matrix[2][5] , 
        \regs_matrix[2][4] , \regs_matrix[2][3] , \regs_matrix[2][2] , 
        \regs_matrix[2][1] , \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n23), .new_value(w_data), .current_value({
        \regs_matrix[3][16] , \regs_matrix[3][15] , \regs_matrix[3][14] , 
        \regs_matrix[3][13] , \regs_matrix[3][12] , \regs_matrix[3][11] , 
        \regs_matrix[3][10] , \regs_matrix[3][9] , \regs_matrix[3][8] , 
        \regs_matrix[3][7] , \regs_matrix[3][6] , \regs_matrix[3][5] , 
        \regs_matrix[3][4] , \regs_matrix[3][3] , \regs_matrix[3][2] , 
        \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n22), .new_value(w_data), .current_value({
        \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] , 
        \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] , 
        \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] , 
        \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] , 
        \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] , 
        \regs_matrix[4][1] , \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n21), .new_value(w_data), .current_value({
        \regs_matrix[5][16] , \regs_matrix[5][15] , \regs_matrix[5][14] , 
        \regs_matrix[5][13] , \regs_matrix[5][12] , \regs_matrix[5][11] , 
        \regs_matrix[5][10] , \regs_matrix[5][9] , \regs_matrix[5][8] , 
        \regs_matrix[5][7] , \regs_matrix[5][6] , \regs_matrix[5][5] , 
        \regs_matrix[5][4] , \regs_matrix[5][3] , \regs_matrix[5][2] , 
        \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n20), .new_value(w_data), .current_value({
        \regs_matrix[6][16] , \regs_matrix[6][15] , \regs_matrix[6][14] , 
        \regs_matrix[6][13] , \regs_matrix[6][12] , \regs_matrix[6][11] , 
        \regs_matrix[6][10] , \regs_matrix[6][9] , \regs_matrix[6][8] , 
        \regs_matrix[6][7] , \regs_matrix[6][6] , \regs_matrix[6][5] , 
        \regs_matrix[6][4] , \regs_matrix[6][3] , \regs_matrix[6][2] , 
        \regs_matrix[6][1] , \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n19), .new_value(w_data), .current_value({
        \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] , 
        \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] , 
        \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] , 
        \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] , 
        \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] , 
        \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n18), .new_value(w_data), .current_value({
        \regs_matrix[8][16] , \regs_matrix[8][15] , \regs_matrix[8][14] , 
        \regs_matrix[8][13] , \regs_matrix[8][12] , \regs_matrix[8][11] , 
        \regs_matrix[8][10] , \regs_matrix[8][9] , \regs_matrix[8][8] , 
        \regs_matrix[8][7] , \regs_matrix[8][6] , \regs_matrix[8][5] , 
        \regs_matrix[8][4] , \regs_matrix[8][3] , \regs_matrix[8][2] , 
        \regs_matrix[8][1] , \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n17), .new_value(w_data), .current_value({
        \regs_matrix[9][16] , \regs_matrix[9][15] , \regs_matrix[9][14] , 
        \regs_matrix[9][13] , \regs_matrix[9][12] , \regs_matrix[9][11] , 
        \regs_matrix[9][10] , \regs_matrix[9][9] , \regs_matrix[9][8] , 
        \regs_matrix[9][7] , \regs_matrix[9][6] , \regs_matrix[9][5] , 
        \regs_matrix[9][4] , \regs_matrix[9][3] , \regs_matrix[9][2] , 
        \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n31), .new_value(w_data), .current_value({
        \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] , 
        \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] , 
        \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] , 
        \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] , 
        \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] , 
        \regs_matrix[10][1] , \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n30), .new_value(w_data), .current_value({
        \regs_matrix[11][16] , \regs_matrix[11][15] , \regs_matrix[11][14] , 
        \regs_matrix[11][13] , \regs_matrix[11][12] , \regs_matrix[11][11] , 
        \regs_matrix[11][10] , \regs_matrix[11][9] , \regs_matrix[11][8] , 
        \regs_matrix[11][7] , \regs_matrix[11][6] , \regs_matrix[11][5] , 
        \regs_matrix[11][4] , \regs_matrix[11][3] , \regs_matrix[11][2] , 
        \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n29), .new_value(w_data), .current_value({
        \regs_matrix[12][16] , \regs_matrix[12][15] , \regs_matrix[12][14] , 
        \regs_matrix[12][13] , \regs_matrix[12][12] , \regs_matrix[12][11] , 
        \regs_matrix[12][10] , \regs_matrix[12][9] , \regs_matrix[12][8] , 
        \regs_matrix[12][7] , \regs_matrix[12][6] , \regs_matrix[12][5] , 
        \regs_matrix[12][4] , \regs_matrix[12][3] , \regs_matrix[12][2] , 
        \regs_matrix[12][1] , \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n28), .new_value(w_data), .current_value({
        \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] , 
        \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] , 
        \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] , 
        \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] , 
        \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] , 
        \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n27), .new_value(w_data), .current_value({
        \regs_matrix[14][16] , \regs_matrix[14][15] , \regs_matrix[14][14] , 
        \regs_matrix[14][13] , \regs_matrix[14][12] , \regs_matrix[14][11] , 
        \regs_matrix[14][10] , \regs_matrix[14][9] , \regs_matrix[14][8] , 
        \regs_matrix[14][7] , \regs_matrix[14][6] , \regs_matrix[14][5] , 
        \regs_matrix[14][4] , \regs_matrix[14][3] , \regs_matrix[14][2] , 
        \regs_matrix[14][1] , \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n26), .new_value(w_data), .current_value({
        \regs_matrix[15][16] , \regs_matrix[15][15] , \regs_matrix[15][14] , 
        \regs_matrix[15][13] , \regs_matrix[15][12] , \regs_matrix[15][11] , 
        \regs_matrix[15][10] , \regs_matrix[15][9] , \regs_matrix[15][8] , 
        \regs_matrix[15][7] , \regs_matrix[15][6] , \regs_matrix[15][5] , 
        \regs_matrix[15][4] , \regs_matrix[15][3] , \regs_matrix[15][2] , 
        \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  OR2X2 U2 ( .A(n662), .B(n664), .Y(n1) );
  OR2X2 U3 ( .A(n666), .B(n668), .Y(n2) );
  OR2X2 U4 ( .A(n664), .B(n668), .Y(n3) );
  OR2X2 U5 ( .A(n666), .B(n667), .Y(n4) );
  OR2X2 U6 ( .A(n664), .B(n667), .Y(n5) );
  OR2X2 U7 ( .A(n665), .B(n666), .Y(n6) );
  OR2X2 U8 ( .A(n664), .B(n665), .Y(n7) );
  OR2X2 U9 ( .A(n662), .B(n663), .Y(n8) );
  OR2X2 U10 ( .A(n661), .B(n662), .Y(n9) );
  OR2X2 U11 ( .A(n663), .B(n668), .Y(n10) );
  OR2X2 U12 ( .A(n661), .B(n668), .Y(n11) );
  OR2X2 U13 ( .A(n663), .B(n667), .Y(n12) );
  OR2X2 U14 ( .A(n661), .B(n667), .Y(n13) );
  OR2X2 U15 ( .A(n663), .B(n665), .Y(n14) );
  OR2X2 U16 ( .A(n661), .B(n665), .Y(n15) );
  OR2X2 U17 ( .A(n662), .B(n666), .Y(n16) );
  INVX2 U18 ( .A(n9), .Y(n17) );
  INVX2 U19 ( .A(n8), .Y(n18) );
  INVX2 U20 ( .A(n7), .Y(n19) );
  INVX2 U21 ( .A(n6), .Y(n20) );
  INVX2 U22 ( .A(n5), .Y(n21) );
  INVX2 U23 ( .A(n4), .Y(n22) );
  INVX2 U24 ( .A(n3), .Y(n23) );
  INVX2 U25 ( .A(n2), .Y(n24) );
  INVX2 U26 ( .A(n1), .Y(n25) );
  INVX2 U27 ( .A(n15), .Y(n26) );
  INVX2 U28 ( .A(n14), .Y(n27) );
  INVX2 U29 ( .A(n13), .Y(n28) );
  INVX2 U30 ( .A(n12), .Y(n29) );
  INVX2 U31 ( .A(n11), .Y(n30) );
  INVX2 U32 ( .A(n10), .Y(n31) );
  INVX2 U33 ( .A(n16), .Y(n32) );
  BUFX2 U34 ( .A(n341), .Y(n33) );
  BUFX2 U35 ( .A(n647), .Y(n34) );
  BUFX2 U36 ( .A(n641), .Y(n35) );
  BUFX2 U37 ( .A(n335), .Y(n36) );
  BUFX2 U38 ( .A(n338), .Y(n37) );
  BUFX2 U39 ( .A(n644), .Y(n38) );
  BUFX2 U40 ( .A(n639), .Y(n39) );
  BUFX2 U41 ( .A(n333), .Y(n40) );
  BUFX2 U42 ( .A(n343), .Y(n41) );
  BUFX2 U43 ( .A(n648), .Y(n42) );
  BUFX2 U44 ( .A(n638), .Y(n43) );
  BUFX2 U45 ( .A(n334), .Y(n44) );
  BUFX2 U46 ( .A(n649), .Y(n45) );
  BUFX2 U47 ( .A(n640), .Y(n46) );
  BUFX2 U48 ( .A(n332), .Y(n47) );
  BUFX2 U49 ( .A(n342), .Y(n48) );
  NOR2X1 U50 ( .A(n352), .B(N12), .Y(n51) );
  NAND2X1 U51 ( .A(n51), .B(N10), .Y(n333) );
  NOR2X1 U52 ( .A(N11), .B(N12), .Y(n52) );
  NAND2X1 U53 ( .A(n52), .B(N10), .Y(n332) );
  OAI22X1 U54 ( .A(\regs_matrix[11][0] ), .B(n333), .C(\regs_matrix[9][0] ), 
        .D(n332), .Y(n50) );
  NOR2X1 U55 ( .A(n353), .B(n352), .Y(n55) );
  NAND2X1 U56 ( .A(N10), .B(n55), .Y(n335) );
  NOR2X1 U57 ( .A(n353), .B(N11), .Y(n56) );
  NAND2X1 U58 ( .A(n56), .B(N10), .Y(n334) );
  OAI22X1 U59 ( .A(\regs_matrix[15][0] ), .B(n335), .C(\regs_matrix[13][0] ), 
        .D(n334), .Y(n49) );
  NOR2X1 U60 ( .A(n50), .B(n49), .Y(n68) );
  NAND2X1 U61 ( .A(n51), .B(n351), .Y(n341) );
  NAND2X1 U62 ( .A(n52), .B(n351), .Y(n338) );
  NOR2X1 U63 ( .A(\regs_matrix[8][0] ), .B(n338), .Y(n53) );
  NOR2X1 U64 ( .A(n354), .B(n53), .Y(n54) );
  OAI21X1 U65 ( .A(\regs_matrix[10][0] ), .B(n341), .C(n54), .Y(n58) );
  NAND2X1 U66 ( .A(n55), .B(n351), .Y(n343) );
  NAND2X1 U67 ( .A(n56), .B(n351), .Y(n342) );
  OAI22X1 U68 ( .A(\regs_matrix[14][0] ), .B(n343), .C(\regs_matrix[12][0] ), 
        .D(n342), .Y(n57) );
  NOR2X1 U69 ( .A(n58), .B(n57), .Y(n67) );
  OAI22X1 U70 ( .A(\regs_matrix[3][0] ), .B(n333), .C(\regs_matrix[1][0] ), 
        .D(n332), .Y(n60) );
  OAI22X1 U71 ( .A(\regs_matrix[7][0] ), .B(n335), .C(\regs_matrix[5][0] ), 
        .D(n334), .Y(n59) );
  NOR2X1 U72 ( .A(n60), .B(n59), .Y(n66) );
  NOR2X1 U73 ( .A(outreg_data[0]), .B(n338), .Y(n61) );
  NOR2X1 U74 ( .A(N13), .B(n61), .Y(n62) );
  OAI21X1 U75 ( .A(\regs_matrix[2][0] ), .B(n341), .C(n62), .Y(n64) );
  OAI22X1 U76 ( .A(\regs_matrix[6][0] ), .B(n343), .C(\regs_matrix[4][0] ), 
        .D(n342), .Y(n63) );
  NOR2X1 U77 ( .A(n64), .B(n63), .Y(n65) );
  AOI22X1 U78 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(n69) );
  OAI22X1 U79 ( .A(\regs_matrix[11][1] ), .B(n333), .C(\regs_matrix[9][1] ), 
        .D(n332), .Y(n71) );
  OAI22X1 U80 ( .A(\regs_matrix[15][1] ), .B(n335), .C(\regs_matrix[13][1] ), 
        .D(n334), .Y(n70) );
  NOR2X1 U81 ( .A(n71), .B(n70), .Y(n85) );
  NOR2X1 U82 ( .A(\regs_matrix[8][1] ), .B(n338), .Y(n72) );
  NOR2X1 U83 ( .A(n354), .B(n72), .Y(n73) );
  OAI21X1 U84 ( .A(\regs_matrix[10][1] ), .B(n341), .C(n73), .Y(n75) );
  OAI22X1 U85 ( .A(\regs_matrix[14][1] ), .B(n343), .C(\regs_matrix[12][1] ), 
        .D(n342), .Y(n74) );
  NOR2X1 U86 ( .A(n75), .B(n74), .Y(n84) );
  OAI22X1 U87 ( .A(\regs_matrix[3][1] ), .B(n333), .C(\regs_matrix[1][1] ), 
        .D(n332), .Y(n77) );
  OAI22X1 U88 ( .A(\regs_matrix[7][1] ), .B(n335), .C(\regs_matrix[5][1] ), 
        .D(n334), .Y(n76) );
  NOR2X1 U89 ( .A(n77), .B(n76), .Y(n83) );
  NOR2X1 U90 ( .A(outreg_data[1]), .B(n338), .Y(n78) );
  NOR2X1 U91 ( .A(N13), .B(n78), .Y(n79) );
  OAI21X1 U92 ( .A(\regs_matrix[2][1] ), .B(n341), .C(n79), .Y(n81) );
  OAI22X1 U93 ( .A(\regs_matrix[6][1] ), .B(n343), .C(\regs_matrix[4][1] ), 
        .D(n342), .Y(n80) );
  NOR2X1 U94 ( .A(n81), .B(n80), .Y(n82) );
  AOI22X1 U95 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n86) );
  OAI22X1 U96 ( .A(\regs_matrix[11][2] ), .B(n333), .C(\regs_matrix[9][2] ), 
        .D(n332), .Y(n88) );
  OAI22X1 U97 ( .A(\regs_matrix[15][2] ), .B(n335), .C(\regs_matrix[13][2] ), 
        .D(n334), .Y(n87) );
  NOR2X1 U98 ( .A(n88), .B(n87), .Y(n102) );
  NOR2X1 U99 ( .A(\regs_matrix[8][2] ), .B(n338), .Y(n89) );
  NOR2X1 U100 ( .A(n354), .B(n89), .Y(n90) );
  OAI21X1 U101 ( .A(\regs_matrix[10][2] ), .B(n341), .C(n90), .Y(n92) );
  OAI22X1 U102 ( .A(\regs_matrix[14][2] ), .B(n343), .C(\regs_matrix[12][2] ), 
        .D(n342), .Y(n91) );
  NOR2X1 U103 ( .A(n92), .B(n91), .Y(n101) );
  OAI22X1 U104 ( .A(\regs_matrix[3][2] ), .B(n333), .C(\regs_matrix[1][2] ), 
        .D(n332), .Y(n94) );
  OAI22X1 U105 ( .A(\regs_matrix[7][2] ), .B(n335), .C(\regs_matrix[5][2] ), 
        .D(n334), .Y(n93) );
  NOR2X1 U106 ( .A(n94), .B(n93), .Y(n100) );
  NOR2X1 U107 ( .A(outreg_data[2]), .B(n338), .Y(n95) );
  NOR2X1 U108 ( .A(N13), .B(n95), .Y(n96) );
  OAI21X1 U109 ( .A(\regs_matrix[2][2] ), .B(n341), .C(n96), .Y(n98) );
  OAI22X1 U110 ( .A(\regs_matrix[6][2] ), .B(n343), .C(\regs_matrix[4][2] ), 
        .D(n342), .Y(n97) );
  NOR2X1 U111 ( .A(n98), .B(n97), .Y(n99) );
  AOI22X1 U112 ( .A(n102), .B(n101), .C(n100), .D(n99), .Y(n103) );
  OAI22X1 U113 ( .A(\regs_matrix[11][3] ), .B(n333), .C(\regs_matrix[9][3] ), 
        .D(n332), .Y(n105) );
  OAI22X1 U114 ( .A(\regs_matrix[15][3] ), .B(n335), .C(\regs_matrix[13][3] ), 
        .D(n334), .Y(n104) );
  NOR2X1 U115 ( .A(n105), .B(n104), .Y(n119) );
  NOR2X1 U116 ( .A(\regs_matrix[8][3] ), .B(n338), .Y(n106) );
  NOR2X1 U117 ( .A(n354), .B(n106), .Y(n107) );
  OAI21X1 U118 ( .A(\regs_matrix[10][3] ), .B(n341), .C(n107), .Y(n109) );
  OAI22X1 U119 ( .A(\regs_matrix[14][3] ), .B(n343), .C(\regs_matrix[12][3] ), 
        .D(n342), .Y(n108) );
  NOR2X1 U120 ( .A(n109), .B(n108), .Y(n118) );
  OAI22X1 U121 ( .A(\regs_matrix[3][3] ), .B(n333), .C(\regs_matrix[1][3] ), 
        .D(n332), .Y(n111) );
  OAI22X1 U122 ( .A(\regs_matrix[7][3] ), .B(n335), .C(\regs_matrix[5][3] ), 
        .D(n334), .Y(n110) );
  NOR2X1 U123 ( .A(n111), .B(n110), .Y(n117) );
  NOR2X1 U124 ( .A(outreg_data[3]), .B(n338), .Y(n112) );
  NOR2X1 U125 ( .A(N13), .B(n112), .Y(n113) );
  OAI21X1 U126 ( .A(\regs_matrix[2][3] ), .B(n341), .C(n113), .Y(n115) );
  OAI22X1 U127 ( .A(\regs_matrix[6][3] ), .B(n343), .C(\regs_matrix[4][3] ), 
        .D(n342), .Y(n114) );
  NOR2X1 U128 ( .A(n115), .B(n114), .Y(n116) );
  AOI22X1 U129 ( .A(n119), .B(n118), .C(n117), .D(n116), .Y(n120) );
  OAI22X1 U130 ( .A(\regs_matrix[11][4] ), .B(n40), .C(\regs_matrix[9][4] ), 
        .D(n332), .Y(n122) );
  OAI22X1 U131 ( .A(\regs_matrix[15][4] ), .B(n36), .C(\regs_matrix[13][4] ), 
        .D(n334), .Y(n121) );
  NOR2X1 U132 ( .A(n122), .B(n121), .Y(n136) );
  NOR2X1 U133 ( .A(\regs_matrix[8][4] ), .B(n338), .Y(n123) );
  NOR2X1 U134 ( .A(n354), .B(n123), .Y(n124) );
  OAI21X1 U135 ( .A(\regs_matrix[10][4] ), .B(n341), .C(n124), .Y(n126) );
  OAI22X1 U136 ( .A(\regs_matrix[14][4] ), .B(n41), .C(\regs_matrix[12][4] ), 
        .D(n342), .Y(n125) );
  NOR2X1 U137 ( .A(n126), .B(n125), .Y(n135) );
  OAI22X1 U138 ( .A(\regs_matrix[3][4] ), .B(n40), .C(\regs_matrix[1][4] ), 
        .D(n47), .Y(n128) );
  OAI22X1 U139 ( .A(\regs_matrix[7][4] ), .B(n36), .C(\regs_matrix[5][4] ), 
        .D(n44), .Y(n127) );
  NOR2X1 U140 ( .A(n128), .B(n127), .Y(n134) );
  NOR2X1 U141 ( .A(outreg_data[4]), .B(n338), .Y(n129) );
  NOR2X1 U142 ( .A(N13), .B(n129), .Y(n130) );
  OAI21X1 U143 ( .A(\regs_matrix[2][4] ), .B(n33), .C(n130), .Y(n132) );
  OAI22X1 U144 ( .A(\regs_matrix[6][4] ), .B(n41), .C(\regs_matrix[4][4] ), 
        .D(n48), .Y(n131) );
  NOR2X1 U145 ( .A(n132), .B(n131), .Y(n133) );
  AOI22X1 U146 ( .A(n136), .B(n135), .C(n134), .D(n133), .Y(n137) );
  OAI22X1 U147 ( .A(\regs_matrix[11][5] ), .B(n40), .C(\regs_matrix[9][5] ), 
        .D(n47), .Y(n139) );
  OAI22X1 U148 ( .A(\regs_matrix[15][5] ), .B(n36), .C(\regs_matrix[13][5] ), 
        .D(n44), .Y(n138) );
  NOR2X1 U149 ( .A(n139), .B(n138), .Y(n153) );
  NOR2X1 U150 ( .A(\regs_matrix[8][5] ), .B(n338), .Y(n140) );
  NOR2X1 U151 ( .A(n354), .B(n140), .Y(n141) );
  OAI21X1 U152 ( .A(\regs_matrix[10][5] ), .B(n33), .C(n141), .Y(n143) );
  OAI22X1 U153 ( .A(\regs_matrix[14][5] ), .B(n41), .C(\regs_matrix[12][5] ), 
        .D(n48), .Y(n142) );
  NOR2X1 U154 ( .A(n143), .B(n142), .Y(n152) );
  OAI22X1 U155 ( .A(\regs_matrix[3][5] ), .B(n40), .C(\regs_matrix[1][5] ), 
        .D(n47), .Y(n145) );
  OAI22X1 U156 ( .A(\regs_matrix[7][5] ), .B(n36), .C(\regs_matrix[5][5] ), 
        .D(n44), .Y(n144) );
  NOR2X1 U157 ( .A(n145), .B(n144), .Y(n151) );
  NOR2X1 U158 ( .A(outreg_data[5]), .B(n338), .Y(n146) );
  NOR2X1 U159 ( .A(N13), .B(n146), .Y(n147) );
  OAI21X1 U160 ( .A(\regs_matrix[2][5] ), .B(n33), .C(n147), .Y(n149) );
  OAI22X1 U161 ( .A(\regs_matrix[6][5] ), .B(n41), .C(\regs_matrix[4][5] ), 
        .D(n48), .Y(n148) );
  NOR2X1 U162 ( .A(n149), .B(n148), .Y(n150) );
  AOI22X1 U163 ( .A(n153), .B(n152), .C(n151), .D(n150), .Y(n154) );
  OAI22X1 U164 ( .A(\regs_matrix[11][6] ), .B(n40), .C(\regs_matrix[9][6] ), 
        .D(n47), .Y(n156) );
  OAI22X1 U165 ( .A(\regs_matrix[15][6] ), .B(n36), .C(\regs_matrix[13][6] ), 
        .D(n44), .Y(n155) );
  NOR2X1 U166 ( .A(n156), .B(n155), .Y(n170) );
  NOR2X1 U167 ( .A(\regs_matrix[8][6] ), .B(n338), .Y(n157) );
  NOR2X1 U168 ( .A(n354), .B(n157), .Y(n158) );
  OAI21X1 U169 ( .A(\regs_matrix[10][6] ), .B(n33), .C(n158), .Y(n160) );
  OAI22X1 U170 ( .A(\regs_matrix[14][6] ), .B(n41), .C(\regs_matrix[12][6] ), 
        .D(n48), .Y(n159) );
  NOR2X1 U171 ( .A(n160), .B(n159), .Y(n169) );
  OAI22X1 U172 ( .A(\regs_matrix[3][6] ), .B(n40), .C(\regs_matrix[1][6] ), 
        .D(n47), .Y(n162) );
  OAI22X1 U173 ( .A(\regs_matrix[7][6] ), .B(n36), .C(\regs_matrix[5][6] ), 
        .D(n44), .Y(n161) );
  NOR2X1 U174 ( .A(n162), .B(n161), .Y(n168) );
  NOR2X1 U175 ( .A(outreg_data[6]), .B(n37), .Y(n163) );
  NOR2X1 U176 ( .A(N13), .B(n163), .Y(n164) );
  OAI21X1 U177 ( .A(\regs_matrix[2][6] ), .B(n33), .C(n164), .Y(n166) );
  OAI22X1 U178 ( .A(\regs_matrix[6][6] ), .B(n41), .C(\regs_matrix[4][6] ), 
        .D(n48), .Y(n165) );
  NOR2X1 U179 ( .A(n166), .B(n165), .Y(n167) );
  AOI22X1 U180 ( .A(n170), .B(n169), .C(n168), .D(n167), .Y(n171) );
  OAI22X1 U181 ( .A(\regs_matrix[11][7] ), .B(n40), .C(\regs_matrix[9][7] ), 
        .D(n47), .Y(n173) );
  OAI22X1 U182 ( .A(\regs_matrix[15][7] ), .B(n36), .C(\regs_matrix[13][7] ), 
        .D(n44), .Y(n172) );
  NOR2X1 U183 ( .A(n173), .B(n172), .Y(n187) );
  NOR2X1 U184 ( .A(\regs_matrix[8][7] ), .B(n37), .Y(n174) );
  NOR2X1 U185 ( .A(n354), .B(n174), .Y(n175) );
  OAI21X1 U186 ( .A(\regs_matrix[10][7] ), .B(n33), .C(n175), .Y(n177) );
  OAI22X1 U187 ( .A(\regs_matrix[14][7] ), .B(n41), .C(\regs_matrix[12][7] ), 
        .D(n48), .Y(n176) );
  NOR2X1 U188 ( .A(n177), .B(n176), .Y(n186) );
  OAI22X1 U189 ( .A(\regs_matrix[3][7] ), .B(n40), .C(\regs_matrix[1][7] ), 
        .D(n47), .Y(n179) );
  OAI22X1 U190 ( .A(\regs_matrix[7][7] ), .B(n36), .C(\regs_matrix[5][7] ), 
        .D(n44), .Y(n178) );
  NOR2X1 U191 ( .A(n179), .B(n178), .Y(n185) );
  NOR2X1 U192 ( .A(outreg_data[7]), .B(n37), .Y(n180) );
  NOR2X1 U193 ( .A(N13), .B(n180), .Y(n181) );
  OAI21X1 U194 ( .A(\regs_matrix[2][7] ), .B(n33), .C(n181), .Y(n183) );
  OAI22X1 U195 ( .A(\regs_matrix[6][7] ), .B(n41), .C(\regs_matrix[4][7] ), 
        .D(n48), .Y(n182) );
  NOR2X1 U196 ( .A(n183), .B(n182), .Y(n184) );
  AOI22X1 U197 ( .A(n187), .B(n186), .C(n185), .D(n184), .Y(n188) );
  OAI22X1 U198 ( .A(\regs_matrix[11][8] ), .B(n40), .C(\regs_matrix[9][8] ), 
        .D(n47), .Y(n190) );
  OAI22X1 U199 ( .A(\regs_matrix[15][8] ), .B(n36), .C(\regs_matrix[13][8] ), 
        .D(n44), .Y(n189) );
  NOR2X1 U200 ( .A(n190), .B(n189), .Y(n204) );
  NOR2X1 U201 ( .A(\regs_matrix[8][8] ), .B(n37), .Y(n191) );
  NOR2X1 U202 ( .A(n354), .B(n191), .Y(n192) );
  OAI21X1 U203 ( .A(\regs_matrix[10][8] ), .B(n33), .C(n192), .Y(n194) );
  OAI22X1 U204 ( .A(\regs_matrix[14][8] ), .B(n41), .C(\regs_matrix[12][8] ), 
        .D(n48), .Y(n193) );
  NOR2X1 U205 ( .A(n194), .B(n193), .Y(n203) );
  OAI22X1 U206 ( .A(\regs_matrix[3][8] ), .B(n40), .C(\regs_matrix[1][8] ), 
        .D(n47), .Y(n196) );
  OAI22X1 U207 ( .A(\regs_matrix[7][8] ), .B(n36), .C(\regs_matrix[5][8] ), 
        .D(n44), .Y(n195) );
  NOR2X1 U208 ( .A(n196), .B(n195), .Y(n202) );
  NOR2X1 U209 ( .A(outreg_data[8]), .B(n37), .Y(n197) );
  NOR2X1 U210 ( .A(N13), .B(n197), .Y(n198) );
  OAI21X1 U211 ( .A(\regs_matrix[2][8] ), .B(n33), .C(n198), .Y(n200) );
  OAI22X1 U212 ( .A(\regs_matrix[6][8] ), .B(n41), .C(\regs_matrix[4][8] ), 
        .D(n48), .Y(n199) );
  NOR2X1 U213 ( .A(n200), .B(n199), .Y(n201) );
  AOI22X1 U214 ( .A(n204), .B(n203), .C(n202), .D(n201), .Y(n205) );
  OAI22X1 U215 ( .A(\regs_matrix[11][9] ), .B(n40), .C(\regs_matrix[9][9] ), 
        .D(n47), .Y(n207) );
  OAI22X1 U216 ( .A(\regs_matrix[15][9] ), .B(n36), .C(\regs_matrix[13][9] ), 
        .D(n44), .Y(n206) );
  NOR2X1 U217 ( .A(n207), .B(n206), .Y(n221) );
  NOR2X1 U218 ( .A(\regs_matrix[8][9] ), .B(n37), .Y(n208) );
  NOR2X1 U219 ( .A(n354), .B(n208), .Y(n209) );
  OAI21X1 U220 ( .A(\regs_matrix[10][9] ), .B(n33), .C(n209), .Y(n211) );
  OAI22X1 U221 ( .A(\regs_matrix[14][9] ), .B(n41), .C(\regs_matrix[12][9] ), 
        .D(n48), .Y(n210) );
  NOR2X1 U222 ( .A(n211), .B(n210), .Y(n220) );
  OAI22X1 U223 ( .A(\regs_matrix[3][9] ), .B(n40), .C(\regs_matrix[1][9] ), 
        .D(n47), .Y(n213) );
  OAI22X1 U224 ( .A(\regs_matrix[7][9] ), .B(n36), .C(\regs_matrix[5][9] ), 
        .D(n44), .Y(n212) );
  NOR2X1 U225 ( .A(n213), .B(n212), .Y(n219) );
  NOR2X1 U226 ( .A(outreg_data[9]), .B(n37), .Y(n214) );
  NOR2X1 U227 ( .A(N13), .B(n214), .Y(n215) );
  OAI21X1 U228 ( .A(\regs_matrix[2][9] ), .B(n33), .C(n215), .Y(n217) );
  OAI22X1 U229 ( .A(\regs_matrix[6][9] ), .B(n41), .C(\regs_matrix[4][9] ), 
        .D(n48), .Y(n216) );
  NOR2X1 U230 ( .A(n217), .B(n216), .Y(n218) );
  AOI22X1 U231 ( .A(n221), .B(n220), .C(n219), .D(n218), .Y(n222) );
  OAI22X1 U232 ( .A(\regs_matrix[11][10] ), .B(n40), .C(\regs_matrix[9][10] ), 
        .D(n47), .Y(n224) );
  OAI22X1 U233 ( .A(\regs_matrix[15][10] ), .B(n36), .C(\regs_matrix[13][10] ), 
        .D(n44), .Y(n223) );
  NOR2X1 U234 ( .A(n224), .B(n223), .Y(n238) );
  NOR2X1 U235 ( .A(\regs_matrix[8][10] ), .B(n37), .Y(n225) );
  NOR2X1 U236 ( .A(n354), .B(n225), .Y(n226) );
  OAI21X1 U237 ( .A(\regs_matrix[10][10] ), .B(n33), .C(n226), .Y(n228) );
  OAI22X1 U238 ( .A(\regs_matrix[14][10] ), .B(n41), .C(\regs_matrix[12][10] ), 
        .D(n48), .Y(n227) );
  NOR2X1 U239 ( .A(n228), .B(n227), .Y(n237) );
  OAI22X1 U240 ( .A(\regs_matrix[3][10] ), .B(n40), .C(\regs_matrix[1][10] ), 
        .D(n47), .Y(n230) );
  OAI22X1 U241 ( .A(\regs_matrix[7][10] ), .B(n36), .C(\regs_matrix[5][10] ), 
        .D(n44), .Y(n229) );
  NOR2X1 U242 ( .A(n230), .B(n229), .Y(n236) );
  NOR2X1 U243 ( .A(outreg_data[10]), .B(n37), .Y(n231) );
  NOR2X1 U244 ( .A(N13), .B(n231), .Y(n232) );
  OAI21X1 U245 ( .A(\regs_matrix[2][10] ), .B(n33), .C(n232), .Y(n234) );
  OAI22X1 U246 ( .A(\regs_matrix[6][10] ), .B(n41), .C(\regs_matrix[4][10] ), 
        .D(n48), .Y(n233) );
  NOR2X1 U247 ( .A(n234), .B(n233), .Y(n235) );
  AOI22X1 U248 ( .A(n238), .B(n237), .C(n236), .D(n235), .Y(n239) );
  OAI22X1 U249 ( .A(\regs_matrix[11][11] ), .B(n40), .C(\regs_matrix[9][11] ), 
        .D(n47), .Y(n241) );
  OAI22X1 U250 ( .A(\regs_matrix[15][11] ), .B(n36), .C(\regs_matrix[13][11] ), 
        .D(n44), .Y(n240) );
  NOR2X1 U251 ( .A(n241), .B(n240), .Y(n255) );
  NOR2X1 U252 ( .A(\regs_matrix[8][11] ), .B(n37), .Y(n242) );
  NOR2X1 U253 ( .A(n354), .B(n242), .Y(n243) );
  OAI21X1 U254 ( .A(\regs_matrix[10][11] ), .B(n33), .C(n243), .Y(n245) );
  OAI22X1 U255 ( .A(\regs_matrix[14][11] ), .B(n41), .C(\regs_matrix[12][11] ), 
        .D(n48), .Y(n244) );
  NOR2X1 U256 ( .A(n245), .B(n244), .Y(n254) );
  OAI22X1 U257 ( .A(\regs_matrix[3][11] ), .B(n40), .C(\regs_matrix[1][11] ), 
        .D(n47), .Y(n247) );
  OAI22X1 U258 ( .A(\regs_matrix[7][11] ), .B(n36), .C(\regs_matrix[5][11] ), 
        .D(n44), .Y(n246) );
  NOR2X1 U259 ( .A(n247), .B(n246), .Y(n253) );
  NOR2X1 U260 ( .A(outreg_data[11]), .B(n37), .Y(n248) );
  NOR2X1 U261 ( .A(N13), .B(n248), .Y(n249) );
  OAI21X1 U262 ( .A(\regs_matrix[2][11] ), .B(n33), .C(n249), .Y(n251) );
  OAI22X1 U263 ( .A(\regs_matrix[6][11] ), .B(n41), .C(\regs_matrix[4][11] ), 
        .D(n48), .Y(n250) );
  NOR2X1 U264 ( .A(n251), .B(n250), .Y(n252) );
  AOI22X1 U265 ( .A(n255), .B(n254), .C(n253), .D(n252), .Y(n256) );
  OAI22X1 U266 ( .A(\regs_matrix[11][12] ), .B(n40), .C(\regs_matrix[9][12] ), 
        .D(n47), .Y(n258) );
  OAI22X1 U267 ( .A(\regs_matrix[15][12] ), .B(n36), .C(\regs_matrix[13][12] ), 
        .D(n44), .Y(n257) );
  NOR2X1 U268 ( .A(n258), .B(n257), .Y(n272) );
  NOR2X1 U269 ( .A(\regs_matrix[8][12] ), .B(n37), .Y(n259) );
  NOR2X1 U270 ( .A(n354), .B(n259), .Y(n260) );
  OAI21X1 U271 ( .A(\regs_matrix[10][12] ), .B(n33), .C(n260), .Y(n262) );
  OAI22X1 U272 ( .A(\regs_matrix[14][12] ), .B(n41), .C(\regs_matrix[12][12] ), 
        .D(n48), .Y(n261) );
  NOR2X1 U273 ( .A(n262), .B(n261), .Y(n271) );
  OAI22X1 U274 ( .A(\regs_matrix[3][12] ), .B(n40), .C(\regs_matrix[1][12] ), 
        .D(n47), .Y(n264) );
  OAI22X1 U275 ( .A(\regs_matrix[7][12] ), .B(n36), .C(\regs_matrix[5][12] ), 
        .D(n44), .Y(n263) );
  NOR2X1 U276 ( .A(n264), .B(n263), .Y(n270) );
  NOR2X1 U277 ( .A(outreg_data[12]), .B(n37), .Y(n265) );
  NOR2X1 U278 ( .A(N13), .B(n265), .Y(n266) );
  OAI21X1 U279 ( .A(\regs_matrix[2][12] ), .B(n33), .C(n266), .Y(n268) );
  OAI22X1 U280 ( .A(\regs_matrix[6][12] ), .B(n41), .C(\regs_matrix[4][12] ), 
        .D(n48), .Y(n267) );
  NOR2X1 U281 ( .A(n268), .B(n267), .Y(n269) );
  AOI22X1 U282 ( .A(n272), .B(n271), .C(n270), .D(n269), .Y(n273) );
  OAI22X1 U283 ( .A(\regs_matrix[11][13] ), .B(n40), .C(\regs_matrix[9][13] ), 
        .D(n47), .Y(n275) );
  OAI22X1 U284 ( .A(\regs_matrix[15][13] ), .B(n36), .C(\regs_matrix[13][13] ), 
        .D(n44), .Y(n274) );
  NOR2X1 U285 ( .A(n275), .B(n274), .Y(n289) );
  NOR2X1 U286 ( .A(\regs_matrix[8][13] ), .B(n37), .Y(n276) );
  NOR2X1 U287 ( .A(n354), .B(n276), .Y(n277) );
  OAI21X1 U288 ( .A(\regs_matrix[10][13] ), .B(n33), .C(n277), .Y(n279) );
  OAI22X1 U289 ( .A(\regs_matrix[14][13] ), .B(n41), .C(\regs_matrix[12][13] ), 
        .D(n48), .Y(n278) );
  NOR2X1 U290 ( .A(n279), .B(n278), .Y(n288) );
  OAI22X1 U291 ( .A(\regs_matrix[3][13] ), .B(n40), .C(\regs_matrix[1][13] ), 
        .D(n47), .Y(n281) );
  OAI22X1 U292 ( .A(\regs_matrix[7][13] ), .B(n36), .C(\regs_matrix[5][13] ), 
        .D(n44), .Y(n280) );
  NOR2X1 U293 ( .A(n281), .B(n280), .Y(n287) );
  NOR2X1 U294 ( .A(outreg_data[13]), .B(n37), .Y(n282) );
  NOR2X1 U295 ( .A(N13), .B(n282), .Y(n283) );
  OAI21X1 U296 ( .A(\regs_matrix[2][13] ), .B(n33), .C(n283), .Y(n285) );
  OAI22X1 U297 ( .A(\regs_matrix[6][13] ), .B(n41), .C(\regs_matrix[4][13] ), 
        .D(n48), .Y(n284) );
  NOR2X1 U298 ( .A(n285), .B(n284), .Y(n286) );
  AOI22X1 U299 ( .A(n289), .B(n288), .C(n287), .D(n286), .Y(n290) );
  OAI22X1 U300 ( .A(\regs_matrix[11][14] ), .B(n40), .C(\regs_matrix[9][14] ), 
        .D(n47), .Y(n292) );
  OAI22X1 U301 ( .A(\regs_matrix[15][14] ), .B(n36), .C(\regs_matrix[13][14] ), 
        .D(n44), .Y(n291) );
  NOR2X1 U302 ( .A(n292), .B(n291), .Y(n306) );
  NOR2X1 U303 ( .A(\regs_matrix[8][14] ), .B(n37), .Y(n293) );
  NOR2X1 U304 ( .A(n354), .B(n293), .Y(n294) );
  OAI21X1 U305 ( .A(\regs_matrix[10][14] ), .B(n33), .C(n294), .Y(n296) );
  OAI22X1 U306 ( .A(\regs_matrix[14][14] ), .B(n41), .C(\regs_matrix[12][14] ), 
        .D(n48), .Y(n295) );
  NOR2X1 U307 ( .A(n296), .B(n295), .Y(n305) );
  OAI22X1 U308 ( .A(\regs_matrix[3][14] ), .B(n40), .C(\regs_matrix[1][14] ), 
        .D(n47), .Y(n298) );
  OAI22X1 U309 ( .A(\regs_matrix[7][14] ), .B(n36), .C(\regs_matrix[5][14] ), 
        .D(n44), .Y(n297) );
  NOR2X1 U310 ( .A(n298), .B(n297), .Y(n304) );
  NOR2X1 U311 ( .A(outreg_data[14]), .B(n37), .Y(n299) );
  NOR2X1 U312 ( .A(N13), .B(n299), .Y(n300) );
  OAI21X1 U313 ( .A(\regs_matrix[2][14] ), .B(n33), .C(n300), .Y(n302) );
  OAI22X1 U314 ( .A(\regs_matrix[6][14] ), .B(n41), .C(\regs_matrix[4][14] ), 
        .D(n48), .Y(n301) );
  NOR2X1 U315 ( .A(n302), .B(n301), .Y(n303) );
  AOI22X1 U316 ( .A(n306), .B(n305), .C(n304), .D(n303), .Y(n307) );
  OAI22X1 U317 ( .A(\regs_matrix[11][15] ), .B(n40), .C(\regs_matrix[9][15] ), 
        .D(n47), .Y(n309) );
  OAI22X1 U318 ( .A(\regs_matrix[15][15] ), .B(n36), .C(\regs_matrix[13][15] ), 
        .D(n44), .Y(n308) );
  NOR2X1 U319 ( .A(n309), .B(n308), .Y(n323) );
  NOR2X1 U320 ( .A(\regs_matrix[8][15] ), .B(n37), .Y(n310) );
  NOR2X1 U321 ( .A(n354), .B(n310), .Y(n311) );
  OAI21X1 U322 ( .A(\regs_matrix[10][15] ), .B(n33), .C(n311), .Y(n313) );
  OAI22X1 U323 ( .A(\regs_matrix[14][15] ), .B(n41), .C(\regs_matrix[12][15] ), 
        .D(n48), .Y(n312) );
  NOR2X1 U324 ( .A(n313), .B(n312), .Y(n322) );
  OAI22X1 U325 ( .A(\regs_matrix[3][15] ), .B(n40), .C(\regs_matrix[1][15] ), 
        .D(n47), .Y(n315) );
  OAI22X1 U326 ( .A(\regs_matrix[7][15] ), .B(n36), .C(\regs_matrix[5][15] ), 
        .D(n44), .Y(n314) );
  NOR2X1 U327 ( .A(n315), .B(n314), .Y(n321) );
  NOR2X1 U328 ( .A(outreg_data[15]), .B(n37), .Y(n316) );
  NOR2X1 U329 ( .A(N13), .B(n316), .Y(n317) );
  OAI21X1 U330 ( .A(\regs_matrix[2][15] ), .B(n33), .C(n317), .Y(n319) );
  OAI22X1 U331 ( .A(\regs_matrix[6][15] ), .B(n41), .C(\regs_matrix[4][15] ), 
        .D(n48), .Y(n318) );
  NOR2X1 U332 ( .A(n319), .B(n318), .Y(n320) );
  AOI22X1 U333 ( .A(n323), .B(n322), .C(n321), .D(n320), .Y(n324) );
  OAI22X1 U334 ( .A(\regs_matrix[13][16] ), .B(n44), .C(\regs_matrix[11][16] ), 
        .D(n333), .Y(n326) );
  OAI21X1 U335 ( .A(\regs_matrix[15][16] ), .B(n335), .C(N13), .Y(n325) );
  NOR2X1 U336 ( .A(n326), .B(n325), .Y(n349) );
  NOR2X1 U337 ( .A(\regs_matrix[8][16] ), .B(n37), .Y(n328) );
  NOR2X1 U338 ( .A(\regs_matrix[10][16] ), .B(n33), .Y(n327) );
  NOR2X1 U339 ( .A(n328), .B(n327), .Y(n329) );
  OAI21X1 U340 ( .A(\regs_matrix[12][16] ), .B(n48), .C(n329), .Y(n331) );
  OAI22X1 U341 ( .A(\regs_matrix[9][16] ), .B(n47), .C(\regs_matrix[14][16] ), 
        .D(n343), .Y(n330) );
  NOR2X1 U342 ( .A(n331), .B(n330), .Y(n348) );
  OAI22X1 U343 ( .A(\regs_matrix[3][16] ), .B(n40), .C(\regs_matrix[1][16] ), 
        .D(n47), .Y(n337) );
  OAI22X1 U344 ( .A(\regs_matrix[7][16] ), .B(n36), .C(\regs_matrix[5][16] ), 
        .D(n44), .Y(n336) );
  NOR2X1 U345 ( .A(n337), .B(n336), .Y(n347) );
  NOR2X1 U346 ( .A(outreg_data[16]), .B(n37), .Y(n339) );
  NOR2X1 U347 ( .A(N13), .B(n339), .Y(n340) );
  OAI21X1 U348 ( .A(\regs_matrix[2][16] ), .B(n33), .C(n340), .Y(n345) );
  OAI22X1 U349 ( .A(\regs_matrix[6][16] ), .B(n41), .C(\regs_matrix[4][16] ), 
        .D(n48), .Y(n344) );
  NOR2X1 U350 ( .A(n345), .B(n344), .Y(n346) );
  AOI22X1 U351 ( .A(n349), .B(n348), .C(n347), .D(n346), .Y(n350) );
  INVX2 U352 ( .A(N10), .Y(n351) );
  INVX2 U353 ( .A(N11), .Y(n352) );
  INVX2 U354 ( .A(N12), .Y(n353) );
  INVX2 U355 ( .A(N13), .Y(n354) );
  INVX2 U356 ( .A(n69), .Y(r1_data[0]) );
  INVX2 U357 ( .A(n86), .Y(r1_data[1]) );
  INVX2 U358 ( .A(n103), .Y(r1_data[2]) );
  INVX2 U359 ( .A(n120), .Y(r1_data[3]) );
  INVX2 U360 ( .A(n137), .Y(r1_data[4]) );
  INVX2 U361 ( .A(n154), .Y(r1_data[5]) );
  INVX2 U362 ( .A(n171), .Y(r1_data[6]) );
  INVX2 U363 ( .A(n188), .Y(r1_data[7]) );
  INVX2 U364 ( .A(n205), .Y(r1_data[8]) );
  INVX2 U365 ( .A(n222), .Y(r1_data[9]) );
  INVX2 U366 ( .A(n239), .Y(r1_data[10]) );
  INVX2 U367 ( .A(n256), .Y(r1_data[11]) );
  INVX2 U368 ( .A(n273), .Y(r1_data[12]) );
  INVX2 U369 ( .A(n290), .Y(r1_data[13]) );
  INVX2 U370 ( .A(n307), .Y(r1_data[14]) );
  INVX2 U371 ( .A(n324), .Y(r1_data[15]) );
  INVX2 U372 ( .A(n350), .Y(r1_data[16]) );
  NOR2X1 U373 ( .A(n658), .B(N16), .Y(n357) );
  NAND2X1 U374 ( .A(n357), .B(N14), .Y(n639) );
  NOR2X1 U375 ( .A(N15), .B(N16), .Y(n358) );
  NAND2X1 U376 ( .A(n358), .B(N14), .Y(n638) );
  OAI22X1 U377 ( .A(\regs_matrix[11][0] ), .B(n639), .C(\regs_matrix[9][0] ), 
        .D(n638), .Y(n356) );
  NOR2X1 U378 ( .A(n657), .B(n658), .Y(n361) );
  NAND2X1 U379 ( .A(N14), .B(n361), .Y(n641) );
  NOR2X1 U380 ( .A(n657), .B(N15), .Y(n362) );
  NAND2X1 U381 ( .A(n362), .B(N14), .Y(n640) );
  OAI22X1 U382 ( .A(\regs_matrix[15][0] ), .B(n641), .C(\regs_matrix[13][0] ), 
        .D(n640), .Y(n355) );
  NOR2X1 U383 ( .A(n356), .B(n355), .Y(n374) );
  NAND2X1 U384 ( .A(n357), .B(n660), .Y(n647) );
  NAND2X1 U385 ( .A(n358), .B(n660), .Y(n644) );
  NOR2X1 U386 ( .A(\regs_matrix[8][0] ), .B(n644), .Y(n359) );
  NOR2X1 U387 ( .A(n659), .B(n359), .Y(n360) );
  OAI21X1 U388 ( .A(\regs_matrix[10][0] ), .B(n647), .C(n360), .Y(n364) );
  NAND2X1 U389 ( .A(n361), .B(n660), .Y(n649) );
  NAND2X1 U390 ( .A(n362), .B(n660), .Y(n648) );
  OAI22X1 U391 ( .A(\regs_matrix[14][0] ), .B(n649), .C(\regs_matrix[12][0] ), 
        .D(n648), .Y(n363) );
  NOR2X1 U392 ( .A(n364), .B(n363), .Y(n373) );
  OAI22X1 U393 ( .A(\regs_matrix[3][0] ), .B(n639), .C(\regs_matrix[1][0] ), 
        .D(n638), .Y(n366) );
  OAI22X1 U394 ( .A(\regs_matrix[7][0] ), .B(n641), .C(\regs_matrix[5][0] ), 
        .D(n640), .Y(n365) );
  NOR2X1 U395 ( .A(n366), .B(n365), .Y(n372) );
  NOR2X1 U396 ( .A(outreg_data[0]), .B(n644), .Y(n367) );
  NOR2X1 U397 ( .A(N17), .B(n367), .Y(n368) );
  OAI21X1 U398 ( .A(\regs_matrix[2][0] ), .B(n647), .C(n368), .Y(n370) );
  OAI22X1 U399 ( .A(\regs_matrix[6][0] ), .B(n649), .C(\regs_matrix[4][0] ), 
        .D(n648), .Y(n369) );
  NOR2X1 U400 ( .A(n370), .B(n369), .Y(n371) );
  AOI22X1 U401 ( .A(n374), .B(n373), .C(n372), .D(n371), .Y(n375) );
  OAI22X1 U402 ( .A(\regs_matrix[11][1] ), .B(n639), .C(\regs_matrix[9][1] ), 
        .D(n638), .Y(n377) );
  OAI22X1 U403 ( .A(\regs_matrix[15][1] ), .B(n641), .C(\regs_matrix[13][1] ), 
        .D(n640), .Y(n376) );
  NOR2X1 U404 ( .A(n377), .B(n376), .Y(n391) );
  NOR2X1 U405 ( .A(\regs_matrix[8][1] ), .B(n644), .Y(n378) );
  NOR2X1 U406 ( .A(n659), .B(n378), .Y(n379) );
  OAI21X1 U407 ( .A(\regs_matrix[10][1] ), .B(n647), .C(n379), .Y(n381) );
  OAI22X1 U408 ( .A(\regs_matrix[14][1] ), .B(n649), .C(\regs_matrix[12][1] ), 
        .D(n648), .Y(n380) );
  NOR2X1 U409 ( .A(n381), .B(n380), .Y(n390) );
  OAI22X1 U410 ( .A(\regs_matrix[3][1] ), .B(n639), .C(\regs_matrix[1][1] ), 
        .D(n638), .Y(n383) );
  OAI22X1 U411 ( .A(\regs_matrix[7][1] ), .B(n641), .C(\regs_matrix[5][1] ), 
        .D(n640), .Y(n382) );
  NOR2X1 U412 ( .A(n383), .B(n382), .Y(n389) );
  NOR2X1 U413 ( .A(outreg_data[1]), .B(n644), .Y(n384) );
  NOR2X1 U414 ( .A(N17), .B(n384), .Y(n385) );
  OAI21X1 U415 ( .A(\regs_matrix[2][1] ), .B(n647), .C(n385), .Y(n387) );
  OAI22X1 U416 ( .A(\regs_matrix[6][1] ), .B(n649), .C(\regs_matrix[4][1] ), 
        .D(n648), .Y(n386) );
  NOR2X1 U417 ( .A(n387), .B(n386), .Y(n388) );
  AOI22X1 U418 ( .A(n391), .B(n390), .C(n389), .D(n388), .Y(n392) );
  OAI22X1 U419 ( .A(\regs_matrix[11][2] ), .B(n639), .C(\regs_matrix[9][2] ), 
        .D(n638), .Y(n394) );
  OAI22X1 U420 ( .A(\regs_matrix[15][2] ), .B(n641), .C(\regs_matrix[13][2] ), 
        .D(n640), .Y(n393) );
  NOR2X1 U421 ( .A(n394), .B(n393), .Y(n408) );
  NOR2X1 U422 ( .A(\regs_matrix[8][2] ), .B(n644), .Y(n395) );
  NOR2X1 U423 ( .A(n659), .B(n395), .Y(n396) );
  OAI21X1 U424 ( .A(\regs_matrix[10][2] ), .B(n647), .C(n396), .Y(n398) );
  OAI22X1 U425 ( .A(\regs_matrix[14][2] ), .B(n649), .C(\regs_matrix[12][2] ), 
        .D(n648), .Y(n397) );
  NOR2X1 U426 ( .A(n398), .B(n397), .Y(n407) );
  OAI22X1 U427 ( .A(\regs_matrix[3][2] ), .B(n639), .C(\regs_matrix[1][2] ), 
        .D(n638), .Y(n400) );
  OAI22X1 U428 ( .A(\regs_matrix[7][2] ), .B(n641), .C(\regs_matrix[5][2] ), 
        .D(n640), .Y(n399) );
  NOR2X1 U429 ( .A(n400), .B(n399), .Y(n406) );
  NOR2X1 U430 ( .A(outreg_data[2]), .B(n644), .Y(n401) );
  NOR2X1 U431 ( .A(N17), .B(n401), .Y(n402) );
  OAI21X1 U432 ( .A(\regs_matrix[2][2] ), .B(n647), .C(n402), .Y(n404) );
  OAI22X1 U433 ( .A(\regs_matrix[6][2] ), .B(n649), .C(\regs_matrix[4][2] ), 
        .D(n648), .Y(n403) );
  NOR2X1 U434 ( .A(n404), .B(n403), .Y(n405) );
  AOI22X1 U435 ( .A(n408), .B(n407), .C(n406), .D(n405), .Y(n409) );
  OAI22X1 U436 ( .A(\regs_matrix[11][3] ), .B(n639), .C(\regs_matrix[9][3] ), 
        .D(n638), .Y(n411) );
  OAI22X1 U437 ( .A(\regs_matrix[15][3] ), .B(n641), .C(\regs_matrix[13][3] ), 
        .D(n640), .Y(n410) );
  NOR2X1 U438 ( .A(n411), .B(n410), .Y(n425) );
  NOR2X1 U439 ( .A(\regs_matrix[8][3] ), .B(n644), .Y(n412) );
  NOR2X1 U440 ( .A(n659), .B(n412), .Y(n413) );
  OAI21X1 U441 ( .A(\regs_matrix[10][3] ), .B(n647), .C(n413), .Y(n415) );
  OAI22X1 U442 ( .A(\regs_matrix[14][3] ), .B(n649), .C(\regs_matrix[12][3] ), 
        .D(n648), .Y(n414) );
  NOR2X1 U443 ( .A(n415), .B(n414), .Y(n424) );
  OAI22X1 U444 ( .A(\regs_matrix[3][3] ), .B(n639), .C(\regs_matrix[1][3] ), 
        .D(n638), .Y(n417) );
  OAI22X1 U445 ( .A(\regs_matrix[7][3] ), .B(n641), .C(\regs_matrix[5][3] ), 
        .D(n640), .Y(n416) );
  NOR2X1 U446 ( .A(n417), .B(n416), .Y(n423) );
  NOR2X1 U447 ( .A(outreg_data[3]), .B(n644), .Y(n418) );
  NOR2X1 U448 ( .A(N17), .B(n418), .Y(n419) );
  OAI21X1 U449 ( .A(\regs_matrix[2][3] ), .B(n647), .C(n419), .Y(n421) );
  OAI22X1 U450 ( .A(\regs_matrix[6][3] ), .B(n649), .C(\regs_matrix[4][3] ), 
        .D(n648), .Y(n420) );
  NOR2X1 U451 ( .A(n421), .B(n420), .Y(n422) );
  AOI22X1 U452 ( .A(n425), .B(n424), .C(n423), .D(n422), .Y(n426) );
  OAI22X1 U453 ( .A(\regs_matrix[11][4] ), .B(n39), .C(\regs_matrix[9][4] ), 
        .D(n638), .Y(n428) );
  OAI22X1 U454 ( .A(\regs_matrix[15][4] ), .B(n35), .C(\regs_matrix[13][4] ), 
        .D(n640), .Y(n427) );
  NOR2X1 U455 ( .A(n428), .B(n427), .Y(n442) );
  NOR2X1 U456 ( .A(\regs_matrix[8][4] ), .B(n644), .Y(n429) );
  NOR2X1 U457 ( .A(n659), .B(n429), .Y(n430) );
  OAI21X1 U458 ( .A(\regs_matrix[10][4] ), .B(n647), .C(n430), .Y(n432) );
  OAI22X1 U459 ( .A(\regs_matrix[14][4] ), .B(n45), .C(\regs_matrix[12][4] ), 
        .D(n648), .Y(n431) );
  NOR2X1 U460 ( .A(n432), .B(n431), .Y(n441) );
  OAI22X1 U461 ( .A(\regs_matrix[3][4] ), .B(n39), .C(\regs_matrix[1][4] ), 
        .D(n43), .Y(n434) );
  OAI22X1 U462 ( .A(\regs_matrix[7][4] ), .B(n35), .C(\regs_matrix[5][4] ), 
        .D(n46), .Y(n433) );
  NOR2X1 U463 ( .A(n434), .B(n433), .Y(n440) );
  NOR2X1 U464 ( .A(outreg_data[4]), .B(n644), .Y(n435) );
  NOR2X1 U465 ( .A(N17), .B(n435), .Y(n436) );
  OAI21X1 U466 ( .A(\regs_matrix[2][4] ), .B(n34), .C(n436), .Y(n438) );
  OAI22X1 U467 ( .A(\regs_matrix[6][4] ), .B(n45), .C(\regs_matrix[4][4] ), 
        .D(n42), .Y(n437) );
  NOR2X1 U468 ( .A(n438), .B(n437), .Y(n439) );
  AOI22X1 U469 ( .A(n442), .B(n441), .C(n440), .D(n439), .Y(n443) );
  OAI22X1 U470 ( .A(\regs_matrix[11][5] ), .B(n39), .C(\regs_matrix[9][5] ), 
        .D(n43), .Y(n445) );
  OAI22X1 U471 ( .A(\regs_matrix[15][5] ), .B(n35), .C(\regs_matrix[13][5] ), 
        .D(n46), .Y(n444) );
  NOR2X1 U472 ( .A(n445), .B(n444), .Y(n459) );
  NOR2X1 U473 ( .A(\regs_matrix[8][5] ), .B(n644), .Y(n446) );
  NOR2X1 U474 ( .A(n659), .B(n446), .Y(n447) );
  OAI21X1 U475 ( .A(\regs_matrix[10][5] ), .B(n34), .C(n447), .Y(n449) );
  OAI22X1 U476 ( .A(\regs_matrix[14][5] ), .B(n45), .C(\regs_matrix[12][5] ), 
        .D(n42), .Y(n448) );
  NOR2X1 U477 ( .A(n449), .B(n448), .Y(n458) );
  OAI22X1 U478 ( .A(\regs_matrix[3][5] ), .B(n39), .C(\regs_matrix[1][5] ), 
        .D(n43), .Y(n451) );
  OAI22X1 U479 ( .A(\regs_matrix[7][5] ), .B(n35), .C(\regs_matrix[5][5] ), 
        .D(n46), .Y(n450) );
  NOR2X1 U480 ( .A(n451), .B(n450), .Y(n457) );
  NOR2X1 U481 ( .A(outreg_data[5]), .B(n644), .Y(n452) );
  NOR2X1 U482 ( .A(N17), .B(n452), .Y(n453) );
  OAI21X1 U483 ( .A(\regs_matrix[2][5] ), .B(n34), .C(n453), .Y(n455) );
  OAI22X1 U484 ( .A(\regs_matrix[6][5] ), .B(n45), .C(\regs_matrix[4][5] ), 
        .D(n42), .Y(n454) );
  NOR2X1 U485 ( .A(n455), .B(n454), .Y(n456) );
  AOI22X1 U486 ( .A(n459), .B(n458), .C(n457), .D(n456), .Y(n460) );
  OAI22X1 U487 ( .A(\regs_matrix[11][6] ), .B(n39), .C(\regs_matrix[9][6] ), 
        .D(n43), .Y(n462) );
  OAI22X1 U488 ( .A(\regs_matrix[15][6] ), .B(n35), .C(\regs_matrix[13][6] ), 
        .D(n46), .Y(n461) );
  NOR2X1 U489 ( .A(n462), .B(n461), .Y(n476) );
  NOR2X1 U490 ( .A(\regs_matrix[8][6] ), .B(n644), .Y(n463) );
  NOR2X1 U491 ( .A(n659), .B(n463), .Y(n464) );
  OAI21X1 U492 ( .A(\regs_matrix[10][6] ), .B(n34), .C(n464), .Y(n466) );
  OAI22X1 U493 ( .A(\regs_matrix[14][6] ), .B(n45), .C(\regs_matrix[12][6] ), 
        .D(n42), .Y(n465) );
  NOR2X1 U494 ( .A(n466), .B(n465), .Y(n475) );
  OAI22X1 U495 ( .A(\regs_matrix[3][6] ), .B(n39), .C(\regs_matrix[1][6] ), 
        .D(n43), .Y(n468) );
  OAI22X1 U496 ( .A(\regs_matrix[7][6] ), .B(n35), .C(\regs_matrix[5][6] ), 
        .D(n46), .Y(n467) );
  NOR2X1 U497 ( .A(n468), .B(n467), .Y(n474) );
  NOR2X1 U498 ( .A(outreg_data[6]), .B(n38), .Y(n469) );
  NOR2X1 U499 ( .A(N17), .B(n469), .Y(n470) );
  OAI21X1 U500 ( .A(\regs_matrix[2][6] ), .B(n34), .C(n470), .Y(n472) );
  OAI22X1 U501 ( .A(\regs_matrix[6][6] ), .B(n45), .C(\regs_matrix[4][6] ), 
        .D(n42), .Y(n471) );
  NOR2X1 U502 ( .A(n472), .B(n471), .Y(n473) );
  AOI22X1 U503 ( .A(n476), .B(n475), .C(n474), .D(n473), .Y(n477) );
  OAI22X1 U504 ( .A(\regs_matrix[11][7] ), .B(n39), .C(\regs_matrix[9][7] ), 
        .D(n43), .Y(n479) );
  OAI22X1 U505 ( .A(\regs_matrix[15][7] ), .B(n35), .C(\regs_matrix[13][7] ), 
        .D(n46), .Y(n478) );
  NOR2X1 U506 ( .A(n479), .B(n478), .Y(n493) );
  NOR2X1 U507 ( .A(\regs_matrix[8][7] ), .B(n38), .Y(n480) );
  NOR2X1 U508 ( .A(n659), .B(n480), .Y(n481) );
  OAI21X1 U509 ( .A(\regs_matrix[10][7] ), .B(n34), .C(n481), .Y(n483) );
  OAI22X1 U510 ( .A(\regs_matrix[14][7] ), .B(n45), .C(\regs_matrix[12][7] ), 
        .D(n42), .Y(n482) );
  NOR2X1 U511 ( .A(n483), .B(n482), .Y(n492) );
  OAI22X1 U512 ( .A(\regs_matrix[3][7] ), .B(n39), .C(\regs_matrix[1][7] ), 
        .D(n43), .Y(n485) );
  OAI22X1 U513 ( .A(\regs_matrix[7][7] ), .B(n35), .C(\regs_matrix[5][7] ), 
        .D(n46), .Y(n484) );
  NOR2X1 U514 ( .A(n485), .B(n484), .Y(n491) );
  NOR2X1 U515 ( .A(outreg_data[7]), .B(n38), .Y(n486) );
  NOR2X1 U516 ( .A(N17), .B(n486), .Y(n487) );
  OAI21X1 U517 ( .A(\regs_matrix[2][7] ), .B(n34), .C(n487), .Y(n489) );
  OAI22X1 U518 ( .A(\regs_matrix[6][7] ), .B(n45), .C(\regs_matrix[4][7] ), 
        .D(n42), .Y(n488) );
  NOR2X1 U519 ( .A(n489), .B(n488), .Y(n490) );
  AOI22X1 U520 ( .A(n493), .B(n492), .C(n491), .D(n490), .Y(n494) );
  OAI22X1 U521 ( .A(\regs_matrix[11][8] ), .B(n39), .C(\regs_matrix[9][8] ), 
        .D(n43), .Y(n496) );
  OAI22X1 U522 ( .A(\regs_matrix[15][8] ), .B(n35), .C(\regs_matrix[13][8] ), 
        .D(n46), .Y(n495) );
  NOR2X1 U523 ( .A(n496), .B(n495), .Y(n510) );
  NOR2X1 U524 ( .A(\regs_matrix[8][8] ), .B(n38), .Y(n497) );
  NOR2X1 U525 ( .A(n659), .B(n497), .Y(n498) );
  OAI21X1 U526 ( .A(\regs_matrix[10][8] ), .B(n34), .C(n498), .Y(n500) );
  OAI22X1 U527 ( .A(\regs_matrix[14][8] ), .B(n45), .C(\regs_matrix[12][8] ), 
        .D(n42), .Y(n499) );
  NOR2X1 U528 ( .A(n500), .B(n499), .Y(n509) );
  OAI22X1 U529 ( .A(\regs_matrix[3][8] ), .B(n39), .C(\regs_matrix[1][8] ), 
        .D(n43), .Y(n502) );
  OAI22X1 U530 ( .A(\regs_matrix[7][8] ), .B(n35), .C(\regs_matrix[5][8] ), 
        .D(n46), .Y(n501) );
  NOR2X1 U531 ( .A(n502), .B(n501), .Y(n508) );
  NOR2X1 U532 ( .A(outreg_data[8]), .B(n38), .Y(n503) );
  NOR2X1 U533 ( .A(N17), .B(n503), .Y(n504) );
  OAI21X1 U534 ( .A(\regs_matrix[2][8] ), .B(n34), .C(n504), .Y(n506) );
  OAI22X1 U535 ( .A(\regs_matrix[6][8] ), .B(n45), .C(\regs_matrix[4][8] ), 
        .D(n42), .Y(n505) );
  NOR2X1 U536 ( .A(n506), .B(n505), .Y(n507) );
  AOI22X1 U537 ( .A(n510), .B(n509), .C(n508), .D(n507), .Y(n511) );
  OAI22X1 U538 ( .A(\regs_matrix[11][9] ), .B(n39), .C(\regs_matrix[9][9] ), 
        .D(n43), .Y(n513) );
  OAI22X1 U539 ( .A(\regs_matrix[15][9] ), .B(n35), .C(\regs_matrix[13][9] ), 
        .D(n46), .Y(n512) );
  NOR2X1 U540 ( .A(n513), .B(n512), .Y(n527) );
  NOR2X1 U541 ( .A(\regs_matrix[8][9] ), .B(n38), .Y(n514) );
  NOR2X1 U542 ( .A(n659), .B(n514), .Y(n515) );
  OAI21X1 U543 ( .A(\regs_matrix[10][9] ), .B(n34), .C(n515), .Y(n517) );
  OAI22X1 U544 ( .A(\regs_matrix[14][9] ), .B(n45), .C(\regs_matrix[12][9] ), 
        .D(n42), .Y(n516) );
  NOR2X1 U545 ( .A(n517), .B(n516), .Y(n526) );
  OAI22X1 U546 ( .A(\regs_matrix[3][9] ), .B(n39), .C(\regs_matrix[1][9] ), 
        .D(n43), .Y(n519) );
  OAI22X1 U547 ( .A(\regs_matrix[7][9] ), .B(n35), .C(\regs_matrix[5][9] ), 
        .D(n46), .Y(n518) );
  NOR2X1 U548 ( .A(n519), .B(n518), .Y(n525) );
  NOR2X1 U549 ( .A(outreg_data[9]), .B(n38), .Y(n520) );
  NOR2X1 U550 ( .A(N17), .B(n520), .Y(n521) );
  OAI21X1 U551 ( .A(\regs_matrix[2][9] ), .B(n34), .C(n521), .Y(n523) );
  OAI22X1 U552 ( .A(\regs_matrix[6][9] ), .B(n45), .C(\regs_matrix[4][9] ), 
        .D(n42), .Y(n522) );
  NOR2X1 U553 ( .A(n523), .B(n522), .Y(n524) );
  AOI22X1 U554 ( .A(n527), .B(n526), .C(n525), .D(n524), .Y(n528) );
  OAI22X1 U555 ( .A(\regs_matrix[11][10] ), .B(n39), .C(\regs_matrix[9][10] ), 
        .D(n43), .Y(n530) );
  OAI22X1 U556 ( .A(\regs_matrix[15][10] ), .B(n35), .C(\regs_matrix[13][10] ), 
        .D(n46), .Y(n529) );
  NOR2X1 U557 ( .A(n530), .B(n529), .Y(n544) );
  NOR2X1 U558 ( .A(\regs_matrix[8][10] ), .B(n38), .Y(n531) );
  NOR2X1 U559 ( .A(n659), .B(n531), .Y(n532) );
  OAI21X1 U560 ( .A(\regs_matrix[10][10] ), .B(n34), .C(n532), .Y(n534) );
  OAI22X1 U561 ( .A(\regs_matrix[14][10] ), .B(n45), .C(\regs_matrix[12][10] ), 
        .D(n42), .Y(n533) );
  NOR2X1 U562 ( .A(n534), .B(n533), .Y(n543) );
  OAI22X1 U563 ( .A(\regs_matrix[3][10] ), .B(n39), .C(\regs_matrix[1][10] ), 
        .D(n43), .Y(n536) );
  OAI22X1 U564 ( .A(\regs_matrix[7][10] ), .B(n35), .C(\regs_matrix[5][10] ), 
        .D(n46), .Y(n535) );
  NOR2X1 U565 ( .A(n536), .B(n535), .Y(n542) );
  NOR2X1 U566 ( .A(outreg_data[10]), .B(n38), .Y(n537) );
  NOR2X1 U567 ( .A(N17), .B(n537), .Y(n538) );
  OAI21X1 U568 ( .A(\regs_matrix[2][10] ), .B(n34), .C(n538), .Y(n540) );
  OAI22X1 U569 ( .A(\regs_matrix[6][10] ), .B(n45), .C(\regs_matrix[4][10] ), 
        .D(n42), .Y(n539) );
  NOR2X1 U570 ( .A(n540), .B(n539), .Y(n541) );
  AOI22X1 U571 ( .A(n544), .B(n543), .C(n542), .D(n541), .Y(n545) );
  OAI22X1 U572 ( .A(\regs_matrix[11][11] ), .B(n39), .C(\regs_matrix[9][11] ), 
        .D(n43), .Y(n547) );
  OAI22X1 U573 ( .A(\regs_matrix[15][11] ), .B(n35), .C(\regs_matrix[13][11] ), 
        .D(n46), .Y(n546) );
  NOR2X1 U574 ( .A(n547), .B(n546), .Y(n561) );
  NOR2X1 U575 ( .A(\regs_matrix[8][11] ), .B(n38), .Y(n548) );
  NOR2X1 U576 ( .A(n659), .B(n548), .Y(n549) );
  OAI21X1 U577 ( .A(\regs_matrix[10][11] ), .B(n34), .C(n549), .Y(n551) );
  OAI22X1 U578 ( .A(\regs_matrix[14][11] ), .B(n45), .C(\regs_matrix[12][11] ), 
        .D(n42), .Y(n550) );
  NOR2X1 U579 ( .A(n551), .B(n550), .Y(n560) );
  OAI22X1 U580 ( .A(\regs_matrix[3][11] ), .B(n39), .C(\regs_matrix[1][11] ), 
        .D(n43), .Y(n553) );
  OAI22X1 U581 ( .A(\regs_matrix[7][11] ), .B(n35), .C(\regs_matrix[5][11] ), 
        .D(n46), .Y(n552) );
  NOR2X1 U582 ( .A(n553), .B(n552), .Y(n559) );
  NOR2X1 U583 ( .A(outreg_data[11]), .B(n38), .Y(n554) );
  NOR2X1 U584 ( .A(N17), .B(n554), .Y(n555) );
  OAI21X1 U585 ( .A(\regs_matrix[2][11] ), .B(n34), .C(n555), .Y(n557) );
  OAI22X1 U586 ( .A(\regs_matrix[6][11] ), .B(n45), .C(\regs_matrix[4][11] ), 
        .D(n42), .Y(n556) );
  NOR2X1 U587 ( .A(n557), .B(n556), .Y(n558) );
  AOI22X1 U588 ( .A(n561), .B(n560), .C(n559), .D(n558), .Y(n562) );
  OAI22X1 U589 ( .A(\regs_matrix[11][12] ), .B(n39), .C(\regs_matrix[9][12] ), 
        .D(n43), .Y(n564) );
  OAI22X1 U590 ( .A(\regs_matrix[15][12] ), .B(n35), .C(\regs_matrix[13][12] ), 
        .D(n46), .Y(n563) );
  NOR2X1 U591 ( .A(n564), .B(n563), .Y(n578) );
  NOR2X1 U592 ( .A(\regs_matrix[8][12] ), .B(n38), .Y(n565) );
  NOR2X1 U593 ( .A(n659), .B(n565), .Y(n566) );
  OAI21X1 U594 ( .A(\regs_matrix[10][12] ), .B(n34), .C(n566), .Y(n568) );
  OAI22X1 U595 ( .A(\regs_matrix[14][12] ), .B(n45), .C(\regs_matrix[12][12] ), 
        .D(n42), .Y(n567) );
  NOR2X1 U596 ( .A(n568), .B(n567), .Y(n577) );
  OAI22X1 U597 ( .A(\regs_matrix[3][12] ), .B(n39), .C(\regs_matrix[1][12] ), 
        .D(n43), .Y(n570) );
  OAI22X1 U598 ( .A(\regs_matrix[7][12] ), .B(n35), .C(\regs_matrix[5][12] ), 
        .D(n46), .Y(n569) );
  NOR2X1 U599 ( .A(n570), .B(n569), .Y(n576) );
  NOR2X1 U600 ( .A(outreg_data[12]), .B(n38), .Y(n571) );
  NOR2X1 U601 ( .A(N17), .B(n571), .Y(n572) );
  OAI21X1 U602 ( .A(\regs_matrix[2][12] ), .B(n34), .C(n572), .Y(n574) );
  OAI22X1 U603 ( .A(\regs_matrix[6][12] ), .B(n45), .C(\regs_matrix[4][12] ), 
        .D(n42), .Y(n573) );
  NOR2X1 U604 ( .A(n574), .B(n573), .Y(n575) );
  AOI22X1 U605 ( .A(n578), .B(n577), .C(n576), .D(n575), .Y(n579) );
  OAI22X1 U606 ( .A(\regs_matrix[11][13] ), .B(n39), .C(\regs_matrix[9][13] ), 
        .D(n43), .Y(n581) );
  OAI22X1 U607 ( .A(\regs_matrix[15][13] ), .B(n35), .C(\regs_matrix[13][13] ), 
        .D(n46), .Y(n580) );
  NOR2X1 U608 ( .A(n581), .B(n580), .Y(n595) );
  NOR2X1 U609 ( .A(\regs_matrix[8][13] ), .B(n38), .Y(n582) );
  NOR2X1 U610 ( .A(n659), .B(n582), .Y(n583) );
  OAI21X1 U611 ( .A(\regs_matrix[10][13] ), .B(n34), .C(n583), .Y(n585) );
  OAI22X1 U612 ( .A(\regs_matrix[14][13] ), .B(n45), .C(\regs_matrix[12][13] ), 
        .D(n42), .Y(n584) );
  NOR2X1 U613 ( .A(n585), .B(n584), .Y(n594) );
  OAI22X1 U614 ( .A(\regs_matrix[3][13] ), .B(n39), .C(\regs_matrix[1][13] ), 
        .D(n43), .Y(n587) );
  OAI22X1 U615 ( .A(\regs_matrix[7][13] ), .B(n35), .C(\regs_matrix[5][13] ), 
        .D(n46), .Y(n586) );
  NOR2X1 U616 ( .A(n587), .B(n586), .Y(n593) );
  NOR2X1 U617 ( .A(outreg_data[13]), .B(n38), .Y(n588) );
  NOR2X1 U618 ( .A(N17), .B(n588), .Y(n589) );
  OAI21X1 U619 ( .A(\regs_matrix[2][13] ), .B(n34), .C(n589), .Y(n591) );
  OAI22X1 U620 ( .A(\regs_matrix[6][13] ), .B(n45), .C(\regs_matrix[4][13] ), 
        .D(n42), .Y(n590) );
  NOR2X1 U621 ( .A(n591), .B(n590), .Y(n592) );
  AOI22X1 U622 ( .A(n595), .B(n594), .C(n593), .D(n592), .Y(n596) );
  OAI22X1 U623 ( .A(\regs_matrix[11][14] ), .B(n39), .C(\regs_matrix[9][14] ), 
        .D(n43), .Y(n598) );
  OAI22X1 U624 ( .A(\regs_matrix[15][14] ), .B(n35), .C(\regs_matrix[13][14] ), 
        .D(n46), .Y(n597) );
  NOR2X1 U625 ( .A(n598), .B(n597), .Y(n612) );
  NOR2X1 U626 ( .A(\regs_matrix[8][14] ), .B(n38), .Y(n599) );
  NOR2X1 U627 ( .A(n659), .B(n599), .Y(n600) );
  OAI21X1 U628 ( .A(\regs_matrix[10][14] ), .B(n34), .C(n600), .Y(n602) );
  OAI22X1 U629 ( .A(\regs_matrix[14][14] ), .B(n45), .C(\regs_matrix[12][14] ), 
        .D(n42), .Y(n601) );
  NOR2X1 U630 ( .A(n602), .B(n601), .Y(n611) );
  OAI22X1 U631 ( .A(\regs_matrix[3][14] ), .B(n39), .C(\regs_matrix[1][14] ), 
        .D(n43), .Y(n604) );
  OAI22X1 U632 ( .A(\regs_matrix[7][14] ), .B(n35), .C(\regs_matrix[5][14] ), 
        .D(n46), .Y(n603) );
  NOR2X1 U633 ( .A(n604), .B(n603), .Y(n610) );
  NOR2X1 U634 ( .A(outreg_data[14]), .B(n38), .Y(n605) );
  NOR2X1 U635 ( .A(N17), .B(n605), .Y(n606) );
  OAI21X1 U636 ( .A(\regs_matrix[2][14] ), .B(n34), .C(n606), .Y(n608) );
  OAI22X1 U637 ( .A(\regs_matrix[6][14] ), .B(n45), .C(\regs_matrix[4][14] ), 
        .D(n42), .Y(n607) );
  NOR2X1 U638 ( .A(n608), .B(n607), .Y(n609) );
  AOI22X1 U639 ( .A(n612), .B(n611), .C(n610), .D(n609), .Y(n613) );
  OAI22X1 U640 ( .A(\regs_matrix[11][15] ), .B(n39), .C(\regs_matrix[9][15] ), 
        .D(n43), .Y(n615) );
  OAI22X1 U641 ( .A(\regs_matrix[15][15] ), .B(n35), .C(\regs_matrix[13][15] ), 
        .D(n46), .Y(n614) );
  NOR2X1 U642 ( .A(n615), .B(n614), .Y(n629) );
  NOR2X1 U643 ( .A(\regs_matrix[8][15] ), .B(n38), .Y(n616) );
  NOR2X1 U644 ( .A(n659), .B(n616), .Y(n617) );
  OAI21X1 U645 ( .A(\regs_matrix[10][15] ), .B(n34), .C(n617), .Y(n619) );
  OAI22X1 U646 ( .A(\regs_matrix[14][15] ), .B(n45), .C(\regs_matrix[12][15] ), 
        .D(n42), .Y(n618) );
  NOR2X1 U647 ( .A(n619), .B(n618), .Y(n628) );
  OAI22X1 U648 ( .A(\regs_matrix[3][15] ), .B(n39), .C(\regs_matrix[1][15] ), 
        .D(n43), .Y(n621) );
  OAI22X1 U649 ( .A(\regs_matrix[7][15] ), .B(n35), .C(\regs_matrix[5][15] ), 
        .D(n46), .Y(n620) );
  NOR2X1 U650 ( .A(n621), .B(n620), .Y(n627) );
  NOR2X1 U651 ( .A(outreg_data[15]), .B(n38), .Y(n622) );
  NOR2X1 U652 ( .A(N17), .B(n622), .Y(n623) );
  OAI21X1 U653 ( .A(\regs_matrix[2][15] ), .B(n34), .C(n623), .Y(n625) );
  OAI22X1 U654 ( .A(\regs_matrix[6][15] ), .B(n45), .C(\regs_matrix[4][15] ), 
        .D(n42), .Y(n624) );
  NOR2X1 U655 ( .A(n625), .B(n624), .Y(n626) );
  AOI22X1 U656 ( .A(n629), .B(n628), .C(n627), .D(n626), .Y(n630) );
  OAI22X1 U657 ( .A(\regs_matrix[13][16] ), .B(n46), .C(\regs_matrix[11][16] ), 
        .D(n639), .Y(n632) );
  OAI21X1 U658 ( .A(\regs_matrix[15][16] ), .B(n641), .C(N17), .Y(n631) );
  NOR2X1 U659 ( .A(n632), .B(n631), .Y(n655) );
  NOR2X1 U660 ( .A(\regs_matrix[8][16] ), .B(n38), .Y(n634) );
  NOR2X1 U661 ( .A(\regs_matrix[10][16] ), .B(n34), .Y(n633) );
  NOR2X1 U662 ( .A(n634), .B(n633), .Y(n635) );
  OAI21X1 U663 ( .A(\regs_matrix[12][16] ), .B(n42), .C(n635), .Y(n637) );
  OAI22X1 U664 ( .A(\regs_matrix[9][16] ), .B(n43), .C(\regs_matrix[14][16] ), 
        .D(n649), .Y(n636) );
  NOR2X1 U665 ( .A(n637), .B(n636), .Y(n654) );
  OAI22X1 U666 ( .A(\regs_matrix[3][16] ), .B(n39), .C(\regs_matrix[1][16] ), 
        .D(n43), .Y(n643) );
  OAI22X1 U667 ( .A(\regs_matrix[7][16] ), .B(n35), .C(\regs_matrix[5][16] ), 
        .D(n46), .Y(n642) );
  NOR2X1 U668 ( .A(n643), .B(n642), .Y(n653) );
  NOR2X1 U669 ( .A(outreg_data[16]), .B(n38), .Y(n645) );
  NOR2X1 U670 ( .A(N17), .B(n645), .Y(n646) );
  OAI21X1 U671 ( .A(\regs_matrix[2][16] ), .B(n34), .C(n646), .Y(n651) );
  OAI22X1 U672 ( .A(\regs_matrix[6][16] ), .B(n45), .C(\regs_matrix[4][16] ), 
        .D(n42), .Y(n650) );
  NOR2X1 U673 ( .A(n651), .B(n650), .Y(n652) );
  AOI22X1 U674 ( .A(n655), .B(n654), .C(n653), .D(n652), .Y(n656) );
  INVX2 U675 ( .A(N16), .Y(n657) );
  INVX2 U676 ( .A(N15), .Y(n658) );
  INVX2 U677 ( .A(N17), .Y(n659) );
  INVX2 U678 ( .A(N14), .Y(n660) );
  INVX2 U679 ( .A(n375), .Y(r2_data[0]) );
  INVX2 U680 ( .A(n392), .Y(r2_data[1]) );
  INVX2 U681 ( .A(n409), .Y(r2_data[2]) );
  INVX2 U682 ( .A(n426), .Y(r2_data[3]) );
  INVX2 U683 ( .A(n443), .Y(r2_data[4]) );
  INVX2 U684 ( .A(n460), .Y(r2_data[5]) );
  INVX2 U685 ( .A(n477), .Y(r2_data[6]) );
  INVX2 U686 ( .A(n494), .Y(r2_data[7]) );
  INVX2 U687 ( .A(n511), .Y(r2_data[8]) );
  INVX2 U688 ( .A(n528), .Y(r2_data[9]) );
  INVX2 U689 ( .A(n545), .Y(r2_data[10]) );
  INVX2 U690 ( .A(n562), .Y(r2_data[11]) );
  INVX2 U691 ( .A(n579), .Y(r2_data[12]) );
  INVX2 U692 ( .A(n596), .Y(r2_data[13]) );
  INVX2 U693 ( .A(n613), .Y(r2_data[14]) );
  INVX2 U694 ( .A(n630), .Y(r2_data[15]) );
  INVX2 U695 ( .A(n656), .Y(r2_data[16]) );
  NAND3X1 U696 ( .A(w_en), .B(n669), .C(w_sel[0]), .Y(n664) );
  NAND2X1 U697 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n665) );
  NAND2X1 U698 ( .A(w_sel[2]), .B(n670), .Y(n667) );
  NAND3X1 U699 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n661) );
  NAND2X1 U700 ( .A(w_sel[1]), .B(n671), .Y(n668) );
  NAND3X1 U701 ( .A(w_en), .B(n672), .C(w_sel[3]), .Y(n663) );
  NAND3X1 U702 ( .A(n672), .B(n669), .C(w_en), .Y(n666) );
  INVX1 U703 ( .A(w_sel[3]), .Y(n669) );
  INVX1 U704 ( .A(w_sel[0]), .Y(n672) );
  NAND2X1 U705 ( .A(n670), .B(n671), .Y(n662) );
  INVX1 U706 ( .A(w_sel[2]), .Y(n671) );
  INVX1 U707 ( .A(w_sel[1]), .Y(n670) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data({dest_data[16], n10, n12, n14, 
        n16, n18, n20, n2, n4, n6, n8, n21, n22, n23, n24, n25, n26}), 
        .r1_data(src1_data), .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX1 U2 ( .A(dest_data[9]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX1 U4 ( .A(dest_data[8]), .Y(n3) );
  INVX2 U5 ( .A(n3), .Y(n4) );
  INVX1 U6 ( .A(dest_data[7]), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n6) );
  INVX1 U8 ( .A(dest_data[6]), .Y(n7) );
  INVX2 U9 ( .A(n7), .Y(n8) );
  INVX1 U10 ( .A(dest_data[15]), .Y(n9) );
  INVX2 U11 ( .A(n9), .Y(n10) );
  INVX1 U12 ( .A(dest_data[14]), .Y(n11) );
  INVX2 U13 ( .A(n11), .Y(n12) );
  INVX1 U14 ( .A(dest_data[13]), .Y(n13) );
  INVX2 U15 ( .A(n13), .Y(n14) );
  INVX1 U16 ( .A(dest_data[12]), .Y(n15) );
  INVX2 U17 ( .A(n15), .Y(n16) );
  INVX1 U18 ( .A(dest_data[11]), .Y(n17) );
  INVX2 U19 ( .A(n17), .Y(n18) );
  INVX1 U20 ( .A(dest_data[10]), .Y(n19) );
  INVX2 U21 ( .A(n19), .Y(n20) );
  BUFX2 U22 ( .A(dest_data[5]), .Y(n21) );
  BUFX2 U23 ( .A(dest_data[4]), .Y(n22) );
  BUFX2 U24 ( .A(dest_data[3]), .Y(n23) );
  BUFX2 U25 ( .A(dest_data[2]), .Y(n24) );
  BUFX2 U26 ( .A(dest_data[1]), .Y(n25) );
  BUFX2 U27 ( .A(dest_data[0]), .Y(n26) );
  AND2X2 U28 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  AND2X2 U29 ( .A(w_data_sel[0]), .B(n29), .Y(n31) );
  INVX2 U30 ( .A(w_data_sel[1]), .Y(n29) );
  BUFX2 U31 ( .A(n32), .Y(n27) );
  OAI21X1 U32 ( .A(n28), .B(n29), .C(n30), .Y(dest_data[9]) );
  AOI22X1 U33 ( .A(ext_data2[9]), .B(n31), .C(ext_data1[9]), .D(n27), .Y(n30)
         );
  INVX1 U34 ( .A(alu_result[9]), .Y(n28) );
  OAI21X1 U35 ( .A(n29), .B(n33), .C(n34), .Y(dest_data[8]) );
  AOI22X1 U36 ( .A(ext_data2[8]), .B(n31), .C(ext_data1[8]), .D(n27), .Y(n34)
         );
  INVX1 U37 ( .A(alu_result[8]), .Y(n33) );
  OAI21X1 U38 ( .A(n29), .B(n35), .C(n36), .Y(dest_data[7]) );
  AOI22X1 U39 ( .A(ext_data2[7]), .B(n31), .C(ext_data1[7]), .D(n27), .Y(n36)
         );
  INVX1 U40 ( .A(alu_result[7]), .Y(n35) );
  OAI21X1 U41 ( .A(n29), .B(n37), .C(n38), .Y(dest_data[6]) );
  AOI22X1 U42 ( .A(ext_data2[6]), .B(n31), .C(ext_data1[6]), .D(n27), .Y(n38)
         );
  INVX1 U43 ( .A(alu_result[6]), .Y(n37) );
  OAI21X1 U44 ( .A(n29), .B(n39), .C(n40), .Y(dest_data[5]) );
  AOI22X1 U45 ( .A(ext_data2[5]), .B(n31), .C(ext_data1[5]), .D(n27), .Y(n40)
         );
  INVX1 U46 ( .A(alu_result[5]), .Y(n39) );
  OAI21X1 U47 ( .A(n29), .B(n41), .C(n42), .Y(dest_data[4]) );
  AOI22X1 U48 ( .A(ext_data2[4]), .B(n31), .C(ext_data1[4]), .D(n27), .Y(n42)
         );
  INVX1 U49 ( .A(alu_result[4]), .Y(n41) );
  OAI21X1 U50 ( .A(n29), .B(n43), .C(n44), .Y(dest_data[3]) );
  AOI22X1 U51 ( .A(ext_data2[3]), .B(n31), .C(ext_data1[3]), .D(n27), .Y(n44)
         );
  INVX1 U52 ( .A(alu_result[3]), .Y(n43) );
  OAI21X1 U53 ( .A(n29), .B(n45), .C(n46), .Y(dest_data[2]) );
  AOI22X1 U54 ( .A(ext_data2[2]), .B(n31), .C(ext_data1[2]), .D(n27), .Y(n46)
         );
  INVX1 U55 ( .A(alu_result[2]), .Y(n45) );
  OAI21X1 U56 ( .A(n29), .B(n47), .C(n48), .Y(dest_data[1]) );
  AOI22X1 U57 ( .A(ext_data2[1]), .B(n31), .C(ext_data1[1]), .D(n27), .Y(n48)
         );
  INVX1 U58 ( .A(alu_result[1]), .Y(n47) );
  OAI21X1 U59 ( .A(n29), .B(n49), .C(n50), .Y(dest_data[15]) );
  AOI22X1 U60 ( .A(ext_data2[15]), .B(n31), .C(ext_data1[15]), .D(n27), .Y(n50) );
  INVX1 U61 ( .A(alu_result[15]), .Y(n49) );
  OAI21X1 U62 ( .A(n29), .B(n51), .C(n52), .Y(dest_data[14]) );
  AOI22X1 U63 ( .A(ext_data2[14]), .B(n31), .C(ext_data1[14]), .D(n27), .Y(n52) );
  INVX1 U64 ( .A(alu_result[14]), .Y(n51) );
  OAI21X1 U65 ( .A(n29), .B(n53), .C(n54), .Y(dest_data[13]) );
  AOI22X1 U66 ( .A(ext_data2[13]), .B(n31), .C(ext_data1[13]), .D(n27), .Y(n54) );
  INVX1 U67 ( .A(alu_result[13]), .Y(n53) );
  OAI21X1 U68 ( .A(n29), .B(n55), .C(n56), .Y(dest_data[12]) );
  AOI22X1 U69 ( .A(ext_data2[12]), .B(n31), .C(ext_data1[12]), .D(n27), .Y(n56) );
  INVX1 U70 ( .A(alu_result[12]), .Y(n55) );
  OAI21X1 U71 ( .A(n29), .B(n57), .C(n58), .Y(dest_data[11]) );
  AOI22X1 U72 ( .A(ext_data2[11]), .B(n31), .C(ext_data1[11]), .D(n27), .Y(n58) );
  INVX1 U73 ( .A(alu_result[11]), .Y(n57) );
  OAI21X1 U74 ( .A(n29), .B(n59), .C(n60), .Y(dest_data[10]) );
  AOI22X1 U75 ( .A(ext_data2[10]), .B(n31), .C(ext_data1[10]), .D(n27), .Y(n60) );
  INVX1 U76 ( .A(alu_result[10]), .Y(n59) );
  OAI21X1 U77 ( .A(n29), .B(n61), .C(n62), .Y(dest_data[0]) );
  AOI22X1 U78 ( .A(ext_data2[0]), .B(n31), .C(ext_data1[0]), .D(n27), .Y(n62)
         );
  NOR2X1 U79 ( .A(w_data_sel[0]), .B(w_data_sel[1]), .Y(n32) );
  INVX1 U80 ( .A(alu_result[0]), .Y(n61) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35;
  assign out[0] = N2;
  assign N2 = in[0];

  XNOR2X1 U2 ( .A(in[15]), .B(n1), .Y(out[15]) );
  OAI21X1 U3 ( .A(in[14]), .B(n2), .C(in[16]), .Y(n1) );
  INVX1 U4 ( .A(n3), .Y(n2) );
  XOR2X1 U5 ( .A(in[14]), .B(n4), .Y(out[14]) );
  NOR2X1 U6 ( .A(n3), .B(n5), .Y(n4) );
  NOR2X1 U7 ( .A(n6), .B(in[13]), .Y(n3) );
  XNOR2X1 U8 ( .A(in[13]), .B(n7), .Y(out[13]) );
  NAND2X1 U9 ( .A(in[16]), .B(n6), .Y(n7) );
  NAND2X1 U10 ( .A(n8), .B(n9), .Y(n6) );
  XNOR2X1 U11 ( .A(n9), .B(n10), .Y(out[12]) );
  NOR2X1 U12 ( .A(n8), .B(n5), .Y(n10) );
  NOR2X1 U13 ( .A(n11), .B(in[11]), .Y(n8) );
  INVX1 U14 ( .A(in[12]), .Y(n9) );
  XNOR2X1 U15 ( .A(in[11]), .B(n12), .Y(out[11]) );
  NAND2X1 U16 ( .A(in[16]), .B(n11), .Y(n12) );
  NAND2X1 U17 ( .A(n13), .B(n14), .Y(n11) );
  XNOR2X1 U18 ( .A(n14), .B(n15), .Y(out[10]) );
  NOR2X1 U19 ( .A(n13), .B(n5), .Y(n15) );
  NOR2X1 U20 ( .A(n16), .B(in[9]), .Y(n13) );
  INVX1 U21 ( .A(in[10]), .Y(n14) );
  XNOR2X1 U22 ( .A(in[9]), .B(n17), .Y(out[9]) );
  NAND2X1 U23 ( .A(in[16]), .B(n16), .Y(n17) );
  NAND2X1 U24 ( .A(n18), .B(n19), .Y(n16) );
  XNOR2X1 U25 ( .A(n19), .B(n20), .Y(out[8]) );
  NOR2X1 U26 ( .A(n18), .B(n5), .Y(n20) );
  NOR2X1 U27 ( .A(n21), .B(in[7]), .Y(n18) );
  INVX1 U28 ( .A(in[8]), .Y(n19) );
  XNOR2X1 U29 ( .A(in[7]), .B(n22), .Y(out[7]) );
  NAND2X1 U30 ( .A(in[16]), .B(n21), .Y(n22) );
  NAND2X1 U31 ( .A(n23), .B(n24), .Y(n21) );
  XNOR2X1 U32 ( .A(n24), .B(n25), .Y(out[6]) );
  NOR2X1 U33 ( .A(n23), .B(n5), .Y(n25) );
  NOR2X1 U34 ( .A(n26), .B(in[5]), .Y(n23) );
  INVX1 U35 ( .A(in[6]), .Y(n24) );
  XNOR2X1 U36 ( .A(in[5]), .B(n27), .Y(out[5]) );
  NAND2X1 U37 ( .A(in[16]), .B(n26), .Y(n27) );
  NAND2X1 U38 ( .A(n28), .B(n29), .Y(n26) );
  XNOR2X1 U39 ( .A(n29), .B(n30), .Y(out[4]) );
  NOR2X1 U40 ( .A(n28), .B(n5), .Y(n30) );
  INVX1 U41 ( .A(in[16]), .Y(n5) );
  NOR2X1 U42 ( .A(n31), .B(in[3]), .Y(n28) );
  INVX1 U43 ( .A(in[4]), .Y(n29) );
  XNOR2X1 U44 ( .A(in[3]), .B(n32), .Y(out[3]) );
  NAND2X1 U45 ( .A(in[16]), .B(n31), .Y(n32) );
  OR2X1 U46 ( .A(n33), .B(in[2]), .Y(n31) );
  XNOR2X1 U47 ( .A(in[2]), .B(n34), .Y(out[2]) );
  NAND2X1 U48 ( .A(in[16]), .B(n33), .Y(n34) );
  OR2X1 U49 ( .A(in[1]), .B(N2), .Y(n33) );
  XNOR2X1 U50 ( .A(in[1]), .B(n35), .Y(out[1]) );
  NAND2X1 U51 ( .A(N2), .B(in[16]), .Y(n35) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  wire   SYNOPSYS_UNCONNECTED__0;

  controller whooop_whoop ( .clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(
        load_coeff), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), 
        .modwait(modwait), .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), .dest(dest), .err(err) );
  counter thats_the ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(
        clear), .one_k_samples(one_k_samples) );
  datapath sound_of_the ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
  magnitude police ( .in(outreg_data), .out(fir_out) );
endmodule


module ahb_lite_fir_filter ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, 
        hwdata, hrdata, hresp );
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, hsel, hsize, hwrite;
  output hresp;
  wire   data_ready, new_coefficient_set, modwait, err, load_coeff;
  wire   [15:0] sample_data;
  wire   [1:0] coefficient_num;
  wire   [15:0] fir_coefficient;
  wire   [15:0] fir_out;

  ahb_lite_slave whoever_threw_that_paper ( .clk(clk), .n_rst(n_rst), 
        .coefficient_num(coefficient_num), .modwait(modwait), .fir_out(fir_out), .err(err), .hsel(hsel), .haddr(haddr), .hsize(hsize), .htrans(htrans), 
        .hwrite(hwrite), .hwdata(hwdata), .clear_new_coefficient(1'b0), 
        .sample_data(sample_data), .data_ready(data_ready), 
        .new_coefficient_set(new_coefficient_set), .fir_coefficient(
        fir_coefficient), .hrdata(hrdata), .hresp(hresp) );
  coefficient_loader your_moms ( .clk(clk), .n_reset(n_rst), 
        .new_coefficient_set(new_coefficient_set), .modwait(modwait), 
        .load_coeff(load_coeff), .coefficient_num(coefficient_num) );
  fir_filter a_ho ( .clk(clk), .n_reset(n_rst), .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient), .load_coeff(load_coeff), 
        .data_ready(data_ready), .modwait(modwait), .fir_out(fir_out), .err(
        err) );
endmodule

