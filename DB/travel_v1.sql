/*
 Navicat Premium Data Transfer

 Source Server         : ONYX-3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : travel_v1

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 21/02/2022 20:59:18
*/
Drop database if exists travel_v1;
create database travel_v1;
use travel_v1;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for binhluan
-- ----------------------------
DROP TABLE IF EXISTS `binhluan`;
CREATE TABLE `binhluan`  (
  `id_bl` int NOT NULL AUTO_INCREMENT,
  `id_chitiet` int NOT NULL,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trangthai` int NOT NULL,
  `ngaygio` date NOT NULL,
  PRIMARY KEY (`id_bl`) USING BTREE,
  INDEX `id_chitiet`(`id_chitiet`) USING BTREE,
  CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`id_chitiet`) REFERENCES `chitiettour` (`id_chitiet`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of binhluan
-- ----------------------------

-- ----------------------------
-- Table structure for chitiettour
-- ----------------------------
DROP TABLE IF EXISTS `chitiettour`;
CREATE TABLE `chitiettour`  (
  `id_chitiet` int NOT NULL AUTO_INCREMENT,
  `id_tour` int NOT NULL,
  `ngaydi` datetime(0) NOT NULL,
  `ngayve` datetime(0) NOT NULL,
  `soluong` int NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
--   `id` int ,
  PRIMARY KEY (`id_chitiet`) USING BTREE,
  INDEX `id_tour`(`id_tour`) USING BTREE,
--   INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `chitiettour_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`) ON DELETE RESTRICT ON UPDATE RESTRICT
--   CONSTRAINT `chitiettour_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chitiettour
-- ----------------------------
INSERT INTO `chitiettour` VALUES (1, 1, '2023-05-01 11:06:00', '2023-05-06 00:03:00', 24, 'Du lịch Miền Trung - Tour Du lịch Đà Nẵng được thiên nhiên đặc biệt ưu đãi, mảnh đất miền Trung đẹp với nhiều dãy núi hùng vỹ xanh rì, những bờ biển cát trắng mịn thoai thoải và những dòng sông trong vắt thơ mộng. Không những vậy, trên con đường di sản miền Trung cùng du lịch thanh tùng, du khách còn được thưởng ngoạn những di sản thế giới cuả Việt Nam đó là Phố cổ Hội An – nơi bến cảng một thời sầm uất nhất Đông Dương, quần thể di tích Cố Đô Huế với hệ thống đền đài lăng tẩm nguy nga tráng lệ và Động Phong Nha với nhiều hang động kì bí của tạo hóa..', 'g1.jpg');
INSERT INTO `chitiettour` VALUES (2, 2, '2023-06-13 04:02:00', '2023-06-18 15:01:00', 25, 'Tour Hà Nội - Hạ Long - Sapa 5 Ngày 4 đêm là một hành trình kết hợp 3 địa điểm hấp dẫn và thu hút khách nhất của Miền bắc. Du khách cùng nồng nàn họa quyện vào không khí náo nhiệt nhưng cũng rất cổ kính tại Hà Nội Thủ Đô. Cùng Trải nghiệm cảm giác ngồi tàu ngắm nhìn kỳ quan thế giới Vịnh Hạ Long. Chinh phục nóc nhà nhà Fansipan. Quà nhiều điều hấp dẫn đang chờ đợi. Hãy cùng Du Lịch Sài Gòn Thành Công khám phá hành trình thú vị này nhé.', '9fqWJJX2PpQczomQytZnxayJB876gegyNouIC3z2.jpeg');
INSERT INTO `chitiettour` VALUES (3, 3, '2023-06-07 02:03:00', '2023-06-10 14:01:00', 24, 'Nha Trang - thành phố biển nổi tiếng, gây ấn tượng với bao người ngay từ tên gọi dịu dàng, thân thương. Tạo hóa đã ưu ái dành tặng cho phố biển tinh khôi tất cả nét đẹp của một vùng duyên hải, từ những bãi biển quyến rũ, trải dài, những bãi cát trắng mịn đến những hòn đảo ngoài khơi hoang sơ, những rạn san hô kỳ vỹ, muôn màu… Vậy nên đừng chần chừ đặt ngay tour du lịch Nha Trang và lên đường khám phá nhé. ', 'tzunu85Z99ukZqiRSVyUBkiTiMzNG9aSEq1exEUG.jpeg');
INSERT INTO `chitiettour` VALUES (4, 4, '2023-06-20 02:04:00', '2023-06-23 02:04:00', 25, 'Với vị trí địa lý đặc biệt – Cực Nam của Tổ quốc trên đất liền, du lịch Cà Mau từ lâu đã trở thành điểm đến thiêng liêng và hấp dẫn. Chương trình Tour Cà Mau đưa quý khách về Đất Mũi tận mắt ngắm nhìn nơi cuối cùng của đất phương Nam, tìm hiểu hệ sinh thái rừng ngập mặn phong phú, đa dạng ở Vườn quốc gia Mũi Cà Mau. Cùng Thám Hiểm MeKong trải nghiệm cuộc sống mưu sinh của người dân địa phương với các hoạt động như đi giỡ cua, mò sò, giăng lưới, soi ba khía…', '9fkaQtAamf50CT5XvGwK1CzjktruxgeVZCm7CGPx.jpeg');
INSERT INTO `chitiettour` VALUES (5, 5, '2023-06-14 02:03:00', '2023-06-18 14:02:00', 25, 'Tour Tiền Giang - Cần Thơ sẽ đưa bạn về với vùng quê sông nước của miền Tây Việt Nam. Bạn sẽ được tận hưởng không khí trong lành của vườn cây trái, hương phù sa từ dòng sông Mekong hiền hoà, hương lúa Việt Nam. Thưởng thức những món ngon của vùng hương đồng lúa nội.', 'lFpUx3QLwugVNThLdnG0OC7yxfZ9899lmRqEScuN.jpeg');
INSERT INTO `chitiettour` VALUES (6, 6, '2023-06-22 02:04:00', '2023-06-25 15:04:00', 9, 'Tour Tiền Giang - Cần Thơ sẽ đưa bạn về với vùng quê sông nước của miền Tây Việt Nam. Bạn sẽ được tận hưởng không khí trong lành của vườn cây trái, hương phù sa từ dòng sông Mekong hiền hoà, hương lúa Việt Nam. Thưởng thức những món ngon của vùng hương đồng lúa nội.', '6lb639AmFGUpYklxgmUZhhQqJsYb3axcXScwXa9Y.jpeg');
INSERT INTO `chitiettour` VALUES (7, 7, '2023-06-16 13:02:00', '2023-06-19 14:03:00', 24, 'Với Tour Miền Tây chỉ 4 ngày quý khách có thể khám phá trọn vẹn vùng sông nước miền Tây với các điểm đến hấp dẫn tại Cần Thơ, Sóc Trăng, Bạc Liêu và Cà Mau. Tham gia Tour Miền Tây: Cần Thơ – Bạc Liêu – Cà Mau quý khách trải nghiệm du thuyền trên sông Mekong huyền thoại, nghe đờn ca tài tử sâu lắng và sẽ được nghỉ ngơi thư giãn đúng nghĩa. ', 'yqklgL5Yja2mXE0K8yf6opePitujiod2CzzQyOI5.jpeg');
INSERT INTO `chitiettour` VALUES (8, 8, '2023-06-22 04:02:00', '2023-06-25 14:03:00', 25, 'Nhắc đến Đà Lạt, du khách nghĩ ngay đến thành phố với một chút buồn, rất nên thơ và lãng mạn, thêm cái lành lạnh của thời tiết cuối năm đã mang lại vị trí vàng để du khách lựa chọn là điểm đến cùng bạn bè và người thân...', 'fWP9LNQcVHZf1f9ZidSXJCW1WVxTg16uhAMGQraY.jpeg');
INSERT INTO `chitiettour` VALUES (9, 9, '2023-06-22 15:01:00', '2023-06-25 03:04:00', 24, 'Miền Trung, dải đất thân thương nối liền hai miền Nam - Bắc của Việt Nam. “Cung đường di sản miền Trung” sẽ kết nối du khách với các di sản văn hóa của nhân loại được UNESCO công nhận bao gồm: Quảng Bình cùng Vườn quốc gia Phong Nha - Kẻ Bàng; Huế với hai di sản là Quần thể di tích Cố đô Huế và Nhã Nhạc cung đình; Quảng Nam với hai di sản là Thánh địa Mỹ Sơn và đô thị cổ Hội An. Trên mỗi bước đi, du khách còn có thể khám phá cho mình nhiều điểm đến hấp dẫn: Bà Nà Hill, Làng Chài Lăng Cô, …và nhiều bãi tắm tuyệt đẹp: Cửa Đại, Non Nước, Lăng Cô, Nhật Lệ…cùng với những nét ẩm thực độc đáo của Miền Trung. Cùng trải nghiệm cung đường tuyệt vời này ngay hôm nay!', 'mCziIlZi8EtH02hAogJYUe5V4EXbofmaSX4inm3T.jpeg');
INSERT INTO `chitiettour` VALUES (10, 10, '2023-07-18 02:03:00', '2023-07-21 15:04:00', 24, 'Sapa từ lâu đã được khách du lịch gọi với cái tên đầy thân thương đó là “nơi gặp gỡ đất trời” hay “thị trấn sương mù”. Vậy tại sao nơi đây lại gây ấn tượng mạnh với khách du lịch trong và ngoài nước với vẻ đẹp của sương mù như vậy. Hãy cùng chiêm ngưỡng vẻ đẹp Sapa trong sương để thấy được vẻ đẹp huyền ảo và mộng mơ của thị trấn vùng cao Tây Bắc nổi tiếng này nhé! ', 'K3OzMJdBUepkvlYdIIGavzEqABQx3SBO5fDFYWFz.jpeg');
INSERT INTO `chitiettour` VALUES (11, 11, '2023-07-20 02:03:00', '2023-07-23 14:04:00', 25, 'Hãy bỏ lại mọi bận rộn của cuộc sống thường ngày và tự thưởng cho bản thân một trải nghiệm ấn tượng tại Show Huyền Thoại Làng Chài Phan Thiết nào! Đến với sân khấu kịch nhạc nước với qui mô hơn 1.500 chỗ ngồi, bạn sẽ đắm chìm trước câu chuyện đầy cảm động về niềm tin biển cả và ước mơ của người dân làng chài Phan Thiết.', 'wocmZx2HF5OOztSLlycpY2SJySXIIlVwhEjF1SWn.jpeg');
INSERT INTO `chitiettour` VALUES (12, 12, '2023-08-03 03:02:00', '2023-08-09 03:02:00', 23, 'Tour Lễ Hội Pháo Hoa Đà Nẵng - Huế ..............', 'qYZRQF9U8HjBf9nLLoldgAiesE9cXAoxwhhSowmP.png');
INSERT INTO `chitiettour` VALUES (13, 13, '2023-09-16 02:03:00', '2023-09-18 04:02:00', 23, 'Hành trình chinh phục vùng non nước hữu tình Đông Bắc và trải nghiệm trọn vẹn khoảnh khắc đất trời giao mùa tại vùng đất xinh đẹp này. Tour du lịch Đông Bắc sẽ là một lựa chọn tuyệt vời đưa quý khách tham quan và khám phá Hà Giang - Tuyệt tác vùng cao, vùng đất Cao Bằng - lịch sử in dấu và trải nghiệm những nét văn hóa độc đáo nơi đây,....', 'pN5SdOhEx7pWuJma8h2tWqNDSO45O2ZIDoBKv3Sz.jpeg');
INSERT INTO `chitiettour` VALUES (14, 14, '2023-08-21 02:03:00', '2023-08-24 15:02:00', 24, 'Combo Sapa 2 ngày khởi hành từ Hà Nội - Khách sạn 4 sao Sapa Charm Hotel..............', 'QIoNbGcEuwo7Q2X8g4Ry0WS7Qcx0ADezkK2MadKg.jpeg');
INSERT INTO `chitiettour` VALUES (15, 15, '2023-08-23 03:02:00', '2023-08-25 14:03:00', 25, 'Xứ Bắc – vùng đất khai cơ của các Vương triều Việt, nơi định đô của hầu hết các triều đại phong kiến Việt Nam chính vì vậy nơi đây được xem như là đất kinh đô ngàn năm văn hiến với một bề dày văn hóa, lịch sử sâu sắc và đa dạng.', 'F0vjVN2jllY6rNx2JH7tjNuiiuejtSTp6C3cWOyk.jpeg');
INSERT INTO `chitiettour` VALUES (16, 16, '2023-08-30 03:53:00', '2023-09-03 14:03:00', 25, 'Du Lịch Miền Tây dịp lễ 2/9 - Xuôi về vùng đất Miền Tây Nam Bộ, du khách sẽ được trải nghiệm cuộc sống nơi những con rạch nhỏ xen kẽ rợp bóng dừa, háo hứng với chợ nổi nhộn nhịp ghe thuyền đầy ắp các loại trái cây miệt vườn, thưởng thức những món ăn đặc sản cá tai tượng chiên xù, uống nước dừa xiêm, nghe đờn ca tài tử và nhâm nhi chén trà mật ong thanh mát. Cùng Du lịch Việt trải nghiệm những đặc trưng nơi con người miền Tây sông nước mộc mạc thân thương qua hành trình ngắn 2 ngày 1 đêm.', 'sDv3V2eYaaiqfNKNglkVM2KIfivMSYnxVvGvWCHn.jpeg');
INSERT INTO `chitiettour` VALUES (17, 17, '2023-07-25 02:04:00', '2023-07-28 02:04:00', 25, 'Là hành trình cực kỳ ý nghĩa và cũng không kém phần thú vị. Với hành trình này du khách có dịp hành hương cầu bình an, may mắn tại những ngôi chùa nổi tiếng linh thiêng, tham quan và khám phá những địa danh nổi tiếng của Bạc Liêu, Sóc Trăng. Viếng Quan Âm Phật Đài Mẹ Nam Hải Bạc Liêu, một công trình văn hóa tâm linh nổi bật của tỉnh, với pho tượng Bồ Tát Quán Thế Âm hay người dân nơi đây còn gọi lại Mẹ Nam Hải Bạc Liêu cao 11 mét, đứng uy nghi giữa một không gian thoáng đãng hướng nhìn ra biển Đông.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (18, 18, '2023-06-22 02:04:00', '2023-06-26 02:04:00', 25, 'Đến với du lịch Phú Quốc, ngoài những điểm tham quan thuần túy như Dinh Cậu, Hàm Ninh, Suối Tranh, Bãi Sao, mua sắm ngọc trai, nước mắm, rượu Sim,… thì từ tháng 10 đến tháng 5 năm sau Hòn Mây Rút, Hòn Móng Tay lại là điểm đến nổi như cồn của giới trẻ hay những người đam mê khám phá những bãi biển đẹp, hoang sơ. Cùng Du Lịch Việt trải nghiệm hành trình tour thú vị, hấp dẫn này nhé.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (19, 19, '2023-06-01 02:04:00', '2023-06-04 02:04:00', 25, 'Du Lịch Miền Bắc - Du khách sẽ hoàn toàn lạc trôi vào coi thiên đường chốn nhân gian với hành trình 4 ngày. Du khách sẽ bị hút vào ngút ngàn màu xanh của đồng ruộng và khám phá những nơi lưu giữ vẻ đẹp nguyên sơ các nếp nhà sàn, cùng nét thú vị độc đáo của con người, phong tục tập quán của người đồng bào. Thỏa sức khám phá cảnh núi đồi chập chùng, những dòng nước uốn lượn và những hang đá ẩn sâu phía dưới chân núi, đắm mình trong khung cảnh hữu tình, cầu tài cầu lộc cho cuộc sống bình an, gia đình hạnh phúc.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (20, 20, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Lễ 30/4 - Tour Du lịch Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sapa từ Sài Gòn 2023. Tour Du lịch Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sa Pa từ Sài Gòn. Hành trình phương Bắc sẽ đưa du khách đến Hà Nội 36 phố phường, nếm đặc sản đất Hà Thành, chìm đắm trong nên thơ cảnh sắc núi rừng Yên Tử, cảm nhận không gian bao la hùng vĩ của Hạ Long, khám phá nét đặc sắc của văn hóa vùng cao nơi phố núi Sapa với mênh mông những thửa ruộng bậc thang xanh ngút ngàn và tìm hiểu đời sống văn hóa của đồng bào dân tộc – Đó là những gì mà du khách cảm nhận được trong 5 ngày 4 đêm, chương trình “Hà Nội – Yên Tử – Hạ Long – Lào Cai – Sapa” ', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (21, 21, '2023-06-29 02:04:00', '2023-07-03 02:04:00', 25, 'Quảng Bình là một trong các tỉnh miền Trung được thiên nhiên ưu ái khi sở hữu vườn Quốc gia Phong Nha - Kẻ Bàng có hệ thống hang động núi đá vôi, suối ngầm, sông ngầm đẹp bậc nhất thế giới. Do vậy mà không chỉ “Thiên Nam đệ nhất động” Phong Nha, khu vực vườn Quốc gia còn những hang động kỳ vĩ khác như động Thiên Đường, động Tiên Sơn, sông Chày hang Tối, suối Moọc với vẻ đẹp ấn tượn', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (22, 22, '2023-05-29 02:04:00', '2023-06-03 02:04:00', 25, 'Du lịch Hè - Tour Du lịch Quy Nhơn - Phú Yên từ Hà Nội 2023. Quy Nhơn – Thành phố trung tâm của Tỉnh Bình Định với bờ biển dài, chạy quanh thành phố, được đánh giá là một trong những bãi biển đẹp nhất Miền Trung. Với thành Đồ Bàn – Kinh đô cũ của đất nước Champa vẫn còn đó những nét vết tích cổ kính, rêu phong. Tháp Đôi, cụm kiến trúc Tháp Chăm đặc sắc độc đáo bậc nhất Bình Đình, nằm ẩn mình trong 1 thành phố năng động hiếu khách. Đến Quy Nhơn quý khách nhớ ghé viếng thăm Mộ của thi nhân Hàn Mặc Tử, một thi sĩ tài hoa mà bạc mệnh. Đến Quy Nhơn quý khách hãy 1 lần ghé qua quê hương của người Anh Hùng Áo Vải – Quang Trung Nguyễn Huệ. Nằm cách Tp Quy Nhơn khoảng 100km về phía nam, Tp Tuy Hòa vẫn khá mới lạ và còn nhiều nét hoang sơ trong bản đồ du lịch của nhiều du khách. Đến Tuy Hòa, quý khách nhất định phải ghé đến Gành Đá Đĩa – Thắng cảnh độc nhất vô nhị của Việt Nam, Gành Ông – Bãi Xép nơi ghi dấu của bộ phim “Tôi thấy hoa vàng trên cỏ xanh” nổi tiếng của Victo Vũ.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (23, 23, '2023-08-01 02:04:00', '2023-08-06 02:04:00', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang từ Hà Nội 2023. Nha Trang, thành phố biển với cát trắng, quanh năm sóng vỗ rì rào, được ví như Địa Trung Hải của Việt Nam. Đến Nha Trang, du khách không chỉ được tận hưởng những ngày nghỉ biển tuyệt vời bên bờ biển trải dài, bầu trời xanh ngắt… mà du khách còn được trải nghiệm những dịch vụ vui chơi giải trí đẳng cấp hàng đầu Việt Nam.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (24, 24, '2023-09-29 02:04:00', '2023-10-03 02:04:00', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang bay Bamboo Airways từ Hà Nội 2023. Nha Trang, thành phố biển với cát trắng, quanh năm sóng vỗ rì rào, được ví như Địa Trung Hải của Việt Nam. Đến Nha Trang, du khách không chỉ được tận hưởng những ngày nghỉ biển tuyệt vời bên bờ biển trải dài, bầu trời xanh ngắt… mà du khách còn được trải nghiệm những dịch vụ vui chơi giải trí đẳng cấp hàng đầu Việt Nam. ', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (25, 25, '2023-03-01 02:04:00', '2023-03-05 02:04:00', 25, 'Du lịch Hè Tour Du lịch Quy Nhơn - Tuy Hòa - Quy Nhơn từ Hà Nội 2023. Quy Nhơn – Thành phố trung tâm của Tỉnh Bình Định với bờ biển dài, chạy quanh thành phố, được đánh giá là một trong những bãi biển đẹp nhất Miền Trung. Với thành Đồ Bàn – Kinh đô cũ của đất nước Champa vẫn còn đó những nét vết tích cổ kính, rêu phong. Tháp Đôi, cụm kiến trúc Tháp Chăm đặc sắc độc đáo bậc nhất Bình Đình, nằm ẩn mình trong 1 thành phố năng động hiếu khách. Đến Quy Nhơn quý khách nhớ ghé viếng thăm Mộ của thi nhân Hàn Mặc Tử, một thi sĩ tài hoa mà bạc mệnh', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (26, 26, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Hè Tour Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Đất Mũi - Châu Đốc từ Hà Nội 2023. Tạo hóa đã ban tặng cho miền Tây cái đẹp mộc mạc mà nên thơ, với những cánh đồng xanh bát ngát, những miệt vườn sai quả, những ngả đường trĩu nặng phù sa. Đặc biệt, du khách sẽ được xuôi về miền sang nước hữu tình này để chu du, thưởng ngoạn và trải nghiệm những điều bình dị, chân phương.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (27, 27, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Hè Tour Du lịch Phú Quốc Khám phá Đảo Ngọc từ Hà Nội 2023. Du lịch Phú Quốc Khám phá Grand World Phú Quốc là một dự án siêu khủng tái hiện những công trình của thế giới như: kênh đào Venice lãng mạn, công trình tre khổng lồ, bảo tàng gấu Teddy… Ngoài ra nơi đây còn có hàng loạt tiện ích mới được nâng cấp cùng chuỗi hoạt động nghệ thuật độc đáo và những sự kiện âm nhạc đặc sắc, quy mô “khủng” mang đến không khí lễ hội bất tận suốt 365 ngày/năm.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (28, 28, '2023-04-29 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Hè - Tour Hà Nội - Sài Gòn - Mũi Né - Vũng Tàu từ Hà Nội 2023. Du lịch Mũi Né - Mũi Né là một mũi biển ở thành phố Phan Thiết, một trung tâm du lịch nổi tiếng của tỉnh Bình Thuận. tên gọi Mũi Né xuất phát từ ngư dân đánh cá. "Mũi" là cái mũi đất đưa ra biển lớn; "Né" có nghĩa là nơi tránh giông bão. Cùng Du Lịch Việt khám phá Mũi Né sẽ  đưa Quý khách tham quan, Lâu đài Vang RD trong khu nghỉ dưỡng Sealink: Tại đây, du khách có cảm giác trở về thời trung cổ của châu Âu với khu quảng trường rộng lớn, mái vòm cổ kính, trang nhã, sang trọng, và những tháp canh cao vút trải tầm nhìn ra không gian tươi xanh của Sea Links City và toàn vịnh Mũi Né', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (29, 29, '2023-04-30 02:04:00', '2023-04-30 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Hoa Lư - Tam Cốc 1 ngày từ Hà Nội 2023. Du lịch Ninh Bình - Ninh Bình một tỉnh thuộc Miền Bắc nước ta, cách thủ đô Hà Nội 90km về phía Nam. Đến với Tour du lịch Ninh Bình du khách sẽ được tham quan với nhiều danh lam thắng đẹp cả về cảnh quan và ý nghĩa lịch sử. Nơi đây đã trở thành nơi được nhiều du khách lựa chọn trong kỳ nghỉ dưỡng của mình. Ngoài ra, khi đi tour Ninh Bình, bạn còn có thể thưởng thức nhiều món ăn đặc sắc, tham gia nhiều lễ hội thú vị mà chỉ có thể bắt gặp ở vùng đất này. Hãy tham khảo các tour du lịch Ninh Bình đang được du lịch thanh tùng mở bán hàng tuần tại Website trực tuyến, để lựa chọn cho mình chuyến du lịch phù hợp nhé! ', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (30, 30, '2023-05-01 02:04:00', '2023-05-01 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Bái Đính - Tràng An 1 ngày từ Hà Nội 2023. Chùa Bái Đính là một quần thể chùa lớn với nhiều kỷ lục châu Á và Việt Nam được xác lập như chùa có tượng Phật bằng đồng dát vàng lớn nhất châu Á, chùa có hành lang La Hán dài nhất châu Á, có tượng Di lặc bằng đồng lớn nhất Đông Nam Á... Đây là ngôi chùa lớn nhất và sở hữu nhiều kỷ lục nhất ở Việt Nam. Các hạng mục xây dựng, mở rộng khu chùa mới được các đại biểu tham dự đại lễ Phật đản thế giới 2008 làm lễ khánh thành giai đoạn 1, năm 2010 chùa Bái Đính là nơi tổ chức Đại lễ cung nghinh xá lợi Phật đầu tiên từ Ấn Độ về Việt Nam.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (31, 31, '2023-06-01 02:04:00', '2023-06-01 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Hương 1 ngày từ Hà Nội 2023. Chùa Hương hay còn gọi chùa Hương Tích, là một trong những ngôi chùa nổi tiếng bậc nhất miền Bắc bởi vị trí tọa lạc nơi non nước hữu tình với cảnh sắc thiên nhiên tuyệt đẹp. Chùa Hương cũng là ngôi chùa mang đậm giá trị tâm linh thiêng liêng của người Việt. Đến thăm chùa Hương, du khách không chỉ được cầu tài phát lộc, thanh tịnh tâm hồn mà còn được chiêm ngưỡng bức tranh thiên nhiên đẹp như tiên cảnh và thưởng thức nhiều đặc sản độc đáo.Mặc dù nằm xa trung tâm nhưng chùa Hương vẫn thu hút hàng triệu du khách gần xa đến dâng hương lễ phật hàng năm và trở thành một trong những điểm Du lịch Hà Nội được nhiều người yêu thích nhất.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (32, 32, '2023-05-03 02:04:00', '2023-05-03 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Yên Tử 1 ngày từ Hà Nội 2023. " Trăm năm tích đức tu hành - Chưa đi Yên Tử, chưa thành quả tu.” Dẫu không thành chính quả nhưng một lần hành hương về Yên Tử, du khách sẽ được nếm trải không ít khổ nạn trên con đường tìm đến một chút thanh tịnh, bình yên cho tâm hồn. Nằm chênh vênh trên độ cao 1.068m, Chùa Đồng – điểm đến cuối cùng trong quần thể di tích Trúc Lâm Yên Tử là sự thách thức lòng thành tâm của các thiện nam tín nữ và sự kiên nhẫn của các du khách vãn cảnh có mong muốn được thỉnh ba hồi chuông giữa chót vót mây vờn sương cuộn.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (33, 33, '2023-04-30 02:04:00', '2023-04-30 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - City Tour Hà Nội 1 ngày giá tốt 2023. " Hà Nội – thủ đô ngàn năm văn hiến luôn cuốn hút du khách bởi nét cổ kính, yên bình lạ kỳ. Một chuyến tham quan quanh Hà Nội sẽ để lại trong lòng du khách những kỷ niệm khó quên về 36 khu phố nghề cổ kính của Hà Nội xưa, Văn miếu Quốc Tử Giám – biểu trưng của một thủ đô giàu truyền thống hiếu học, hồ Hoàn Kiếm và đền Ngọc Sơn – trái tim của Hà Nội, lăng chủ tịch Hồ Chí Minh – nơi an nghỉ ngàn thu của Bác Hồ kính yêu', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (34, 34, '2023-05-01 02:04:00', '2023-05-01 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Tam Chúc - Tràng An 1 ngày từ Hà Nội 2023. Trong đời sống tâm linh của người Việt, chùa là một địa danh rất linh thiêng và tôn kính. Người ta đến chùa không chỉ để cầu may, tìm sự bình an, sự thanh thản, mà còn để tìm về với cội nguồn dân tộc. Đi chùa đã trở thành một việc làm không thể thiếu của rất nhiều người dân Việt Nam mỗi dịp Tết đến, xuân về. Tour du lịch chùa Tam Chúc 1 ngày đưa quý khách đến với ngôi chùa lớn nhất Đông Nam Á, đươc coi là “Hạ Long trên cạn” sau khi khánh thành sẽ chở thành khu du lịch trọng điểm cùa Hà Nam, Hãy cùng nhau  khám phá tour du lịch Chùa Tam Chúc 1 ngày nhé.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (35, 35, '2023-08-05 02:04:00', '2023-08-07 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Hạ Long - Hà Nội 2N1Đ từ Hà Nội 2023. Trong đời sống tâm linh của người Việt, chùa là một địa danh rất linh thiêng và tôn kính. Người ta đến chùa không chỉ để cầu may, tìm sự bình an, sự thanh thản, mà còn để tìm về với cội nguồn dân tộc. Đi chùa đã trở thành một việc làm không thể thiếu của rất nhiều người dân Việt Nam mỗi dịp Tết đến, xuân về. Tour du lịch chùa Tam Chúc 1 ngày đưa quý khách đến với ngôi chùa lớn nhất Đông Nam Á, đươc coi là “Hạ Long trên cạn” sau khi khánh thành sẽ chở thành khu du lịch trọng điểm cùa Hà Nam, Hãy cùng nhau  khám phá tour du lịch Chùa Tam Chúc 1 ngày nhé.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (36, 36, '2023-06-06 02:04:00', '2023-06-09 02:04:00', 25, 'Du lịch Miền Bắc Hà Nội - Aquamarine Du Thuyền Ngủ Đêm 3N2Đ từ Hà Nội 2023. Du thuyền Hạ Long Aquamarine được thiết kế với vỏ thép và nội thất gỗ, 21 phòng ngủ hạng sang cực kỳ thoải mái và đẳng cấp. Các không gian nhà hàng, sundeck cực kỳ rộng rãi và thoải mái. Đội ngũ nhân viên được đào tạo chuyên nghiệp sẽ mang lại cho du khách một trải nghiệm tuyệt vời trên vịnh Hạ Long..', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (37, 37, '2023-09-09 02:04:00', '2023-09-11 02:04:00', 25, 'Du lịch Hà Nôi - Sapa - Bản Cát Cát - Check in Moana từ Hà Nội 2023. Du lịch Sapa - "Thành phố trong sương" nổi tiếng với với cảnh quan núi non hùng vĩ, khí hậu trong lành hoang sơ, quanh năm mát mẻ sẽ giúp bạn có được những giờ phút nghỉ dưỡng đúng nghĩa. Đến với tour Sapa bạn sẽ được trải nghiệm ngắm tuyết rơi vào mùa Đông, trèo lên đỉnh núi Fansipan - nơi được mệnh danh là nóc nhà Đông Dương, và được dạo quanh thung lũng Mường Hoa làm say lòng người. Thông qua tour du lịch Sapa du khách còn có dịp được trải nghiệm nhiều nét văn hóa độc đáo với cuộc sống của đồng bào dân tộc thiểu số vùng Miền núi phía Bắc, thưởng thức các món ăn truyền thống đặc sắc nơi đây', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (38, 38, '2023-05-11 02:04:00', '2023-05-13 02:04:00', 25, 'Du lịch Hà Nôi - Sapa - Bản Cát Cát - Check in Moana từ Hà Nội 2023. Du lịch Sapa - "Thành phố trong sương" nổi tiếng với với cảnh quan núi non hùng vĩ, khí hậu trong lành hoang sơ, quanh năm mát mẻ sẽ giúp bạn có được những giờ phút nghỉ dưỡng đúng nghĩa. Đến với tour Sapa bạn sẽ được trải nghiệm ngắm tuyết rơi vào mùa Đông, trèo lên đỉnh núi Fansipan - nơi được mệnh danh là nóc nhà Đông Dương, và được dạo quanh thung lũng Mường Hoa làm say lòng người. Thông qua tour du lịch Sapa du khách còn có dịp được trải nghiệm nhiều nét văn hóa độc đáo với cuộc sống của đồng bào dân tộc thiểu số vùng Miền núi phía Bắc, thưởng thức các món ăn truyền thống đặc sắc nơi đâ', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (39, 39, '2023-08-15 02:04:00', '2023-08-19 02:04:00', 25, 'Du lịch Miền Tây Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Châu Đốc từ Hà Nội 2023. Tạo hóa đã ban tặng cho miền Tây cái đẹp mộc mạc mà nên thơ, với những cánh đồng xanh bát ngát, những miệt vườn sai quả, những ngả đường trĩu nặng phù sa. Đặc biệt, du khách sẽ được xuôi về miền sang nước hữu tình này để chu du, thưởng ngoạn và trải nghiệm những điều bình dị, chân phương - Xuôi về Miền Tây, Du Khách có dịp trải nghiệm thú vị khi hòa mình vào cuộc sống miệt vườn, thưởng thức những món ăn đặc sản đậm đà hương vị của vùng đồng bằng cây ngọt trái lành. Đến Cần Thơ, vùng đất mệnh danh là “Tây Đô”, lên thuyền du ngoại chợ nổi Cái Răng, trực tiếp trải nghiệm nét văn hóa độc đáo trên sông nước. Ghé Sóc Trăng, thăm Chùa Dơi hơn 400 năm tuổi, vừa chiêm ngưỡng lối kiến trúc Khơmer độc đáo vừa nghe kể về đàn dơi huyền bí trụ ngụ trong khuôn viên chùa. Đặt chân đến Đất Mũi, vùng đất cuối cùng của Tổ quốc, đứng trên đài quan sát, Du Khách sẽ thu vào tầm mắt khung cảnh rừng mắm, rừng đước xanh rì nối nhau, trải dài ngút ngàn, tiếp giáp với mây trời. Đến Bạc Liêu, khám phá miền quê hương của chàng Công Tử tiêu tiền như nước, nghe nhắc lại những giai thoại nức tiếng gần xa trong quá khứ về sự xa hoa', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (40, 40, '2023-07-05 02:04:00', '2023-07-09 02:04:00', 25, 'Du lịch Tây Nguyên - Pleiku - Buôn Mê Thuột mùa Hoa Cafe từ Hà Nội 2023. Xuân về, mảnh đất Cao Nguyên như khoác lên mình một tấm áo choàng mới, với bạt ngàn màu trắng tinh khiết của loài cây đặc sản của vùng đất đỏ Bazan – Cafe. Khắp các thung lũng, sườn đồi, nương rẫy Cafe ngút ngàn tầm mắt, những bông hoa trắng, nhỏ tinh khiết nổi bật lên giữa màu đỏ của đất, màu xanh của lá...hút hồn tất cả du khách. Buôn Mê Thuột – Thành phố lớn bậc nhất Tây Nguyên, thủ phủ của hồ tiêu, Cafe. Pleiku nơi có Biển Hồ Tơ Nưng, vết tích còn sót lại của ngọn núi lửa hàng triệu năm tuổi, ngày nay thành 1 hồ nước trong xanh, soi bóng thông reo vi vút', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (41, 41, '2023-04-30 02:04:00', '2023-04-03 02:04:00', 25, 'Du lịch Hà Nội - Đảo Cát Bà - Vịnh Lan Hạ dịp Lễ 30/4 từ Hà Nội. Quần đảo Cát Bà là quần thể gồm 367 đảo trong đó có đảo Cát Bà ở phía Nam vịnh Hạ Long, ngoài khơi thành phố Hải Phòng và tỉnh Quảng Ninh, cách trung tâm thành phố Hải Phòng khoảng 30 km, cách thành phố Hạ Long khoảng 25 km. Về mặt hành chính, quần đảo thuộc huyện đảo Cát Hải, thành phố Hải Phòng. Nơi đây đã được UNESCO công nhận là khu dự trữ sinh quyển thế giới.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (42, 42, '2023-06-20 02:04:00', '2023-06-22 02:04:00', 25, 'ombo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 Sao.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (43, 43, '2023-08-22 02:04:00', '2023-08-26 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (44, 44, '2023-05-01 02:04:00', '2023-05-04 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (45, 45, '2023-07-25 02:04:00', '2023-07-30 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (46, 46, '2023-06-27 02:04:00', '2023-07-01 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (47, 47, '2023-05-02 02:04:00', '2023-05-04 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (48, 48, '2023-06-01 02:04:00', '2023-06-04 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (49, 49, '2023-08-02 02:04:00', '2023-08-03 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');
INSERT INTO `chitiettour` VALUES (50, 50, '2023-05-24 02:04:00', '2023-05-26 02:04:00', 25, 'Combo du lịch Nha Trang  3 ngày 2 đêm ở khách sạn gần trung tâm mang đến mức giá bất ngờ bạn và gia đình sẽ được tận hưởng kỳ nghỉ sang chảnh chuẩn 3 sao, Bao gồm 1 vé máy bay khứ hồi từ Hà Nội - Nha Trang của hãng hàng không Bamboo Airways. Vé đã gồm 7kg hành lý xách tay và 20kg hành lý.', 'B5MimFC0yog0oh9BuExgQ59NZ0huNaFkjC8SgTz2.jpeg');

-- ----------------------------
-- Table structure for chucvu
-- ----------------------------
DROP TABLE IF EXISTS `chucvu`;
CREATE TABLE `chucvu`  (
  `id_cv` int NOT NULL AUTO_INCREMENT,
  `tencv` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cv`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chucvu
-- ----------------------------
INSERT INTO `chucvu` VALUES (1, 'khách hàng');
INSERT INTO `chucvu` VALUES (4, 'quản lí');
INSERT INTO `chucvu` VALUES (5, 'nhân viên kinh doanh');

-- ----------------------------
-- Table structure for chuongtrinhtour
-- ----------------------------
DROP TABLE IF EXISTS `chuongtrinhtour`;
CREATE TABLE `chuongtrinhtour`  (
  `id_chuongtrinh` int NOT NULL AUTO_INCREMENT,
  `id_tour` int NOT NULL,
  `tieude` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngaythu` int NOT NULL,
  `mota` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_chuongtrinh`) USING BTREE,
  INDEX `id_tour`(`id_tour`) USING BTREE,
  CONSTRAINT `chuongtrinhtour_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chuongtrinhtour
-- ----------------------------
INSERT INTO `chuongtrinhtour` VALUES (6, 30, '', 1, '06h30: Quý khách tập trung tại điểm đón.  07h00: Khởi hành đi Phan Thiết. Ăn sáng tại Long Thành. Trên đường đi quý khách tìm hiểu về lịch sử, văn hóa, địa lý của những vùng đất đi qua và tham gia các trò chơi vui nhộn cùng với HDV.  Trưa: Dùng cơm trưa tại nhà hàng địa phương. Trên đường về khách sạn, quý khách tham quan: Nghệ thuật tranh cát Phi Long Bảo tàng ngọc trai Long Beach Pearl Mũi Né. Nhận phòng khách sạn và nghỉ ngơi  Chiều: Đoàn tự do tắm biển tại resort. Dùng cơm chiều tại nhà hàng. Chương trình riêng của quý khách. Nghỉ đêm tại resor');
INSERT INTO `chuongtrinhtour` VALUES (7, 30, '', 2, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Quý khách chinh phục Đồi cát bay – tự do tham gia trò chơi trượt cát. Tiếp tục tham quan : Công viên tượng cát Forgotten land – mang chủ để cổ tích và truyền thuyết Việt Nam cùng thế giới, được điêu khắc từ 100% cát tự nhiên, không pha trộn phụ gia và chỉ nhờ sự nén chặt của cát và nước. (bao gồm trong tour).  Trưa: Đoàn dùng bữa trưa tại nhà hàng. Trở về khách sạn nghỉ ngơi.  Chiều: Xe đưa đoàn dùng cơm chiều tại nhà hàng. Quý khách đến với sân khấu Làng Chài – Fishermen Show, thưởng thức chương trình ca múa nhạc kịch trên nền sân khấu nhạc nước lập trình tái tạo cảnh biển cả và làng chài với hàng trăm ống phun nước kỹ thuật số công nghệ 2D và 3D mới nhất hiện nay, được đẩy áp lực cao bởi các bơm chìm công suất lớn và tạo màu bằng hàng ngàn đèn LED 256 màu. (chi phí tự túc).  Tối: Xe đưa đoàn trở về khách sạn nghỉ ngơi');
INSERT INTO `chuongtrinhtour` VALUES (8, 30, '', 3, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Đoàn sinh hoạt tự do  Trưa: Làm thủ tục trả phòng, đoàn dùng bữa trưa tại nhà hàng. Khởi hành về TP.HCM, trên đường về, quý khách tham quan và mua sắm: Cơ sở sản xuất nước mắm - mua sắm đặc sản của miền biển, cũng như tìm hiểu đời sống mua bán của người dân Bình Thuận. Tham quan Lâu Đài rượu vang : Quý khách được nghe giới thiệu về quy trình sản xuất, đóng chai và thưởng thức một trong những loại rượu vang hảo hạng nổi tiếng thế giới được xuất xứ từ Thung Lũng Napa (Mỹ)  Chiều: Về đến TP.HCM, xe đưa đoàn về điểm đón ban đầu, chia tay và hẹn gặp lại quý khách trong hành trình kế tiếp');
INSERT INTO `chuongtrinhtour` VALUES (9, 30, '', 4, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Đoàn sinh hoạt tự do  Trưa: Làm thủ tục trả phòng, đoàn dùng bữa trưa tại nhà hàng. Khởi hành về TP.HCM, trên đường về, quý khách tham quan và mua sắm: Cơ sở sản xuất nước mắm - mua sắm đặc sản của miền biển, cũng như tìm hiểu đời sống mua bán của người dân Bình Thuận. Tham quan Lâu Đài rượu vang : Quý khách được nghe giới thiệu về quy trình sản xuất, đóng chai và thưởng thức một trong những loại rượu vang hảo hạng nổi tiếng thế giới được xuất xứ từ Thung Lũng Napa (Mỹ)  Chiều: Về đến TP.HCM, xe đưa đoàn về điểm đón ban đầu, chia tay và hẹn gặp lại quý khách trong hành trình kế tiếp');
INSERT INTO `chuongtrinhtour` VALUES (10, 30, '', 5, 'Sáng: Dùng điểm tâm sáng tại khách sạn. Đoàn sinh hoạt tự do  Trưa: Làm thủ tục trả phòng, đoàn dùng bữa trưa tại nhà hàng. Khởi hành về TP.HCM, trên đường về, quý khách tham quan và mua sắm: Cơ sở sản xuất nước mắm - mua sắm đặc sản của miền biển, cũng như tìm hiểu đời sống mua bán của người dân Bình Thuận. Tham quan Lâu Đài rượu vang : Quý khách được nghe giới thiệu về quy trình sản xuất, đóng chai và thưởng thức một trong những loại rượu vang hảo hạng nổi tiếng thế giới được xuất xứ từ Thung Lũng Napa (Mỹ)  Chiều: Về đến TP.HCM, xe đưa đoàn về điểm đón ban đầu, chia tay và hẹn gặp lại quý khách trong hành trình kế tiếp');
INSERT INTO `chuongtrinhtour` VALUES (11, 33, 'abc', 1, '<h6><a href=\"http://travel.com:8082/du-lich-bac-lieu-can-tho-ca-mau/49.html\">Du lịch Bạc Li&ecirc;u - Cần Thơ - C&agrave; Mau</a></h6>\r\n\r\n<h5>Khởi h&agrave;nh tại: Thanh kh&ecirc;</h5>\r\n\r\n<h5>Thời gian 3 ng&agrave;y / 3 đ&ecirc;m</h5>\r\n\r\n<h5>Gi&aacute;: 75489800</h5>\r\n\r\n<p>Lịch tr&igrave;nh: Du lịch Bạc Li&ecirc;u - Cần Thơ - C&agrave; Mau</p>\r\n\r\n<p>C&ograve;n: 24 chỗ</p>\r\n\r\n<p>-- dvshvjks</p>\r\n\r\n<p>ohgjk</p>\r\n\r\n<p>&nbsp;</p>');
INSERT INTO `chuongtrinhtour` VALUES (12, 33, '', 2, '05h00 Qúy khách tập trung tại điểm hẹn.  05h30 Khởi hành đi Cà Mau (350 km)  06h30 Thưởng thức món hủ tíu Mỹ Tho.  07h15 Tiếp tục hành trình đến Bạc Liêu.  11h45 Tham quan Nhà công tử Bạc Liêu.  12h30 Ăn trưa tại nhà hàng địa phương.  14h00 Tham quan Nhà Thờ Tắc Sậy (Nhà thờ Cha Diệp) tại huyện Giá Rai, cách Tp. Bạc Liêu 37 km.');
INSERT INTO `chuongtrinhtour` VALUES (13, 33, '', 3, '05h00 Qúy khách tập trung tại điểm hẹn.  05h30 Khởi hành đi Cà Mau (350 km)  06h30 Thưởng thức món hủ tíu Mỹ Tho.  07h15 Tiếp tục hành trình đến Bạc Liêu.  11h45 Tham quan Nhà công tử Bạc Liêu.  12h30 Ăn trưa tại nhà hàng địa phương.  14h00 Tham quan Nhà Thờ Tắc Sậy (Nhà thờ Cha Diệp) tại huyện Giá Rai, cách Tp. Bạc Liêu 37 km.');

-- ----------------------------
-- Table structure for diadiem
-- ----------------------------
DROP TABLE IF EXISTS `diadiem`;
CREATE TABLE `diadiem`  (
  `id_dd` int NOT NULL AUTO_INCREMENT,
  `id_tinh` int NOT NULL,
  `diemden` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mota` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_dd`) USING BTREE,
  INDEX `id_tinh`(`id_tinh`) USING BTREE,
  CONSTRAINT `diadiem_ibfk_1` FOREIGN KEY (`id_tinh`) REFERENCES `tinh` (`id_tinh`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diadiem
-- ----------------------------
INSERT INTO `diadiem` VALUES (3, 1, 'phố cổ hội an', 'Một địa danh nổi tiếng ở quảng nam');
INSERT INTO `diadiem` VALUES (4, 2, 'đảo lý sơn', 'Một trong những hàng đảo nổi tiếng nhất ở quảng ngãi');
INSERT INTO `diadiem` VALUES (5, 3, 'mỹ châu', 'xã');
INSERT INTO `diadiem` VALUES (6, 3, 'mỹ đức', 'xã');
INSERT INTO `diadiem` VALUES (7, 4, 'Hải châu', 'quận');
INSERT INTO `diadiem` VALUES (8, 4, 'Thanh khê', 'quận');
INSERT INTO `diadiem` VALUES (9, 4, 'Thanh khê', 'quận');
INSERT INTO `diadiem` VALUES (10, 5, 'U minh', 'rừng');

-- ----------------------------
-- Table structure for hoadon
-- ----------------------------
DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE `hoadon`  (
  `id_hd` int NOT NULL AUTO_INCREMENT,
  `id_pd` int NOT NULL,
  `ngaythanhtoan` DateTime NOT NULL,
  `tongtien` int NULL DEFAULT NULL,
  `tinhtrang` int NOT NULL,
  PRIMARY KEY (`id_hd`) USING BTREE,
  INDEX `id_pd`(`id_pd`) USING BTREE,
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`id_pd`) REFERENCES `phieudat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hoadon
-- ----------------------------
INSERT INTO `hoadon` VALUES (1, 1, '2018-06-02', 3784820, 0);
INSERT INTO `hoadon` VALUES (3, 3, '2018-06-02', 3784820, 0);
INSERT INTO `hoadon` VALUES (4, 2, '2018-06-02', 3784820, 0);

-- ----------------------------
-- Table structure for loaitour
-- ----------------------------
DROP TABLE IF EXISTS `loaitour`;
CREATE TABLE `loaitour`  (
  `id_lt` int NOT NULL AUTO_INCREMENT,
  `tenlt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_lt`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loaitour
-- ----------------------------
INSERT INTO `loaitour` VALUES (1, 'Sự kiện');
INSERT INTO `loaitour` VALUES (2, 'nổi bật');
INSERT INTO `loaitour` VALUES (3, 'yêu thích');
INSERT INTO `loaitour` VALUES (4, 'hàng đầu');
INSERT INTO `loaitour` VALUES (5, 'hàng đầu');
INSERT INTO `loaitour` VALUES (6, 'hàng đầu');

-- ----------------------------
-- Table structure for phieudat
-- ----------------------------
DROP TABLE IF EXISTS `phieudat`;
CREATE TABLE `phieudat`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
--   `cmnd` int NOT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_chitiet` int NOT NULL,
  `ngaydat` date NOT NULL,
  `treem` int NOT NULL,
  `trenho` int NOT NULL,
  `nguoilon` int NOT NULL,
  `soluongdat` int NOT NULL,
  `trangthai` int NOT NULL,
  `huy` int NOT NULL,
  `thanhtien` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_chitiet`(`id_chitiet`) USING BTREE,
  CONSTRAINT `phieudat_ibfk_1` FOREIGN KEY (`id_chitiet`) REFERENCES `chitiettour` (`id_chitiet`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phieudat
-- ----------------------------



-- ----------------------------
-- Table structure for tinh
-- ----------------------------
DROP TABLE IF EXISTS `tinh`;
CREATE TABLE `tinh`  (
  `id_tinh` int NOT NULL AUTO_INCREMENT,
  `tentinh` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tinh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tinh
-- ----------------------------
INSERT INTO `tinh` VALUES (1, 'An Giang');
INSERT INTO `tinh` VALUES (2, 'Bạc Liêu');
INSERT INTO `tinh` VALUES (3, 'Bắc Giang');
INSERT INTO `tinh` VALUES (4, 'Bắc Kạn');
INSERT INTO `tinh` VALUES (5, 'Bắc Ninh');
INSERT INTO `tinh` VALUES (6, 'Bến Tre');
INSERT INTO `tinh` VALUES (8, 'Bình Dương');
INSERT INTO `tinh` VALUES (9, 'Bình Định');
INSERT INTO `tinh` VALUES (10, 'Bình Phước');
INSERT INTO `tinh` VALUES (11, 'Bình Thuận');
INSERT INTO `tinh` VALUES (12, 'Cà Mau');
INSERT INTO `tinh` VALUES (13, 'Cao Bằng');
INSERT INTO `tinh` VALUES (14, 'Cần Thơ');
INSERT INTO `tinh` VALUES (15, 'Đà Nẵng');
INSERT INTO `tinh` VALUES (16, 'Đắk Lắk');
INSERT INTO `tinh` VALUES (17, 'Điện Biên');
INSERT INTO `tinh` VALUES (18, 'Đồng Nai');
INSERT INTO `tinh` VALUES (19, 'Đồng Tháp');
INSERT INTO `tinh` VALUES (20, 'Gia Lai');
INSERT INTO `tinh` VALUES (22, 'Hà Giang');
INSERT INTO `tinh` VALUES (23, 'Hà Nam');
INSERT INTO `tinh` VALUES (24, 'Hà Nội');
INSERT INTO `tinh` VALUES (25, 'Hải Phòng');
INSERT INTO `tinh` VALUES (26, 'Hậu Giang');
INSERT INTO `tinh` VALUES (27, 'Hòa Bình');
INSERT INTO `tinh` VALUES (28, 'Thành phố Hồ Chí Minh');
INSERT INTO `tinh` VALUES (29, 'Hưng Yên');
INSERT INTO `tinh` VALUES (30, 'Khánh Hòa');
INSERT INTO `tinh` VALUES (31, 'Kiên Giang');
INSERT INTO `tinh` VALUES (32, 'Kon Tum');
INSERT INTO `tinh` VALUES (33, 'Lai Châu');
INSERT INTO `tinh` VALUES (34, 'Lạng Sơn');
INSERT INTO `tinh` VALUES (35, 'Lào Cai');
INSERT INTO `tinh` VALUES (36, 'Lâm Đồng');
INSERT INTO `tinh` VALUES (37, 'Long An');
INSERT INTO `tinh` VALUES (38, 'Nam Định');
INSERT INTO `tinh` VALUES (39, 'Nghệ An');
INSERT INTO `tinh` VALUES (40, 'Ninh Bình');
INSERT INTO `tinh` VALUES (41, 'Ninh Thuận');
INSERT INTO `tinh` VALUES (42, 'Phú Thọ');
INSERT INTO `tinh` VALUES (43, 'Phú Yên');
INSERT INTO `tinh` VALUES (44, 'Quảng Bình');
INSERT INTO `tinh` VALUES (45, 'Quảng Nam');
INSERT INTO `tinh` VALUES (46, 'Quảng Ngãi');
INSERT INTO `tinh` VALUES (47, 'Quảng Ninh');
INSERT INTO `tinh` VALUES (48, 'Quảng Trị');
INSERT INTO `tinh` VALUES (49, 'Sóc Trăng');
INSERT INTO `tinh` VALUES (50, 'Tây Ninh');
INSERT INTO `tinh` VALUES (51, 'Thái Bình');
INSERT INTO `tinh` VALUES (52, 'Thái Nguyên');
INSERT INTO `tinh` VALUES (53, 'Thanh Hóa');
INSERT INTO `tinh` VALUES (54, 'Thừa Thiên Huế');
INSERT INTO `tinh` VALUES (55, 'Tiền Giang');
INSERT INTO `tinh` VALUES (56, 'Tuyên Quang');
INSERT INTO `tinh` VALUES (57, 'Yên Bái');
INSERT INTO `tinh` VALUES (58, 'Vĩnh Long');
INSERT INTO `tinh` VALUES (59, 'Trà Vinh');

-- ----------------------------
-- Table structure for tour
-- ----------------------------
DROP TABLE IF EXISTS `tour`;
CREATE TABLE `tour`  (
  `id_tour` int NOT NULL AUTO_INCREMENT,
--   `id_tinh` int NULL DEFAULT NULL,
--   `id_dd` int NOT NULL,
  `noixuatphat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_lt` int NULL DEFAULT NULL,
  `phuongtien` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sltd` int NOT NULL,
  `tentour` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `songay` int NOT NULL,
  `sodem` int NOT NULL,
  `gianguoilon` float NOT NULL,
  `giatreem` float NOT NULL,
  `giatrenho` float NOT NULL,
  `motatour` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `lichtrinh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
--   `bando` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tour`) USING BTREE,
  INDEX `id_lt`(`id_lt`) USING BTREE,
--   INDEX `id_dd`(`id_dd`) USING BTREE,
--   INDEX `id_tinh`(`id_tinh`) USING BTREE,
--   CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_dd`) REFERENCES `diadiem` (`id_dd`) ON DELETE RESTRICT ON UPDATE RESTRICT
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`id_lt`) REFERENCES `loaitour` (`id_lt`) ON DELETE RESTRICT ON UPDATE RESTRICT
--   CONSTRAINT `tour_ibfk_3` FOREIGN KEY (`id_tinh`) REFERENCES `tinh` (`id_tinh`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tour
-- ----------------------------
INSERT INTO `tour` VALUES (1, 'Hà Nội', 4, 'xe khách, thuyền', 25, 'Du Lịch Miền Trung - Đà Nẵng - Động Thiên Đường 5 ngày dịp hè 2023', 5, 4, 7000000, 5000000, 1000000, 'dna.jpg', 'Đà Nẵng - Bà Nà - Hội An - Huế - Thánh Địa La Vang - Động Thiên Đường');
INSERT INTO `tour` VALUES (2, 'TP.Hồ Chí Minh', 6, 'xe bus', 25, 'Du Lịch Miền Bắc - Hạ Long - Sapa - Hàm Rồng 5 ngày giá tốt hè 2023', 5, 4, 8500000, 3000000, 1000000, 'spa.jpg', 'Hà Nội - Hạ Long - Lào Cai - Sapa - Fansipan');
INSERT INTO `tour` VALUES (3, 'Hà Nội', 6, 'xe bus', 25, 'Du lịch Nha Trang: Miền quê hương cát trắng', 3, 3, 8000000, 2500000, 1000000, 'nhatr.jpg', 'nha trang');
INSERT INTO `tour` VALUES (4, 'Hà Nội', 6, 'ô tô , thuyền', 25, 'Du lịch Cà Mau - U Minh Hạ mùa gác kèo ong - Homestay Đất Mũi Cà Mau', 3, 3, 7548980, 2500000, 1300000, 'cm.jpg', 'Du lịch Cà Mau - U Minh Hạ mùa gác kèo ong - Homestay');
INSERT INTO `tour` VALUES (5, 'Bắc Ninh', 4, 'xe ôm', 25, 'Du lịch Tiền Giang - Cần Thơ', 4, 3, 8000000, 2000000, 1300000, 'ctho.jpg', 'Du lịch Tiền Giang - Cần Thơ');
INSERT INTO `tour` VALUES (6, 'Hải phòng', 6, 'xe ôm', 25, 'Du lịch Cần Thơ', 4, 3, 8000000, 2000000, 1300000, 'cantho.jpg', 'Du lịch Tiền Giang - Cần Thơ');
INSERT INTO `tour` VALUES (7, 'Hà Nội', 6, 'xe bus', 25, 'Du lịch Bạc Liêu - Cần Thơ - Cà Mau', 3, 3, 7300000, 1500000, 1000000, 'balieu.jpg', 'Du lịch Bạc Liêu - Cần Thơ - Cà Mau');
INSERT INTO `tour` VALUES (8, 'TP.Hồ Chí Minh', 6, 'xe bus', 25, 'Vườn rau thủy canh - Thác Datanla - Thiền viện Trúc Lâm', 3, 3, 7548980, 784820, 500000, 'vrau.jpg', 'Vườn rau thủy canh - Thác Datanla - Thiền viện Trúc Lâm');
INSERT INTO `tour` VALUES (9, 'TP.Hồ Chí Minh', 5, 'xe bus', 25, 'Du lịch Đà Nẵng - Bà Nà - Hội An - Huế - Động Phong Nha', 3, 3, 7548980, 1784820, 1123546, 'dnang.jpg', 'Du lịch Đà Nẵng - Bà Nà - Hội An - Huế - Động Phong Nha');
INSERT INTO `tour` VALUES (10,'TP.Hồ Chí Minh', 5, 'xe bus', 25, 'Du lịch Hà Nội - Thị trấn Sapa mờ sương', 3, 3, 5500000, 1000000, 500000, 'sapa.jpg', 'Du lịch Hà Nội - Thị trấn Sapa mờ sương');
INSERT INTO `tour` VALUES (11,'Hà Nội', 3, 'xe bus', 25, 'Du lịch Phan Thiết: Mũi Né - Công viên tượng cát - Show nhạc nước Huyền Thoại Làng Chài', 3, 3, 7500000, 1700000, 1100000, 'pthiet.jpg', 'Du lịch Phan Thiết: Mũi Né - Công viên tượng cát - Show nhạc nước Huyền Thoại Làng Chài');
INSERT INTO `tour` VALUES (12, 'Hà Nội', 3, 'xe bus', 25, 'Tour Lễ Hội Pháo Hoa Đà Nẵng - Huế 3 ngày khởi hành hè 2023 giá tốt', 3, 3, 7500000, 1700000, 1000000, 'phao1.jpg', 'Đà Nẵng - Bà Nà - Ngũ Hành Sơn - Bán Đảo Sơn Trà - Hội An - Huế');
INSERT INTO `tour` VALUES (13, 'TP.Hồ Chí Minh', 3, 'xe bus', 25, 'Du Lịch Đông Bắc - Hà Giang - Cao Bằng - Hồ Ba Bể 3 ngày hè 2023', 3, 3, 6000000, 1700000, 1200000, 'cbang.jpg', 'Hà Nội - Hà Giang - Quản Bạ - Đồng Văn - Lũng Cú - Mèo Vạc - Cao Bằng - Thác Bản Giốc - Động Ngườm Ngao - Hang Pắc Pó - Hồ Ba Bể');
INSERT INTO `tour` VALUES (14, 'TP.Hồ Chí Minh', 5, 'xe bus', 25, 'Combo Sapa 2 ngày khởi hành từ Hà Nội - Khách sạn 4 sao Sapa Charm Hotel', 2, 2, 6500000, 1200000, 900000, 'ckinhspa.jpg', 'Thị trấn Sapa - Bản Cát Cát - Núi Hàm Rồng - Fansipan');
INSERT INTO `tour` VALUES (15, 'Hà Nội', 4, 'xe ôm', 25, 'Du Lịch Hạ Long - Hải Phòng - Ninh Bình 4 ngày giá tiết kiệm hè 2023', 4, 3, 5300000, 700000, 500000, 'halong.jpg', 'Hà Nội - Yên Tử - Hạ Long - Hải Phòng - Cầu Vượt Biển Tân Vũ - Ninh Bình - Chùa Bái Đính - Tràng An');
INSERT INTO `tour` VALUES (16, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du Lịch Miền Tây - Mỹ Tho - Chùa Vình Tràng - Cần Thơ 2 ngày lễ 2/9', 2, 2, 7100000, 1000000, 600000, 'mytho.jpg', 'Mỹ Tho - Chùa Vĩnh Tràng - Cồn Long - Lân - Qui - Phụng - Cần Thơ - Chợ Nổi Cái Răng');
INSERT INTO `tour` VALUES (17, 'Hà Nội', 4, 'xe bus', 25, 'Tour Hành Hương Tháng Giêng Bạc Liêu - Mẹ Nam Hải giá tiết kiệm 2023', 2, 2, 6500000, 1500000, 1000000, 'hhuong.jpg', 'Bạc Liêu - Quan Âm Phật Đài Mẹ Nam Hải - Cánh Đồng Quạt Gió - Chùa Xiêm Cán');
INSERT INTO `tour` VALUES (18,'Hà Nội', 4, 'xe bus', 25, 'Du Lịch Phú Quốc - Hòn Móng Tay - Hòn Mây Rút giá tiết kiệm 2023', 4, 3, 5500000, 1500000, 7000000, 'honmt.jpg', 'Phú Quốc - Hòn Móng Tay - Hòn Mây Rút');
INSERT INTO `tour` VALUES (19, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch Mai Châu - Mộc Châu - Ninh Bình 4 ngày khởi hành dịp hè 2023', 4, 3, 7500000, 3784820, 1000000, 'mchau.jpg', 'Mai Châu - Bản Lác - Mộc Châu - Thác Dải Yếm - Đồi Chè Trái Tim - Chùa Bái Đính - Tràng An');
INSERT INTO `tour` VALUES (20, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Lễ 30/4 - Tour Du lịch Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sapa từ Sài Gòn 2023', 4, 3, 5548980, 1184820, 500000, 'halong1.jpg', 'Hà Nội - Đền Đô - Yên Tử - Vịnh Hạ Long - Sapa');
INSERT INTO `tour` VALUES (21,'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hà Nội - Quảng Bình - Động Phong Nha - Bãi Đá Nhảy - Hang Tám Cô dịp Hè từ Hà Nội 2023', 4, 3, 7500000, 1184820, 1000000, 'qbinh.jpg', 'Hà Nội - Quảng Bình - Động Phong Nha - Bãi Đá Nhảy - Hang Tám');
INSERT INTO `tour` VALUES (22, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Hè - Tour Du lịch Quy Nhơn - Phú Yên từ Hà Nội 2023', 4, 3, 7500000, 1184820, 1000000, 'qnhon.jpg', 'Quy Nhơn - Phú Yên');
INSERT INTO `tour` VALUES (23, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang từ Hà Nội 2023', 5, 5, 7500000, 1184820, 1000000, 'hnoi1.jpg', 'Hà Nội - Nha Trang');
INSERT INTO `tour` VALUES (24, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè - Tour Du lịch Hà Nội - Nha Trang bay Bamboo Airways từ Hà Nội 2023', 4, 3, 7500000, 2500000, 1000000, 'nhatrang.jpg', 'Hà Nội - Nha Trang');
INSERT INTO `tour` VALUES (25, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè Tour Hà Nội - Quy Nhơn - Tuy Hòa - Quy Nhơn từ Hà Nội 2023', 4, 3, 7500000, 2000000, 1000000, 'tuyhoa.jpg', 'Hà Nội - Quy Nhơn - Tuy Hòa - Quy Nhơn');
INSERT INTO `tour` VALUES (26, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè Tour Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Đất Mũi - Châu Đốc từ Hà Nội 2023', 4, 3, 7500000, 1500000, 1000000, 'camau.jpg', 'Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Đất Mũi - Châu Đốc');
INSERT INTO `tour` VALUES (27, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè Tour Du lịch Phú Quốc Khám phá Đảo Ngọc từ Hà Nội 2023', 4, 3, 7500000, 2500000, 1000000, 'dngoc.jpg', 'Phú Quốc Khám phá Đảo Ngọc');
INSERT INTO `tour` VALUES (28, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hè - Tour Hà Nội - Sài Gòn - Mũi Né - Vũng Tàu từ Hà Nội 2023', 4, 3, 7500000, 2200000, 900000, 'cham.jpg', 'Hà Nội - Sài Gòn - Mũi Né - Vũng Tàu');
INSERT INTO `tour` VALUES (29, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Hoa Lư - Tam Cốc 1 ngày từ Hà Nội 2023', 1, 0, 3500000, 800000, 500000, 'hoalu.jpg', 'Hà Nội - Hoa Lư - Tam Cốc');
INSERT INTO `tour` VALUES (30, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Bái Đính - Tràng An 1 ngày từ Hà Nội 2023', 1, 0, 3000000, 1000000, 500000, 'baidinh.jpg', 'Hà Nội - Bái Đính - Tràng An');
INSERT INTO `tour` VALUES (31, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Hương 1 ngày từ Hà Nội 2023', 1, 0, 2500000, 600000, 300000, 'chuahuong.jpg', 'Hà Nội - Chùa Hương');
INSERT INTO `tour` VALUES (32, 'Đà Nẵng', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Yên Tử 1 ngày từ Hà Nội 2023', 1, 0, 3500000, 800000, 400000, 'yentu.jpg', 'Hà Nội - Yên Tử');
INSERT INTO `tour` VALUES (33, 'Đà Nẵng', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - City Tour Hà Nội 1 ngày giá tốt 2023', 1, 0, 3500000, 800000, 400000, 'hnoi.jpg', ' Hà Nội - City Tour');
INSERT INTO `tour` VALUES (34, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Chùa Tam Chúc - Tràng An 1 ngày từ Hà Nội 2023', 1, 0, 2500000, 500000, 300000, 'tamchuc.jpg', 'Hà Nội - Chùa Tam Chúc - Tràng An');
INSERT INTO `tour` VALUES (35, 'Đà Nẵng', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Hạ Long - Hà Nội 2N1Đ từ Hà Nội 2023', 2, 1, 2500000, 500000, 300000, 'qninh.jpg', ' Hà Nội - Hạ Long');
INSERT INTO `tour` VALUES (36,'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Miền Bắc Hà Nội - Aquamarine Du Thuyền Ngủ Đêm 3 ngày từ Hà Nội 2023', 3, 2, 2500000, 500000, 200000, 'duthu.jpg', 'Hà Nội - Aquamarine Du Thuyền');
INSERT INTO `tour` VALUES (37, 'Quảng Bình', 4, 'xe bus', 25, 'Du lịch Hà Nôi - Sapa - Bản Cát Cát - Check in Moana từ Hà Nội 2023', 3, 2, 4500000, 1000000, 500000, 'mona.jpg', 'Hà Nôi - Sapa - Bản Cát Cát - Check in Moana');
INSERT INTO `tour` VALUES (38, 'Nghệ An', 4, 'xe bus', 25, 'Du lịch Hà Nôi - Sapa - Fansipan - Check in Moana - Bản Cát Cát từ Hà Nội 2023', 2, 1, 7500000, 3784820, 23546, 'fan.jpg', 'Hà Nôi - Sapa - Fansipan - Check in Moana - Bản Cát Cát');
INSERT INTO `tour` VALUES (39, 'Thanh Hóa', 4, 'xe bus', 25, 'Du lịch Miền Tây Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Châu Đốc từ Hà Nội 2023', 4, 3, 7500000, 1500000, 1000000, 'mtay.jpg', 'Hà Nội - Cần Thơ - Sóc Trăng - Bạc Liêu - Cà Mau - Châu Đốc');
INSERT INTO `tour` VALUES (40, 'TP.Hồ Chí Minh', 4, 'xe bus', 25, 'Du lịch Tây Nguyên - Pleiku - Buôn Mê Thuột mùa Hoa Cafe từ Hà Nội 2023', 4, 3, 6500000, 1000000, 800000, 'tayn.jpg', 'Tây Nguyên - Pleiku - Buôn Mê Thuột');
INSERT INTO `tour` VALUES (41, 'Bắc Giang', 4, 'xe bus', 25, 'Du lịch Hà Nội - Đảo Cát Bà - Vịnh Lan Hạ dịp Lễ 30/4 từ Hà Nội', 3, 3, 5500000, 1500000, 900000, 'catba.jpg', 'Hà Nội - Đảo Cát Bà - Vịnh Lan Hạ');
INSERT INTO `tour` VALUES (42, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Nha Trang 3N2Đ khách sạn 4 sao từ Hà Nội giá tốt 2023', 3, 2, 7500000, 1500000, 900000, 'nha1.jpg', 'Nha Trang');
INSERT INTO `tour` VALUES (43, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Nha Trang 4N3Đ khách sạn 4 sao từ Hà Nội giá tốt 2023', 4, 3, 7500000, 1500000, 900000, 'nha2.jpg', 'Nha Trang');
INSERT INTO `tour` VALUES (44, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Nha Trang 3N2Đ khách sạn 5 sao Siêu Khuyến Mãi từ Hà Nội', 3, 2, 7500000, 1500000, 600000, 'nha3.jpg', 'Nha Trang');
INSERT INTO `tour` VALUES (45, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Vũng Tàu 4N3Đ khách sạn 5 sao Siêu Khuyến Mãi từ Hà Nội', 4, 3, 7500000, 1500000, 900000, 'vungtau.jpg', 'Vũng Tàu');
INSERT INTO `tour` VALUES (46, 'Hà Nội', 4, 'xe bus', 25, 'Combo du lịch Đà Lạt 4N3Đ khách sạn 3 sao từ Hà Nội giá tốt 2023', 4, 3, 7500000, 1500000, 700000, 'dalat.jpg', 'Đà Lạt');
INSERT INTO `tour` VALUES (47, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Phú Thọ - Đền Hùng giá tốt khởi hành từ Hà Nội 2023', 2, 1, 3500000, 1800000, 900000, 'denhung.jpg', 'Phú Thọ - Đền Hùng');
INSERT INTO `tour` VALUES (48, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Hồ Ba Bể - Thác Bản Giốc 3 ngày giá tốt từ Hà Nội', 3, 2, 7500000, 1500000, 900000, 'ban.jpg', 'Hồ Ba Bể - Thác Bản Giốc');
INSERT INTO `tour` VALUES (49, 'Hà Nội', 4, 'xe bus', 25, 'Du lịch Thanh Hóa - Đền Sòng Sơn - Đền Cô Chín - Suối Cá Thần từ Hà Nội 2023', 1, 1, 3500000, 840820, 235460, 'suoi.jpg', 'Thanh Hóa - Đền Sòng Sơn - Đền Cô Chín - Suối Cá Thần');
INSERT INTO `tour` VALUES (50, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 2548980, 500000, 200000, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (51, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (52, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (53, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (54, 'Hà Nội', 4, 'xe bus', 25, 'Du Lịch khám phá các lễ hội của Bắc Ninh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');
INSERT INTO `tour` VALUES (55, 'Hà Nội', 4, 'xe bus', 25, 'duc anh', 1, 1, 7548980, 3784820, 23546, 'hoilim.jpg', 'Bắc Ninh');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cmnd` int NOT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ghichu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_cv` int NOT NULL,
  `Status`			INT  DEFAULT 0 , -- 0:Not Active, 1: Active
  `avatarUrl` varchar(600),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cv`(`id_cv`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_cv`) REFERENCES `chucvu` (`id_cv`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `user` VALUES (2	, 'Nguyễn thị ngân'			, 2059437335	, ' Quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note1'	, 'ngannguyen'	, '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	, 1		,1 		,'' );
INSERT INTO `user` VALUES (9	, 'Lê nguyễn thanh tuyền'	, 205943664		, ' Quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note2'	, 'tthuyen'		, '$2y$10$4OPYhSdN/E8kYI8R9/XOLe2oGMLmJMZqfWRntc4L.BOMF0ktSG9My'	, 4		,1 		,'' );
INSERT INTO `user` VALUES (10	, 'Nguyễn Thị Ngân'			, 205943664		, ' Quảng nam'		, 1226452598, 'levantinh@gmail.com'				, 'note3'	, 'tuyen2'		, '$2y$10$67hudI0nqJpTQ9Ye90ZCX.lbkPuue3vX9Qtf5tZO0QNXeuXdHiP36'	, 1		,1 		,'' );
INSERT INTO `user` VALUES (12	, 'lê văn tịnh'				, 205943664		, ' quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note4'	, 'tinhle'		, '$2y$10$ucxVKawI1N3hinTnPIwx5eddDcw.uH8lIL4o2VZ1m4C4pZNRYz3q6'	, 5		,1 		,'' );
INSERT INTO `user` VALUES (14	, 'czx'						, 2059437335	, 'quảng nam'		, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note5'	, 'tuyenlnt'	, '$2y$10$H3dpN1wBS0XfA8S1IYYprOhE8cAOpGPT04eMqW0XOnet0Qg6pEpHC'	, 4		,1 		,'' );
INSERT INTO `user` VALUES (15	, 'a'						, 2059437335	, 'đ'				, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note6'	, 'a'			, '$2y$10$XIsjlIEUXNkovdPq0Zf9Wu6nOADYku8WT3DBl66p3Ba6UMd.mbiDm'	, 1		,1		,'' );
INSERT INTO `user` VALUES (16	, 'admin'					, 123456789		, 'VP'				, 1226452598, 'lenguyenthanhtuyen97@gmail.com'	, 'note7'	, 'adminn'		, '$2a$12$M4f5oWU.pwjw/IYLUpNilu7JMRl4AV7SEcUUCsDaX//ZNBE6vA4NO'	, 4		,1		,'' );

SET FOREIGN_KEY_CHECKS = 1;

-- Create table Registration_User_Token
DROP TABLE IF EXISTS 	`Token`;
CREATE TABLE IF NOT EXISTS `Token` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`token`	 		CHAR(36) NOT NULL UNIQUE,
	UserID     		INT NOT NULL,
	`expiryDate` 	DATETIME NOT NULL,
    `type`			Varchar(50),
    FOREIGN KEY (UserID) REFERENCES  `user`(`id`)
);

DROP TABLE IF EXISTS 	`TinTuc`;
CREATE TABLE IF NOT EXISTS `TinTuc` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`ten`	 		varchar(200) NOT NULL UNIQUE,
	noidung     		mediumtext NOT NULL,
	`anh1` 	varchar(200) NOT NULL,
    `anh2`			Varchar(200)
);

INSERT INTO `TinTuc` VALUES (1, 'tin tuc nay', 'dsadjsadsdksjlhaldskajdlsaaaaasdsjdasdakdhskadjajdsajhdksadkajksjdksjashdksjadksadkjdkaadshddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddđ', 'dna.jpg', 'dna.jpg');